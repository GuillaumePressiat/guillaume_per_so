libname rsa23 "P:\Remontees\LAMDA\3. Remontees LAMDA\2013 M23\3.2 Sources v1\3.2.1 Import RSA v1";

%macro prefixvars(inpdsn,prefix,outdsn,excludevars=);   
 
/* split the excludevars into individual macro var names for later use*/
%let num=1;
%let excludevar=%scan(%upcase(&excludevars),&num,' ');
%let excludevar&num=&excludevar;
 
%do %while(&excludevar ne );
	%let num=%eval(&num + 1);
	%let excludevar=%scan(&excludevars,&num,' ');
	%let excludevar&num=&excludevar;
%end;
%let numkeyvars=%eval(&num - 1); /* this is number of variables given in the exclude vars */
 
 
 %let dsid=%sysfunc(open(&inpdsn));   /* open the dataset and get the handle */                                                                                                     
 %let numvars=%sysfunc(attrn(&dsid,nvars)); /* get the number of variables */                                                                                                
  data &outdsn;                                                                                                                            
   set &inpdsn(rename=( 
   /*rename all the variables that are not in the excludevars= */                                                                                                                  
	%do i = 1 %to &numvars;
	   %let flag=N; 
	   %let var&i=%sysfunc(varname(&dsid,&i));  
	   %do j=1 %to &numkeyvars;
	   %if %upcase(&&var&i) eq &&excludevar&j %then %let flag=Y;			
	   %end; 
	   %if &flag eq N %then %do; &&var&i=&prefix&&var&i  %end; 
	%end;));                                                                                                                            
 
   %let rc=%sysfunc(close(&dsid));                                                                                                        
  run;                                                                                                                                  
%mend prefixvars;                                                                                                                             
 
/*Call the macro now*/                                                                                                                                        
%prefixvars(synthese13_13,m13_,work.synthese13_13_2,excludevars=nas);
%prefixvars(synthese13_23,m23_,work.synthese13_23_2,excludevars=nas);
