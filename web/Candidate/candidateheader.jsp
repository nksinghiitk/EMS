<%-- 
    Document   : header
    Created on : Nov 13, 2010, 4:45:02 PM
    Author     : System Administrator
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN "http://www.w3.org/TR/html4/strict.dtd">
<%@page import="java.util.*,java.io.*,java.net.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
<%!
    Locale locale=null;
    String locale1="en";
    String rtl="ltr";
    boolean page=true;
    String align="left";
%>
<%
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

    %>
<%
try{
if(session.getAttribute("institute_id")!=null){
System.out.println("institute_id"+session.getAttribute("institute_id"));
}
else{
    request.setAttribute("msg", "Your Session Expired: Please Login Again");
    %><script>parent.location = "<%=request.getContextPath()%>"+"/logout.do?session=\"expired\"";</script><%
    }
}catch(Exception e){
    request.setAttribute("msg", "Your Session Expired: Please Login Again");
    %><script>parent.location = "<%=request.getContextPath()%>"+"/login.jsp?session=\"expired\"";</script><%
    }

String user=(String)session.getAttribute("username");
String pass=(String)session.getAttribute("pass");
 session.setAttribute("pass","t");
  String user_id=   (String)session.getAttribute("user_id");
String user_name=   (String) session.getAttribute("username");
  String question=  (String)request.getAttribute("question");
   String staff_id=  (String) request.getAttribute("staff_id");
   String instituteName=  (String) session.getAttribute("institute_name");
   String role=  (String) session.getAttribute("login_role");
   String contextPath = request.getContextPath();
%>

<table width="100%" height="50px;" border="2px"  style="margin:0px 0px 0px 0px;" dir="<%=rtl%>">

    <tr dir="<%=rtl%>" valign="top"><td valign="top" dir="<%=rtl%>" width="550px">

                        <p align="<%=align%>"  style="font-family:Arial;color:brown;font-size:22px; " dir="<%=rtl%>">&nbsp;&nbsp;<%=resource.getString("electionmanagement")%><br/><br></td>
                    <td dir="<%=rtl%>" valign="top"><p align="left"   style="font-family:Arial;color:brown;font-size:16px;margin-top: 0px;" dir="<%=rtl%>"><span dir="<%=rtl%>"><b><%=instituteName%><br>&nbsp; Role[<%=role%>]</b></span></td>

                    <td align="right" width="250px" valign="top" dir="<%=rtl%>"><span style="font-family:arial;color:brown;font-size:12px;" dir="<%=rtl%>"><b dir="<%=rtl%>"><%=resource.getString("login.hello")%> [<%=user%>]&nbsp;|<a href="<%=contextPath%>/logout.do" style="text-decoration: none;color:brown" dir="<%=rtl%>">&nbsp;<%=resource.getString("login.signout")%></a></b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                     </td>
                </tr>




                </table>

