//
// SAS Data Surveyor for Clickstream Data 2.1
// Copyright © 2009 SAS Institute, Inc.
//
// SASSiteConfig.js
//
/**
 * @fileoverview This file holds site-wide settings.  
 *
 * This file is intended to be a sample which is copied, renamed, modified,
 * and included (after SASTag.js) in the pages to be tagged.
 * Default tag behaviour from SASTag.js will be overridden with
 * the desired settings specified in this file.
 * 
 * @version 2.1 M1
 */  

 /**
 * This function can be defined by the user to change configuration 
 * values related to a specific <I>site</I>.   
 * <P>This function is called by st_init() after the default configuration
 * is loaded, and before st_pageCfg() loads the page-specific configuration.
 */
function st_siteCfg()
{
	// The clickstream collection server URL (http://myccs.mydomain.com)
	st_cfg.ccs="//collect.sas.com";
	
	// The amount of time (milliseconds) to wait for data collection 
	// to complete before continuing.
	st_cfg.timeout 					= 2500;
	
	// The amount of time (milliseconds) to wait between polling to see if 
	// data collection has completed.
	// st_cfg.interval 					= 500;
}

/**
 * This function can be defined by the user <I>within an individual page</I> to change configuration 
 * values related to that specific <I>page</I>.  
 * <P>It is called by st_init() after the default configuration
 * is loaded, and after st_siteCfg() loads the site-specific
 * configuration.
 */
function st_pageCfg()	{}

/**
 * This function can be defined by the user to change the set of data elements
 * that will be collected for a specific <I>site</I>.
 * <P>This function is called by st_init() after the default data collection elements
 * are defined, and before st_pageDats() defines page-specific data elements.
 */
function st_siteDats()
{
	// Set the Collection ID value to something other than 'default'
	st_rq.dats.elems['CID'].value="SAS_SUPPORT";
	
	// Add a new data element value to capture
	// st_rq.dats.add('U_MYVAL',"MySiteVal");
}
/**
 * This function can be defined by the user to change the set of data elements 
 * that will be collected for that specific <I>page</I>.
 * <P>This function is called by st_init() after the default data collection elements are defined,
 * and after site-wide data elements are defined.
 */
function st_pageDats()	{}


/**
 * This function defines the condition(s) under which the object <I>o</I> will be tracked, and is called
 * to determine if the specified object should be instrumented for data collection.
 * <P>
 * <H2>Links (HTML element: A)</H2>
 * <B>This function is called for link tracking only if st_cfg.cap['L'] is blank (the default).</B>
 * <P>The user can define this function to modify the conditions under which links will be tracked.
 * <P>This function serves as a more flexible replacement for tracking by file extension (provided by the st_cfg.cap['L'] setting.) 
 * <P>If st_cfg.cap['L'] is blank and this function is not defined, all links will be tracked.  This is the default behavior.
 * <P>To define and enable this functionality:
 * <P>
 * <OL>
 * <LI>Ensure that st_cfg.cap['L'] is blank (the default).  Doing so simultaneously turns off tracking by extension and turns on the use of the tracking function.
 * <P>  
 * <I>NOTE:</I> If you have previously added code to set the value of st_cfg.cap['L'] to something other than blank, either remove/modify this code, or set st_cfg.cap['L'] to blank after the prior code, as follows:<BR>
 * <P>
 * <PRE>
 * st_cfg.cap['L']='';
 * </PRE>
 * <P>
 * 
 * <LI>Define the tracking decision function in SASSiteConfig.js, modifying the function to conditionally
 * return the appropriate value:<BR>
 * <P>
 * <PRE>
 * function st_trk(o)	
 * {
 *    switch(o.nodeName.toLowerCase())
 * 	  {
 *       case 'a':  // Link elements
 *          return true;
 *          break;
 *       default:
 *          return true;
 *    }
 * }
 * </PRE>
 * 
 * </OL> 
 * 
 * <H2>Other HTML element types</H2>
 * The st_trk function is only supported for controlling link tracking decisions.
 * <BR>Other HTML element types will be supported by this function in the future.
 * @see ST_Cfg#cap
 * @see #st_sar
 * @param {object} o  The DOM object for which a tracking decision needs to be made.
 * @return true {boolean} if the object should be tracked, false otherwise.
 */
function st_trk(o)	{
   switch(o.nodeName.toLowerCase())
   {
      case 'a':  // Link elements
         return true;
         break;
      default:
         return true;
   }
}
	
/**
 * When tracking actions on an object in a page, this function determines if a stop-and-re-click 
 * should occur for the object in question.  By default, stop-and-re-click is enabled.  
 * 
 * <P>Standard behavior is to collect data on a click, stop the click event, and then re-click
 * after data has been collected.  In circumstances where this behavior would not result
 * in the desired result, stop-and-re-click can be controlled by defining st_sar(), and returning
 * true or false to enable or disable, respectively, stop-and-re-click for the object
 * on which the action occured. 
 * 
 * <P>To define and enable this functionality:
 * 
 * <OL>
 * <LI>First, ensure that the element is being tracked.  See {@link ST_Cfg#cap st_cfg.cap} and {@link #st_trk}.
 * <LI>Define the tracking stop-and-re-click decision function in SASSiteConfig.js, 
 * modifying the function to conditionally return the appropriate value.  For example:<BR>
 * <P>
 * <PRE>
 * function st_sar(o)	{
 *  switch(o.nodeName.toLowerCase())
 *  {
 *     case 'a':  // Link elements
 *        if ( o.href.indexOf('action=watch')>0  // MediaWiki watch/unwatch button handling
 *          || o.href.indexOf('action=unwatch')>0)
 *           return false;
 *        else
 *           return true;
 *        break;
 *     default:
 *        return true;
 *  }
 * </PRE>
 * 
 * </OL> 
 * @param {String} o Object to check
 * @see ST_Cfg#cap
 * @see #st_trk
 * @return Returns {boolean} true if data should be collected using stop-and-re-click.  False, otherwise.
 */
function st_sar(o)	{

   switch(o.nodeName.toLowerCase())
   {
      case 'a':  // Link elements   
         if ( o.target=='_blank' )				// New window targets
            return false;
         if ( o.href.indexOf('action=watch')>0  // MediaWiki watch/unwatch button handling
           || o.href.indexOf('action=unwatch')>0)
            return false;
            // added 10/14/10 per A. Shreeve and p. tidball

            if (YAHOO.util.Dom.getAttribute(o, 'className')) {
            	if (YAHOO.util.Dom.getAttribute(o, 'className').indexOf('modal') > -1) return false; 
            	} 
         else
            return true;
         break;
      
      
      case 'img': // Image elements can be clicked too.
            // added 10/14/10 per A. Shreeve and p. tidball
            if (YAHOO.util.Dom.getAttribute(o, 'className')) {
            	if (YAHOO.util.Dom.getAttribute(o, 'className').indexOf('modal') > -1) return false; 
            	} 
         else
            return true;
         break;
      default:
         return true;
   }
}
		
	
