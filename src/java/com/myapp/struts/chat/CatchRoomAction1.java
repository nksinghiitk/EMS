/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.chat;

import chat.Chatter;
import chat.Message;
import com.myapp.struts.utility.AppPath;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author edrp01
 */
public class CatchRoomAction1 extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
HashMap<String,Chatter> loginuser= new HashMap<String,Chatter>();
HashMap<String,Message> loginuser1= new HashMap<String,Message>();
static HashMap msg=new HashMap();
int candidate=0;
static int c=0;
  int i=0,j=0;
    private static final String SUCCESS = "success";
     public static final String DATE_FORMAT_NOW = "yyyy-MM-dd HH:mm:ss";
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session=request.getSession();
    String Name =(String)session.getAttribute("user_id");
    String institute_id =(String)session.getAttribute("institute_id");
    String position=(String)session.getAttribute("login_role");
    String positionname=(String)session.getAttribute("positionname");
    if(positionname!=null){

          position="candidate";
    }
     Properties pro = new Properties();
     Properties pro1 = new Properties();
     String home;
  


                // Check User Login after Room Selection
                
 
  String path = AppPath.getPropertiesFilePath();
 
  home=path;



   FileInputStream in = new FileInputStream(home+"chat.properties");
  				pro = new Properties();
                                 pro.load(in);


				Enumeration keys = pro.keys();
                                int i=0;
				while (keys.hasMoreElements())
				{
                                       String key=(String)keys.nextElement();

                                       pro1.put(key, pro.get(key));


                                       if(key.equalsIgnoreCase(institute_id+"&"+position+"&"+Name+"&h"))
                                       {
                                            System.out.println("kkkkkkkkkkkkkkkk");
                                            request.setAttribute("msg","You are Already login in Chat");
                                            return mapping.findForward("success1");
                                       }


                                   i++;
				}
				in.close();

                                 pro1.put(institute_id+"&"+position+"&"+Name+"&h",(String)session.getAttribute("electionname")+"&"+(String)session.getAttribute("positionname"));
                                 pro1.put(institute_id+"&"+position+"&"+Name,(String)session.getAttribute("electionname")+"&"+(String)session.getAttribute("positionname"));
                                OutputStream fos = new FileOutputStream(home+"chat.properties");



 session.setAttribute("chatter",Name);
  
session.setAttribute("voterchatmsg",institute_id+"&"+position+"&"+Name);



					fos = new FileOutputStream(home+"chat.properties");
					pro1.store(fos, "Current Chat Status");
					fos.close();


 return mapping.findForward(SUCCESS);




}



        
    }
