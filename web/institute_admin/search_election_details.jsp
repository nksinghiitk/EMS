<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%
String role=(String)session.getAttribute("login_role");
if(role.equalsIgnoreCase("insti-admin")|| role.equalsIgnoreCase("insti-admin,voter"))
   {
%>
<jsp:include page="/institute_admin/adminheader.jsp"/>
<%}else if(role.equalsIgnoreCase("Election Manager")|| role.equalsIgnoreCase("Election Manager,voter")){%>
<jsp:include page="/election_manager/login.jsp"/>
<%}else{%>

<%}%>
<%@page import="java.util.*,java.io.*,java.net.*"%>

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



<html><head>
<title>Browsing.....</title>


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
    %>sessionout();<%
    }

%>

<style type="text/css">
body
{
   background-color: #FFFFFF;
   color: #000000;
}
</style>
<script language="javascript">
function fun()
{
document.Form1.action="<%=request.getContextPath()%>/get_elections.do";
document.Form1.method="post";
document.Form1.target="f1";
document.Form1.submit();
//window.setInterval('winresize()', 100);
}

 function winresize()
{
    //alert(document.width);
  
   var winwidth = document.width;
    var IFRAMERef = frames['f1'];
   // alert(IFRAMERef);
    var frmwidth = IFRAMERef.document.width;
    var windiff=200;
    var frmheight;
        if(IFRAMERef.document.getElementById("f1")!=undefined)
        frmheight= IFRAMERef.document.getElementById("f1").height;
        else
            if(IFRAMERef.document.getElementById("form3")!=undefined)
        frmheight= IFRAMERef.document.getElementById("form3").height;
        else
            frmheight = 500+"px";
    //alert("frmheight="+frmheight);
    if(winwidth!=undefined && frmwidth!=undefined)
        windiff= winwidth - frmwidth;
    document.getElementById("ifr3").style.paddingLeft = windiff*0.5+"px";
    document.getElementById("ifr3").style.height = frmheight;
   
}
</script>
</head>
<link rel="stylesheet" href="/EMS/css/page.css"/>
<body onload="fun()" class="datagrid">
   

    <form name="Form1" id="form1" action="<%=request.getContextPath()%>/get_elections.do" style="" >
      <table  align="left" width="100%"  class="datagrid"  style="border:solid 1px #e0e8f5;" dir="<%=rtl%>" align="<%=align%>">



          <tr class="header"><td  width="100%"   align="center" colspan="2" dir="<%=rtl%>">


                 Search Election
                  <%--<%=resource.getString("login.searchinstitute.institutesearch")%>--%>




        </td></tr>
  <tr style="background-color:#e0e8f5;"><td width="800px"  >
          <table dir="<%=rtl%>" align="<%=align%>">
              <tr><td dir="<%=rtl%>" align="<%=align%>"><%=resource.getString("enterstartingkeyword")%></td><td><input  name="search_keyword" type="text" id="search_keyword" onkeyup="fun()"></td>
              <td>


                  <input type="reset" id="Button1" name="clear" value="<%=resource.getString("login.searchinstitute.clear")%>">


      </td></tr>
              

          </table>
      </td>
      <td    align="left" valign="top">
          <table >
              <tr><td dir="<%=rtl%>" align="<%=align%>"><%=resource.getString("login.searchinstitute.infield")%> </td><td rowspan="2" valign="top">
                      <select name="search_by" onChange="fun()" id="search_by" size="1">

<option value="id.electionId">Election Id<%--<%=resource.getString("managerid")%>--%></option>
<option value="electionName">Election Name<%--<%=resource.getString("managerid")%>--%></option>
<option value="status">Election Status<%--<%=resource.getString("managerid")%>--%></option>


</select>

          
     </td>

              </tr></table></td></tr>
  <tr class="header"><td dir="<%=rtl%>" align="left" colspan="2"><%=resource.getString("login.searchinstitute.sortby")%></td></tr>
   <tr style="background-color:#e0e8f5;">
       <td align="left" colspan="2">
           <table>
                           <tr><td dir="<%=rtl%>" align="<%=align%>"><%=resource.getString("login.searchinstitute.field")%></td><td><select name="sort_by" id="sort_by" size="1" onChange="fun()" id="">
<option value="id.electionId">Election Id<%--<%=resource.getString("managerid")%>--%></option>
<option value="electionName">Election Name<%--<%=resource.getString("managerid")%>--%></option>
<option value="status">Election Status<%--<%=resource.getString("managerid")%>--%></option>
</select></td>
                           </tr></table>


      </td>

  </tr>
  <tr><td colspan="2" id="ifr3"><IFRAME  name="f1" src="<%=request.getContextPath()%>/get_elections.do" frameborder=0  id="f1" width="100%" height="700px" ></IFRAME></td></tr>
     
  <tr><td><input type="hidden" id="hidHigh"/></td></tr>
       </table>



   






 

</form>

    

</body>
</html>