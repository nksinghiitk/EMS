/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.election_manager;

import com.myapp.struts.AdminDAO.LoginDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import  com.myapp.struts.utility.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import com.myapp.struts.Voter.VoterRegistrationDAO;
import com.myapp.struts.hbm.Election;
import com.myapp.struts.hbm.ElectionDAO;
import com.myapp.struts.hbm.VoterRegistration;
//import java.util.List;
import java.util.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.myapp.struts.hbm.Login;
import com.myapp.struts.hbm.SetVoter;
import com.myapp.struts.hbm.SetVoterId;
import com.myapp.struts.hbm.VotingDAO;
import com.myapp.struts.hbm.VotingProcess;
import java.io.*;

import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.LinkedBlockingQueue;

public class VotersetAction3 extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";

    private final ExecutorService executor=Executors.newFixedThreadPool(1);
    
    ThreadPoolExecutor mexecutor = new ThreadPoolExecutor(1, 100, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
    Email x;
    private String admin_password;
    private String admin_password1,onetimekey,onetimekey1;
    private String bodymessRPOTKM1;
    private String bodymessRPOTKM11;

	private String bodymessRPOTKM2;
	private String bodymessRPOTKM3;
	private String subRPOTKM;
/*
Dear Sir/Madam,

You have still not cast your ballot in IIT Kanpur AA BoD election. For casting your ballot over web portal, kindly click the following link

http://202.141.40.218:8080/EMS/voterlogin.do?email="+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey

You can also cut and past the above link in a browser to cast your ballot.

For login into election management system, your login is "+obj2.getUserId()+" and password is  "+obj2.getPassword()+" 

You are requested to use the latest mail for this casting your ballot.

YNSingh
EO, IITKAA 2012
*/
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

	System.gc();

        HttpSession session = request.getSession();
	
        DepActionForm loginActionForm;
	loginActionForm = (DepActionForm) form;

	List log=new ArrayList();

	String election=loginActionForm.getElectionId();

	List obj= (List)session.getAttribute("resultset");

	String institute_id=(String)session.getAttribute("institute_id");
        String username=(String)session.getAttribute("username");

        Election e1=ElectionDAO.searchElection(election, institute_id);
	Date date = new Date();

        //subRPOTKM="Credentials for voting in "+e1.getElectionName();
        subRPOTKM=" Indicate your preference for "+e1.getElectionName();
	bodymessRPOTKM1="Dear Sir/Madam,\n\nYou have still not voted in "+e1.getElectionName()+". Please accept any security certificate presented by the browser. Voting over web portal will close on"+e1.getEndDate()+" IST.\n\n For casting your ballot on web portal, you can click on the following link\n\n"+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/voterlogin.do?email=";
	//bodymessRPOTKM1="Dear Students,\n\n The “Sushila and Kantilal Mehta Award” has been instituted with the intent of honoring and rewarding an outstanding faculty member of the Department of Mathematics & Statistics for motivating and encouraging students to pursue pure mathematics through his/her teaching/research and/or discussions.  As per the approved criteria, the awardee is to be chosen by the students.\n\n Please accept any security certificate presented by the browser. The last date for indicating your preference online is "+e1.getEndDate()+" IST.\n\n Please indicate your preference to select the awardee following the link given below \n\n"+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/voterlogin.do?email=";
        bodymessRPOTKM2="\n\nYou can also cut and paste the above link in a browser to  indicate your preference.\n\nAlternatively, you can login into election management system at\nhttps://election.iitk.ac.in/EMS\nfor your preference. Your login is ";
       // bodymessRPOTKM2="\n\nYou can also cut and paste the above link in a browser to cast your ballot.\n\nAlternatively, you can login into election management system at\nhttps://election.iitk.ac.in/EMS\nfor voting. Your login is ";
       bodymessRPOTKM3="\n\nYou are requested to use the latest mail for casting your ballot.\n\n\n\n\n"+username+"\n\nEO,"+e1.getElectionName()+"\n\n Date "+date.toString();
       // bodymessRPOTKM3="\n\nYou are requested to use the latest mail for indicating your preference.\n\n In case of any technical difficulties, please contact amitra@iitk.ac.in .\n\n With best wishes\n\n\n\n\n Amit Mitra";

//+username+"\n\nEO,"+e1.getElectionName()+"\n\n Date "+date.toString();




	String action=loginActionForm.getAction();

if(action.equalsIgnoreCase("1"))//got Reset Password & One Time Key with Voting Link from  Current Page to Email ID
{
     System.out.println(" The size of current page voter list is "+obj.size());
     for(int i=0;i<obj.size();i++)
     {
     	VoterRegistration obj1=(VoterRegistration)obj.get(i);
        if((obj1.getEmail()!=null)&&(!(obj1.getEmail().trim().isEmpty()))&&(!(obj1.getEmail().equals("NULL")))){
         
       		Election e=ElectionDAO.searchElection(election, institute_id);
                VotingDAO v=new VotingDAO();
                VotingProcess voting=(VotingProcess)v.GetVoteStatus(institute_id, election,obj1.getEmail());
		if(voting==null){
			//check if the voter already set and is blocked
			SetVoter s=VoterRegistrationDAO.searchVoterList(institute_id, election, obj1.getId().getEnrollment());
                        if(s!=null && s.getStatus()!=null)
                        {
                        	log.add( "\nReset Password & One time key link not generated as voter is already Blocked\n");
                        }
                        else
                        {

                        	Login obj2=(Login)LoginDAO.searchLoginID(obj1.getEmail());
//				System.out.print(" The email is "+obj1.getEmail());
//				PrintWriter pw = new PrintWriter(System.out);

         			// print object
//		                   pw.print(obj2);
         
			         // change the line
  //                                   pw.println();
//				UserLog.ErrorLog("Get Values of user login "+obj1.getEmail()+" and "+obj2.toString(),"UserDataErrorSendLog.txt");
                                /*Admin Password Generate*/
                                admin_password= RandomPassword.getRandomString(10);
//				UserLog.ErrorLog("Get Values of user login pass "+admin_password,"UserDataErrorSendLog.txt");
                                admin_password1=PasswordEncruptionUtility.password_encrupt(admin_password);
//				UserLog.ErrorLog("Get Values of user login pass1 "+admin_password1,"UserDataErrorSendLog.txt");
                                obj2.setPassword(admin_password1);
//				UserLog.ErrorLog("Get Values of user login 2 "+obj2.toString(),"UserDataErrorSendLog.txt");
				
                                LoginDAO.update1(obj2);

				SetVoter o=new SetVoter();
	    			SetVoterId oi=new SetVoterId();
	    			oi.setInstituteId(institute_id);
	    			oi.setElectionId(election);
	    			oi.setEnrollment(obj1.getId().getEnrollment());
	    			o.setId(oi);
				/*One time key Generate*/
                 		onetimekey= RandomPassword.getRandomString(10);
                		onetimekey1=PasswordEncruptionUtility.password_encrupt(onetimekey);
            			o.setPassword(onetimekey1);
            			VoterRegistrationDAO.setVoter(o);

            		//	mailSend(obj1.getEmail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM11+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);

       				mailSend2(obj1.getEmail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
/*	ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
        emailExecutor.execute(new Runnable() {
            @Override
            public void run() {
                try {
       			mailSend(obj1.getEmail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                } catch (IOException e) {
                    log.add(" Mail send failed "+e);
                }
            }
        });
        emailExecutor.shutdown();
*/
                               log.add( "\nReset Password & One time key link has been send successfully to= "+obj1.getEmail());
                               if((obj1.getAlternateMail()!=null)&&(!(obj1.getAlternateMail().trim().isEmpty()))&&(!(obj1.getAlternateMail().equals("NULL"))))
                               {

                               		//mailSend1(path,obj1.getAlternateMail(),admin_password,bodymessRPOTKM1"For Casting Vote  for "+e.getElectionName()+" election","\n Your Login Id for EMS is"+obj2.getUserId()+" Password "+obj2.getPassword()+"\nClick  http://202.141.40.218:8080/EMS/voterlogin.do?email="+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+"\n");
                                        //  mailSend1(obj1.getAlternateMail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM11+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                                        //  for non threaded mail
                                         // mailSend1(obj1.getAlternateMail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                                         // for threaded mail
                                         mailSend3(obj1.getAlternateMail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);

                                        log.add( "\nReset Password & One time key link has been send successfully to Alternate Mail= "+obj1.getAlternateMail()+"\n");
                                 }//if alternet mail send
				//wait2(1000);
/*			int j=i;
			if(j%500 == 0){
				DateFormat dfor = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
                                Date dobj = new Date();
//System.out.println(dfor.format(obj));
				System.out.println(" Now we have sent 1000 mail mark "+i+" and time is "+dfor.format(dobj));
				wait2(300000);
			}
*/
			}//close else block voter
                }//voting
		else{
                        log.add( "\nReset Password & One time key link not generated as Voter already cast there vote\n");
                }
        }// mail null chek
	System.gc();
    }// end for
}
else if(action.equalsIgnoreCase("2")) //Reset Password and one time key for All Voter not cast there vote
{

	VoterRegistrationDAO voter=new VoterRegistrationDAO();
	List<VoterRegistration> rst = (List<VoterRegistration>)voter.getVoterDetailsReg(institute_id);
	System.out.println(" The size of all voter list is "+rst.size());
        for(int i=0;i<rst.size();i++)
        {
            VoterRegistration obj1=(VoterRegistration)rst.get(i);
            //if((obj1.getEmail()!=null)&&(!(obj1.getEmail().trim().isEmpty()))){
           // if(obj1.getEmail()!=null){
            if((obj1.getEmail()!=null)&&(!(obj1.getEmail().trim().isEmpty()))&&(!(obj1.getEmail().equals("NULL")))){
            
                    Election e=ElectionDAO.searchElection(election, institute_id);
                    VotingDAO v=new VotingDAO();
                    VotingProcess voting=(VotingProcess)v.GetVoteStatus(institute_id, election,obj1.getEmail());
		    if(voting==null)
                    {
//check if the voter already set and is blocked
			 SetVoter s=VoterRegistrationDAO.searchVoterList(institute_id, election, obj1.getId().getEnrollment());
                        if(s!=null && s.getStatus()!=null)
                        {
                		log.add( "\nReset Password & One time key link not generated as voter is already Blocked\n");
                        }
                        else
                        {
                        	Login obj2=(Login)LoginDAO.searchLoginID(obj1.getEmail());
                                /*Admin Password Generate*/
                                admin_password= RandomPassword.getRandomString(10);
                                admin_password1=PasswordEncruptionUtility.password_encrupt(admin_password);
                                obj2.setPassword(admin_password1);
                                LoginDAO.update1(obj2);
                                SetVoter o=new SetVoter();
   				SetVoterId oi=new SetVoterId();
    				oi.setInstituteId(institute_id);
    				oi.setElectionId(election);
    				oi.setEnrollment(obj1.getId().getEnrollment());
    				o.setId(oi);
				/*One time key Generate*/
               			onetimekey= RandomPassword.getRandomString(10);
		
               			onetimekey1=PasswordEncruptionUtility.password_encrupt(onetimekey);
       				o.setPassword(onetimekey1);
       				VoterRegistrationDAO.setVoter(o);

                                //mailSend(obj1.getEmail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM11+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                                // for non threaded mail
                                //mailSend(obj1.getEmail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                               // for threaded mail
                               mailSend2(obj1.getEmail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                               //mailSend(path,obj1.getEmail(),admin_password,bodymessRPOTKM1"For Casting Vote  for "+e.getElectionName()+" election","\n Your Login Id for EMS is"+obj2.getUserId()+" Password "+obj2.getPassword()+"\nClick  http://202.141.40.218:8080/EMS/voterlogin.do?email="+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+"\n");

  //                            log.add( "\nReset Password & One time key link has been send successfully to= "+obj1.getEmail());
                                // if(obj1.getAlternateMail()!=null)
                                       // if((obj1.getAlternateMail()!=null)&&(!(obj1.getAlternateMail().trim().isEmpty())))
                                if((obj1.getAlternateMail()!=null)&&(!(obj1.getAlternateMail().trim().isEmpty()))&&(!(obj1.getAlternateMail().equals("NULL"))))
                                {

                                	//mailSend1(obj1.getAlternateMail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM11+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                                         // for non threaded mail
                                         // mailSend1(obj1.getAlternateMail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                                         // for threaded mail
                                          mailSend3(obj1.getAlternateMail(),admin_password,subRPOTKM,bodymessRPOTKM1+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+bodymessRPOTKM2+obj2.getUserId()+" and password is  "+admin_password+" and key is "+onetimekey+bodymessRPOTKM3);
                                         // mailSend1(path,obj1.getAlternateMail(),admin_password,bodymessRPOTKM1"For Casting Vote  for "+e.getElectionName()+" election","\n Your Login Id for EMS is"+obj2.getUserId()+" Password "+obj2.getPassword()+"\nClick  http://202.141.40.218:8080/EMS/voterlogin.do?email="+obj2.getUserId()+"&hash="+admin_password+"&eid="+election+"&key="+onetimekey+"\n");
                                        //  log.add( "\nReset Password & One time key link has been send successfully to Alternate Mail= "+obj1.getAlternateMail()+"\n");
                                }// if alternet
				//wait2(1000);
		/*	int j=i;
			if(j%500 == 0){
				DateFormat dfor = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
				Date dobj1 = new Date();
//System.out.println(dfor.format(obj));
				System.out.println(" Now we have sent 1000 mail mark "+i +" and "+j+" time is "+dfor.format(dobj1));
				// 1000 milliseconds is 1 second
				wait2(300000);
			}*/
			}//else clock voter
                   }// voting check
                   else{
                       	log.add( "\nReset Password & One time key link has not been send to = "+obj1.getEmail()+ " because Voter already cast their vote."+"\n");
                  }

        	}//mail null check
	System.gc();
	}//end for

}

	UserLog.ErrorListLog(log,"ResetPasswordOneTimeLink.txt");
	session.setAttribute("log",log);

	request.setAttribute("msg", log);

	return mapping.findForward("success");
    }

	private void mailSend2(final String to,final String admin_password,final String subject,final String body){
		mexecutor.execute(new Runnable() {
                @Override
                public void run() {
                        try {
            		x=new Email(to,admin_password,subject,body);
			x.send();
                            } catch (Exception e) {
                                UserLog.ErrorLog("Mail Send Error "+to +" and "+e.toString(),"MailErrorLog.txt");
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
                                UserLog.ErrorLog("Alternet Mail Send Error "+to +" and "+e.toString(),"MailErrorLog.txt");
                            }
                }
        });

	}


    public void mailSend(String to,String admin_password,String subject,String body){
            x=new Email(to,admin_password,subject,body);
            x.send();
           

    }
      public void mailSend1(String to,String admin_password,String subject,String body){
            x=new Email(to,admin_password,subject,body);
            x.sendAlternatemail();


    }
	private void wait2(long k){
		long Time0 = System.currentTimeMillis();
    		long Time1;
		long runTime = 0;
    		while (runTime < k) { // 1000 milliseconds or 1 second
        		Time1 = System.currentTimeMillis();
        		runTime = Time1 - Time0;
    		}

        }


}
