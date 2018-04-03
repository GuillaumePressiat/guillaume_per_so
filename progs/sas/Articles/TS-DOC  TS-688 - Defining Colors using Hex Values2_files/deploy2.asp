lpAddMonitorTag();
if(typeof lpMTagConfig!="undefined")lpMTagConfig.getLPVarValue=function(c){if(!lpMTagConfig.varLookup){lpMTagConfig.varLookup={};for(var b=0;b<lpMTagConfig.vars.length;b++){var a=lpMTagConfig.vars[b];a.length>2&&(lpMTagConfig.varLookup[a[1]]={value:a[2],scope:"page"});a.length==2&&(lpMTagConfig.varLookup[a[0]]={value:a[1],scope:"page"})}}return lpMTagConfig.varLookup[c]==null?null:lpMTagConfig.varLookup[c].value};
typeof lpMTagConfig!="undefined"&&function(a){lpMTagConfig.isMobile=!1;if(/android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(a.substr(0,
4)))lpMTagConfig.isMobile=!0}(navigator.userAgent||navigator.vendor||window.opera);
//DO NOT CHANGE THE BELOW COMMENT
//PLUGINS_LIST=simpleDeploy,globalUtilsV2,mobileDeviceDetection
if( typeof( lpMTagConfig.plugins ) == "undefined" ) { 
	lpMTagConfig.plugins = {};
}

(function() {
	var unit = lpMTagConfig.getLPVarValue( "unit" );
	var language = lpMTagConfig.getLPVarValue( "language" );
		
	if( document.location.href.match( /\/offices\/europe\/germany\// ) ) {
		var language = "dede";
		lpMTagConfig.vars.push(["session","language",language]);
	}
	
	lpMTagConfig.plugins['mobileDeviceDetection'] = {
    name: 'mobileDeviceDetection'
	};
	
	lpMTagConfig.plugins.simpleDeploy = {
		name: "simpleDeploy",
		config: {
			server: "server.iad.liveperson.net",
			buttons: [{
				name: "chat-" + unit + "-" + language,
				pid: "lpButtonDiv",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "2-" + language,
				pid: "lpButtonDiv2",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "3-" + language,
				pid: "lpButtonDiv3",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "4-" + language,
				pid: "lpButtonDiv4",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "5-" + language,
				pid: "lpButtonDiv5",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "6-" + language,
				pid: "lpButtonDiv6",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "7-" + language,
				pid: "lpButtonDiv7",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "8-" + language,
				pid: "lpButtonDiv8",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "9-" + language,
				pid: "lpButtonDiv9",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "10-" + language,
				pid: "lpButtonDiv10",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "11-" + language,
				pid: "lpButtonDiv11",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "12-" + language,
				pid: "lpButtonDiv12",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "13-" + language,
				pid: "lpButtonDiv13",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "14-" + language,
				pid: "lpButtonDiv14",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			},{
				name: "chat-" + unit + "15-" + language,
				pid: "lpButtonDiv15",
				afterStartPage: true,
				ovr: "lpMTagConfig.db1"
			}
			]
		}
	};
	
	lpMTagConfig.plugins.globalUtilsV2 = {
    name: 'globalUtilsV2',
    config : {
		dbOvrObj : ['lpMTagConfig.db1'],
			forceButtonRefreshOnInvite:true,
			overrideZIndex:true,			             
			overrideBusyAction:true,
			overrideOfflineAction:true,
            zIndex:200000
		}
	};
	
})();
if (typeof(lpMTagConfig.pluginCode)== 'undefined') {lpMTagConfig.pluginCode = {};} // HAS TO BE HERE
lpMTagConfig.pluginCode.lpBasePlugin = {
    // initialize the external configuration parameters - do not change this method - has to be added to every plugin
    init: function() {
        try {
            if (typeof (lpMTagConfig.pluginRef) == 'undefined') { lpMTagConfig.pluginRef = {}; }
            lpMTagConfig.pluginRef[this.name] = this;
            this.log(this.name + ' init', 'DEBUG');
            for (var name in lpMTagConfig.plugins) {
                if (typeof (lpMTagConfig.plugins[name]) == 'object' && lpMTagConfig.plugins[name].name == this.name) {
                    var cfg = lpMTagConfig.plugins[name].config;
                    if (cfg) {
                        for (var prop in cfg) {
                            this[prop] = cfg[prop];
                        }
                    }
                    break;
                }
            }
        }
        catch (e) {
            this.log('Plugin ' + this.name + ' exception in init:' + e, 'ERROR');
        }
    },

    log: function(msg, level) {
        if (typeof(lpMTagDebug)!='undefined' && lpMTagDebug.Display) {
            try {
                lpMTagDebug.Display(msg, level, 'PLUGIN-' + this.name);
            }
            catch (e) { }
        }
		if(typeof(console)!='undefined' && 
		   (typeof(lpMTagConfig.pluginsConsoleDebug)=='undefined' ||  lpMTagConfig.pluginsConsoleDebug==true)){
			console.log(level + ":" + msg);
		}
    }
};

// Initialize the plugin hook arrays if needed
if (typeof (lpMTagConfig.pluginHook) == 'undefined') { lpMTagConfig.pluginHook = {}; }
if (typeof (lpMTagConfig.pluginHook.invite) == 'undefined') { lpMTagConfig.pluginHook.invite = []; }
if (typeof (lpMTagConfig.pluginHook.dynButtons) == 'undefined') { lpMTagConfig.pluginHook.dynButtons = []; }
if(typeof lpMTagConfig.pluginCode=="undefined")lpMTagConfig.pluginCode={};
lpMTagConfig.pluginCode.simpleDeploy={ver:1,name:"simpleDeploy",buttonDivMustBePresentOnLoad:!0,defaultButtonDivID:"lpChatButton",sendOrderInfoIfZeroOrEmpty:!1,dontSendIfEmpty:["OrderTotal","OrderNumber"],dontSendIfZero:["OrderTotal","OrderNumber"],sendCookiesIfOrderTotal:!1,buttons:null,scopeOverride:{language:"session"},server:null,varNameCharLimit:50,varValueCharLimit:50,SSOURL:null,inviteChatSSOurl:null,inviteVoiceSSOurl:null,inviteVoiceSingleStepSSOurl:null,defaultInvite:"",isSetup:!1,loop:!0,
varPollInterval:5E3,processVarsTimeout:null,trimSpaces:function(d){return d.replace(/^\s+|\s+$/g,"")},addVar:function(d,c,a){lpMTagConfig.varLookup&&c?lpMTagConfig.varLookup[c]={value:a,scope:d,sent:!1}:c||this.log(this.name+" Added LP variable with a defined name","ERROR")},constructVarsQueryString:function(d){var c="",a;for(a in lpMTagConfig.varLookup)if(!lpMTagConfig.varLookup[a].sent){var b=lpMTagConfig.varLookup[a].value,f=lpMTagConfig.varLookup[a].scope;if(a.indexOf("OrderTotal")!=-1||a.indexOf("OrderNumber")!=
-1){if(this.sendOrderInfoIfZeroOrEmpty&&(b==""||b==0))return;if(!this.sendCookiesIfOrderTotal)lpMTagConfig.sendCookies=!1}for(var g=!0,e=0;e<this.dontSendIfEmpty.length;e++)a.indexOf(this.dontSendIfEmpty[e])!=-1&&b==""&&(g=!1);for(e=0;e<this.dontSendIfZero.length;e++)a.indexOf(this.dontSendIfZero[e])!=-1&&b==0&&(g=!1);if(g)if(b!=null&&f){b=this.trimSpaces(b.toString());a.length>this.varNameCharLimit&&(a=a.substr(0,this.varNameCharLimit));b.length>this.varValueCharLimit&&(b=b.substr(0,this.varValueCharLimit));
g=null;e=a+"="+b;g=typeof encodeURIComponent=="undefined"?escape(a)+"="+escape(b):encodeURIComponent(a)+"="+encodeURIComponent(b);b="P";switch(f){case "page":d&&lpMTagConfig.pageVar.push(g);b="P";break;case "session":d&&lpMTagConfig.sessionVar.push(g);b="S";break;case "visitor":d&&lpMTagConfig.visitorVar.push(g),b="V"}c.length>0&&(c+="&");c+=b+"V!"+e;lpMTagConfig.varLookup[a].sent=!0}else f||this.log("LP variable '"+a+"' does not have a scope defined","ERROR"),b||this.log("LP var '"+a+"' does not have a value defined",
"ERROR")}return c},processVars:function(d){if(!lpMTagConfig.varLookup)lpMTagConfig.varLookup={};if(lpMTagConfig.vars!=null)for(var c=0;c<lpMTagConfig.vars.length;c++){var a=lpMTagConfig.vars[c],b="";a.length>2&&(b=a[0],this.scopeOverride[a[0]]!=null&&(b=this.scopeOverride[a[0]]),this.addVar(b,a[1],a[2]));a.length==2&&(b="page",this.scopeOverride[a[0]]!=null&&(b=this.scopeOverride[a[0]]),this.addVar(b,a[0],a[1]))}d=this.constructVarsQueryString(d);lpMTagConfig.vars=[];if(this.loop){var f=this;this.processVarsTimeout&&
window.clearTimeout(this.processVarsTimeout);this.processVarsTimeout=window.setTimeout(function(){f.processVars(!0)},f.varPollInterval)}return d},start:function(){this.isSetup||this.setup()},setup:function(){this.log(this.name+" setup","DEBUG");this.isSetup=!0;if(typeof lpAddVars=="undefined")lpAddVars=this.addVar;lpMTagConfig.lpTagLoaded=!1;if(typeof lpMTagConfig.lpServer=="undefined")lpMTagConfig.lpServer=this.server!=null?this.server:lpMTagConfig.lpTagSrv;if(typeof lpMTagConfig.pageVar=="undefined")lpMTagConfig.pageVar=
[];if(typeof lpMTagConfig.sessionVar=="undefined")lpMTagConfig.sessionVar=[];if(typeof lpMTagConfig.visitorVar=="undefined")lpMTagConfig.visitorVar=[];if(typeof lpMTagConfig.onLoadCode=="undefined")lpMTagConfig.onLoadCode=[];if(typeof lpMTagConfig.dynButton=="undefined")lpMTagConfig.dynButton=[];if(typeof lpMTagConfig.ifVisitorCode=="undefined")lpMTagConfig.ifVisitorCode=[];if(typeof lpMTagConfig.channels=="undefined"||lpMTagConfig.channels.length==0)lpMTagConfig.channels=["chat"];if(typeof lpMTagConfig.db1==
"undefined")lpMTagConfig.db1={};if(typeof lpMTagConfig.db2=="undefined")lpMTagConfig.db2={};if(this.SSOURL)lpMTagConfig.SSOURL=this.SSOURL;if(this.inviteChatSSOurl)lpMTagConfig.inviteChatSSOurl=this.inviteChatSSOurl;if(this.inviteVoiceSSOurl)lpMTagConfig.inviteVoiceSSOurl=this.inviteVoiceSSOurl;if(this.inviteVoiceSingleStepSSOurl)lpMTagConfig.inviteVoiceSingleStepSSOurl=this.inviteVoiceSingleStepSSOurl;lpMTagConfig.pageLoadTime!=null&&this.addVar("page","pageLoadTime",Math.round(lpMTagConfig.pageLoadTime/
1E3)+" sec",!0);this.processVars(!0);var d=null;typeof lpMTagConfig.getLPVarValue!="undefined"?d=lpMTagConfig.getLPVarValue("unit"):typeof lpUnit!="undefined"&&(d=lpUnit);var c=null;typeof lpMTagConfig.getLPVarValue!="undefined"?c=lpMTagConfig.getLPVarValue("language"):typeof lpLanguage!="undefined"&&(c=lpLanguage);if(this.defaultInvite!=="")lpMTagConfig.defaultInvite=this.defaultInvite;else if(lpMTagConfig.defaultInvite==null){if(d!=null)lpMTagConfig.defaultInvite=lpMTagConfig.channels[0]+"-"+d;
c!=null&&(lpMTagConfig.defaultInvite+="-"+c)}if(this.buttons!=null&&lpMTagConfig.dynButton.length==0)for(var a=0;a<this.buttons.length;a++){lpMTagConfig["db"+(a+1)]==null&&(lpMTagConfig["db"+(a+1)]={});var b={name:this.buttons[a].name,pid:this.buttons[a].pid,afterStartPage:this.buttons[a].afterStartPage,ovr:this.buttons[a].ovr};if(this.buttons[a].SSOURL)b.SSOURL=this.buttons[a].SSOURL;else if(this.SSOURL)b.SSOURL=this.SSOURL;lpMTagConfig.dynButton[lpMTagConfig.dynButton.length]=b}else if(lpMTagConfig.buttonNames==
null&&lpMTagConfig.dynButton.length==0){if(d!=null)for(a=0;a<lpMTagConfig.channels.length;a++){b=lpMTagConfig.channels[a]+"-"+d;c!=null&&(b+="-"+c);lpMTagConfig["db"+(a+1)]==null&&(lpMTagConfig["db"+(a+1)]={});b={name:b,pid:this.buttonDivMustBePresentOnLoad&&document.getElementById(b)!=null?b:this.defaultButtonDivID,afterStartPage:!0,ovr:"lpMTagConfig.db"+(a+1)};if(this.SSOURL)b.SSOURL=this.SSOURL;lpMTagConfig.dynButton[lpMTagConfig.dynButton.length]=b}}else if(lpMTagConfig.buttonNames!=null)for(a=
0;a<lpMTagConfig.buttonNames.length;a++){b=lpMTagConfig.buttonNames[a];lpMTagConfig["db"+(a+1)]==null&&(lpMTagConfig["db"+(a+1)]={});b={name:b,pid:this.buttonDivMustBePresentOnLoad&&document.getElementById(b)!=null?b:this.defaultButtonDivID,afterStartPage:!0,ovr:"lpMTagConfig.db"+(a+1)};if(this.SSOURL)b.SSOURL=this.SSOURL;lpMTagConfig.dynButton[lpMTagConfig.dynButton.length]=b}if(this.buttonDivMustBePresentOnLoad){var f=this;lpMTagConfig.onLoadCode[lpMTagConfig.onLoadCode.length]=function(){if(typeof lpMTagConfig.dynButton!=
"undefined")for(var a=0;a<lpMTagConfig.dynButton.length;a++)typeof lpMTagConfig.dynButton[a].pid!="undefined"&&document.getElementById(lpMTagConfig.dynButton[a].pid)==null&&(f.log("Removing dynButton "+lpMTagConfig.dynButton[a].name,"DEBUG"),lpMTagConfig.dynButton.splice(a,1),a--)}}}};
if(typeof lpMTagConfig.pluginCode=="undefined")lpMTagConfig.pluginCode={};
lpMTagConfig.pluginCode.globalUtilsV2={ver:2,name:"globalUtilsV2",overrideBusyAction:!1,overrideOfflineAction:!1,forceButtonRefreshOnDecline:!1,forceButtonRefreshOnInvite:!1,cookiesToNotSend:null,excludeVisitorByCookie:!1,excludeVariableName:"Exclude",excludeVariableValue:"true",overrideZIndex:!1,zIndex:2E3,ssoURL:null,dynButtonHooks:[{name:"busyAction",run:function(a){return lpMTagConfig.pluginCode.globalUtilsV2.busyAction(a)}},{name:"offlineAction",run:function(a){return lpMTagConfig.pluginCode.globalUtilsV2.offlineAction(a)}},
{name:"dbStateChange",run:function(a){return lpMTagConfig.pluginCode.globalUtilsV2.dbStateChange(a)}}],buttonRefs:[],start:function(){this.log(this.name+" start","DEBUG");this.excludeVisitorByCookie&typeof lpAddVars!="undefined"&&/lpdontbotherme\=1/.test(document.cookie)&&lpAddVars("session",this.excludeVariableName,this.excludeVariableValue);if(this.ssoURL!=null){lpMTagConfig.inviteChatSSOurl=this.ssoURL;for(var a=0;a<lpMTagConfig.dynButton.length;a++)lpMTagConfig.dynButton[a].SSOURL=this.ssoURL}if(this.cookiesToNotSend!=
null&&this.cookiesToNotSend instanceof Array)lpMTagConfig.GetPageCookies=function(){var a=document.cookie;if(typeof a=="undefined"||a==null)a="";for(var c=0;c<this.cookiesToNotSend.length;c++)a=a.replace(this.cookiesToNotSend[c]+"=[a-zA-Z0-9-!]*;?","");return a}},setExcludeCookie:function(a){try{if(this.log(this.name+" setExcludeCookie","DEBUG"),!isNaN(a)&&a>0){var b=new Date;b.setTime(b.getTime()+a*36E5);var c="; expires="+b.toGMTString();document.cookie="lpdontbotherme=1"+c+"; path=/";typeof lpSendData!=
"undefined"&&this.excludeVisitorByCookie&&lpSendData("session",this.excludeVariableName,this.excludeVariableValue)}}catch(d){this.log("Plugin "+this.name+" exception in setExcludeCookie:"+d,"ERROR")}},busyAction:function(a){if(this.overrideBusyAction)try{this.log(this.name+" busyAction","DEBUG");objRef=eval(a.objName);var b=objRef.getActionURL("Busy"),b=b.replace(/forceOffline/,"SESSIONVAR%21BusyClickOverride");window.open(b,"Chat"+lpMTagConfig.lpNumber,"width=472,height=320,status=0,resizable=0,menubar=no,scrollbars=no,location=no")}catch(c){this.log("Plugin "+
this.name+" exception in busyAction:"+c,"ERROR")}},offlineAction:function(a){if(this.overrideOfflineAction)try{this.log(this.name+" offlineAction","DEBUG");objRef=eval(a.objName);var b=objRef.getActionURL("Offline");window.open(b,"Chat"+lpMTagConfig.lpNumber,"width=472,height=320,status=0,resizable=0,menubar=no,scrollbars=no,location=no")}catch(c){this.log("Plugin "+this.name+" exception in offlineAction:"+c,"ERROR")}},dbStateChange:function(a){try{this.log(this.name+" dbStateChange","DEBUG");for(var b=
eval(a.objName),c=!1,d=0;d<this.buttonRefs.length;d++)this.buttonRefs[d]===b&&(c=!0);!c&&b!=null&&this.buttonRefs.push(b);objRef=eval(a.objName);if(typeof objRef.refImage=="undefined")return!0;if(a.status=="busy"&&this.overrideBusyAction)return objRef.setCursorStyle(objRef.pointerStyle),objRef.refImage.src=typeof objRef.ver=="undefined"?objRef.imageUrl+objRef.imgBusyName:objRef.imgBusyName,objRef.refImage.alt="",objRef.refImage.onclick=typeof objRef.overwriteObj.busyAction!="undefined"?function(){try{eval(objRef.extConfig.ovr).busyAction(a.objName)}catch(b){}return!1}:
null,!1;if(a.status=="offline"&&this.overrideOfflineAction)return objRef.setCursorStyle(objRef.pointerStyle),objRef.refImage.src=typeof objRef.ver=="undefined"?objRef.imageUrl+objRef.imgOfflineName:objRef.imgOfflineName,objRef.refImage.alt="",objRef.refImage.onclick=typeof objRef.overwriteObj.offlineAction!="undefined"?function(){try{eval(objRef.extConfig.ovr).offlineAction(a.objName)}catch(b){}return!1}:null,!1}catch(e){this.log("Plugin "+this.name+" exception in dbStateChange:"+e,"ERROR")}return!0},
refreshButtons:function(){for(var a=0;a<this.buttonRefs.length;a++){var b=this.buttonRefs[a];try{b.MakeCall()}catch(c){this.log("Plugin "+this.name+" exception when refreshing button: "+c,"ERROR")}}},inviteChatShown:function(a){try{if(this.log(this.name+" inviteChatShown","DEBUG"),this.forceButtonRefreshOnInvite==!0&&this.refreshButtons(),this.overrideZIndex){var b=eval(a.objName);if(b&&b.divID){var c=document.getElementById(b.divID);if(c)c.style.zIndex=this.zIndex}}}catch(d){this.log("Plugin "+this.name+
" exception in inviteChatShown:"+d,"ERROR")}return!0},inviteChatDeclined:function(){try{this.log(this.name+" inviteChatDeclined","DEBUG"),this.forceButtonRefreshOnDecline==!0&&this.refreshButtons()}catch(a){this.log("Plugin "+this.name+" exception in inviteChatDeclined:"+a,"ERROR")}return!0}};lpMTagConfig.pluginHook.invite[lpMTagConfig.pluginHook.invite.length]={name:"inviteChatDeclined",run:function(a){return lpMTagConfig.pluginCode.globalUtilsV2.inviteChatDeclined(a)}};
lpMTagConfig.pluginHook.invite[lpMTagConfig.pluginHook.invite.length]={name:"inviteChatShown",run:function(a){return lpMTagConfig.pluginCode.globalUtilsV2.inviteChatShown(a)}};
if (typeof lpMTagConfig.pluginCode == "undefined") lpMTagConfig.pluginCode = {};

lpMTagConfig.pluginCode.mobileDeviceDetection = function(document, window, undefined) {

    var mobileDeviceFlag = false; // indicates whether we are on a mobile device or not
    var mobilePhoneFlag = false; // flag just for mobile phones
    var mobileTabletFlag = false; // flag just for mobile phones

    // object describing any / all properties of the device
    var mobileDeviceInfo = {
        isIPhone: false,
        isIPad: false,
        isMobile: false,
        isTablet: false,
        deviceOS: ""
    };

    var appVer = navigator.appVersion;
    var searchVersion = /\s(\d)_\d/;
    var searchDevice = /\s[(](\w+\s?\w*)[;]\s/;
    var isIPhone = false;
    var isIPad = false;

    function isAndroidPhone() {

        // we need to check if this is a Kindle device as they share some of the user agent properties of Android devices.
        // if we detect this is NOT a KINDLE device then we proceed to check if it is an android phone as usual
        var flag = false;

        if (!isKindleDevice()) {
            // looking for Andoird && Mobile in UserAgent for Android Mobile Phones
            flag = navigator.userAgent.match(/^(?=.*?(Android))(?=.*?(Mobile)).*$/i) ? true : false;
            if (flag) {

                mobileDeviceInfo.deviceOS = "Android";
            }
        }

        return flag;
    }

    function isBlackBerry() {

        var flag = navigator.userAgent.match(/BlackBerry/i) ? true : false;
        if (flag) {
            mobileDeviceInfo.deviceOS = "Blackberry";
        }
        return flag;
    }

    function isiOS() {

        var flag = navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
        if (flag) {
            mobileDeviceInfo.deviceOS = "iOS";
        }
        return flag;
    }

    function isiPhone() {
        var flag = navigator.userAgent.match(/iPhone|iPod/i) ? true : false;
        if (flag) {

            mobileDeviceInfo.deviceOS = "iOS (iPhone)";
        }

        return flag;
    }

    function isOpera() {

        var flag = navigator.userAgent.match(/Opera Mini/i) ? true : false;
        if (flag) {
            mobileDeviceInfo.deviceOS = "Opera";
        }
        return flag;
    }

    function isWindows() {

        var flag = navigator.userAgent.match(/IEMobile/i) ? true : false;
        if (flag) {
            mobileDeviceInfo.deviceOS = "Windows";
        }
        return flag;
    }

    function isiPad() {

        var flag = navigator.userAgent.match(/iPad/i) ? true : false;
        if (flag) {
            mobileDeviceInfo.deviceOS = "iOS (iPad)";
        }
        return flag;
    }

    function isAndroidTablet() {

        // looking for Android && NOT "Mobile" to confirm Android Tablet device
        return navigator.userAgent.match(/^(?=.*?(Android))((?!Kindle).)((?!Mobile).)*$/i) ? true : false;
    }

    function isKindleDevice() {
        /*
        Kindle User Agent String
        
        The monochrome Kindles have a User Agent String like:

            Mozilla/5.0 (Linux; U; en-US) AppleWebKit/528.5+ (KHTML, like Gecko, Safari/528.5+) Version/4.0 Kindle/3.0 (screen 600×800; rotate)
        
        The User Agent String of the new Kindle Fire tablet is:
            
            Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; Kindle Fire Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1

        In Silk mode, the User Agent String of the Kindle Fire is:

            Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us; Silk/1.1.0-80) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16 Silk-Accelerated=true

        */

        var flag = navigator.userAgent.match(/Kindle/i) ? true : false;
        if (flag) {

            mobileDeviceInfo.deviceOS = "Kindle";
        }
        return flag;

    }

    function isWindowsTablet() {
        // http://msdn.microsoft.com/en-us/library/ie/hh920767(v=vs.85).aspx#touch
        // Internet Explorer 10 introduces the "Touch" UA string token. If this token is present at the end of the UA string, the computer has touch capability, and is running Windows 8 (or later). This UA string will be transmitted on a touch-enabled system running Windows 8:
        // Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0; Touch)Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0; Touch)
        var flag = navigator.userAgent.match(/(MSIE 10\.0).*(Touch)/i) ? true : false;
        if (flag) {

            mobileDeviceInfo.deviceOS = "Windows 8 Tablet";
        }
        return flag;
    }

    function isTablet() {

        /*
        
        Android mobile phone browsers contain :: Android :: Mobile ::
        Android tablet devices contain :: Android 

        Therefore if we look for "Android" and NOT "Mobile" we can tell its a tablet android device

        User Agents follow...

        Nexus 7 UA == Mozilla/5.0 (Linux; Android 4.1.1; Nexus 7 Build/JRO03D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166  Safari/535.19

        Nexus 4 UA == Mozilla/5.0 (Linux; Android 4.2.1; Nexus 4 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19

        */
        // return navigator.userAgent.match(/^(?!.*Mobile).*Android.*/i) || isiPad() ? true : false;
        return isAndroidTablet() || isiPad() || isWindowsTablet() || isKindleDevice() ? true : false;

    }

    function checkDevice() {
        if (searchVersion.exec(appVer) && searchDevice.exec(appVer)) {
            deviceVersion = searchVersion.exec(appVer)[1];
        }

        // check for just mobilePhone flag

        if (isiPhone() || isAndroidPhone() || isBlackBerry() || isOpera() || isWindows()) {
            mobilePhoneFlag = true;
        } else {
            mobilePhoneFlag = false;

        }

        mobileTabletFlag = isTablet();

        mobileDeviceFlag = (mobileTabletFlag || mobilePhoneFlag);

        mobileDeviceInfo.isIPhone = isiPhone();
        mobileDeviceInfo.isIPad = isiPad();
        mobileDeviceInfo.isMobile = mobilePhoneFlag;
        mobileDeviceInfo.isTablet = mobileTabletFlag;

        mobileDeviceInfo.userAgent = navigator.appVersion;


        if (mobileDeviceInfo.deviceOS === "" && navigator.userAgent.match(/(;\s).*;\s/i)) {
            mobileDeviceInfo.deviceOS = navigator.userAgent.match(/(;\s).*;\s/i)[0].replace(";", "");

        }
        try {
            
            if(typeof(lpMTagConfig.sessionVar) == "undefined") {
                lpMTagConfig.sessionVar = [];

            }

            if (mobileDeviceFlag && lpMTagConfig) {

                lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'mobileDevice=' + mobileDeviceFlag;
                lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'mobilePhone=' + mobilePhoneFlag;
                lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'mobileTablet=' + mobileTabletFlag;
                lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'deviceOS=' + trimSpaces(mobileDeviceInfo.deviceOS);
                lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'deviceUserAgent=' + navigator.userAgent;

                if (window.innerWidth) {
                    lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'mobileDevice-VisualViewport-Width=' + window.innerWidth;
                    lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'mobileDevice-VisualViewport-Height=' + window.innerHeight;

                }


            } else if(lpMTagConfig && mobileDeviceFlag === false) {
                lpMTagConfig.sessionVar[lpMTagConfig.sessionVar.length] = 'mobileDevice=' + mobileDeviceFlag;
            }


        } catch (err) {
            // error
        }

        return mobileDeviceFlag;
    }

    function trimSpaces(d) {
        return d.replace(/^\s+|\s+$/g, "");
    }

    return {
        isMobileDevice: checkDevice(), // call private function to reveal device
        isTablet: isTablet(),
        isIPhone: mobileDeviceInfo.isIPhone, // reveal internal variable for iPhone
        isIPad: mobileDeviceInfo.isIPad, // reveal internal variable for iPad
        deviceInfo: mobileDeviceInfo, // reveal internal variable for all device info {}
        ver: 1.2,
        name: "mobileDeviceDetection",
        trimSpaces: trimSpaces,
        start: function() {
            this.log(this.name + " start", "DEBUG");
        }
    }

}(document, window);
if(typeof lpMTagConfig.initPluginSys=="undefined")lpMTagConfig.initPluginSys=function(){try{for(var a in lpMTagConfig.plugins){for(var c in lpMTagConfig.pluginCode.lpBasePlugin)typeof lpMTagConfig.pluginCode[a]!="undefined"&&(lpMTagConfig.pluginCode[a][c]=lpMTagConfig.pluginCode.lpBasePlugin[c]);typeof lpMTagConfig.pluginCode[a].init!="undefined"&&lpMTagConfig.pluginCode[a].init();typeof lpMTagConfig.pluginCode[a].setup=="function"&&lpMTagConfig.pluginCode[a].setup();typeof lpMTagConfig.pluginLoaded!=
"undefined"&&lpMTagConfig.pluginLoaded(lpMTagConfig.pluginCode[a].name)}}catch(j){if(typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display)lpMTagDebug.Display("Exceptions in processing pluginRef:"+j,"ERROR","PLUGIN-SYS");else throw j;}a=function(a,b){typeof a[b.name]=="undefined"&&(a[b.name]=function(a,c){return arguments.callee.hooks?lpMTagConfig.runPluginHooks(arguments.callee.hooks,b.name,{objName:a,status:c}):lpMTagConfig.runPluginHooks(lpMTagConfig.pluginHook.dynButtons,b.name,{objName:a,status:c})});
if(!a[b.name].hooks)a[b.name].hooks=[];a[b.name].hooks.push(b)};try{for(c in lpMTagConfig.pluginRef){var f=lpMTagConfig.pluginRef[c];if(typeof f.dbOvrObj!="undefined")for(var g=0;g<f.dbOvrObj.length;g++){var h=eval(f.dbOvrObj[g]);if(h){for(var d=0;d<lpMTagConfig.pluginHook.dynButtons.length;d++)a(h,lpMTagConfig.pluginHook.dynButtons[d]);if(f.dynButtonHooks)for(var i=0;i<f.dynButtonHooks.length;i++)a(h,f.dynButtonHooks[i])}}}}catch(k){if(typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display)lpMTagDebug.Display("Exceptions in processing dbOvrObj:"+
k,"ERROR","PLUGIN-SYS");else throw k;}try{for(d=0;d<lpMTagConfig.pluginHook.invite.length;d++)(function(a){var b=lpMTagConfig.pluginHook.invite[a];typeof lpMTagConfig[b.name]=="undefined"&&(lpMTagConfig[b.name]=function(a){return lpMTagConfig.runPluginHooks(lpMTagConfig.pluginHook.invite,b.name,{objName:a})})})(d)}catch(l){if(typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display)lpMTagDebug.Display("Exceptions in processing invite hooks:"+l,"ERROR","PLUGIN-SYS");else throw l;}lpMTagConfig.runPluginHooks=
function(a,b,c){try{for(var d=!0,f=0;f<a.length;f++){var g=a[f];if(g.name==b){typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display&&lpMTagDebug.Display("runPluginHooks running:"+b,"DEBUG","PLUGIN-SYS");c.prevRet=d;var h=g.run(c);h===!1&&(d=h)}}}catch(i){if(typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display)lpMTagDebug.Display("Exceptions in runPluginHooks:"+i,"ERROR","PLUGIN-SYS");else throw i;}return d};try{for(c in lpMTagConfig.pluginRef)c!="lpBasePlugin"&&typeof lpMTagConfig.pluginRef[c].start!=
"undefined"&&lpMTagConfig.pluginRef[c].start()}catch(m){if(typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display)lpMTagDebug.Display("Exceptions in processing start evets:"+m,"ERROR","PLUGIN-SYS");else throw m;}},lpMTagConfig.initPluginSys();else if(typeof e!="undefined")if(typeof lpMTagDebug!="undefined"&&lpMTagDebug.Display)lpMTagDebug.Display("Trying to define and run initPluginSys more than once (Check for multiple mtagconfig.js):"+e,"ERROR","PLUGIN-SYS");else throw e;else typeof lpMTagDebug!=
"undefined"&&lpMTagDebug.Display&&lpMTagDebug.Display("Trying to define and run initPluginSys more than once (Check for multiple mtagconfig.js):","ERROR","PLUGIN-SYS");
