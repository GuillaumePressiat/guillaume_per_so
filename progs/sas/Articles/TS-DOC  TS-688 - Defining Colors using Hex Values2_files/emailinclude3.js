/////////////////////////////////////////////////////
/// connection objects and related functions
////////////////////////////////////////////////////

// HTTPPost
//
// paramters:
// pdata - the data to include with the post
// purl - the full server url
// pcontentType - the content type e.g."application/x-www-form-urlencoded
// pcompleteAsyncResponseFunction - callback function to completet any post processing after the request is complete
// perrorFunction - callbacvk function to handle any error that occur during the async request
//
// e.g. usage
//	
//      var username="bob";
//      var password="password13;
//      var serverURL = "http://<some domain>/httpAuth/";
//      var contentType="application/x-www-form-urlencoded";
//	var data = "username="+username+"&password="+password;
//
//      var postProcessingCallBackFunction = function(){
//         alert("post processing!");
//      }
//   
//      var errorCallBackFunction= function(){
//         alert("an error occurred");
//      }    
//
//	var  post = new HTTPPost(data,serverurl,contentType,postProcessingCallBackFunction, errorCallBackFunction);
//	post.doPost();
// 
//
function HTTPPost(pdata,purl,pcontentType,pcompleteAsyncResponseFunction,perrorFunction){
    
    var data = pdata;
    var url =purl;
    var contentType=pcontentType;
    var completeAsyncResponseFunction=pcompleteAsyncResponseFunction;
    var errorFunction=perrorFunction;

    this.doPost = function(){
		var xhReq;
		try{
			xhReq = this.xmlHttpRequest();
 			xhReq.open("POST", url, true);
			xhReq.setRequestHeader("Content-type", contentType);
			xhReq.setRequestHeader("Content-length", data.length);
			
	 		xhReq.onreadystatechange = function(){
				if (xhReq.readyState != 4)  { 
				    return; 
				}
				
				if(completeAsyncResponseFunction !== undefined){
					completeAsyncResponseFunction(xhReq);
				}
 			};	
 			xhReq.send(data);
 		}catch(error){
 			if(errorFunction !== undefined){
					errorFunction(error);
			}else{
				alert("an error occured"+error);
			}
		}
		return true;
	};

	this.xmlHttpRequest = function(){
		try { 
   			return new XMLHttpRequest(); 
   		} catch(e){ 
   			// try again
	   		try { 
   				return new ActiveXObject("Msxml2.XMLHTTP"); 
   			} catch (e){ 
				// nope   				
   			}
   		}
   		//  we're done nio support
   		alert("XMLHttpRequest not supported");
   		return null;
	};	
};
/////////////////////////////
/// transmit email request
////////////////////////////
function processEmailSubmit(){
    clearErrorsAndMessages();
    if(isValidForm()){
	var host= document.location.host;
	var protocol = document.location.protocol;
	var purl = protocol+"//"+host+"/email2friend/email";
	var pdata = assembleFormData();
 	var pcontentType="application/x-www-form-urlencoded";
	var sendEmailConnection = new HTTPPost(pdata,purl,pcontentType,handleSuccess,handleFailure);
	sendEmailConnection.doPost();
    }
};  			  

////////////////////////////////
/// http post callback function
////////////////////////////////

function handleSuccess(o){
    var serverResponseDiv = document.getElementById('serverResponse');
    document.getElementById("bdform").style.display = "none";
    serverResponseDiv.innerHTML = "<p>Your email has been sent.</p>"
    setTimeout("hideEmailForm()",3000);
};

function handleFailure(response){   
    var serverResponseDiv = document.getElementById('serverResponse');
    serverResponseDiv.innerHTML = "<p>An unexpected error has occured. Please try again. If the problem continues contact your support representative.</p>";
};

/////////////////////////////////////
/// email validation function
/////////////////////////////////////

function isValidEmail(str) {
  // Liberal address validation function, from
  // http://en.wikibooks.org/wiki/JavaScript/Best_Practices
  // Accepts RFC 2822-valid addresses, at the expense of allowing some
  // invalid addresses to slip through.
  var atSym = str.lastIndexOf("@");
  if (atSym < 1) { return false; } // no local-part
  if (atSym == str.length - 1) { return false; } // no domain
  if (atSym > 64) { return false; } // there may only be 64 octets in the local-part
  if (str.length - atSym > 255) { return false; } // there may only be 255 octets in the domain

  // Is the domain plausible?
  var lastDot = str.lastIndexOf(".");
  // Check if it is a dot-atom such as example.com
  if (lastDot > atSym + 1 && lastDot < str.length - 1) { return true; }
  //  Check if could be a domain-literal.
  if (str.charAt(atSym + 1) == '[' &&  str.charAt(str.length - 1) == ']') { return true; }
  return false;
}

//////////////////////////////////////
/// html markup specific functions
/////////////////////////////////////

function showEmailForm(){
    document.getElementById("emailFormDiv").style.display="block";
    document.getElementById("bdform").style.display = "block";
};

function hideEmailForm(){ 
    clearErrorsAndMessages();
    clearForm();
    document.getElementById("emailFormDiv").style.display="none";
};

function isValidForm(){
    var formObject = document.getElementById("emailFriendForm");
    var valid = true, validEmail = true;
    var wrkObj;
	 
    if(typeof formObject.senderName.value == 'undefined' || formObject.senderName.value==null||formObject.senderName.value=='') {   
       wrkObj = document.getElementById("senderName");
       wrkObj.style.background="#EEB4B4";
       valid=false;
    }
    if(typeof formObject.url.value == 'undefined' || formObject.url.value==null||formObject.url.value==''){
	valid=false;
    }
    if(typeof formObject.toEmailAddress.value == 'undefined' || formObject.toEmailAddress.value==null||formObject.toEmailAddress.value==''){
	valid=false;
	wrkObj = document.getElementById("toEmailAddress");
	wrkObj.style.background="#EEB4B4";
    }else{
        if (!isValidEmail(formObject.toEmailAddress.value)) {
            validEmail = false;
            wrkObj = document.getElementById("toEmailAddress");
            wrkObj.style.background="#EEB4B4";
        }
    }
    if(typeof formObject.fromEmailAddress.value == 'undefined' || formObject.fromEmailAddress.value==null||formObject.fromEmailAddress.value==''){
	valid=false;			
	wrkObj = document.getElementById("fromEmailAddress");
	wrkObj.style.background="#EEB4B4";
    }else{
        if (!isValidEmail(formObject.fromEmailAddress.value)) {
            validEmail = false;
            wrkObj = document.getElementById("fromEmailAddress");
            wrkObj.style.background="#EEB4B4";
        }
    }
    var serverResponseDiv = document.getElementById('serverResponse');
    serverResponseDiv.innerHTML = "";
    if(!valid){
	serverResponseDiv.innerHTML += "<div><p>missing required fields</p></div>";
    }
    if(!validEmail){
    serverResponseDiv.innerHTML += "<div><p>please enter a valid email address</p></div>";
    }
    return valid && validEmail;
};

function clearForm(){
    var formObject = document.getElementById("emailFriendForm");
    formObject.senderName.value =""
    formObject.fromEmailAddress.value="";
    formObject.toEmailAddress.value="";
    formObject.ccSender.checked=false;
    formObject.note.value="";
 };
 			
function clearErrorsAndMessages(){
   var serverResponseDiv = document.getElementById('serverResponse');
   serverResponseDiv.innerHTML = "<div></div>";
   var wrkObj = document.getElementById("senderName");
   wrkObj.style.background="#FFFFFF";
   wrkObj = document.getElementById("toEmailAddress");
   wrkObj.style.background="#FFFFFF";
   wrkObj = document.getElementById("fromEmailAddress");
   wrkObj.style.background="#FFFFFF";
};

function assembleFormData(){
    var formData = "";
    var urlToSend = document.location.href;
    var formObject = document.getElementById("emailFriendForm");

    formData = 'senderName='+formObject.senderName.value;
    formData = formData+'&fromEmailAddress='+formObject.fromEmailAddress.value;
    formData = formData+'&toEmailAddress='+formObject.toEmailAddress.value;
    formData = formData+'&ccSender='+formObject.ccSender.checked;
    formData = formData+'&note='+formObject.note.value;
    formData = formData+'&url='+urlToSend;
    formData = formData+'&virtualFolder='+formObject.virtualFolder.value;
    formData = formData+'&template='+formObject.template.value;
    return formData;
};

