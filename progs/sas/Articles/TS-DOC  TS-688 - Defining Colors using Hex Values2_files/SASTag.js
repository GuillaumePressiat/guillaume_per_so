
function ST_Gl()
{this.RQST_PAGE=0;this.RQST_CLK=1;this.RQST_FORM=2;this.FS="/";this.DFS=this.FS+this.FS;}
function ST_Inf()
{this.w3c=typeof window.event=="undefined"?true:false;if(!this.w3c)this.w3c=typeof document.createEventObject=="undefined"?true:false;}
function ST_Cfg()
{var scripts=st_ut.gEBTN(document,"SCRIPT"),U=new ST_URI(scripts[scripts.length-1].src);this.ccs=U.prot.indexOf('http')==0?U.prot+':'+st_gl.DFS+U.dom:'';this.ccsRoot='sastag/';this.cap=new Array();this.cap["M"]='1';this.cap["F"]='0';this.cap["L"]='';this.cap["C"]='1';this.timeout=5000;this.interval=500;this.limIE=2083;}
ST_Cfg.prototype.isCap=function(e,x,y,v,a,r,j,b,f,k)
{if(e=='F'&&!st_ut.isUD(x))
if(x=="")return st_cfg.cap[e].charAt(0)==1;if(st_ut.isUD(x)||x=="")return false;v=new String(st_ut.tLC(this.cap[e]));if(v=='0')return false;if(v=='1')return true;x=x.toLowerCase();if(!st_ut.isUD(y))y=st_ut.tLC(y);a=v.split(':');var l1d=a[0]=='1';r=l1d;if(e!='F')
{for(j=1;j<a.length;j++)
if(a[j]==x)r=!l1d;}
else
{var l2d=l1d;for(j=1;j<a.length;j++)
{if(a[j]=='1'||a[j]=='0')
{l2d=a[j]=='1';continue;}
v=new String(a[j]);b=v.split(',');f=b[0];if(f!=x&&f!='*')continue;if(b.length==1)
{r=l2d;continue;}
else if(st_ut.isUD(y))
{r=f=='*'?l1d:true;continue;}
r=l2d;for(k=1;k<b.length;k++)
if(b[k]==y)r=!l2d;}}
return r;};ST_Cfg.prototype.isTrk=function(o)
{if(typeof(st_trk)==st_ut.f)return st_trk(o);return true;}
ST_Cfg.prototype.isTmr=function(o)
{if(typeof(st_sar)==st_ut.f)return st_sar(o);return true;}
function ST_Val(value,en,m)
{this.en=st_ut.isUD(en)?true:en;this.eFlags=st_ut.isUD(m)?0x7:m;this.value=value;}
function ST_Dats()
{this.elems=new Array();}
ST_Dats.prototype.add=function(key,val,en,m)
{if(st_ut.isUD(key))return-1;if(st_ut.isUD(val))return-1;this.elems[key]=new ST_Val(val,en,m);return true;};function ST_Rq()
{this.dats=new ST_Dats();this.data="";this.iTmrID;this.tTmrID;this.complete=false;this.element;this.actTyp=st_gl.RQST_PAGE;this.actTrg;this.ccsLink="";}
function st_sd(k,v,m)
{if(st_ut.isUD(st_rq.dats.elems[k]))
st_rq.dats.add(k,v,true,m);else
st_rq.dats.elems[k].value=v;}
function st_redoAction()
{if(st_rq.actTyp==st_gl.RQST_FORM)
{st_rq.complete=true;st_rq.actTrg.click();}
else if(st_rq.actTyp==st_gl.RQST_CLK)
{st_rq.complete=true;if(st_inf.w3c)
{var a,h,f,t,ev=document.createEvent("MouseEvents");ev.initEvent("click",true,true);if(!st_rq.actTrg.dispatchEvent(ev))
return false;else
{a=st_ut.fTag(st_rq.actTrg,"a");h=a.href;t=a.target;l=st_ut.tLC(t);if(t=='')f=window;else if(l=='_top')f=top;else if(l=='_self')f=self;else if(l=='_parent')f=parent;else f=window.parent.frames[t];st_ut.isUD(f)?window.open(h,t):f.location=h;}}
else
st_rq.actTrg.click();}
else if(st_rq.actTyp==st_gl.RQST_PAGE)
{st_rq.complete=false;}}
ST_Rq.prototype.iTmr=function()
{if(st_rq.element.complete)
{clearInterval(st_rq.iTmrID);clearTimeout(st_rq.tTmrID);return st_redoAction();}}
ST_Rq.prototype.tTmr=function()
{clearInterval(st_rq.iTmrID);st_rq.complete=true;return st_redoAction();}
ST_Rq.prototype.send=function(type,stype,target,bT,t,d)
{this.actTyp=type;if(!st_ut.isUD(target))
this.actTrg=target;if(st_ut.isUD(bT))
bT=true;st_sd('EVT',stype);if(type==st_gl.RQST_PAGE)
st_sd('REF',document.referrer);function tslash(str)
{var stmp=new String(str),p=stmp.length-1;if((stmp.lastIndexOf('/')!=p)&&(stmp.lastIndexOf('\\')!=p))
stmp+='/';return stmp;}
d=new Date();st_sd('DT',eval(d.getMonth()+1)+st_gl.FS+d.getDate()+st_gl.FS+d.getFullYear());st_sd('TM',d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()+"."+d.getMilliseconds());this.ccsLink=tslash(st_cfg.ccs)+tslash(st_cfg.ccsRoot)+'SASTag.gif?';this.rnd="$RND="+Math.random();t=new String(this.ccsLink+this.rnd);this.build(t.length,type);this.ccsLink+=this.data+this.rnd;if(typeof(st_debugPrint)==st_ut.f){st_debugPrint();}
if(bT)this.iTmrID=setInterval(this.iTmr,st_cfg.interval);this.element=document.createElement("IMG");this.element.id="st_tmpimg";this.element.name=this.element.id;this.element.src=encodeURI(this.ccsLink);if(bT)this.tTmrID=setTimeout(this.tTmr,st_cfg.timeout);}
ST_Rq.prototype.baseDats=function(o,s,i,a,p)
{s=new String(location.protocol);o=st_ut.dFL();p=st_ut.dJV();a=new Array(7,'CS',st_ut.isUD(document.charset)?document.characterSet:document.charset,7,'VER',"2.2",7,'EVT',"",7,'CID',"default",7,'VID',st_getVisitorID(),4,'PID',"",7,'LID',Math.ceil(Math.random()*100000),7,'URI',document.URL,7,'REF',document.referrer,7,'TTL',document.title,7,'PROT',s.substr(0,s.length-1),7,'DOM',document.domain,7,'PORT',location.port,7,'CPU',navigator.cpuClass,7,'PLAT',navigator.platform,7,'SINFO',screen.width+'x'+screen.height+'@'+screen.colorDepth,7,'FL',o.e,7,'FLV',o.v,7,'CK',st_ut.dCK(),7,'JV',p.e,7,'JVV',p.v,7,'JS',true,7,'SLNG',navigator.systemLanguage,7,'BLNG',navigator.browserLanguage,7,'ULNG',navigator.userLanguage,7,'DT','',7,'TM','');for(i=0;i<a.length;i=i+3)
this.dats.add(a[i+1],a[i+2],true,a[i]);var metas=st_ut.gEBTN(document,"META"),key='';for(i=0;i<metas.length;i++)
{with(metas[i])
{key=name!=''?name:(httpEquiv!=''?httpEquiv:i.toString());if(st_cfg.isCap('M',key))
this.dats.add('M_'+key,content,true,4);}}
var cs=new String(document.cookie),csa=cs.split('; ');for(i=0;i<csa.length;i++)
{with(csa[i])
{var p=indexOf('='),k='',v='';if(p>=0)
{k=substr(0,p);if(k=="_SI_VID")continue;v=unescape(substr(p+1));}
if(st_cfg.isCap('C',k))
st_rq.dats.add("C_"+k,v,true,4);}}}
ST_Rq.prototype.build=function(xtra,type)
{var tagFirst=true,key,m,i=false,val;this.data='';this.ts=new String();if(!st_inf.w3c){m=navigator.appVersion.match(/.*MSIE (.+?);/);if(m!=null&&m[1]<8)
i=true;}
for(key in st_rq.dats.elems)
{if(typeof(st_rq.dats.elems[key])==st_ut.f)continue;with(st_rq.dats.elems[key])
{if(st_ut.isUD(en))
continue;if(!en)
continue;if(type==st_gl.RQST_CLK&&!(eFlags&2))
continue;if(type==st_gl.RQST_FORM&&!(eFlags&1))
continue;if(type==st_gl.RQST_PAGE&&!(eFlags&4))
continue;val=new String(value);if(val.indexOf("true")==0&&val.length==4)val="1";else if(val.indexOf("false")==0&&val.length==5)val="0";if(val.indexOf("#")>=0)
val=val.replace(/#/g,"%23");if(val.indexOf("$")>=0)
val=escape(val);this.ts=this.data;if(!tagFirst)
this.ts+='$';else
tagFirst=false;this.ts+=key+"="+val;if(i)
if(this.ts.length+xtra>st_cfg.limIE)
continue;this.data=this.ts;}}}
function ST_URI(URI,d,df,f,b,p,stmp)
{if(!st_ut.isUD(d)){df=new ST_URI(d);this.prot=df.prot;this.dom=df.dom;this.port=df.port;}
else
{this.prot='';this.dom='';this.port='';}
stmp=new String(URI);p=stmp.search(':\/\/');if(p<0)p=stmp.indexOf(":\\\\");if(p>=0){this.prot=stmp.substr(0,p);stmp=stmp.substr(p+3);}else return;if(stmp.charAt(0)!=st_gl.FS&&stmp.charAt(0)!="\\"&&stmp.charAt(1)!=':')
{f=stmp.search('/');b=stmp.indexOf("\\");p=(f>=0?f:100)<(b>=0?b:100)?f:b;if(p>0)stmp=stmp.substr(0,p);p=stmp.search(':');this.dom=p>0?stmp.substr(0,p):stmp;this.port=p>0?stmp.substr(p+1):'';}
else
{this.dom='';this.port='';}}
var st_ut={f:"function",gEBI:function(d,i){return d.getElementById(i)},gEBTN:function(d,n){return d.getElementsByTagName(n)},gEBTNNS:function(d,n,t){return d.getElementsByTagNameNS(n,t)},tLC:function(s){return s.toLowerCase()},gNm:function(o){return(o.localName)?o.localName:o.baseName;},gTxt:function(o){return(o.textContent)?o.textContent:o.text},ckR:function(key){var querystr=key+'=',ckstr=document.cookie,pos=ckstr.indexOf(querystr);if(pos!=-1)
{var sPos=pos+querystr.length,ePos=ckstr.indexOf(';',sPos);if(ePos==-1){ePos=ckstr.length;}
return ckstr.substring(sPos,ePos);}
else{return null;}},ckW:function(k,v,e,d)
{if(st_ut.isUD(e))e=1;d=new Date();d.setDate(d.getDate()+e);document.cookie=k+'='+v+"; expires="+d.toGMTString()+"; path=/";},getURIExtension:function(sURI)
{var sURL=new String(sURI.split("?")[0]),sExt=sURL.substr(sURL.lastIndexOf(".")+1);return sExt;},isScriptLink:function(sURI,t)
{t=st_ut.tLC(sURI.toString());if((t.indexOf("javascript:")==0)||(t.indexOf("vbscript:")==0))
return true;else
return false;},dCK:function(k,v,t)
{k="_SI_CW";v="V";this.ckW(k,v);t=this.ckR(k)==v;if(t)this.ckW(k,'',0);return t;},dFL:function(o,i,a,aX,fo,d)
{o=new Object();o.e=false;o.v='';a=navigator.plugins;if(a&&a.length)
{fo=a["Shockwave Flash"];if(!fo)
fo=a["Shockwave Flash 2.0"];if(fo)
{o.e=true;d=fo.description;if(d)
o.v=d.substr(d.indexOf('Flash')+6);}}
if(navigator.appName=='Microsoft Internet Explorer')
{for(i=15;i>0;i--)
{try
{var aX=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+i);o.e=true;o.v=aX.GetVariable("$version");break;}
catch(e){}}}
return o;},dJV:function(o,i,a,aX,b,c,e,t,tv)
{o=new Object();o.e=false;o.v='';if(navigator.appName=='Microsoft Internet Explorer')
{ol:for(a=2;a>0;a--)
for(b=9;b>=0;b--)
for(c=5;c>=0;c--)
{d=a+"."+b+"."+c;try
{aX=new ActiveXObject("JavaWebStart.isInstalled."+d+".0");o.e=true;o.v=d;break ol;}
catch(e){}}}
else
{a=navigator.mimeTypes;for(i=0;i<a.length;i++)
{t=new String(a[i].type);if(t.indexOf("application/x-java-applet")==0)
{o.e=true;tv=t.split("sion=")[1];if(tv>o.v)o.v=tv;}}}
if(o.v!='')return o;o.e=navigator.javaEnabled();o.v=o.e&&typeof java!='undefined'?java.lang.System.getProperty('java.version'):'';return o;},isUD:function(o){return typeof(o)=="undefined"?true:false;},fTag:function(s,t)
{t=st_ut.tLC(t);while(s!=null&&st_ut.tLC(s.tagName)!=t&&st_ut.tLC(s.tagName)!="body")
s=s.parentNode;if(s==null||st_ut.tLC(s.tagName)!=t||st_ut.isScriptLink(s))
s=null;return s;}}
var st_gl=new ST_Gl(),st_inf=new ST_Inf(),st_cfg=new ST_Cfg(),st_rq=new ST_Rq(),st_dbg=null;function st_getVisitorID(sC,sV)
{sC="_SI_VID";sV=st_ut.ckR(sC);if(sV==null)
{sV=(new Date()).getTime()
+(Math.floor(Math.random()*100000)).toString()
+document.URL.length.toString()
+navigator.userAgent.length.toString()
+(screen.width*screen.height+screen.colorDepth);st_ut.ckW(sC,sV,1825);}
return sV;}
function st_instLnks(i,d)
{if(st_cfg.cap['L']=='0'&&st_cfg.cap['L']!='')
return;for(i=0;i<document.links.length;i++)
with(document.links[i])
{d=st_cfg.cap['L']==''?st_cfg.isTrk(document.links[i]):st_cfg.isCap('L',st_ut.getURIExtension(document.links[i].href));if(!d)continue;if(st_inf.w3c)
document.links[i].addEventListener('click',st_clct,true);else
document.links[i].attachEvent("onclick",st_clct);}}
function st_instFrms(i)
{if(st_cfg.cap['F']=='0')
return;for(i=0;i<document.forms.length;i++)
with(document.forms[i])
{if(!(st_cfg.isCap('F',id)||st_cfg.isCap('F',name)))continue;for(var el=0;el<length;el++)
{if(st_ut.tLC(elements[el].tagName)=="input"&&st_ut.tLC(elements[el].type)=="submit")
{if(st_inf.w3c)
elements[el].addEventListener('click',st_clct,true);else
elements[el].attachEvent("onclick",st_clct);}}}}
function st_clct(e)
{if(st_rq.complete){st_rq.complete=false;return;}
if(!e)var e=window.event;var element=st_inf.w3c?e.target:e.srcElement,nN=st_ut.tLC(element.nodeName),sTyp=st_ut.tLC(e.type),de,eTyp=null,sTrg,sTtl,thisName,iV,nV,v,p,t,f,b,bT;if(sTyp!="click")return;bT=st_cfg.isTmr(element);if(nN=="input"&&st_ut.tLC(element.type)=="submit")
{eTyp=st_gl.RQST_FORM;sTyp='submit';de=st_ut.fTag(element,'form');with(de)
{var elem,aCB=new Array(),nnC=1,el,frmName=id!=''?id:name,lTag,lTyp;for(el=0;el<length;el++)
{with(elements[el])
{lTag=st_ut.tLC(tagName);var cN=(name!="")?name:((id!="")?id:"_PV"+nnC++);if(!(st_cfg.isCap('F',de.id,cN)||st_cfg.isCap('F',de.name,cN)))continue;if(lTag=="input")
{lTyp=st_ut.tLC(type);if((lTyp=="text")||(lTyp=="hidden")||(lTyp=="password"))
{if(lTyp=="password")
st_rq.dats.add('F_'+cN,"X",true,1);else
st_rq.dats.add('F_'+cN,value,true,1);}
else if(lTyp=="radio")
{if(checked)
st_rq.dats.add('F_'+cN,value,true,1);}
else if(lTyp=="checkbox")
{if(checked)
{if(st_ut.isUD(aCB[cN]))
aCB[cN]=value;else
aCB[cN]=aCB[cN]+","+value;}}}
else if(lTag=="textarea")
{st_rq.dats.add('F_'+cN,value,true,1);}}}
for(thisName in aCB)
{if(typeof(aCB[thisName])!=st_ut.f)
st_rq.dats.add('F_'+thisName,aCB[thisName],true,1);}}
sTrg=de.attributes.action.value;iV=st_ut.isUD(de.attributes.id)?"":de.attributes.id.value;nV=st_ut.isUD(de.attributes.name)?"":de.attributes.name.value;sTtl=iV!=""?iV:nV;}
else
{eTyp=st_gl.RQST_CLK;var aT=element,tN=st_ut.tLC(aT.tagName),hr,p;de=st_ut.fTag(element,'a');if(de==null)return;sTtl="";if(tN=='img')
sTtl=aT.alt!=""?aT.alt:aT.src;else
sTtl=de.title!=""?de.title:(st_inf.w3c?de.text:de.innerText);sTrg=de.href;hr=sTrg.toString();f=hr.lastIndexOf('/');b=hr.lastIndexOf('\\');p=f>b?f:b;hr=hr.substr(p+1);if(hr.indexOf("#")>=0)
bT=false;}
st_sd('REF',document.URL);st_sd('ETG',de.tagName,3);st_sd('AID',de.id,3);st_sd('ANM',de.name,3);v=sTrg;p=v.indexOf(':');if(p<0||p>16){t=new String(document.URL);f=t.lastIndexOf('/');b=t.lastIndexOf('\\');p=f>b?f:b;if(p>=0){t=t.substr(0,p+1);v=t+v;}}
st_sd('URI',v);st_sd('TTL',sTtl);st_sd('PROT','');st_sd('DOM','');st_sd('PORT','');sURI=new ST_URI(sTrg,document.URL);st_sd('PROT',sURI.prot);st_sd('DOM',sURI.dom);st_sd('PORT',sURI.port);st_rq.send(eTyp,sTyp,element,bT);if(!bT)return;if(st_inf.w3c)
{e.preventDefault();e.stopPropagation();}
else
{e.cancelBubble=true;}
return false;}
function st_onLoad(e)
{st_rq.send(st_gl.RQST_PAGE,"load");}
function st_onUnload(e)
{}
function st_addListener(obj,evtName,func,capture)
{if(typeof(obj)!="object")
return false;if((st_ut.isUD(evtName))||(evtName==""))
return false;if(typeof(func)!=st_ut.f)
return false;if(st_ut.isUD(capture))
capture=true;if(st_ut.isUD(window.event))
obj.addEventListener(evtName,func,capture);else
obj.attachEvent("on"+evtName,func);return true;}
function st_init()
{if(typeof(st_siteCfg)==st_ut.f)st_siteCfg();if(typeof(st_pageCfg)==st_ut.f)st_pageCfg();st_rq.baseDats();if(typeof(st_siteDats)==st_ut.f)st_siteDats();if(typeof(st_pageDats)==st_ut.f)st_pageDats();st_instLnks();st_instFrms();st_addListener(window,"load",st_onLoad,true);st_addListener(window,"unload",st_onUnload,true);}