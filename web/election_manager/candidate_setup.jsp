<%-- 
    Document   : candidate_setup
    Created on : Jun 27, 2011, 4:29:08 PM
    Author     : Edrp-04
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
<jsp:include page="/election_manager/login.jsp"/>
<%@page import="com.myapp.struts.admin.StaffDoc,com.myapp.struts.hbm.*,com.myapp.struts.hbm.VoterRegistration,com.myapp.struts.hbm.CandidateRegistration"%>

    <%@ page import="java.util.*,java.lang.*"%>
    <%@ page import="org.apache.taglibs.datagrid.DataGridParameters"%>
    <%@ page import="org.apache.taglibs.datagrid.DataGridTag"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*"   %>
    <%@ taglib uri="http://jakarta.apache.org/taglibs/datagrid-1.0" prefix="ui" %>
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Setup</title>
         <style>
    th a:link      { text-decoration: none; color: black }
     th a:visited   { text-decoration: none; color: black }
     .rows          { background-color: white }
     .hiliterows    { background-color: pink; color: #000000; font-weight: bold }
     .alternaterows { background-color: #efefef }
     .header        { background-color: #7697BC; color: #FFFFFF;font-weight: bold }

     .datagrid      { border: 1px solid #C7C5B2; font-family: arial; font-size: 9pt;
	    font-weight: normal }
</style>
    </head>
    <body>

        <%!


   StaffDoc Ob;
   VoterRegistration voter;
   CandidateRegistration candiadte;
   VoterCandidate voter1;
  // Election_Manager_StaffDetail ems;
  // AdminRegistration adminReg;
   //ElectionManager electionmanager;
   //StaffDetail staffdetail;

   ArrayList requestList;
   int fromIndex=0, toIndex;

%>



 <%

 //List rs = (List)session.getAttribute("resultset");
 List<VoterCandidate> rs = (List<VoterCandidate>)session.getAttribute("resultset1");


   requestList = new ArrayList();
//requestList = (ArrayList)session.getAttribute("resultset");
   int tcount =0;
   int perpage=5;
   int tpage=0;
 /*Create a connection by using getConnection() method
   that takes parameters of string type connection url,
   user name and password to connect to database.*/
if(rs!=null){
  Iterator it = rs.iterator();
System.out.println("it="+(tcount));
//requestList = (Login)rs.get(0);

   while (it.hasNext()) {

	System.out.println("it="+(tcount));
        voter1 = (VoterCandidate)rs.get(tcount);
       // staffdetail = (StaffDetail)rs.get(tcount).getStaffDetail();

        Ob = new StaffDoc ();
        //ems=new Election_Manager_StaffDetail();

       // Ob.setmanager_id(electionmanager.getId().getManagerId());
        //Ob.setinstitute_id(electionmanager.getId().getInstituteId());
        //Ob.setfirst_name(staffdetail.getFirstName());
        //Ob.setlast_name(staffdetail.getLastName());
        //Ob.setStaff_id(electionmanager.getStaffId());
        //Ob.setUser_id(electionmanager.getUserId());
        //Ob.setStatus(electionmanager.getStatus());
        Ob.setEnrollment(voter1.getVoterRegistration().getId().getEnrollment());
        Ob.setVoter_name(voter1.getVoterRegistration().getVoterName());
        Ob.setDepartment(voter1.getVoterRegistration().getDepartment());
        Ob.setCourse(voter1.getVoterRegistration().getCourse());
        Ob.setYear(voter1.getVoterRegistration().getYear());
        Ob.setStatus(voter1.getCandidateRegistration().getStatus());
        //ems.getElectionManager().setStatus(ems.getElectionManager().getStatus());









   requestList.add(Ob);
   tcount++;
it.next();
   //System.out.println("tcount="+tcount);
		     }

System.out.println("tcount="+tcount);

   fromIndex = (int) DataGridParameters.getDataGridPageIndex (request, "datagrid1");
   if ((toIndex = fromIndex+5) >= requestList.size ())
   toIndex = requestList.size();
   request.setAttribute ("requestList", requestList.subList(fromIndex, toIndex));
   pageContext.setAttribute("tCount", tcount);
   }

String path=request.getContextPath();
pageContext.setAttribute("path", path);
  %>


<br><br>

<%if(tcount==0)
{%>
<p class="err" style="font-size:12px">No Record Found</p>
<%}
else
{%>
<table align="" dir="" width="80%">
    <tr dir=""><td dir="">
<ui:dataGrid items="${requestList}"  var="doc" name="datagrid1" cellPadding="0" cellSpacing="0" styleClass="datagrid">

  <columns>

    <column width="10%">
      <header value="Enrollment_No" hAlign="left" styleClass="header"/>
      <item   value="${doc.enrollment}" hyperLink="${path}/candidate.do?id=${doc.enrollment}"  hAlign="left"    styleClass="item"/>
    </column>

    <column width="10%">
      <header value="Candidate_Name" hAlign="left" styleClass="header"/>
      <item   value="${doc.voter_name}" hAlign="left" hyperLink="${path}/candidate.do?id=${doc.enrollment}"  styleClass="item"/>
    </column>
    <column width="10%">
      <header value="Department" hAlign="left" styleClass="header"/>
      <item   value="${doc.department}" hAlign="left" hyperLink="${path}/candidate.do?id=${doc.enrollment}"  styleClass="item"/>
    </column>

    <column width="10%">
      <header value="Course" hAlign="left" styleClass="header"/>
      <item   value="${doc.course}" hyperLink="${path}/candidate.do?id=${doc.enrollment}"  hAlign="left" styleClass="item"/>
    </column>


       <column width="10%">
      <header value="Year" hAlign="left" styleClass="header"/>
      <item   value="${doc.year}" hyperLink="${path}/candidate.do?id=${doc.enrollment}"  hAlign="left" styleClass="item"/>
    </column>


      <column width="10%">
      <header value="Status" hAlign="left" styleClass="header"/>
      <item   value="${doc.status}" hyperLink="${path}/candidate.do?id=${doc.enrollment}"  hAlign="left" styleClass="item"/>
    </column>



 </columns>

<rows styleClass="rows" hiliteStyleClass="hiliterows"/>
  <alternateRows styleClass="alternaterows"/>

  <paging size="5" count="${tCount}" custom="true" nextUrlVar="next"
       previousUrlVar="previous" pagesVar="pages"/>
  <order imgAsc="up.gif" imgDesc="down.gif"/>
</ui:dataGrid>

  <table width="500" style="font-family: arial; font-size: 10pt" border=0>
<tr>
<td align="left" width="100px">
<c:if test="${previous != null}">
<a href="<c:out value="${previous}"/>">Previous</a>
</c:if>&nbsp;
<c:if test="${next != null}">
    <a href="<c:out value="${next}"/>">Next</a>
</c:if>

</td><td width="400px" align="center">

<c:forEach items="${pages}" var="page">
<c:choose>
  <c:when test="${page.current}">
    <b><a href="<c:out value="${page.url}"/>"><c:out value="${page.index}"/></a></b>
  </c:when>
  <c:otherwise>
    <a href="<c:out value="${page.url}"/>"><c:out value="${page.index}"/></a>
  </c:otherwise>
</c:choose>
</c:forEach>
</td>

</tr>
<%--<tr><td>
        <%

String msg=(String)request.getAttribute("msg");
if(msg!=null)
    {%>
    <p class="err" style="font-size:12px"><%=msg%></p>


<%}%>

</td></tr>--%>
</table>

  <%}%></td></tr>
</table>
    </body>

</html>