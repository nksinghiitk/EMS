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
      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Pragma", "no-cache");
      response.setDateHeader("max-age", 0);
      response.setDateHeader("Expires", 0);
    %>
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
    //alert("index="+index+" current="+current);
   // alert(document.getElementById("position").style.display);

    var req = newXMLHttpRequest();

req.onreadystatechange = getReadyStateHandler(req, updateCast);

req.open("POST","<%=request.getContextPath()%>/VoteCast.do", true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send("cast="+positionSel);
return true;
}
function updateCast(cartXML)
{
   var em = cartXML.getElementsByTagName("cast")[0];
var em1 = em.getElementsByTagName("message");

alert(em1[0].firstChild.nodeValue);
 
top.location.href="<%=request.getContextPath()%>/logout.do";
}
            function previewBallot() {
    //alert("index="+index+" current="+current);
   // alert(document.getElementById("position").style.display);

    var req = newXMLHttpRequest();

req.onreadystatechange = getReadyStateHandler(req, designBallot);

req.open("POST","<%=request.getContextPath()%>/getPosition.do", true);

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.send();
return true;
}
var choice= new Array;
function designBallot(cartXML)
{

var htm="";
var ival = 0;
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
                divtag1.style.height = "20px";
               var htm1 = '<span style="margin-left: 45%"><%=session.getAttribute("electionName")%></span>';
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
htm = '<div class="building_block" >Position: <strong>'+positionname+'</strong><br><strong >'+ instruct1 +' <span style="color: red">'+noofchoice+'</span>'+ instruct2 +'</strong>';
<%--if(noofchoice>1) htm=htm + ' candidates';
else htm=htm + ' candidate';--%>
htm = htm +'<table class="ballot"><tbody><tr><th style="text-align: left;">Candidate Name</th><th>Selection</th></tr>';

var ca = em1[iii].getElementsByTagName("candidate");
choice[iii]=noofchoice;
//if(ca.length>1)
//{
for(jj=0;jj<ca.length;jj++)
    {
        var candidatename1 = ca[jj].getElementsByTagName("candidatename");
        var candidatename;
            if(candidatename1[0].firstChild!=null) candidatename = candidatename1[0].firstChild.nodeValue;
            else candidatename = "";
       htm = htm +'<tr><td style="text-align: left;"><label for="entry'+iii+'">'+candidatename+'</label></td>';

       var cl = "checkCandidateLimit("+iii+","+jj+",this,"+ noofchoice +",count1["+iii+"],'"+candidatename+"','"+positionname+"')";
if(noofchoice>1)
       {
               htm = htm +'<td><input type="checkbox" value="'+jj+'"   onclick="'+cl+'" name="entry'+iii+'" id="entry'+iii+'" ></td></tr>';
       }
       else
           {
               htm = htm +'<td><input type="radio" value="'+jj+'" onclick="'+cl+'"  name="entry'+iii+'" id="entry'+iii+'" ></td></tr>';
           }
ival = iii;
    }
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
                var sql = '<input type="button" value="Vote Now" onclick="Validate('+ ival +','+ choice +',posXml)" style="margin-left: 45%;"/>';
divtag2.innerHTML = sql;
document.getElementById("ballot").appendChild(divtag2);
window.setTimeout('fn()', 400);
//if(document.parentNode!=undefined)

//document.referrer.getElementById("overbody").style.height=h;
}

function Validate(index,ch,posxm)
{
<%
	try{
		if(session.getAttribute("institute_id")!=null){
//			System.out.println("institute_id"+session.getAttribute("institute_id"));
		}
		else{
			session.invalidate();
		    request.setAttribute("msg", "Your Session Expired: Please Login Again");
	    %>parent.location = "<%=request.getContextPath()%>"+"/login.jsp?session=\"expired\"";<%
        	}
	 }catch(Exception e){
         	request.setAttribute("msg", "Your Session Expired: Please Login Again");
                %>session.invalidate();<%
         }
    %>   

 for(var i=0;i<=index;i++){
        //alert("count1["+i+"]="+count1[i]+" ch["+i+"]="+choice[i]);
        if(count1[i]!=choice[i] || count1[i]==undefined){
            	var position = " " + posXml[i].toString();
            	var msg = 'choose candidate properly for position ' + position;
            	alert(msg);
		javascript:location.reload(true);
		return false;
        }
   }
	castVote();
}
var count1=new Array;
var selectedcandi = new Array;
var positionSel = new Array;

function checkCandidateLimit(iii,jj,this1,noofchoice,currentSel,candidateName,positionName)
{
    var id = "entry"+iii;
    
    if(positionSel[iii]==undefined)
        {
            positionSel[iii] = new Array;
            if(positionSel=="")
            positionSel[iii][0]=positionName;
            else positionSel[iii][0]=";"+positionName;
            positionSel[iii][1] = new Array;
        }
        var doc= document.getElementById(id);
    if(currentSel==undefined){ count1[iii]=0;currentSel=0;}
    //alert(currentSel);
    if(this1.type=="checkbox")
    {
    if(this1.checked==true)
        {
            positionSel[iii][1][jj]=candidateName;
            //alert(positionSel[iii]);
            count1[iii]++;
            
            //selectedcandi[iii][jj]=candidateName;
            
        }
    else
        {
          positionSel[iii][1][jj]="";
          alert(positionSel[iii]);
            count1[iii]--;}
    if(count1[iii]>noofchoice)
        {
            alert("You may Select more than maximum choice.");
            this1.checked = false;
            positionSel[iii][1][jj]="";
            count1[iii]--;
        }
    }
    else{
        count1[iii]=1;
        positionSel[iii][1][0]=candidateName;
        //alert(positionSel[iii]);
    }
                

}
        </script>
    </head>
    
    <body onload="previewBallot()" style="margin: 0px;">
   
        <div id="main" style="width: 100%; height: 100%">
            <div id="middle" style="width: 100%;margin-left: 0%; position: relative;">
                <form id="form1">
                <div id="ballot" style="width: 660px; position: relative;margin-left: 0px; margin-top: 0px; border: 2px solid #F2F5A9;background-color: #D8CEF6;overflow: auto;font-family: Gill, Helvetica, sans-serif ;font-size: 12px;">
                    
                </div>
                </form>
            </div>
            
        </div>
    </body>
    
   
</html>
