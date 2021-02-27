<!-- MAIL SETTING BY SUPERADMIN-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="java.util.*,java.io.*,java.net.*,java.io.FileInputStream,com.myapp.struts.utility.AppPath"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/LibMS/css/page.css"/>
           <script language="javascript" type="text/javascript">
               function reset1()
        {
        document.getElementById('f1').faddress.value="";
        document.getElementById('f1').password.value="";
        document.getElementById('f1').host.value="";
        document.getElementById('f1').port.value="";
        document.getElementById('f1').sname.value="";
         return false;
        }
        function check1()
        {
        var faddress=document.getElementById('f1').faddress.value;
        var password=document.getElementById('f1').password.value;
        var host=document.getElementById('f1').host.value;
        var port=document.getElementById('f1').port.value;
        var sname=document.getElementById('f1').sname.value;
         if(faddress=="")
         {
            alert("Please Enter Email Configuration Address");
            document.getElementById('f1').faddress.focus();
            return false;
        }
        if(password=="")
        {
            alert("Please Enter Email Configrution password");
            document.getElementById('f1').password.focus();
            return false;
        }
        if(host=="")
        {
            alert("Please Enter Email Configuration Host Address");
            document.getElementById('f1').host.focus();
            return false;
        }
        if(port=="")
        {
            alert("Please Enter Email Configuration port Address");
            document.getElementById('f1').port.focus();
            return false;
        }
        if(sname=="")
        {
            alert("Please Enter Email Address of sender");
            document.getElementById('f1').sname.focus();
            return false;
        }
  }
    </script>
        <%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
    </head>
    <body >
        <%
        Properties libmspro = new Properties();
			String path=AppPath.getPropertiesFilePath();
                        libmspro.load(new FileInputStream(path+"ems.properties"));
			String userid = libmspro.getProperty("webadmin");
        		String buffer = libmspro.getProperty("webpass");
        		String host = libmspro.getProperty("host");
        		String port = libmspro.getProperty("port");
        		String frmAdd = libmspro.getProperty("faddress");

%>
        <html:form  styleId="f1" action="/mailsetting" method="post" >
            <table width="400px" align="center" class="datagrid" style="border:solid 1px ">
                        <tr><td  colspan="2" class="headerStyle" align="center">SuperAdmin Mail Setting</td></tr>
                        <tr><td  class="txt1" width="250px">F Address</td><td width="250px"><input type="text" id="faddress" style="width:200px" name="faddress" value="<%=frmAdd%>" ></td></tr>
                       <tr><td class="txt1" >Password</td><td><input type="password" id="password" name="password" style="width:200px" value="<%=buffer%>" ></td></tr>
                       <tr><td class="txt1" >Host</td><td><input type="text" id="host" name="host" style="width:200px" value="<%=host%>" ></td></tr>
                        <tr><td class="txt1" >Port</td><td><input type="text" id="port" name="port" style="width:200px" value="<%=port%>"></td></tr>
                        <tr><td class="txt1" >S Name</td><td><input type="text" id="sname" name="sname" style="width:200px" value="<%=userid%>"></td></tr>
                        <tr><td colspan="2" align="center">
                                
                                <input type="submit" id="Button1"  name="button" value="Submit" onclick="return check1();" class="txt2" >
                                <input type="submit" id="Button2" value="Reset" onclick="return reset1();" class="txt2">
                            </td></tr>
                    <tr><td colspan="2" height="10px">
                           <%
       String msgmail=(String)request.getAttribute("msg");
       if(msgmail!=null)
           {
               out.println(msgmail);
          }
    %>

                        </td></tr>
                    </table>
          </html:form>
        
    </body>


</html>
