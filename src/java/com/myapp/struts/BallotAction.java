package com.myapp.struts;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//import com.myapp.struts.hbm.*;
import javax.servlet.http.*;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
import java.util.*;
import javax.servlet.http.HttpSession;
import com.myapp.struts.utility.*;
import com.myapp.struts.Voter.VoterRegistrationDAO;
import com.myapp.struts.hbm.Election;
import com.myapp.struts.hbm.ElectionDAO;
import com.myapp.struts.hbm.VoterRegistration;
import com.myapp.struts.AdminDAO.LoginDAO;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.LinkedBlockingQueue;

import com.myapp.struts.hbm.Login;
import com.myapp.struts.hbm.SetVoter;
import com.myapp.struts.hbm.SetVoterId;
import com.myapp.struts.hbm.VotingDAO;
import com.myapp.struts.hbm.VotingProcess;

//import org.apache.commons.lang3.StringEscapeUtils;


public class  BallotAction extends org.apache.struts.action.Action {

    private final ExecutorService executor=Executors.newFixedThreadPool(1);

    ThreadPoolExecutor mexecutor = new ThreadPoolExecutor(1, 10, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
    
    Email x;
    
    private String admin_password;
    private String admin_password1,onetimekey,onetimekey1;
    private String bodymessRPOTKM1;
    private String bodymessRPOTKM11;

    private String bodymessRPOTKM2;
    private String bodymessRPOTKM3;
    private String subRPOTKM;

    String user_id;

    Locale locale = null;
    String locale1 = "en";
    String rtl = "ltr";
    boolean page = true;

   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
	System.gc();
        HttpSession session = request.getSession();
        
        if(session.isNew())
        {
            return mapping.findForward("out");
        }
  //      session_id = session.getId();
     
        try {
            if (session.getAttribute("locale") != null) {
                locale1 = (String) session.getAttribute("locale");
               
            } else {
                locale1 = "en";
            }
        } catch (Exception e) {
            locale1 = "en";
        }
        locale = new Locale(locale1);
        if (!(locale1.equals("ur") || locale1.equals("ar"))) {
            rtl = "LTR";
            page = true;
        } else {
            rtl = "RTL";
            page = false;
        }
        ResourceBundle resource = ResourceBundle.getBundle("multiLingualBundle", locale);

        LoginActionForm loginActionForm;
        loginActionForm = (LoginActionForm) form;
   
   	//get the election id
   	String election="1";
   	//get the institute id
   	String institute_id="1";
	//get the enrollment number
        String userenroll = (loginActionForm.getEnroll().trim());
	if(!userenroll.matches("[\\w*\\s*]*")){
		request.setAttribute("msg","Please enter only letters and numbers.");
	       	return mapping.findForward("error");
	}else{
//	userenroll=StringEscapeUtils.escapeHtml4(userenroll);
       // user_id = loginActionForm.getEnroll();
        
	System.out.println("Reached-LoginAction.java line 101"+userenroll);
		//check for enroll is not null
           if((userenroll!=null ) && !(userenroll.equals(""))) {
         //  if((user_id!=null ) && !(user_id.equals(""))) {
             	// search enroll exist in table 
		VoterRegistrationDAO voter=new VoterRegistrationDAO();
		VoterRegistration rst = voter.searchVoterRegistration(institute_id,userenroll);

		//   Login lobj=LoginDAO.searchForgetPassword(user_id);
		   if(rst == null)
                   {
			UserLog.ErrorLog("\nReset Password & One time key link not generated as voter does not exist- "+userenroll+"\n","GenBallotLog.txt");
			request.setAttribute("msg","Your vote does not exist. Contact Election Officer.");
                        return mapping.findForward("failure");
		   }
		   else{
		   //get user name (email)
		   //String email=user_id;
		   String email=rst.getEmail();
		   //get alternet email
		   String alteremail=rst.getAlternateMail();

		   Election e1=ElectionDAO.searchElection(election, institute_id);
        	   Date date = new Date();

		   admin_password= RandomPassword.getRandomString(10);
		   admin_password1=PasswordEncruptionUtility.password_encrupt(admin_password);
			// set the mail body
		   subRPOTKM=" Indicate your preference for "+e1.getElectionName();
        	   bodymessRPOTKM1="Dear Sir/Madam,\n\nYou have still not voted in "+e1.getElectionName()+". Please accept any security certificate presented by the browser. Voting over web portal will close on"+e1.getEndDate()+" IST.\n\n For casting your ballot on web portal, you can click on the following link\n\n"+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/voterlogin.do?email=";
		   bodymessRPOTKM2="\n\nYou can also cut and paste the above link in a browser to  indicate your preference.\n\nAlternatively, you can login into election management system at\nhttps://election.iitk.ac.in/EMS\nfor your preference. Your login is ";
		   bodymessRPOTKM3="\n\nYou are requested to use the latest mail for casting your ballot.\n\n\n\n\n\n\nEO,"+e1.getElectionName()+"\n\n Date "+date.toString();
		   //check user voted or not
		VotingDAO v=new VotingDAO();
                VotingProcess voting=(VotingProcess)v.GetVoteStatus(institute_id, election,email);
		if(voting==null){
			SetVoter s=VoterRegistrationDAO.searchVoterList(institute_id, election, userenroll);
                        if(s!=null && s.getStatus()!=null)
                        {
				UserLog.ErrorLog("\nReset Password & One time key link not generated as voter is already Blocked\n ","GenBallotLog.txt");
                        }
                        else
                        {
				//set password
				Login obj2=(Login)LoginDAO.searchLoginID(email);
		//		admin_password= RandomPassword.getRandomString(10);
		//		admin_password1=PasswordEncruptionUtility.password_encrupt(admin_password);
				obj2.setPassword(admin_password1);
				LoginDAO.update1(obj2);
				//set voter
				SetVoter o=new SetVoter();
                                SetVoterId oi=new SetVoterId();
                                oi.setInstituteId(institute_id);
                                oi.setElectionId(election);
                                oi.setEnrollment(userenroll);
                                o.setId(oi);
				/*One time key Generate*/
                                onetimekey= RandomPassword.getRandomString(10);
                                onetimekey1=PasswordEncruptionUtility.password_encrupt(onetimekey);
                                o.setPassword(onetimekey1);
                                VoterRegistrationDAO.setVoter(o);
				
				mailSend2(email,admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
				UserLog.ErrorLog("\nReset Password & One time key link has been send successfully Mail Send "+email,"GenBallotMailLog.txt");

                               if((alteremail!=null)&&(!(alteremail.trim().isEmpty()))&&(!(alteremail.equals("NULL"))))
                               {
					mailSend3(alteremail,admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);

				UserLog.ErrorLog("Reset Password & One time key link has been send successfully Alternet Mail Send  "+alteremail,"GenBallotMailLog.txt");
                               }
			}//else
		}//voting
	 	else{ 
			mailSend2(email,admin_password,subRPOTKM,"You have already cast your vote.");
			UserLog.ErrorLog("\nReset Password & One time key link not generated as Voter already cast there vote- "+userenroll+"\n ","GenBallotMailLog.txt");
                }
		request.setAttribute("msg","Your ballot/status has been sent your email id.");
        	return mapping.findForward("success");
	    }// close voter exist
	  }//enrollment null check
	}//close saitise
		request.setAttribute("msg","Please enter only letters and numbers.");
	       	return mapping.findForward("failure");
    }//close function

	private void mailSend2(final String to,final String admin_password,final String subject,final String body){
                mexecutor.execute(new Runnable() {
                @Override
                public void run() {
                        try {
                        x=new Email(to,admin_password,subject,body);
                        x.send();
                            } catch (Exception e) {
                                UserLog.ErrorLog("Mail Send Error "+to +" and "+e.toString(),"GenBallotMailErrorLog.txt");
                            }
                }
        });

        }
	private void mailSend3(final String to,final String admin_password,final String subject,final String body){
                mexecutor.execute(new Runnable() {
                @Override
                public void run() {
                        try {
                        x=new Email(to,admin_password,subject,body);
                        x.sendAlternatemail();
                            } catch (Exception e) {
                                UserLog.ErrorLog("Alternet Mail Send Error "+to +" and "+e.toString(),"GenBallotMailErrorLog.txt");
                            }
                }
        });

        }
}//close class
