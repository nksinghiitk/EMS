/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.utility;


import java.io.FileInputStream;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Arrays;

public class Email {
	private String to;
	private String subject;
	private String text;
	String userid;
	String host;
	String port;
	String path;
	String buffer;
	String frmAdd;
	String replyto;
	Session session ;
	MimeMessage message;

	public Email(String to,String password,String subject,String body){

		this.to = to; this.subject=subject;this.text=body; this.path=path;
                Email_Sing proper=Email_Sing.getInstance();
                Properties props=proper.getEmail_Sing();
                userid=props.getProperty("mail.smtp.user");
                buffer=props.getProperty("mail.smtp.password");
                port=props.getProperty("mail.smtp.port");
                host=props.getProperty("mail.smtp.host");
                frmAdd=props.getProperty("frmAdd");

                session = Session.getDefaultInstance(props, null);
		session.setDebug(false);
        		message = new MimeMessage(session);
                    
//		try{
//			String os= (String)System.getProperty("os.name");
//			Properties libmspro = new Properties();
//			path=AppPath.getPropertiesFilePath();
//                      libmspro.load(new FileInputStream(path+"ems.properties"));
//			userid = libmspro.getProperty("webadmin");
//        		buffer = libmspro.getProperty("webpass");
//        		host = libmspro.getProperty("host");
//        		port = libmspro.getProperty("port");
//        		frmAdd = libmspro.getProperty("faddress");
//			Properties props = System.getProperties();
//        		props.put("mail.smtp.starttls.enable", "true");
//        		props.put("mail.smtp.host", host);
//        		props.setProperty("mail.transport.protocol", "smtp");
//        		props.put("mail.smtp.user", userid);
//        		props.put("mail.smtp.password",buffer);
//        		props.put("mail.smtp.port", port);
//        		props.put("mail.smtp.auth", "true");
//        		session = Session.getDefaultInstance(props, null);
//        		message = new MimeMessage(session);
//		}
//		catch (Exception ex) {
//	        	ex.printStackTrace();
//                        UserLog.ErrorLog(ex.getMessage(),"MailSendLog.txt");
//           	}
	}

	public void send(){
		try{
			InternetAddress fromAddress = null;
			InternetAddress toAddress = null;
			try {
				fromAddress = new InternetAddress(frmAdd);
				toAddress = new InternetAddress(to);
			} catch (AddressException e) {

                                 UserLog.ErrorLog(e.getMessage().toString(),"MailSendLog.txt");
			}
			message.setFrom(fromAddress);
			message.setRecipient(RecipientType.TO, toAddress);
			message.setSubject(subject);
//			message.addHeader("Expiry-date","");
			message.setReplyTo(new javax.mail.Address[]
			{
			    new InternetAddress("election@iitkalumni.org")
			});
			message.setText(text);

			String pass=buffer.toString();
			Transport transport = session.getTransport("smtp");
			transport.connect(host, userid, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
                        UserLog.ErrorLog("Mail Send "+to +" and Internet address "+toAddress,"MailSendLog.txt");
		} catch (Exception e) {
			 UserLog.ErrorLog("Exception Mail send "+to+" and "+e.getMessage().toString(),"MailSendLog.txt");
			UserLog.ErrorLog("Mail Send Error "+to +" and "+e.getMessage().toString(),"MailErrorLog.txt");

	//		wait2(5000);
	//		send();
		}
	}

    	public void sendAlternatemail(){
		try{
			InternetAddress fromAddress = null;
 			InternetAddress[] toAddress =null;
			try {
				fromAddress = new InternetAddress(frmAdd);
				toAddress =  InternetAddress.parse(to);
			} catch (AddressException e) {
				 UserLog.ErrorLog(e.getMessage().toString(),"MailSendLog.txt");
			}
			message.setFrom(fromAddress);
 			message.setRecipients(Message.RecipientType.TO, toAddress);
			message.setSubject(subject);
//			message.setTimeToLive(43200000);
			message.setReplyTo(new javax.mail.Address[]
                        {
                            new InternetAddress("election@iitkalumni.org")
                        });
			message.setText(text);

			String pass=buffer.toString();
			Transport transport = session.getTransport("smtp");
			transport.connect(host, userid, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
                        UserLog.ErrorLog("Alternet Mail Send "+ to +" and Internet address "+Arrays.toString(toAddress),"MailSendLog.txt");
		} catch (Exception e) {
			UserLog.ErrorLog("Mail Send Error "+to +" and "+e.getMessage().toString(),"MailErrorLog.txt");
			 UserLog.ErrorLog("Exception Mail send Alternet"+to+" and "+e.getMessage().toString(),"MailSendLog.txt");
	//		wait2(5000);
	//		sendAlternatemail();
		}
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
