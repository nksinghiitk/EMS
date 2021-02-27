/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.institute_admin;


import com.myapp.struts.utility.PasswordEncruptionUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.myapp.struts.hbm.*;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import  com.myapp.struts.utility.*;
import java.io.FileInputStream;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.*;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Edrp-04
 */
public class Election_Manager_RegistrationAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
     private final ExecutorService executor=Executors.newFixedThreadPool(1);
    Email obj;

    private static final String SUCCESS = "success";
     private String first_name;
    private String last_name;
    private String address1;
    private String city1;
    private String state1;
    private String country1;
    private String gender;
    private String contact_no;
    private String mobile_no;
    private String department;
    private String staff_id;
    private String manager_id;
    private String institute_id;
     private String user_id;
    private String password;
    private String zip1;
    private String repassword;
    private String email_id;
    private String admin_password;
    private String admin_password1;
    Locale locale=null;
    String locale1="en";
    String rtl="ltr";
    boolean page=true;
    String align="left";
    private String button;



    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Election_Manager_RegistrationActionForm ManagerRegistrationForm=(Election_Manager_RegistrationActionForm)form;
        HttpSession session = request.getSession();
        first_name=ManagerRegistrationForm.getFirst_name();
        last_name=ManagerRegistrationForm.getLast_name();
        address1=ManagerRegistrationForm.getAddress1();
        city1=ManagerRegistrationForm.getCity1();
        state1=ManagerRegistrationForm.getState1();
        country1=ManagerRegistrationForm.getCountry1();
        gender=ManagerRegistrationForm.getGender();
        contact_no=ManagerRegistrationForm.getContact_no();
        mobile_no=ManagerRegistrationForm.getMobile_no();
        department=ManagerRegistrationForm.getDepartment();
        // staff_id=ManagerRegistrationForm.getStaff_id();
        // manager_id=ManagerRegistrationForm.getManager_id();
       institute_id=(String) session.getAttribute("institute_id");
        //auto generated Manager ID & Staff ID
        button=ManagerRegistrationForm.getsubmit();
        System.out.println("button issssssssssdddddd "+button);



        System.out.println(staff_id+"   "+manager_id);

        //institute_id=ManagerRegistrationForm.getInstitute_id();

        institute_id=(String)session.getAttribute("institute_id");


        //user_id=ManagerRegistrationForm.getUser_id();
       // password=ManagerRegistrationForm.getPassword();
        zip1=ManagerRegistrationForm.getZip1();
        //repassword=ManagerRegistrationForm.getRepassword();
        email_id=ManagerRegistrationForm.getEmail_id();
        user_id=email_id;
        try{
          //  HttpSession session=request.getSession();

            try{
locale1=(String)session.getAttribute("locale");

    if(session.getAttribute("locale")!=null)
    {
        locale1 = (String)session.getAttribute("locale");
       // System.out.println("locale="+locale1);
    }
    else locale1="en";
}catch(Exception e){locale1="en";}
     locale = new Locale(locale1);
    if(!(locale1.equals("ur")||locale1.equals("ar"))){ rtl="LTR";page=true;align="left";}
    else{ rtl="RTL";page=false;align="right";}
    ResourceBundle resource = ResourceBundle.getBundle("multiLingualBundle", locale);




         AdminRegistrationDAO admindao = new AdminRegistrationDAO();
        ElectionManagerDAO electionmanagerdao=new ElectionManagerDAO();
        StaffDetailDAO staffdetaildao=new StaffDetailDAO();
        LoginDAO logindao= new LoginDAO();
            //StaffManagerDAO staffmanagerdao=new StaffManagerDAO();


       StaffDetail staffdetail=new StaffDetail();
        ElectionManager electionmanager=new ElectionManager();
        ElectionManagerId electionprimary=new ElectionManagerId();
        StaffDetailId staffdetailprimary=new StaffDetailId();
        Login login =new Login();


      // List rs1=logindao.getStaffDetails(staff_id, institute_id);
      // List rs2=electionmanagerdao.getStaffDetails(staff_id, institute_id);





       //25.11
       if(button.equals("Update")){
             ElectionManagerDAO electionmanagerdao1=new ElectionManagerDAO();
              electionmanagerdao1=new ElectionManagerDAO();
             //ElectionManager electionmanager1=new ElectionManager();
             Election_Manager_RegistrationActionForm ManagerRegistrationForm1=(Election_Manager_RegistrationActionForm)form;
             StaffDetailDAO st= new StaffDetailDAO();
            manager_id=ManagerRegistrationForm1.getManager_id();
            staff_id=ManagerRegistrationForm1.getStaff_id();
            institute_id=ManagerRegistrationForm1.getInstitute_id();
             List<ElectionManager> elm =electionmanagerdao1.ManagerDeatils(manager_id, institute_id);
             List<StaffDetail> elm1 =st.getStaffDetails(staff_id, institute_id);
            System.out.println("manager idddddddd "+manager_id +"  ddd ");
             if(elm!=null && !elm.isEmpty())
            {
                //electionmanager1=(ElectionManager) elm.get(0);
                 elm.get(0).setDepartment(ManagerRegistrationForm1.getDepartment());
                 elm1.get(0).setFirstName(ManagerRegistrationForm1.getFirst_name());
                 elm1.get(0).setLastName(ManagerRegistrationForm1.getLast_name());
                  elm1.get(0).setAddress1(ManagerRegistrationForm1.getAddress1());
                  elm1.get(0).setCity1(ManagerRegistrationForm1.getCity1());
                  elm1.get(0).setCountry1(ManagerRegistrationForm1.getCountry1());
                  elm1.get(0).setState1(ManagerRegistrationForm1.getState1());
                  elm1.get(0).setZip1(ManagerRegistrationForm1.getZip1());
                  elm1.get(0).setGender(ManagerRegistrationForm1.getGender());
                  elm1.get(0).setContactNo(ManagerRegistrationForm1.getContact_no());
                  elm1.get(0).setMobileNo(ManagerRegistrationForm1.getMobile_no());



                //electionprimary.setInstituteId(institute_id);
                //electionprimary.setManagerId(manager_id);

//                electionmanager1.setDepartment(department);
//                electionmanager1.setStaffId(staff_id);

                electionmanagerdao1.update(elm.get(0));
                st.update(elm1.get(0));
             }
             String msg=resource.getString("record_updated_successfully");
            request.setAttribute("msg",msg);
        return mapping.findForward("success1");

       }
       else{
       //25.11

         staff_id=(String)ElectionDAO.returnMaxElectionManagerId(institute_id);
        manager_id=staff_id;
        //Iterator i1= rs1.iterator();
       //Iterator i2=rs2.iterator();
       System.out.println("staff id isssssssssss  "+staff_id+"   "+manager_id);
       
       List rs4=logindao.getStaffDetails(staff_id, institute_id);
      
      // List rs2=MyQueryResult.getMyExecuteQuery("select * from staff_detail where emai_id='"+admin_email+"'");
      
       Iterator it4 = rs4.iterator();
       
       //code added on 4 Feb 2014
       int sid;
       while(it4.hasNext()){
           sid =Integer.parseInt(staff_id)+1;
           staff_id=Integer.toString(sid);
           rs4=logindao.getStaffDetails(staff_id, institute_id);
           it4 = rs4.iterator();
           System.out.println("staff id isssssssssss  "+staff_id+"   "+manager_id);
       }
       //code added on 4 Feb 2014
       
       manager_id=staff_id;
       List rs=admindao.getAdminDeatilsByUserId(user_id);
       List rs1=logindao.getUser(user_id);
       List rs2=electionmanagerdao.getUserId(user_id);
       List rs3=staffdetaildao.getStaffDetails(staff_id, institute_id);
        List rs5=electionmanagerdao.getStaffDetails(staff_id, institute_id);
       List rs6=electionmanagerdao.ManagerDeatils(manager_id, institute_id);
        Iterator it = rs.iterator();
       Iterator it1 = rs1.iterator();
       Iterator it2 = rs2.iterator();
       Iterator it3 = rs3.iterator();
       Iterator it5=rs5.iterator();
       Iterator it6= rs6.iterator();
       if(it.hasNext() || it1.hasNext() || it2.hasNext() )
       {
String msg1=resource.getString("duplicate_user_id");
            request.setAttribute("msg1", msg1);
            return mapping.findForward("failure");
       }

       else if(it3.hasNext() || it5.hasNext())
       {
           String msg2=resource.getString("duplicate_staff_id");
         request.setAttribute("msg2", msg2);
         return mapping.findForward("failure");
       }
       else if(it6.hasNext())
       {
           String msg3=resource.getString("duplicate_manager_id");
           request.setAttribute("msg3", msg3);
           return mapping.findForward("failure");
       }

        else{



        //Election_Manager_StaffDetail ems = new Election_Manager_StaffDetail();

        /*ems.getElectionManager().getId().setInstituteId(institute_id);
        ems.getElectionManager().getId().setManagerId(manager_id);
        ems.getElectionManager().setDepartment(department);
        ems.getElectionManager().setStaffId(staff_id);
        ems.getElectionManager().setStatus("ok");
        ems.getElectionManager().setUserId(user_id);
        ems.getStaffDetail().getId().setInstituteId(institute_id);
        ems.getStaffDetail().getId().setStaffId(staff_id);
        ems.getStaffDetail().setFirstName(first_name);
        ems.getStaffDetail().setLastName(last_name);
        ems.getStaffDetail().setAddress1(address1);
        ems.getStaffDetail().setCity1(city1);
        ems.getStaffDetail().setState1(state1);
        ems.getStaffDetail().setCountry1(country1);
        ems.getStaffDetail().setContactNo(contact_no);
        ems.getStaffDetail().setMobileNo(mobile_no);
        ems.getStaffDetail().setGender(gender);
        ems.getStaffDetail().setZip1(zip1);
        ems.getStaffDetail().setEmailId(email_id);
        ems.getLogin().setUserId(user_id);
        ems.getLogin().setPassword(password);
        ems.getLogin().setRole("Election Manager");
        ems.getLogin().setStaffDetail(staffdetail);*/

        electionprimary.setInstituteId(institute_id);
        electionprimary.setManagerId(manager_id);

        electionmanager.setDepartment(department);
        electionmanager.setStaffId(staff_id);
        electionmanager.setStatus("OK");
        electionmanager.setUserId(user_id);
        electionmanager.setId(electionprimary);

        staffdetailprimary.setInstituteId(institute_id);
        staffdetailprimary.setStaffId(staff_id);

        staffdetail.setFirstName(first_name);
        staffdetail.setLastName(last_name);
        staffdetail.setAddress1(address1);
        staffdetail.setCity1(city1);
        staffdetail.setCountry1(country1);
        staffdetail.setState1(state1);
        staffdetail.setZip1(zip1);
        staffdetail.setGender(gender);
        staffdetail.setContactNo(contact_no);
        staffdetail.setMobileNo(mobile_no);
        staffdetail.setEmailId(email_id);
        staffdetail.setEnrollment(staff_id);

        staffdetail.setId(staffdetailprimary);


        login.setUserId(user_id);

         /*Admin Password Generate*/
                 admin_password= RandomPassword.getRandomString(10);
                 System.out.println(admin_password);
                admin_password1=PasswordEncruptionUtility.password_encrupt(admin_password);



         login.setPassword(admin_password1);



        login.setRole("Election Manager");
        login.setUserName(staffdetail.getFirstName()+" "+staffdetail.getLastName());
        login.setStaffDetail(staffdetail);




        System.out.println("Institute_id="+electionmanager.getId().getInstituteId()+" manager_id="+electionmanager.getId().getManagerId());



        //staffmanagerdao.insert(ems);

        staffdetaildao.insert(staffdetail);
        logindao.insert(login);
         electionmanagerdao.insert(electionmanager);
         String msg=resource.getString("record_inserted_successfully");
         request.setAttribute("msg",msg);
         String mailbody=UserLog.readProperty("mail.properties", user_id+"em");


       if(mailbody=="")
       mailbody="\n You are Registered as a Election Manager with given following details\n";

         obj=new Email(email_id,admin_password,"Registration Accepted Successfully from EMS"," Dear "+login.getUserName()+mailbody+"user_id="+user_id +" , Password for EMS Login ="+admin_password+".\nWith Regards\nInstitute Admin\n"+session.getAttribute("institute_name")+"\nElectionMS");
         System.out.println(email_id+institute_id+admin_password);
         executor.submit(new Runnable() {

                public void run() {

                    obj.send();
                }
            });
        return mapping.findForward(SUCCESS);
        }
        }
        }
        catch(HibernateException e)
        {
throw e;
    }
}
}
