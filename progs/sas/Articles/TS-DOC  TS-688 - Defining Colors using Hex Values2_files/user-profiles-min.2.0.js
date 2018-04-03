function handleForgottenPWD(a){var b="";
if(a!=null&&a!=""){b="&locale="+a
}window.location.href=loginConfig.serverURL()+"passwordResetRequest.htm?returnURL="+encodeURI(window.location.href)+b
}function h(){}function handleCreateProfile(a){var b="";
if(a!=null&&a!=""){b="&locale="+a
}window.location.href=loginConfig.serverURL()+"create.htm?returnURL="+encodeURI(window.location.href)+b
}function processLogoutRequest(){deleteCookie(loginConfig.userCookieName(),".sas.com");
window.location.href=loginConfig.logoutUrl()+"?realm=/extweb&goto="+encodeURIComponent(window.location.href)
}function showLoginScreen(a){handleLogin()
}function handleLogin(b,d){var c="";
if(b!=null&&b!=""){c="&locale="+b
}var a="";if(typeof d!="undefined"&&d!=null&&d==true){a="&showNewUserDisplay=false"
}window.location.href=loginConfig.loginUrl()+"?realm=/extweb&goto="+encodeURIComponent(window.location.href)+c+a
}function showAnonMenu(){try{var f=document.getElementById("logout");
if(f!=undefined){f.style.display="none"
}var d=document.getElementById("login");
if(d!=undefined){d.style.display="block"
}var c=document.getElementById("logout2");
if(c!=undefined){c.style.display="none"
}var b=document.getElementById("logout3");
if(b!=undefined){b.style.display="none"
}var a=document.getElementById("logout4");
if(a!=undefined){a.style.display="none"
}var g=document.getElementById("login2");
if(g!=undefined){g.style.display="block"
}}catch(e){}}function showAuthMenu(){try{var j=interpretFirstName();
var k=document.getElementById("logout");
if(k!=undefined){k.style.display="block"
}var g=document.getElementById("login");
if(g!=undefined){g.style.display="none"
}var f=document.getElementById("logout2");
if(f!=undefined){f.style.display="block"
}var d=document.getElementById("logout3");
if(d!=undefined){d.style.display="block"
}var c=document.getElementById("logout4");
if(c!=undefined){c.style.display="block"
}var a=document.getElementById("login2");
if(a!=undefined){a.style.display="none"
}var b=document.getElementById("loginDisplayName");
b.style.display="inline";b.innerHTML=j
}catch(e){}}function interpretFirstName(){var a="friend";
try{a=Encoder.decode(readCookie(loginConfig.userCookieName()))
}catch(b){a="not available"}a=a.replace(/\+/g," ");
return a}function userProfileInit(){try{var a=readCookie(loginConfig.authCookieName());
var d=readCookie(loginConfig.persistCookieName());
var c=readCookie(loginConfig.userCookieName());
if((a==null||a==""||a.charAt(0)==":")&&(d!=null&&d!=""&&d.charAt(0)!=":")){window.location.href=loginConfig.loginUrl()+"?realm=/extweb&goto="+encodeURIComponent(window.location.href)
}if(a!=null&&a!=""&&a.charAt(0)!=":"){if(c!=null&&c!=""&&c.charAt(0)!=":"){showAuthMenu()
}else{handleMissingUserCookie()
}}else{showAnonMenu()}}catch(b){}}function handleMissingUserCookie(){processLogoutRequest()
}try{YAHOO.util.Event.onDOMReady(userProfileInit)
}catch(error){}var loginConfig={authCookieName:function(){profileLoginHost=document.location.host;
document.location.host;cookieName="et_iPlanetDirectoryPro";
var b=/prod/;var c=/stage/;var a=/col=wwwstage/;
if(profileLoginHost=="support.sas.com"||profileLoginHost=="www.sas.com"||(b.test(profileLoginHost)&&!a.test(document.location.search))){cookieName="ep_iPlanetDirectoryPro"
}else{if(c.test(profileLoginHost)||a.test(document.location.search)){cookieName="es_iPlanetDirectoryPro"
}}return cookieName},userCookieName:function(){return"SASUserDisplayName"
},serverURL:function(){profileLoginHost=document.location.host;
return"https://"+profileLoginHost+"/profile/user/"
},persistCookieName:function(){profileLoginHost=document.location.host;
cookieName="et_DProPCookie";var b=/prod/;
var c=/stage/;var a=/col=wwwstage/;
if(profileLoginHost=="support.sas.com"||profileLoginHost=="www.sas.com"||(b.test(profileLoginHost)&&!a.test(document.location.search))){cookieName="ep_DProPCookie"
}else{if(c.test(profileLoginHost)||a.test(document.location.search)){cookieName="es_DProPCookie"
}}return cookieName},loginUrl:function(){profileLoginHost=document.location.host;
var b="http://logintest.sas.com/opensso/UI/Login";
var c=/prod/;var d=/stage/;var a=/col=wwwstage/;
if(profileLoginHost=="support.sas.com"||profileLoginHost=="www.sas.com"||(c.test(profileLoginHost)&&!a.test(document.location.search))){b="https://login.sas.com/opensso/UI/Login"
}else{if(d.test(profileLoginHost)||a.test(document.location.search)){b="https://loginstage.sas.com/opensso/UI/Login"
}}return b},logoutUrl:function(){profileLoginHost=document.location.host;
var b="http://logintest.sas.com/opensso/UI/Logout";
var c=/prod/;var d=/stage/;var a=/col=wwwstage/;
if(profileLoginHost=="support.sas.com"||profileLoginHost=="www.sas.com"||(c.test(profileLoginHost)&&!a.test(document.location.search))){b="https://login.sas.com/opensso/UI/Logout"
}else{if(d.test(profileLoginHost)||a.test(document.location.search)){b="https://loginstage.sas.com/opensso/UI/Logout"
}}return b}};function createCookie(c,f,g,d){var a="";
if(g){var b=new Date();b.setTime(b.getTime()+(g*24*60*60*1000));
var a="; expires="+b.toGMTString()
}var e="";if(d!=null){var e="; domain="+d
}document.cookie=c+"="+f+a+e+"; path=/"
}function deleteCookie(a,b){createCookie(a,"",-1,b)
}function readCookie(b){var a=document.cookie.split(";");
var e=b+"=";for(var d=0;d<a.length;
d++){var f=a[d];while(f.charAt(0)==" "){f=f.substring(1,f.length)
}if(f.indexOf(e)==0){return unescape(f.substring(e.length,f.length))
}}return null}function isLetter(b){var c=/^[a-zA-Z]+$/;
var a=c.test(b);return c.test(b)
}function openWindow(g,c,f,j,e,b,d){var a="top="+f+",left="+j+",width="+e+",height="+b;
if(d!=""){a+=","+d}win1=window.open(g,c,a)
}var Encoder={encode:function(b){var a=this._utf8_encode(b);
return escape(a)},decode:function(b){var a=unescape(b);
return this._utf8_decode(a)},_munge:function(c){var d=6;
var b="";var a="";for(i=0;i<c.length;
++i){a=String.fromCharCode(d^c.charCodeAt(i));
if(this._isAlpha(a)){b+=a}else{b+=String.fromCharCode(c.charCodeAt(i))
}}return b},_unmunge:function(c){var d=6;
var b="";var a="";for(i=0;i<c.length;
i++){a=String.fromCharCode(d^c.charCodeAt(i));
if(this._isAlpha(a)){b+=a}else{b+=String.fromCharCode(c.charCodeAt(i))
}}return b},_utf8_encode:function(b){b=b.replace(/\r\n/g,"\n");
var a="";for(var e=0;e<b.length;
e++){var d=b.charCodeAt(e);if(d<128){a+=String.fromCharCode(d)
}else{if((d>127)&&(d<2048)){a+=String.fromCharCode((d>>6)|192);
a+=String.fromCharCode((d&63)|128)
}else{a+=String.fromCharCode((d>>12)|224);
a+=String.fromCharCode(((d>>6)&63)|128);
a+=String.fromCharCode((d&63)|128)
}}}return a},_utf8_decode:function(a){var b="";
var d=0;var e=c1=c2=0;while(d<a.length){e=a.charCodeAt(d);
if(e<128){b+=String.fromCharCode(e);
d++}else{if((e>191)&&(e<224)){c2=a.charCodeAt(d+1);
b+=String.fromCharCode(((e&31)<<6)|(c2&63));
d+=2}else{c2=a.charCodeAt(d+1);
c3=a.charCodeAt(d+2);b+=String.fromCharCode(((e&15)<<12)|((c2&63)<<6)|(c3&63));
d+=3}}}return b},_isAlpha:function(b){var c=/^[a-zA-Z]+$/;
var a=c.test(b);return c.test(b)
}};