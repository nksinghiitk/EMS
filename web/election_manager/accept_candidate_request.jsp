<%--
    Document   : candidate_registration
    Created on : 18 Jun, 2011, 7:28:39 PM
    Author     : akhtar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.myapp.struts.hbm.*,java.util.*;"%>
<%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%! boolean read = false;%>
<%
            String btn = (String) request.getAttribute("button");
            if (btn.equals("Add") || btn.equals("Delete")) {
                read = true;
            } else {
                read = false;
            }
            String status = request.getParameter("status");
            if(status.equalsIgnoreCase("U")) {read = false;btn="Update";}
            String msg1 = (String) request.getAttribute("msg1");
%>
<script type="text/javascript">

   
      function submit()
      {
         

          document.getElementsById("filename").value=document.getElementById("img").value;
        
      }

      function send()
      {
         
          window.location="<%=request.getContextPath()%>/election_manager/search_candidate.jsp?status=NR";



         return false;
      }
    
</script>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>EMS</title>
    <link href="/css/Style1.css" rel="stylesheet" type="text/css" />

    <%

                String enrollment = (String) request.getAttribute("enrollment");
                String instituteid = (String) request.getAttribute("instituteid");
                String dep = (String) request.getAttribute("dep");
                String cour = (String) request.getAttribute("cour");
                String dur = (String) request.getAttribute("dur");
                String sess = (String) request.getAttribute("sess");
                String jdate = (String) request.getAttribute("jdate");
                String vname = (String) request.getAttribute("vname");
                String gen = (String) request.getAttribute("gen");
                String bdate = (String) request.getAttribute("bdate");
                String fname = (String) request.getAttribute("f_name");
                String mname = (String) request.getAttribute("m_name");
                String yr = (String) request.getAttribute("year");
                String mnumb = (String) request.getAttribute("mnumb");
                String cadd = (String) request.getAttribute("cadd");
                String padd = (String) request.getAttribute("padd");
                String city = (String) request.getAttribute("city");
                String city1 = (String) request.getAttribute("city1");
                String state = (String) request.getAttribute("state");
                String state1 = (String) request.getAttribute("state1");
                String country = (String) request.getAttribute("country");
                String country1 = (String) request.getAttribute("country1");
                String zcode = (String) request.getAttribute("zcode");
                String zcode1 = (String) request.getAttribute("zcode1");
                String email = (String) request.getAttribute("email");
                String img = (String) request.getAttribute("image");
                String file = (String) request.getAttribute("filename");
                String position=(String)request.getAttribute("position");
                String election=(String)request.getAttribute("election");
                String alternateemail=(String)request.getAttribute("alternateemail");
                String proposedby=(String)request.getAttribute("proposedby");
                String secondedby=(String)request.getAttribute("secondedby");
                String positionaccepted=(String)request.getAttribute("positionaccepted");
                System.out.println("position@@@@@@@@@"+position+"  "+election+dep);


    %>



    <script language="javascript" type="text/javascript" src="js/datetimepicker.js"></script>



    <script type="text/javascript">



        function check3()
        {

            if(document.getElementById('ins1').options[document.getElementById('ins1').selectedIndex].value=="Select")
            {
                alert("Enter Institute Name");

                document.getElementById('ins1').focus();

                return false;
            }
            if(document.getElementById('dep1').value=="")
            {
                alert("Enter department Name");

                document.getElementById('dep1').focus();

                return false;
            }

            if(document.getElementById('cour1').value=="")
            {
                alert("Enter Course ");

                document.getElementById('cour1').focus();

                return false;
            }

            if(document.getElementById('vname1').value=="")
            {
                alert("Enter  Voter Name");

                document.getElementById('vname1').focus();

                return false;
            }
            if(document.getElementById('gen1').options[document.getElementById('gen1').selectedIndex].value=="Select")
            {
                alert("Enter  Gender");

                document.getElementById('gen1').focus();

                return false;
            }
            if(document.getElementById('3').value=="")
            {
                alert("Enter BirthDate");

                document.getElementById('3').focus();

                return false;
            }
            if(document.getElementById('fname1').value=="")
            {
                alert("Enter Father's Name");

                document.getElementById('fname1').focus();

                return false;
            }
            if(document.getElementById('mname1').value=="")
            {
                alert("Enter Mother's Name");

                document.getElementById('mname1').focus();

                return false;
            }
            if(document.getElementById('mnumb1').value=="")
            {
                alert("Enter Mobile Number");

                document.getElementById('mnumb1').focus();

                return false;
            }
            if(document.getElementById('email1').value=="")
            {
                alert("Enter Email ID");

                document.getElementById('email1').focus();

                return false;
            }
            if(document.getElementById('country1').value=="")
            {
                alert("Enter Country");

                document.getElementById('country1').focus();

                return false;
            }
            if(document.getElementById('enrolled').options[document.getElementById('enrolled').selectedIndex].value=="Select")
            {
                alert("Select Enrolled Level");

                document.getElementById('enrolled').focus();

                return false;
            }
            if(document.getElementById('mark').value=="")
            {
                alert("Enter % Marks in Last Exam");

                document.getElementById('mark').focus();

                return false;
            }
            if(document.getElementById('attendence').value=="")
            {
                alert("Enter %age of Attendence");

                document.getElementById('attendence').focus();

                return false;
            }

             var radio_choice = false;

            // Loop from zero to the one minus the number of radio button selections
            for (counter = 0; counter < document.getElementById("radio_form").backlog.length; counter++)
            {
                // If a radio button has been selected it will return true
                // (If not it will return false)

                if (document.getElementById("radio_form").backlog[counter].checked)
                    radio_choice = true;
            }

            if (!radio_choice)
            {
                // If there were no selections made display an alert box
                alert("Please choose backlog option")
                return false;
            }
          radio_choice = false;
            for (counter = 0; counter < document.getElementById("radio_form").criminal.length; counter++)
            {
                if (document.getElementById("radio_form").criminal[counter].checked)
                    radio_choice = true;
            }

            if (!radio_choice)
            {
                // If there were no selections made display an alert box
                alert("Please choose option whether u have criminal log or not")
                return false;
            }


 radio_choice = false;
            for (counter = 0; counter < document.getElementById("radio_form").indisc.length; counter++)
            {
                if (document.getElementById("radio_form").indisc[counter].checked)
                    radio_choice = true;
            }

            if (!radio_choice)
            {
                // If there were no selections made display an alert box
                alert("Please choose option whether u have  involed in Indiscipilinary action  or not")
                return false;
            }

/*radio_choice = false;
            for (counter = 0; counter < document.getElementById("radio_form").position.length; counter++)
            {
                if (document.getElementById("radio_form").position[counter].checked)
                    radio_choice = true;
            }

            if (!radio_choice)
            {
                // If there were no selections made display an alert box
                alert("Please choose position for which u r goin to register")
                return false;
            }


            return true;
        }*/


            // set var radio_choice to false
















        function copy1(){
            var i=document.getElementById("enrollment");
            var j=document.getElementById("enrollment1");
            i.value=j.value;
            var ins=document.getElementById("ins");
            var ins1=document.getElementById("ins1");
            ins.value=ins1.value;
            var dep=document.getElementById("dep");
            var dep1=document.getElementById("dep1");
            dep.value=dep1.value;
            var cour=document.getElementById("cour");
            var cour1=document.getElementById("cour1");
            cour.value=cour1.value;
            var year=document.getElementById("year");
            var year1=document.getElementById("year1");
            year.value=year1.value;
            var dur=document.getElementById("dur");
            var dur1=document.getElementById("dur1");
            dur.value=dur1.value;
            var sess=document.getElementById("sess");
            var sess1=document.getElementById("sess1");
            sess.value=sess1.value;
            var jdate=document.getElementById("jdate");
            var jdate1=document.getElementById("1");
            jdate.value=jdate1.value;
            var vname=document.getElementById("vname");
            var vname1=document.getElementById("vname1");
            vname.value=vname1.value;
            var gen=document.getElementById("gen");
            var gen1=document.getElementById("gen1");
            gen.value=gen1.value;
            var bdate=document.getElementById("bdate");
            var bdate1=document.getElementById("3");
            bdate.value=bdate1.value;
            var fname=document.getElementById("fname");
            var fname1=document.getElementById("fname1");
            fname.value=fname1.value;

            var mname=document.getElementById("mname");
            var mname1=document.getElementById("mname1");
            mname.value=mname1.value;
            var mnumb=document.getElementById("mnumb");
            var mnumb1=document.getElementById("mnumb1");
            mnumb.value=mnumb1.value;
            var cadd=document.getElementById("cadd");
            var cadd1=document.getElementById("cadd1");
            cadd.value=cadd1.value;
            var city=document.getElementById("city");
            var city1=document.getElementById("city1");
            city.value=city1.value;
            var state=document.getElementById("state");
            var state1=document.getElementById("State1");
            state.value=state1.value;
            var state2=document.getElementById("state2");
            var state21=document.getElementById("state21");
            state2.value=state21.value;
            var zcode=document.getElementById("zcode");
            var zcode1=document.getElementById("zcode1");
            zcode.value=zcode1.value;
            var country=document.getElementById("country");
            var country1=document.getElementById("country1");
            country.value=country1.value;
            var padd=document.getElementById("padd");
            var padd1=document.getElementById("padd1");
            cadd.value=padd1.value;
            var city2=document.getElementById("city2");
            var city21=document.getElementById("city21");
            city2.value=city21.value;
            var zcode2=document.getElementById("zcode2");
            var zcode21=document.getElementById("zcode21");
            zcode2.value=zcode21.value;
            var country2=document.getElementById("country2");
            var country21=document.getElementById("country21");
            country2.value=country21.value;
            var email=document.getElementById("email");
            var email1=document.getElementById("email1");
            email.value=email1.value;

            var button=document.getElementById("button");
            var button1=document.getElementById("button1");
            button.value=button1.value;
        }




                                 
                                        function copy()
                                        {
                                            var a=document.getElementById("cadd1").value;
                                            var b=document.getElementById("city1").value;
                                            var c=document.getElementById("state1").value;
                                            var d=document.getElementById("zcode1").value;
                                            var e=document.getElementById("country1").value;
                                            document.getElementById("padd1").value=a;
                                            document.getElementById("city21").value=b;
                                            document.getElementById("state21").value=c;
                                            document.getElementById("zcode21").value=d;
                                            document.getElementById("country21").value=e;
                                        }
                                        function checkReason()
                                        {
                                            if(document.getElementById("txtReason")!=undefined)
                                                if(document.getElementById("txtReason").value !=undefined && document.getElementById("txtReason").value!="")
                                                   return true;
                                                else{
                                                    alert("Please enter reason for Rejection");
                                                    document.getElementById("txtReason").focus();
                                                     return false;}
                                        }




    </script>
</head>

<link rel="Stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>

<body>
   
    <%--  <%if(msg1!=null){%>   <span style=" position:absolute; top: 120px; font-size:12px;font-weight:bold;color:red;" ><%=msg1%></span>  <%}%>--%>


    <div
        style="  top:10%;
        left:60%;
        right:5px;
        position: absolute;

        visibility: show;" >
        <%if (btn.equals("View") == true) {%>

        <%if (session.getAttribute("image") != null) {%>
        <html:img src="/EMS/Candidate/upload.jsp"  alt="no Image Selected" width="100" height="100"/>

        <%} else {%>

        <html:img src="/EMS/images/no-image.jpg"  alt="no Image Selected" width="100" height="100"/>
        <%}%>


        <%} else {%>

        
        <html:img src="/EMS/Candidate/viewimage.jsp" alt="no image selected" width="120" height="120" />
        <br/>


        <%}%>

    </div>


    <div
        style="  top:325px;
        left:800px;
        right:5px;
        position: absolute;

        visibility: visible; z-index: 100;" >


        <html:form action="/candidateimageupload" method="post" styleId="form1" enctype="multipart/form-data">
            <%--<%if (btn.equals("Update") == true || btn.equals("View") == true) {%>
            <html:file  property="img" name="CandidateRegActionForm" styleId="img" onchange="submit()"  onclick="copy1()" />
            <%}%>--%>


            <%--<input type="hidden" name="filename" tabindex="16" id="filename" />

            <html:hidden property="enrollment" name="CandidateRegActionForm" styleId="enrollment"/>
            <html:hidden property="institute_id" name="CandidateRegActionForm" styleId="ins"/>
            <html:hidden property="department" name="CandidateRegActionForm" styleId="dep"/>
            <html:hidden property="course" name="CandidateRegActionForm" styleId="cour"/>
            <html:hidden property="year" name="CandidateRegActionForm" styleId="year"/>
            <html:hidden property="duration" name="CandidateRegActionForm" styleId="dur"/>
            <html:hidden property="session" name="CandidateRegActionForm" styleId="sess"/>
            <html:hidden property="j_date" name="CandidateRegActionForm" styleId="jdate"/>
            <html:hidden property="v_name" name="CandidateRegActionForm" styleId="vname"/>
            <html:hidden property="gender" name="CandidateRegActionForm" styleId="gen"/>
            <html:hidden property="b_date" name="CandidateRegActionForm" styleId="bdate"/>
            <html:hidden property="f_name" name="CandidateRegActionForm" styleId="fname"/>
            <html:hidden property="m_name" name="CandidateRegActionForm" styleId="mname"/>

            <html:hidden property="m_number" name="CandidateRegActionForm" styleId="mnumb"/>
            <html:hidden property="c_add" name="CandidateRegActionForm" styleId="cadd"/>
            <html:hidden property="city" name="CandidateRegActionForm" styleId="city"/>
            <html:hidden property="state" name="CandidateRegActionForm" styleId="state"/>
            <html:hidden property="zipcode" name="CandidateRegActionForm" styleId="zcode"/>
            <html:hidden property="country" name="CandidateRegActionForm" styleId="country"/>
            <html:hidden property="p_add" name="CandidateRegActionForm" styleId="padd"/>
            <html:hidden property="city1" name="CandidateRegActionForm" styleId="city2"/>

            <html:hidden property="state1" name="CandidateRegActionForm" styleId="state2"/>

            <html:hidden property="zipcode1" name="CandidateRegActionForm" styleId="zcode2"/>

            <html:hidden property="country1" name="CandidateRegActionForm" styleId="country2"/>

            <html:hidden property="email" name="CandidateRegActionForm" styleId="email"/>
            <html:hidden property="button" name="CandidateRegActionForm" styleId="button"/>--%>
        </html:form>



    </div>
    <html:form action="/candidateregistration2" method="post"   onsubmit="return check3()" styleId="radio_form">


     
             <table border="0" class="datagrid" align="center" width="80%">
                  <tr class="headerStyle">
                                        <td colspan="2" align="center">Candidate Details</td>


                                    </tr>
                                    <tr>
                                        <td >Enrollment Number*:</td><td><html:text readonly="<%=read%>"  name="CandidateRegActionForm"  styleId="enrollment1" property="enrollment"   /></td>
                                        

                                    </tr>
                                    
                                    <tr><td align="left">Institute Name*</td><td>
                                            <html:select property="institute_id" styleId="ins1"  name="CandidateRegActionForm"  tabindex="10" disabled="true">
<html:option  value="Select"> Select </html:option>
            <html:options collection="Institute"  labelProperty="instituteName" property="instituteId"  name="Institute" ></html:options>
                                              
                                            </html:select>
                                            <html:hidden property="institute_id" styleId="ins1" name="CandidateRegActionForm"></html:hidden>
                                    </tr>
                                    <tr>
                                        <td align="left">Department*:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" styleId="dep1" property="department"   /></td>

                                    </tr>

                                    <tr>
                                        <td align="left">Course*:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" styleId="cour1" property="course" /></td>
                                    </tr>

                                    <tr>
                                        <td align="left">Year :</td><td><html:text readonly="<%=read%>"  name="CandidateRegActionForm" styleId="year1" property="year" value="<%=yr%>"/></td>

                                    </tr>
                                    <tr><td  width="30%">Duration of course:</td><td><html:text  readonly="<%=read%>" name="CandidateRegActionForm" styleId="dur1" value="<%=dur%>" property="duration" /> </td>
                                    </tr>
                                    <tr>
                                        <td align="left">Current Session:</td><td><html:text readonly="<%=read%>"  name="CandidateRegActionForm" styleId="sess1" value="<%=sess%>" property="session"  /></td>
                                    </tr
                                    <tr><td width="15%">Date of Joining<br>(DD-MM-YYYY)</td><td><html:text readonly="<%=read%>"  name="CandidateRegActionForm" styleId="1" property="j_date" value="<%=jdate%>" />
                                            <%--<a href="javascript:NewCal('1','ddmmmyyyy')"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>--%></td></tr>


                                    <tr>
                                        <td align="left">Candidate Name*</td>
                                        <td>

                                          <html:text readonly="<%=read%>"  name="CandidateRegActionForm"  styleId="vname1"  value="<%=vname%>"  property="v_name"/>

                                        </td>
                                    </tr>
                                    <tr><td align="left">Gender*</td><td>
                                            <html:select property="gender" styleId="gen1"  name="CandidateRegActionForm"  tabindex="10" disabled="<%=read%>">

                                                <html:option  value="Select"> Select </html:option>
                                                <html:option  value="male">Male</html:option>
                                                <html:option value="female">Female</html:option>

                                            </html:select>

                                    </tr>
                                    <tr>
                                        <td>Date of Birth*<br>(DD-MM-YYYY)</td><td><html:text readonly="<%=read%>"  name="CandidateRegActionForm"  property="b_date"  value="<%=bdate%>" styleId="3" /></td>                                           </td>
                                    </tr>


                                    <tr> <td>Father's Name*</td><td><html:text  readonly="<%=read%>" name="CandidateRegActionForm" styleId="fname1"  value="<%=fname%>"  property="f_name"/></td></tr>
                                    <tr> <td>Mother's Name*</td><td><html:text readonly="true" name="CandidateRegActionForm" styleId="mname1" value="<%=mname%>" property="m_name"/></td>
                                    </tr>

                                    <tr>
                                        <td align="left">Mobile No*:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" styleId="mnumb1" value="<%=mnumb%>" property="m_number" /></td>
                                    </tr>
                                    <tr>
                                        <td align="left">Corresponding Address:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" styleId="cadd1" property="c_add" value="<%=cadd%>"  /></td>
                                    </tr>
                                    <tr>
                                        <td align="left">City:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="city"  value="<%=city%>" styleId="city1"/></td>
                                    </tr>

                                    <tr>
                                        <td align="left">State:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="state" value="<%=state%>" styleId="state1"/></td>
                                    </tr>


                                    <tr>
                                        <td align="left">Zip Code:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="zipcode"  value="<%=zcode%>" styleId="zcode1"/></td>
                                    </tr>
                                    <tr>
                                        <td align="left">Country:*</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="country"  value="<%=country%>" styleId="country1"/></td>

                                    </tr>



                                    <tr>
                                        <td colspan="2"><input type="checkbox" id="Checkbox1" name="check" value="off" tabindex="17" onclick="return copy();" >&nbsp;&nbsp;<b>Click Here</b>&nbsp;(If permanent address is same as corresponding address)</td>
                                    </tr>
                                    <tr>    <td align="left">Permanent Address</td><td><html:text  readonly="<%=read%>" name="CandidateRegActionForm" property="p_add" value="<%=padd%>" styleId="padd1"/></td></tr>
                                    <tr>    <td align="left">City</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="city1" value="<%=city1%>"  styleId="city21"/></td></tr>
                                    <tr>    <td align="left">State</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="state1" value="<%=state1%>" styleId="state21"/></td></tr>
                                    <tr> <td align="left">ZIP Code</td><td><html:text  readonly="<%=read%>" name="CandidateRegActionForm" property="zipcode1"  value="<%=zcode1%>" styleId="zcode21"/></td><td colspan="2"></tr>
                                    <tr><td align="left">Country</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="country1" value="<%=country1%>" styleId="country21"/></td></tr>

                               <tr><td align="left">Alternate Email</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm" property="alternateemail" value="<%=alternateemail%>" styleId="alternateemail"/></td></tr>
                             <tr>

                            <td align="left" >email*:</td><td><html:text readonly="<%=read%>" name="CandidateRegActionForm"   value="<%=email%>" styleId="email1" property="email"/></td>

                        </tr>
                         <tr><td align="center" class="headerStyle" bgcolor="#E0E8F5" height="10px;" colspan="2"><b>Candidature Eligibility Criteria </b></td></tr>

                               

                        <tr>
                            <td colspan="2"><b>Important! </b>Please provide a working email address:</td>

                        </tr>

                       
                       
                                <%
List<ElectionCriteria> obj=(List<ElectionCriteria>)session.getAttribute("rule");
if(obj!=null)
    {
       Iterator it=obj.iterator();
       for(int i=0;i<obj.size();i++)
       {
           out.println("<tr><td>Rule :</td><td>"+obj.get(i).getElectionrule().getCriteria()+"</td><tr>");
           out.println("<tr><td>Ans:</td><td>"+obj.get(i).getRuleanswer().getAnswer()+"</td><tr>");
       }

     }


%>



                            
                        <tr><td align="center" class="headerStyle" bgcolor="#E0E8F5" height="10px;" colspan="2"><b>Candidature Request for: </b></td></tr>
                        
            <tr><td>Election* </td><td><html:text name="CandidateRegActionForm" property="elections"  readonly="<%=read%>"/>
                </td></tr>
            <br>
            <tr><td>Position* </td><td><html:text name="CandidateRegActionForm" property="position"  readonly="<%=read%>"/>
                </td></tr>
            <tr><td>Reason of Rejection*</td><td><html:textarea name="CandidateRegActionForm" style="width: 514px; height: 67px;" styleId="txtReason" property="reason" rows="3" cols="200"/>
                </td></tr>



         
            <tr>
                <td align="center" colspan="2">




                    *indicated fields are mandatory
                    



                    <input name="button" type="submit" value="Reject" onclick="return checkReason();" class="txt1"/>
                    <input name="button" type="submit" value="Accept"  class="txt1"/>
                    <input name="button" type="button" value="Back" onclick="return send();"  class="txt1"/>

         <%
String role=(String)session.getAttribute("login_role");
                         if(role.equalsIgnoreCase("insti-admin")|| role.equalsIgnoreCase("insti-admin,voter"))
   {
%>

<%}else{%>
 <input name="button" type="button" value="Cancel" onclick="return send()" class="txt1"/>

<%}%>

                </td>
            </tr>

             </table>

    </html:form>


