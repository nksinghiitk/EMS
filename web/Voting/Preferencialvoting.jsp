<%-- 
    Document   : voting
    Created on : Jun 21, 2011, 6:38:30 PM
    Author     : Edrp-04
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.isNew()){
%>
<script>parent.location="<%=request.getContextPath()%>/login.jsp";</script>
<%}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<%
	try{
		if(session.getAttribute("institute_id")!=null){
//			System.out.println("institute_id"+session.getAttribute("institute_id"));
		}
		else{
			session.invalidate();
		    request.setAttribute("msg", "Your Session Expired: Please Login Again");
	    %><script>parent.location = "<%=request.getContextPath()%>"+"/login.jsp?session=\"expired\"";</script><%
        	}
	 }catch(Exception e){
         	request.setAttribute("msg", "Your Session Expired: Please Login Again");
                %>session.invalidate();<%
         }
    %>                
        <script type="text/javascript">
            <%
 String   electionid = (String)session.getAttribute("election_id");
%>
   //var heigh;
   function fn() {

var def_height=404;
var i=0;


//alert(theiframe);
var theiframe = "f1";
var IFRAMEref = window.parent.frames[theiframe];
//pausecomp(3000);
if (IFRAMEref)
    {//alert(IFRAMEref.document);
   //i=0; while(i<558240000){i++;}
var heigh;
    if(IFRAMEref.document!=null)
    heigh = (typeof IFRAMEref.document.body != 'undefined' &&
typeof IFRAMEref.document.body.scrollHeight != 'undefined') ?
IFRAMEref.document.body.scrollHeight :
(typeof IFRAMEref.document.height != 'undefined') ?
IFRAMEref.document.height :
def_height;
if(heigh==undefined) heigh = document.height;
//alert("i="+i+" heigh="+heigh);
//var d = IFRAMEref.document.getElementById("");
}
//heigh = heigh<495?495:heigh;
var he,hei;
//if(heigh>=def_height){
he = heigh + 200;
hei = heigh + 0;//}
<%--else{
    he=parseInt(heigh + 0.27*heigh,10);
    hei = parseInt(heigh + 0.07* heigh,10);}--%>
var overheigh = parent.document.getElementById("overbody").style.height;
<%--alert(overheigh);--%>
overheigh = overheigh.substr(0, overheigh.indexOf("px"));
overheigh = overheigh.substr(0, overheigh.indexOf("%"));

if(he>screen.height)
    parent.document.getElementById("overbody").style.height = he+'px';
else
    parent.document.getElementById("overbody").style.height = screen.height+'px';
var f1heigh = parent.document.getElementById("f1").style.height;
//alert("f1="+f1heigh);
f1heigh = f1heigh.substr(0, f1heigh.indexOf("px"));
f1heigh = f1heigh.substr(0, f1heigh.indexOf("%"));
//if(f1heigh<hei)
    parent.document.getElementById("f1").style.height = hei+'px';

var h = hei + 25;
parent.document.getElementById("electionResult1").style.height = h+'px';

IFRAMEref = null;
return heigh;
}
            var posXml=new Array;
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
 function castVote() {
   // alert(finallist+"kkkk");
   // alert(document.getElementById("position").style.display);

    var req = newXMLHttpRequest();

req.onreadystatechange = getReadyStateHandler(req, updateCast);

//req.open("POST","<%=request.getContextPath()%>/VoteCast.do", true);
req.open("POST","<%=request.getContextPath()%>/PreferentialVoteCast.do", true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//req.send("cast="+positionSel);
req.send("cast="+finallist);
return true;
}
function send1()
{

    <%

String role=(String)session.getAttribute("login_role");
if(role.equalsIgnoreCase("insti-admin")|| role.equalsIgnoreCase("insti-admin,voter"))
   {

%>
 top.location.href="<%=request.getContextPath()%>/institute_admin/search_election_details.jsp";

<%}else if(role.equalsIgnoreCase("Election Manager")|| role.equalsIgnoreCase("Election Manager,voter"))
   { %>
 top.location.href="<%=request.getContextPath()%>/electionmanager.do";

<%}else{
    System.out.println("hiii in senddeee");%>
    top.location.href="<%=request.getContextPath()%>/Voter/voter_home.jsp";
    <%}%>

   }
function updateCast(cartXML)
{
   var em = cartXML.getElementsByTagName("cast")[0];
var em1 = em.getElementsByTagName("message");

alert(em1[0].firstChild.nodeValue);
send1();
}
            function previewBallot() {
    //alert("index="+index+" current="+current);
   // alert(document.getElementById("position").style.display);

    var req = newXMLHttpRequest();

req.onreadystatechange = getReadyStateHandler(req, designBallot);

req.open("POST","<%=request.getContextPath()%>/getPosition1.do", true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return true;
}
var choice= new Array;
function designBallot(cartXML)
{

var htm="";
var ival = 0;
var tval=0;
document.getElementById("ballot").innerHTML="";
var em = cartXML.getElementsByTagName("positions")[0];
var em1 = em.getElementsByTagName("position");
//var em = cartXML.firstChild.value;
var divtag1 = document.createElement("div");
                divtag1.id = "ElectionName";
                divtag1.style.backgroundColor = "#D8CEF6";
                divtag1.style.border = "solid 5px #F2F5A9";
                divtag1.style.borderTopLeftRadius = "15px";
                divtag1.style.borderTopRightRadius = "15px";
                divtag1.style.borderBottomLeftRadius = "15px";
                divtag1.style.borderBottomRightRadius = "15px";
                divtag1.style.marginLeft = "30px";
                divtag1.style.width = "590px";
                divtag1.style.align = "center";
                divtag1.style.marginTop = "5px";
                divtag1.style.height = "40px";
               var htm1 = '<span style="margin-left: 45%">Preferencial Voting<br><%=session.getAttribute("electionName")%></span>';
               divtag1.innerHTML = htm1;
            document.getElementById("ballot").appendChild(divtag1);
            
for(iii=0;iii<em1.length;iii++)
    {
        //position block creation
                var divtag = document.createElement("div");
                divtag.id = "position"+iii;
                divtag.style.backgroundColor = "#D8CEF6";
                divtag.style.border = "solid 5px #F2F5A9";
                divtag.style.borderTopLeftRadius = "15px";
                divtag.style.borderTopRightRadius = "15px";
                divtag.style.borderBottomLeftRadius = "15px";
                divtag.style.borderBottomRightRadius = "15px";
                divtag.style.marginLeft = "30px";
                divtag.style.width = "590px";
                divtag.style.align = "center";
                divtag.style.marginTop = "5px";
   //             divtag.style.height = document.height;
                //divtag.innerHTML ='Position Name *<br><input type="text" Id="position_name0'+iii +'" size="40px"/><br>Number of choice *<br><input type="text" Id="numberofchoice0'+ iii +'" size="40px"/><br><br><div id="candidate0'+iii+'" style="position: relative;background-color: #D8CEF6; border: 3px solid #F2F5A9;display: block;width: 595px"></div><input type="button" name="add candidate" style="" id="add0'+iii+'" onclick="create(0,'+iii+',this);" value="Add Candidate" size="50px"><br>';
                //document.getElementById("position").appendChild(divtag);
        //end of block
var positionname1 = em1[iii].getElementsByTagName("positionname");
var positionname = positionname1[0].firstChild.nodeValue;
var noofchoice1 = em1[iii].getElementsByTagName("noofchoice");
var noofchoice = noofchoice1[0].firstChild.nodeValue;
posXml[iii]=positionname;
var instruct = em1[iii].getElementsByTagName("instruction");
var instrucT = instruct[0].firstChild.nodeValue;
var instruct1;
var instruct2;
if(instrucT!=undefined)
    if(instrucT.lastIndexOf(noofchoice)!=-1)
        {instruct1 = instrucT.substr(0, instrucT.lastIndexOf(noofchoice)-1);
        instruct2 = instrucT.substr(instrucT.lastIndexOf(noofchoice)+1,instrucT.length);}
htm = '<div class="building_block" >Position: <strong>'+positionname+'</strong><br><strong >Give preference to all but only <span style="color: red">'+noofchoice+'</span> candidate according to preference will be elected</strong>';
<%--if(noofchoice>1) htm=htm + ' candidates';
else htm=htm + ' candidate';--%>
htm = htm +'<table class="ballot"><tbody><tr><th style="text-align: left;">Candidate Name</th>';

var ca = em1[iii].getElementsByTagName("candidate");
choice[iii]=1;
//if(ca.length>1)
//{

plen=ca.length;
for(i=0;i<plen;i++)
{


    htm+='<th>'+(i+1)+' Pref&nbsp;&nbsp;</th>';


}
htm+='</tr>';
pref=0;
for(jj=0;jj<ca.length;jj++)
    {

        var candidatename1 = ca[jj].getElementsByTagName("candidatename");
        var candidatename;
            if(candidatename1[0].firstChild!=null) candidatename = candidatename1[0].firstChild.nodeValue;
            else   candidatename = "";

       htm = htm +'<tr><td style="text-align: left;"><label for="entry'+iii+'">'+candidatename+'</label></td>';

    //   var cl = "checkCandidateLimit("+iii+","+jj+",this,"+ ca.length +",count1["+iii+"],'"+candidatename+"','"+positionname+"')";
   var cl = "checkCandidateLimit("+jj+",this,"+ ca.length +",'"+candidatename+"','"+positionname+"')";

             
     
 for(k=0;k<ca.length;k++)
     {
        htm = htm +'<td><input type="radio" value="'+(k+1)+'" onclick="'+cl+'"  name="entry'+iii+pref+'" id="entry'+iii+pref+'" ></td>';
       
     }

htm+='</tr>';
     //  }
     //  else
         //  {
             //  htm = htm +'<td><input type="radio" value="'+jj+'" onclick="'+cl+'"  name="entry'+iii+'" id="entry'+iii+'" ></td></tr>';
         //  }
            
           

ival = ca.length;
 pref++;
    }
 tval+=ca.length;
//}
// htm = htm +'<td><a href="/EMS/printballot.do?id=<%=electionid%>">Print Ballot</a></td></tr>';
  htm = htm + '</tbody></table></div>';
//alert("create("+jj+","+iii+",this);");
//alert(document.getElementById(idadd).attributes.onclick.value);
divtag.innerHTML =htm;
document.getElementById("ballot").appendChild(divtag);


document.getElementById("ballot").style.display="block";

}
var divtag2 = document.createElement("div");
                divtag2.id = "submit";
                divtag2.style.backgroundColor = "#D8CEF6";
                divtag2.style.border = "solid 5px #F2F5A9";
                divtag2.style.borderTopLeftRadius = "15px";
                divtag2.style.borderTopRightRadius = "15px";
                divtag2.style.borderBottomLeftRadius = "15px";
                divtag2.style.borderBottomRightRadius = "15px";
                divtag2.style.marginLeft = "30px";
                divtag2.style.width = "590px";
                divtag2.style.align = "center";
                divtag2.style.marginTop = "5px";
     //           divtag2.style.height = document.height;
                var sql = '<input type="button" value="Vote Now" onclick="Validate('+ tval +','+ choice +',posXml)" style="margin-left: 45%;"/>';
divtag2.innerHTML = sql;
document.getElementById("ballot").appendChild(divtag2);
window.setTimeout('fn()', 400);
//if(document.parentNode!=undefined)

//document.referrer.getElementById("overbody").style.height=h;
}
function Validate(index,ch,posxm)
{
         
        
     // alert(candi.length+"  "+pref1.length+"  "+index);
      if(candi.length==0)
        {
            	//var position = " " + posXml[0].toString();
            	var msg = 'choose candidate properly for position ' ;
            	alert(msg);
		javascript:location.reload(true);
		return false;
        }
        if(candi.length!=index &&  pref1.length!=index)
        {
            	//var position = " " + posXml[0].toString();
            	var msg = 'choose candidate properly for position ' ;
            	alert(msg);
		javascript:location.reload(true);
		return false;
        }
        

	castVote();
}
var count1= new Array;
var selectedcandi = new Array;
var positionSel = new Array;
var currentSel = new Array;



    var candi=new Array();
    var pref1=new Array();
    var finallist=new Array();
    var in1=0;
function checkCandidateLimit(jj,this1,noofchoice,candidateName,positionName)
{
    

    alert("Canidate "+jj+" Has "+this1.value+"Pref");
    
candi[in1]=new Array();
candi[in1]=jj;

pref1[in1]=new Array();
pref1[in1]=this1.value;

            finallist[in1] = new Array;
            finallist[in1][0]=positionName+","+candidateName+","+this1.value+";";
           // alert(finallist.valueOf());
           

          
    
       
in1++;
  

}
        </script>
    </head>
    
    <body onload="previewBallot()" style="margin: 0px;">
   
        <div id="main" style="width: 100%; height: 100%">
            <div id="middle" style="width: 100%;margin-left: 0%; position: relative;">
                <form id="form1">
                <div id="ballot" style="width: 660px; position: relative;margin-left: 0px; margin-top: 0px; border: 2px solid #F2F5A9;background-color: #D8CEF6;overflow: auto">
                    
                </div>
                </form>
            </div>
            
        </div>
    </body>
    
   
</html>
