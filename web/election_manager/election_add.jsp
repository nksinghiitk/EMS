<%--
    Document   : cat_biblio_entry
    Created on : Jan 13, 2011, 12:02:47 PM
    Author     : Client
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.myapp.struts.hbm.ElectionDAO"%>
<%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String msg=(String)request.getAttribute("msg");
if(msg==null){msg=(String)request.getAttribute("msg1");}
if(msg!=null)
    {
    %>
    <script>
        alert("<%=msg%>");
        window.back();
    </script>
<%}%>


<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page import="java.util.*,java.io.*,java.net.*,java.sql.Timestamp,java.lang.Object"%>

<link type="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
<%!
    Locale locale=null;
    String locale1="en";
    String rtl="ltr";
    boolean page=true;
    String align="left";
    String regid="";
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
    regid = resource.getString("registrationid");
    System.out.println("Reg id="+regid);
    %>
<script src="<%=request.getContextPath()%>/js/datetimepicker.js"></script>
<style type="text/css">
.ui-datepicker
{
   font-family: Arial;
   font-size: 13px;
}
</style>

<%
String role=(String)session.getAttribute("login_role");
if(role.equalsIgnoreCase("insti-admin")|| role.equalsIgnoreCase("insti-admin,voter"))
   {
%>

<%}else if(role.equalsIgnoreCase("Election Manager")|| role.equalsIgnoreCase("Election Manager,voter")){%>
<jsp:include page="/election_manager/login.jsp"/>
<%}else{%>

<%}%>
<script language="javascript">


$(document).ready(function()
{
   var jQueryDatePicker1Opts =
   {
      dateFormat: 'yy-mm-dd',
      changeMonth: true,
      changeYear: true,
      showButtonPanel: false,
      showAnim: 'show'
   };
   $("#start_date").datepicker(jQueryDatePicker1Opts);
   $("#end_date").datepicker(jQueryDatePicker1Opts);
    $("#Nstart_date").datepicker(jQueryDatePicker1Opts);
   $("#Nend_date").datepicker(jQueryDatePicker1Opts);
   $("#Scr_date").datepicker(jQueryDatePicker1Opts);
   $("#Scrend_date").datepicker(jQueryDatePicker1Opts);
   $("#wtd_date").datepicker(jQueryDatePicker1Opts);
   $("#wtdend_date").datepicker(jQueryDatePicker1Opts);


});

    </script>
<%! boolean read=false;%>
<%
String button=(String)request.getAttribute("button");
if(button==null)
    button="Add";
if (button.equals("View")||button.equals("Delete"))
read=true;
else
   {
    read=false;
}
String msg1=(String) request.getAttribute("msg1");
%>
<script type="text/javascript">
var pos_no=0;
function checkpos1(){
//alert("sdasda");
      var req = newXMLHttpRequest();
 var electionId = document.getElementById("electionId").value;
req.onreadystatechange = getReadyStateHandler(req, updatePositions1);

req.open("POST","<%=request.getContextPath()%>/getPosition.do?getElectionId="+electionId, true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return pos_no;


  }


function updatePositions1(cartXML)
{

  
   var em = cartXML.getElementsByTagName("positions")[0];
   var em6 = em.getElementsByTagName("position");
   pos_no=em6.length;
}


var j=0;
var i=0;
var count=0;
function createposition()
{
  

checkpos1();

        
//alert(checkpos);

if(checkpos==true){

i=0;
j=j+1;
//alert(j+"CREATE");
var divtag = document.createElement("div");
     divtag.id = "position"+j;
     divtag.style.backgroundColor = "#E0F8F7";
     divtag.style.border = "solid 5px #0B3B24";
     divtag.style.borderTopLeftRadius = "10px";
     divtag.style.width = "930px";
     divtag.style.align = "center";
     divtag.style.marginLeft = "0px";
     divtag.innerHTML ='<table><tr><td><%=resource.getString("positionname")%>*&nbsp;&nbsp;<input type="text" Id="position_name'+i+''+j +'" size="25px"/></td>&nbsp;&nbsp;<td><%=resource.getString("numberofchoice")%>*<input type="text" onkeypress="return isNumberKey(event)" Id="numberofchoice'+i+''+ j +'" size="25px"/></td><td><input type="button" id="but0'+ j +'" value="Save" onclick="search('+ j +');"/></td></tr><tr><td colspan="2"><%=resource.getString("instruction")%>:&nbsp;&nbsp;<textarea id="instruct0'+ j+'" readonly="true" rows="3" style="width: 415px; height: 46px;"></textarea></td></tr> <input type="button" id="Add Criteria" name="Add Criteria" style="margin-left: 0px;" value="Add Criteria" size="50px" onclick="createcriteria('+j+');"></table>';
     document.getElementById("position").appendChild(divtag);
     checkpos=false;
}
else if(count==0){
    
i=0;
j=j+1;
count=count+1;
var divtag = document.createElement("div");
     divtag.id = "position"+j;
     divtag.style.backgroundColor = "#E0F8F7";
     divtag.style.border = "solid 5px #0B3B24";
     divtag.style.borderTopLeftRadius = "10px";
     divtag.style.width = "930px";
     divtag.style.align = "center";
     divtag.style.marginLeft = "0px";
     divtag.innerHTML ='<table><tr><td><%=resource.getString("positionname")%>*&nbsp;&nbsp;<input type="text" Id="position_name'+i+''+j +'" size="25px"/></td>&nbsp;&nbsp;<td><%=resource.getString("numberofchoice")%>*<input type="text" onkeypress="return isNumberKey(event)" Id="numberofchoice'+i+''+ j +'" size="25px"/></td><td><input type="button" id="but0'+ j +'" value="Save" onclick="search('+ j +');"/></td></tr><tr><td colspan="2"><%=resource.getString("instruction")%>:&nbsp;&nbsp;<textarea id="instruct0'+ j+'" readonly="true" rows="3" style="width: 415px; height: 46px;"></textarea></td></tr> <input type="button" id="Add Criteria" name="Add Criteria" style="margin-left: 0px;" value="Add Criteria" size="50px" onclick="createcriteria('+j+');"></table>';
     document.getElementById("position").appendChild(divtag);
}
else{
    alert("Save Previous  Position Entry First");
    return false;
}
}
function search4(current) {

    var position = "position_name0"+current;
    var posinstruct = "instruct0" + current;
    var numberofchoice = "numberofchoice0"+current;
    var position_name = document.getElementById(position).value;
    var noofchoice = document.getElementById(numberofchoice).value;
    var instruct = document.getElementById(posinstruct).value;
   // instruct="You can choose "+noofchoice+" Candidate for this Position";

    var electionId = document.getElementById("electionId").value;
    position_name = position_name.replace(/^\s*|\s*$/g,"");
    noofchoice = noofchoice.replace(/^\s*|\s*$/g,"");
    instruct = instruct.replace(/^\s*|\s*$/g,"");
    var posid = "position_id0"+current;
    var PositionId="";
    var butId = "but0"+current;
    var buttonVal = document.getElementById(butId).value;


if(position_name.length>=1 && noofchoice.length>=1 && electionId!="" && instruct.length>=1)
{


     return true;
}
else{alert("Please Enter Values in the Field For Position First");
return false;}
}



var k=0;
var l=0;
//var j=0;
function createcriteria(j)
{
   
 if(search4(j)==false)
     return false;

k=0;
l=l+1;

var divtag = document.createElement("div");
     divtag.id = "criteria"+l;
     divtag.style.backgroundColor = "#E0F8F7";
     divtag.style.border = "solid 5px #0B3B24";
     divtag.style.borderTopLeftRadius = "10px";
     divtag.style.width = "930px";
     divtag.style.align = "center";
     divtag.style.marginLeft = "0px";
     divtag.innerHTML ='<table><tr><td>Criteria*&nbsp;&nbsp;<input type="text" Id="criteria_name'+k+''+l +'" size="25px"/></td>&nbsp;&nbsp;<td></td><td><input type="button" id="but0'+ l +'" value="Save" onclick="search1('+ l +','+j+');"/>eg.i)Candidate should have 75% of Attendence<br> ii)No Criminal background should be allowed etc..</td></tr><tr><%--<td colspan="2"><%=resource.getString("instruction")%>:&nbsp;&nbsp;<textarea id="instruct0'+ j+'" readonly="true" rows="3" style="width: 415px; height: 46px;"></textarea></td>--%></tr></table>';



//document.getElementById("criteria").appendChild(divtag);
 document.getElementById("position").appendChild(divtag);

}
l=0;
function createcriteriaforupdate(posi,iii)
{
   // alert("positionid="+posi+","+"dividdd="+iii)
  iii++;
 // alert("divid,after increment="+iii);
  
     searchCriteria1(posi,(iii-1));
     
    // alert("AFTERsearchcriteriacallrulecount"+rulerowcount);
k=0;
l=rulerowcount;
//alert("RULE"+l);
var divtag = document.createElement("div");
     divtag.id = "criteria"+l;
     divtag.style.backgroundColor = "#E0F8F7";
     divtag.style.border = "solid 5px #0B3B24";
     divtag.style.borderTopLeftRadius = "10px";
     divtag.style.width = "930px";
     divtag.style.align = "center";
     divtag.style.marginLeft = "0px";
     divtag.innerHTML ='<table><tr><td>Rule*&nbsp;&nbsp;<input type="text" Id="criteria_name'+k+''+l +'" size="25px"/></td>&nbsp;&nbsp;<td></td><td><input type="button" id="but0'+ l +'" value="Save" onclick="search1('+ l +','+iii+');"/>eg.i)Candidate should have 75% of Attendence<br> ii)No Criminal background should be allowed etc..</td></tr><tr></tr></table>';
    


//document.getElementById("criteria").appendChild(divtag);

 document.getElementById("position"+(iii-1)).appendChild(divtag);
 
l++;

}

function newXMLHttpRequest() {
var xmlreq = false;
// Create XMLHttpRequest object in non-Microsoft browsers
if (window.XMLHttpRequest) {
xmlreq = new XMLHttpRequest();
} else if (window.ActiveXObject) {
try {
// Try to create XMLHttpRequest in later versions
// of Internet Explorer
xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e1) {
// Failed to create required ActiveXObject
try {
// Try version supported by older versions
// of Internet Explorer
xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e2) {
// Unable to create an XMLHttpRequest by any means
xmlreq = false;
}
}
}
return xmlreq;
}
document.onkeyup = keyHit
function keyHit(event) {

  if (event.keyCode == 13) {
 // changerec();

    event.stopPropagation()
    event.preventDefault()
  }
}

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }

/*
* Returns a function that waits for the specified XMLHttpRequest
* to complete, then passes it XML response to the given handler function.
* req - The XMLHttpRequest whose state is changing
* responseXmlHandler - Function to pass the XML response to
*/
function getReadyStateHandler(req, responseXmlHandler) {
// Return an anonymous function that listens to the XMLHttpRequest instance
return function () {
// If the request's status is "complete"
if (req.readyState == 4) {
// Check that we received a successful response from the server
if (req.status == 200) {
// Pass the XML payload of the response to the handler function.
responseXmlHandler(req.responseXML);
} else {
// An HTTP problem has occurred
alert("HTTP error "+req.status+": "+req.statusText);
}
}
}
}
var checkpos=false;
function search(current) {

    var position = "position_name0"+current;
    var posinstruct = "instruct0" + current;
    var numberofchoice = "numberofchoice0"+current;
    var position_name = document.getElementById(position).value;
    var noofchoice = document.getElementById(numberofchoice).value;
    var instruct = document.getElementById(posinstruct).value;
    instruct="You can choose "+noofchoice+" Candidate for this Position";
  
    var electionId = document.getElementById("electionId").value;
    position_name = position_name.replace(/^\s*|\s*$/g,"");
    noofchoice = noofchoice.replace(/^\s*|\s*$/g,"");
    instruct = instruct.replace(/^\s*|\s*$/g,"");
    var posid = "position_id0"+current;
    var PositionId="";
    var butId = "but0"+current;
    var buttonVal = document.getElementById(butId).value;
   
    if(buttonVal=="Update")
        {
            PositionId = document.getElementById(posid).value;
        }
//alert(position_name.length+ " "+noofchoice.length+electionId);
if(position_name.length>=1 && noofchoice.length>=1 && electionId!="")
{
    var req = newXMLHttpRequest();

  document.getElementById(posinstruct).value=instruct;
req.onreadystatechange = getReadyStateHandler(req, update1);

req.open("POST","<%=request.getContextPath()%>/AddPosition.do?setPosition="+position_name+"&setChoice="+noofchoice+"&setElectionId="+electionId+"&setposId="+PositionId+"&setposInstruction="+instruct, true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
var idPos = "position"+current;

document.getElementById(idPos).style.backgroundColor = "#D8CEF6";
document.getElementById(idPos).style.border = "solid 5px #F2F5A9";

return true;
}
else{alert("Please Enter Values in the Field For Position First");
return false;}
}

function update1(cartXML)
{
//alert("call");

var em = cartXML.getElementsByTagName("email_ids")[0];
var em1 = em.getElementsByTagName("message");
//var em = cartXML.firstChild.value;
for(i=0;i<em1.length;i++)
    {

    if(em1[i].firstChild.nodeValue=="Position updated successfully")
        {
            alert(em1[i].firstChild.nodeValue);
        }
        else
        alert(em1[i].firstChild.nodeValue);

    }
    checkpos=true;
}

function search1(current,pos_id) {
   // alert("search1 ,current="+current+"position_id="+pos_id);
    var position = "criteria_name0"+current;
    var position_name = document.getElementById(position).value;
    var electionId = document.getElementById("electionId").value;
   // alert("election_id="+electionId+position_name);
   // position_name = position_name.replace(/[&\/\\#,+()$~%.'":*?<>{}]/g,'');
    //alert("position_nameeeee"+position_name)
  if(valid(position_name)==false){
     return false;}

     
    var posid = "rule_id0"+current;
  //  var PositionId="";
    var butId = "but0"+current;
    var buttonVal = document.getElementById(butId).value;
   <%-- if(buttonVal=="Update")
      {
          PositionId = document.getElementById(posid).value;
       }--%>
        //alert(position_name);
if (position_name.length >= 1)
{


if(position_name!="" && position_name!=null  && electionId!="" && electionId!=null)
{
    var req = newXMLHttpRequest();

  
req.onreadystatechange = getReadyStateHandler(req, update13);
req.open("POST","<%=request.getContextPath()%>/AddRule.do", true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send("setRule="+position_name+"&setElectionId="+electionId+"&setpos_id="+(pos_id-1));
var idPos = "criteria"+current;

document.getElementById(idPos).style.backgroundColor = "#D8CEF6";
 document.getElementById(idPos).style.border = "solid 5px #F2F5A9";
 

return true;
}
alert("Please Enter Values in the Field");
return false;
}
alert("Please Enter Values in the Field");

return false;

  

}
function update13(cartXML)
{

  
var em = cartXML.getElementsByTagName("email_ids")[0];
var em1 = em.getElementsByTagName("message");
//var em = cartXML.firstChild.value;
for(i=0;i<em1.length;i++)
    {
       alert(em1[i].firstChild.nodeValue);     


    }
   window.location.reload();
}
function deletePosition(current) {
 //alert(current);
 var req = newXMLHttpRequest();
 var electionId = document.getElementById("electionId").value;
//alert(electionId);
req.onreadystatechange = getReadyStateHandler(req, update1);

req.open("POST","<%=request.getContextPath()%>/deletePosition.do?getElectionId="+electionId+"&positionId="+current, true);
req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return true;
}
function searchPositions() {
    //alert("index="+index+" current="+current);
    var req = newXMLHttpRequest();
 var electionId = document.getElementById("electionId").value;
req.onreadystatechange = getReadyStateHandler(req, updatePositions);

req.open("POST","<%=request.getContextPath()%>/getPosition.do?getElectionId="+electionId, true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return true;
}

function updatePositions(cartXML)
{


var em = cartXML.getElementsByTagName("positions")[0];
var em1 = em.getElementsByTagName("position");

for(iii=0;iii<em1.length;iii++)
    {
      //position block creation
                var divtag = document.createElement("div");
                divtag.id = "position"+iii;
                divtag.style.backgroundColor = "#D8CEF6";
                divtag.style.border = "solid 5px #F2F5A9";
                divtag.style.borderTopLeftRadius = "10px";
                divtag.style.width = "930px";
                divtag.style.align = "left";

                divtag.style.marginTop = "5px";
                divtag.style.marginLeft = "3px";
 var positionname1 = em1[iii].getElementsByTagName("positionname");
var positionname = positionname1[0].firstChild.nodeValue;
var noofchoice1 = em1[iii].getElementsByTagName("noofchoice");
var noofchoice = noofchoice1[0].firstChild.nodeValue;
var positionId = em1[iii].getElementsByTagName("positionId");
var positionid = positionId[0].firstChild.nodeValue;
var instruct = em1[iii].getElementsByTagName("instruction");
var instrucT = instruct[0].firstChild.nodeValue;
var posiId = "position_name0"+iii;
var nochoice = "numberofchoice0"+iii;
var posid = "position_id0"+iii;
var inst = "instruct0"+iii;

///alert(iii);

                <%if(!button.equals("View") && !button.equals("Block")){%>
                            divtag.innerHTML ='<table><tr><td><%=resource.getString("positionname")%> *&nbsp;&nbsp;<input type="text" Id="position_name0'+iii +'" size="25px"/><input type="hidden" Id="position_id0'+iii +'" size="25px"/></td>&nbsp;&nbsp;<td><%=resource.getString("numberofchoice")%> *&nbsp;&nbsp;<input type="text" Id="numberofchoice0'+ iii +'" size="25px"/></td><td><input type="button" id="but0'+ iii +'" value="<%=resource.getString("update")%>" onclick="search('+ iii +');"/></td>&nbsp;&nbsp;<td><input type="button" value="<%=resource.getString("delete")%>" onclick="deletePosition('+ positionid +');"/></td></tr><tr><td colspan="3"><%=resource.getString("instruction")%>:&nbsp;&nbsp;<textarea id="instruct0'+ iii+'" rows="3" style="width: 415px; height: 46px;"></textarea><input type="button" id="Add Criteria" name="Add Criteria" style="margin-left: 0px;" value="Add Criteria" size="50px"  onclick="createcriteriaforupdate('+positionid+','+iii+');"></td></tr></table>';<%}else{%>
                           divtag.innerHTML ='<table><tr><td><%=resource.getString("positionname")%> *&nbsp;&nbsp;<input type="text" Id="position_name0'+iii +'" size="25px"/><input type="hidden" Id="position_id0'+iii +'" size="25px"/></td>&nbsp;&nbsp;<td><%=resource.getString("numberofchoice")%> *&nbsp;&nbsp;<input type="text" Id="numberofchoice0'+ iii +'" size="25px"/></td></tr><tr><td colspan="3"><%=resource.getString("instruction")%>:&nbsp;&nbsp;<textarea id="instruct0'+ iii+'" rows="3" style="width: 415px; height: 46px;"></textarea><input type="button" id="Add Criteria" name="Add Criteria" style="margin-left: 0px;" value="Add Criteria" size="50px" onclick="createcriteriaforupdate('+positionid+','+iii+');"></td></tr></table>';<%}%>
                        document.getElementById("position").appendChild(divtag);
          //end of block

document.getElementById(posiId).value = positionname;
document.getElementById(nochoice).value = noofchoice;
document.getElementById(posid).value = positionid;
document.getElementById(inst).value = instrucT;
  
//alert(positionid+"AJAX"+ positionId[0].firstChild.nodeValue);

        searchCriteria(positionid,iii);


}
//alert(iii+" TOTAL DIV");
j=iii;
if(j<0)j=0;

//alert(j);
}

function send()
{
  <%
 role=(String)session.getAttribute("login_role");
if(role.equalsIgnoreCase("insti-admin")|| role.equalsIgnoreCase("insti-admin,voter"))
   {
%>

<%}else if(role.equalsIgnoreCase("Election Manager")|| role.equalsIgnoreCase("Election Manager,voter")){%>
 window.location="<%=request.getContextPath()%>/electionmanager.do";
<%}else{%>
top.window.location="<%=request.getContextPath()%>/Voter/voter_home.jsp";
<%}%>
   
    return false;
}
function matchDate(f1,f2)
{


var split = f1.split(' ');

var x = split[0];
var y = split[1];
var d1=new Date(x);
var t1=y;



var split1 = f2.split(' ');

 var a = split1[0];
 var b = split1[1];

var d2=new Date(a);
var t2=b;


<%--
var startTime =t1;
var endTime = t2;
var regExp = /(\d{1,2})\:(\d{1,2})\:(\d{1,2})/;
if(parseInt(endTime .replace(regExp, "$1$2$3")) > parseInt(startTime .replace(regExp, "$1$2$3")))
{
time=0;
}
--%>
        

 
    if(d1.getYear()==d2.getYear() &&  d1.getMonth()==d2.getMonth() &&  d1.getDate()==d2.getDate())
                            {
                                if(t1==t2)
                                    return true;
                                else
                                {
                                    
                                     if(t1>t2)
                                        return true;
                                    else
                                    {    return false;
                                    
                                    }
                                }
                            }
                    else{
                            var startDateValue = new Date(d1);
                            var startDateValuecmp = startDateValue.getTime();
                            var endDateValue = new Date(d2);
                            var endDateValuecmp = endDateValue.getTime();
                            if( startDateValuecmp > endDateValuecmp )
                                return true;
                            else
                                    return false;
                    }
                         
           
}
function status1(){
       
    document.getElementById('status').value=document.getElementById('block').value;
    alert(document.getElementById('status').value);
    return true;
}
function checkdates()
{
        // 28.11.2013
        if(document.getElementById('details').value=="")
            {
                alert ("Please Enter Election Details");

            document.getElementById('details').focus();


            return false;
            }
            // 28.11.2013
       if(document.getElementById('electionname').value=="")
        {
            alert ("Please Name Your Election");

            document.getElementById('electionname').focus();


            return false;
        }

  
        if(document.getElementById('Nstart_date').value=="")
        {
            alert ("Please Define Nomination Start Date");
            document.getElementById('Nstart_date').focus();

            return false;
        }



        if(document.getElementById('Nend_date').value=="")
        {
            alert ("Please Define Nomination End Date");
            document.getElementById('Nend_date').focus();
            return false;
        }
        var nstart= document.getElementById("Nstart_date");
        var nend = document.getElementById("Nend_date");

            if(nstart.value!=undefined && nend.value!=undefined)
            {
                
      
                if(matchDate(nstart.value,nend.value))
                  {
                      alert("Nomination Start Date should be lesser than nomination End Date");
                      nstart.focus();
                      return false;
                  }
            }








        if(document.getElementById('Scr_date').value=="")
        {
            alert ("Please Define Scrutny Start Date");
            document.getElementById('Scr_date').focus();
            return false;
        }

    





        var sstart = document.getElementById("Scr_date");
       


        //check Scrutny date less than both nomination end date

         

                   



      

                        if(matchDate(nend.value,sstart.value))
                        {
                        alert("Scrutny Start Date should be greater than Nomination End Date");
                        sstart.focus();
                        return false;
                        }

             

 
     if(document.getElementById('Scrend_date').value=="")
        {
            alert ("Please Define Scrutny End Date");
            document.getElementById('Scrend_date').focus();
            return false;
        }


        //check Scrutny start date> Scrutny start date
        
var send = document.getElementById("Scrend_date");





              if(sstart.value!=undefined && send.value!=undefined)
                {

                        if(matchDate(sstart.value,send.value))
                        {
                        alert("Scrutny Start Date should be lesser than Scrutny End Date");
                        sstart.focus();
                        return false;
                        }

                }




        if(document.getElementById('wtd_date').value=="")
        {
            alert ("Please Define Nomination Withdrawl Start Date");
            document.getElementById('wtd_date').focus();
            return false;
        }
         var wstart = document.getElementById("wtd_date");
                      if(wstart.value!=undefined)
                        {

                            if(matchDate(send.value,wstart.value))
                            {
                            alert("Withdrawal Start Date should be lesser than Scruty End Date");
                            wstart.focus();
                            return false;
                            }
                        }

        if(document.getElementById('wtdend_date').value=="")
        {
            alert ("Please Define Nomination Withdrawl End Date");
            document.getElementById('wtdend_date').focus();
            return false;
        }



    var wend = document.getElementById("wtdend_date");

                     if(wstart.value!=undefined && wend.value!=undefined)
                        {

                            if(matchDate(wstart.value,wend.value))
                            {
                            alert("Withdrawal Start Date should be lesser than Withdrawal End Date");
                            wstart.focus();
                            return false;
                            }
                        }


 if(document.getElementById('start_date').value=="")
        {
            alert ("Please Define Election Start Date");
            document.getElementById('start_date').focus();
            return false;
        }



                if(wstart.value!=undefined && wend.value!=undefined)
                        {

                            if(matchDate(wstart.value,wend.value))
                            {
                            alert("Withdrawal Start Date should be lesser than Withdrawal End Date");
                            wstart.focus();
                            return false;
                            }
                        }

 var start = document.getElementById("start_date");

   if(start.value!=undefined)
                        {

                            if(matchDate(wend.value,start.value))
                            {
                            alert("Election Start  should be greater than Withdrawal End Date");
                            start.focus();
                            return false;
                            }
                        }







   if(document.getElementById('end_date').value=="")
        {
            alert ("Please Define Election End Date");
            document.getElementById('end_date').focus();
            return false;
        }
  
    var end = document.getElementById("end_date");

             if(start.value!=undefined && end.value!=undefined)
                            {  
                                if(matchDate(start.value,end.value))
                                {
                                alert("Election Start Date should be lesser than Election End Date");
                                start.focus();
                                return false;
                                }
                            }



   if(document.getElementById('result_DeclarationDate').value=="")
        {
            alert ("Please Define Election Result Declaration Date");
            document.getElementById('result_DeclarationDate').focus();
            return false;
        }

    var result_declare_date = document.getElementById("result_DeclarationDate");

             if(result_declare_date.value!=undefined && end.value!=undefined)
                            {
                                if(matchDate(end.value,result_declare_date.value))
                                {
                                alert("Election Result Declaration Date should be greater than Election End Date");
                                result_declare_date.focus();
                                return false;
                                }
                            }
       








        <%--if(document.getElementById('cri').value=="")
        {
            alert ("Please set critaria for Nomination");
            document.getElementById('cri').focus();
            return false;
        }--%>
  
}

function valid(rule_name)
    {

     var s = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
     str=rule_name;

     for (var i = 0; i < str.length; i++)
     {

        if (s.indexOf(str.charAt(i)) != -1)
      {
         alert ("The box has special characters. \nThese are not allowed.\n ie use percent for % etc");

         return false;
      }

    }

    }
// update Criteria specific to position
var k=0;
var l=0;
function update_criteria(posi,current1) {
   var ele=document.getElementById("position"+posi).getElementsByTagName('input');

     pos=ele[1].value;
    // alert("pos="+pos);
  var electionId = document.getElementById("electionId").value;
var c=0;

       cn = document.getElementById( "position"+posi ).childNodes;
  for (var i = current1+1;c<=0; i++)
  {

   var list=cn[i].getElementsByTagName('input');
   var rule_name=list[0].value;
   if(valid(rule_name)==false)
    return false;
  
  var rule_id=list[1].value;

  var req = newXMLHttpRequest();

if (rule_name.length < 1)
{
   alert("Please Enter Values in the Field");
return false;

}



req.onreadystatechange = getReadyStateHandler(req, update2);

req.open("POST","<%=request.getContextPath()%>/UpdateRule.do", true);
req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send("setRule="+rule_name+"&setElectionId="+electionId+"&ruleId="+rule_id+"&position="+pos);


     c++;






  
  }


return true;
   
  

   
   
  

}
function update2(cartXML)
{
  // alert("call");

var em = cartXML.getElementsByTagName("email_ids")[0];
var em1 = em.getElementsByTagName("message");
//var em = cartXML.firstChild.value;
for(i=0;i<em1.length;i++)
    {
       alert(em1[i].firstChild.nodeValue);

    }
}

// Deleate Criteria specific to position


function search2(posi,current1) {
   //alert("position idllllllll="+posi+"current="+current1);
   
   var ele=document.getElementById("position"+posi).getElementsByTagName('input');

     pos=ele[1].value;
     //alert("pos="+pos);
  var electionId = document.getElementById("electionId").value;
var c=0;

       cn = document.getElementById( "position"+posi ).childNodes;
  for (var i = current1+1;c<=0; i++)
  {

     var list=cn[i].getElementsByTagName('input');
   var rule_name=list[0].value;
  var rule_id=list[1].value;

  var req = newXMLHttpRequest();

if (rule_name.length < 1)
{
   alert("Please Enter Values in the Field");
return false;

}



req.onreadystatechange = getReadyStateHandler(req, update4);

req.open("POST","<%=request.getContextPath()%>/UpdateRule.do", true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send("setRule="+rule_name+"&setElectionId="+electionId+"&ruleId="+rule_id+"&position="+pos+"&action="+'t');


     c++;


  }


return true;

}
function update4(cartXML)
{
   

var em = cartXML.getElementsByTagName("email_ids")[0];
var em1 = em.getElementsByTagName("message");
//var em = cartXML.firstChild.value;
for(i=0;i<em1.length;i++)
    {
       alert(em1[i].firstChild.nodeValue);

    }
}





function searchCriteria(pos_id,data) {
   
    var req = newXMLHttpRequest();
    var electionId = document.getElementById("electionId").value;
req.onreadystatechange = getReadyStateHandler(req, updateCriteria);

req.open("POST","<%=request.getContextPath()%>/getRule1.do?getElectionId="+electionId+"&setpos="+pos_id+"&div="+data, true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return true;
}
//var rulerowcount;
function updateCriteria(cartXML1)
{
    var st="<%=request.getParameter("st")!=null && request.getParameter("st").equals("'y'")==false ?request.getParameter("st"):""%>";

var emr = cartXML1.getElementsByTagName("positions1")[0];
var em1r = emr.getElementsByTagName("position1");
//alert(em1r.length);
//rulerowcount=em1r.length;
for(c=0;c<em1r.length;c++)
    {
        //position block creation
                var divtag = document.createElement("div");
                divtag.id = "rule"+c;
                divtag.style.backgroundColor = "#D8CEF6";
                divtag.style.border = "solid 5px #F2F5A9";
                divtag.style.borderTopLeftRadius = "10px";
                divtag.style.width = "900px";
                divtag.style.align = "left";

                divtag.style.marginTop = "5px";
                divtag.style.marginLeft = "3px";
            
//fetch data from XML
var positionname2 = em1r[c].getElementsByTagName("positionname1");
var positionname1 = positionname2[0].firstChild.nodeValue;
var positionId1 = em1r[c].getElementsByTagName("positionId1");
var pos = em1r[c].getElementsByTagName("pos");
var posi = pos[0].firstChild.nodeValue;
//alert(posi+"databaseposiid");

var positionid1 = positionId1[0].firstChild.nodeValue;
//var posiId = "rule_name0"+iii;
//var posid = "rule_id0"+iii;
//document.getElementById(posiId).value = positionname;
//document.getElementById(posid).value = positionid;


                <%if(!button.equals("View") && !button.equals("Block")){%>
                          divtag.innerHTML ='<table><tr><td>Rule : *&nbsp;&nbsp;<input type="text" Id="rule_name0'+c +'"  value='+positionname1 +' size="25px"/><input type="hidden" Id="rule_id0'+c +'" value='+positionid1 +' size="25px"/></td><td><input type="button" id="but0'+ c +'" value="<%=resource.getString("update")%>" onclick="update_criteria('+posi+','+ c +');"/></td>&nbsp;&nbsp;<td><input type="button" value="<%=resource.getString("delete")%>" onclick="search2('+posi+','+ c +');"/></td></tr></table><br>';
               <%}else{%>
                           divtag.innerHTML ='<table><tr><td>Rule : *&nbsp;&nbsp;<input type="text" Id="rule_name0'+c +'"  value='+positionname1 +' size="25px"/><input type="hidden" Id="rule_id0'+c +'" value='+positionid1 +' size="25px"/></td></tr></table><br>';
                <%}%>
                        
        //end of block


document.getElementById("position"+posi).appendChild(divtag);
//rulerowcount++;
}

//j=c-1;
//if(j<0)j=0;
var divtag1 = document.createElement("div");
     divtag1.id = "result";
     divtag1.style.backgroundColor = "#E0F8F7";
    // divtag1.style.border = "solid 5px #0B3B24";
     divtag1.style.borderTopLeftRadius = "10px";
  //   divtag1.style.width = "930px";
     divtag1.style.align = "center";
     divtag1.style.marginLeft = "0px";
     <%if(button.equals("View") && button.equals("Block")){%>
    // divtag1.innerHTML =st;
     <%}else{%>
     divtag1.innerHTML =st;
        <%}%>
document.getElementById("criteria").appendChild(divtag1);
}


function searchCriteria1(pos_id,data) {

    var req = newXMLHttpRequest();
    var electionId = document.getElementById("electionId").value;
req.onreadystatechange = getReadyStateHandler(req, updateCriteria1);

req.open("POST","<%=request.getContextPath()%>/getRule1.do?getElectionId="+electionId+"&setpos="+pos_id+"&div="+data, true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return true;
}
var rulerowcount;
function updateCriteria1(cartXML1)
{
   

var emr = cartXML1.getElementsByTagName("positions1")[0];
var em1r = emr.getElementsByTagName("position1");
//alert("TOTAL RULES"+em1r.length);
rulerowcount=em1r.length;

}


</script>
    <% String institute_id=(String)session.getAttribute("institute_id");%>
    <% String user_id=(String)session.getAttribute("user_id");%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
         <script language="javascript" type="text/javascript" src="js/datetimepicker.js">
    </script>
        <script language="javascript" type="text/javascript">
        function funconLoad()
        {
            searchPositions();
            
        }
<%
System.out.println("Hello i am above");
String id=(String)ElectionDAO.returnMaxElectionId(institute_id);
System.out.println("Hello i am below");
%>
        </script>
    </head>
    <body onload="funconLoad()" dir="<%=rtl%>" style=" background-image: url('/EMS/images/paperbg.gif'); margin-top:0; margin-bottom:0;" >
   <%if(msg1!=null){%>   <span style=" position:absolute; top: 120px; font-size:12px;font-weight:bold;color:red;" ><%=msg1%></span>  <%}%>


   <html:form method="post" action="/createelection" onsubmit="return checkdates()">
       <table align="center" style="font-family: Gill, Helvetica, sans-serif;" width="80%" valign="top" dir="<%=rtl%>">
           <tr><td width="70%" align="left" valign="top" style="border: solid #ECF1EF 5px;" dir="<%=rtl%>">
                   <table><tr><td colspan="2" style="border: 2px solid teal"><div style="background-color: teal;font-family: Gill, Helvetica, sans-serif;width: 100%;color: white"><%=resource.getString("electiondetail")%> </div>
     <html:hidden value="<%=institute_id%>" name="DepActionForm" property="instituteId"/>
  <html:hidden value="<%=user_id%>" name="DepActionForm" property="createdby"/>
     <table dir="<%=rtl%>">
         <tr><td style="vertical-align: top;width: 550px;" dir="<%=rtl%>">
  <%=resource.getString("electionid")%>
  <html:text readonly="true" property="electionId" styleId="electionId" name="DepActionForm" value="<%=id%>" styleClass="textBoxWidth" />
             </td>
 <td style="width: 500px" dir="<%=rtl%>">
      <%=resource.getString("electionname")%><html:text readonly="<%=read %>" name="DepActionForm" style="width: 295px"  property="electionname" styleId="electionname"/><br><span style="font-size: 12px"><%=resource.getString("nameurelection")%>*</span>
  </td>
         </tr></table></td></tr>
         <tr><td colspan="2" dir="<%=rtl%>">
         <div style="background-color: transparent; border: 2px solid teal">
             <span style="vertical-align: top; margin-left: 20px;">
                 <div style="background-color: teal;width: 100%;color: white" dir="<%=rtl%>"> <%=resource.getString("detail")%>  </div><br><html:textarea readonly="<%=read %>" style="width: 700px;margin-left: 20px;" name="DepActionForm" property="description" styleId="details"/>
             </span
             <table style="margin-left: 20px;" dir="<%=rtl%>">

                 <tr><td dir="<%=rtl%>"> <span style="font-size: 14px;font-weight: 600"><%=resource.getString("nominationstart")%>: </span><br><span style="font-size: 12px"><%=resource.getString("nomi")%>*</span><br><html:text readonly="true" name="DepActionForm" property="nominationStart"    styleId="Nstart_date"/><a href="javascript:NewCal('Nstart_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" height="19" alt="Pick a date"/></a></td>
             <td dir="<%=rtl%>"><span style="font-size: 14px;font-weight: 600"><%=resource.getString("nominationend")%>:</span><br><span style="font-size: 12px"><%=resource.getString("nomic")%> *</span><br><html:text readonly="true" name="DepActionForm" property="nominationEnd"    styleId="Nend_date"/><a href="javascript:NewCal('Nend_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" height="19" alt="Pick a date"/></a></td></tr>
         <tr><td dir="<%=rtl%>"><span style="font-size: 14px;font-weight: 600"><%=resource.getString("scrutnystart")%>: </span><br><span style="font-size: 12px">  *</span><br><html:text readonly="true" name="DepActionForm" property="scrutnyDate"    styleId="Scr_date"/><a href="javascript:NewCal('Scr_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" height="19" alt="Pick a date"/></a></td>
             <td dir="<%=rtl%>"><span style="font-size: 14px;font-weight: 600"><%=resource.getString("scrutnyend")%>:</span><br><span style="font-size: 12px"> *</span><br><html:text readonly="true" name="DepActionForm" property="scrutnyEndDate"    styleId="Scrend_date"/><a href="javascript:NewCal('Scrend_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" height="19" alt="Pick a date"/></a></td></tr>
        <tr><td dir="<%=rtl%>"><span style="font-size: 14px;font-weight: 600"><%=resource.getString("withdrawstrat")%> </span><br><span style="font-size: 12px">  *</span><br><html:text readonly="true" name="DepActionForm" property="withdrawlDate"    styleId="wtd_date"/><a href="javascript:NewCal('wtd_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" height="19" alt="Pick a date"/></a></td>
             <td dir="<%=rtl%>"><span style="font-size: 14px;font-weight: 600"><%=resource.getString("withdrawend")%>:</span><br><span style="font-size: 12px"> *</span><br><html:text readonly="true" name="DepActionForm" property="withdrawlEndDate"    styleId="wtdend_date"/><a href="javascript:NewCal('wtdend_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" height="19" alt="Pick a date"/></a></td></tr>
        <tr><td style="vertical-align: top" dir="<%=rtl%>">
                 <span style="font-size: 14px;font-weight: 600"><%=resource.getString("electionstart")%>: </span><br><span style="font-size: 12px"><%=resource.getString("votingopens")%>*</span><br><html:text readonly="true" name="DepActionForm" property="startdate"    styleId="start_date"/><a href="javascript:NewCal('start_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" hieght="19" alt="Pick a date"/></a></td>
             <td dir="<%=rtl%>"><span style="font-size: 14px;font-weight: 600"><%=resource.getString("electionend")%>: </span><br><span style="font-size: 12px; azimuth: right"><%=resource.getString("votingend")%>*</span><br><html:text readonly="true" name="DepActionForm" property="enddate"    styleId="end_date"/><a href="javascript:NewCal('end_date','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" hieght="19" alt="Pick a date"/></a></td></tr>

         <tr>
             <td style="vertical-align: top" dir="<%=rtl%>">
             <span style="font-size: 14px;font-weight: 600">Result can be declared by Election Officer after this date and time: </span><br><span style="font-size: 12px">(After voting result will be displayed)*</span><br><html:text readonly="true" name="DepActionForm" property="resultDeclarationDate"    styleId="result_DeclarationDate"/><a href="javascript:NewCal('result_DeclarationDate','ddmmyyyy',true,24)"><img src="<%=request.getContextPath()%>/images/cal.gif" width="16" hieght="19" alt="Pick a date"/></a></td>

        </tr>

             </table>
         </div></td></tr>
         <tr><td colspan="2" dir="<%=rtl%>" style="border: 2px solid teal">
                 <div style="background-color: teal;width: 100%;color: white"><%=resource.getString("position")%>
                 </div>
                 <table dir="<%=rtl%>"><tr><td dir="<%=rtl%>">
        <div id="position" style="width: 950px;">
            <%--new code--%>
             <div id="criteria" style="width: 950px;">

            </div>
            
           <%--new code--%>
        </div></td></tr>
         <tr><td dir="<%=rtl%>">
        <div style="position: static"><%if(!button.equals("View")&& !button.equals("Block")){%>


            <input type="button" id="add Position" name="add Position" style="margin-left: 0px;" value="<%=resource.getString("addnewposition")%>" size="50px" onclick="createposition();">

         <%}%>
        </div></td></tr>
         </table>
        </td>
         </tr>
      <%--    <tr><td colspan="2" dir="<%=rtl%>" style="border: 2px solid blue">
          <div style="background-color: teal;width: 100%;color: white">Set Criteria Or Set Eligibility Criteria For Election
           </div>
                 <table dir="<%=rtl%>"><tr><td dir="<%=rtl%>">
            <div id="criteria" style="width: 950px;">

            </div>
           </td></tr>
             <tr><td dir="<%=rtl%>">
             <div style="position: static">
             <%if(!button.equals("View")&& !button.equals("Block")){%>
             <input type="button" id="Add Criteria" name="Add Criteria" style="margin-left: 0px;" value="Add Criteria" size="50px" onclick="createcriteria();"><%}%>
             </div>
                 </td></tr>
                 </table>
            </td>
         </tr>--%>
                  
        
                 <html:hidden name="DepActionForm" property="status" styleId="status"/>
<%--
         <%if(request.getAttribute("button").equals("Block")){%>
         <tr><td dir="<%=rtl%>">Election Status:&nbsp;&nbsp;<select id="block" name="block" onchange="return status1();"><option selected value="block">Block</option><option  value="under-process">UnBlock</option></select>
             </td></tr><%}%>



--%>


         <tr><td dir="<%=rtl%>">*<%=resource.getString("mendatory")%></td></tr>

         <tr>
             <td dir="<%=rtl%>">
   
   <input id="button1"  name="button" type="submit" onclick="return checkdates();"  value="Submit" class="txt1"  />
    &nbsp;&nbsp;&nbsp;<input name="button" type="button" value="<%=resource.getString("cancel")%>" onclick="return send()" class="txt1"/>
   
             </td></tr>
     </table>

               </td></tr>
       </table>
  </html:form>
    </body>
</html>

