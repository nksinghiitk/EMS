<%-- 
    Document   : SetMailBody
    Created on : Feb 5, 2012, 11:54:47 AM
    Author     : guest
--%>

<%@page contentType="text/html" import="java.util.*,java.io.*,com.myapp.struts.utility.*" pageEncoding="UTF-8"%>
<%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String role=(String)session.getAttribute("login_role");
String userid=(String)session.getAttribute("user_id");
String id=(String)request.getParameter("id");
if(id!=null){
session.setAttribute("id", id);
session.removeAttribute("mail");
}
String mail=(String)request.getParameter("mail");
if(mail!=null){
 session.setAttribute("mail", mail);
 session.removeAttribute("id");
 }
String msg=(String)request.getAttribute("msg");
if(msg!=null){
 out.println(msg);
 }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <script type="text/javascript">
        function submit3(){
   // alert("ok");

document.Form1.action="<%=request.getContextPath()%>/sendallmail.do?&button=sendmailtoall";
document.Form1.method="post";
document.Form1.submit();
}
function submit1(){
   // alert("ok");
     
document.Form1.action="<%=request.getContextPath()%>/sendallmail.do?&button=sendmail";
document.Form1.method="post";
document.Form1.submit();
}
function submit2(){
   // alert("ok");

document.Form1.action="<%=request.getContextPath()%>/sendallmail.do?&button=update";
document.Form1.method="post";
document.Form1.submit();



}
</script>
    <%!
       String mailbody;
     %>

<%
     //  String path =(String) session.getAttribute("apppath");
   // System.out.println("ok"+path+userid+"voter");
      //    FileInputStream in = new FileInputStream(path+"/web/mail.properties");
            
  	//	Properties	pro = new Properties();
          //      pro.load(in);
        //	Enumeration keys = pro.keys();

	//			while (keys.hasMoreElements())
	//			{
          //                             String key=(String)keys.nextElement();

            //                           if(key.equalsIgnoreCase(userid+"candi")){
                                       //mailbody=(String)pro.get(key);
    mailbody=UserLog.readProperty("mail.properties", userid+"candi");
                                      
                                      // }
				//}
				//in.close();

                                List msg2=(List)request.getAttribute("msg2");
if(msg2!=null){
	if(msg2.isEmpty()==false ){
		for(int i=0;i<msg2.size(); i++)
	    		out.println(msg2.get(i)+"\n");
	}
}


%>
    <body>

        <form name="Form1" action="<%=request.getContextPath()%>/sendallmail1.do" name="CandidateRegActionForm"  >
     <table  cellspacing="10px" align="center">
                <tr><td><u>Candidate Mail Body</u></td></tr>
                    <tr>

                        <td>Type the Mail Body</td>
<td><textarea   cols="50" rows="5" name="candidateid" id="candidateid"><%=mailbody%></textarea><br><br>
<%
if(session.getAttribute("mail")!=null){

%>
    <input type="Submit" onclick="return submit3();"  id="button" name="button" value="Send Mail To All" />
   
    <%}else{%>
     <input type="Submit" onclick="return submit1();"  id="button" name="button" value="Send Mail" />

   
     
<%}%>
  <input type="Submit" onclick="return submit2();" id="button" name="button" value="Update" />
                        </td>
                    </tr>

                   
                </table>

 



   
        </form>

    

    </body>
</html>
