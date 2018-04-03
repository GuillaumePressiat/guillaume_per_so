
/* renommer variable par prefix */
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


/* renommer toutes variables suffix : */
%macro rename2(oldvarlist, suffix);
  %let k=1;
  %let old = %scan(&oldvarlist, &k);
     %do %while("&old" NE "");
      rename &old = &old.&suffix;
	  %let k = %eval(&k + 1);
      %let old = %scan(&oldvarlist, &k);
  %end;
%mend;

/* exemple */

/* lister les variables à renommer avec exclusion du nas (pivot) */
proc sql noprint;
  select name into : var_lst separated by ' '
     from dictionary.columns
     where upcase(libname)='WORK' and
           upcase(memname)='TABLE'
		   and name ne 'nas'
     order by name;
quit;


data table_renomme; set table;
%rename2(&var_lst.,_m13);
run;

/* ordonner les variables par ordre alphabétique */ 


proc contents data=table_renomme out=newa(keep=name);
run;

/* Create macro variables for each variable name, and a count of the number of variables */

data _null_;
  set newa end=last;
  i+1;
  call symput('var'||trim(left(put(i,8.))),trim(name));
  if last then call symput('total',trim(left(put(i,8.))));
run;
/* Use a macro DO loop to generate the names of the variables on a RETAIN statement.  */
/* Placing the variable names on a RETAIN statement prior to the SET statement        */
/* ensures the variables are placed in the PDV in that order.                         */
/*                                                                                    */
/* If you do not need to permanently reorder the variables, just print them in        */
/* alphabetical order, you can use the macro DO LOOP on a VAR statement in PROC PRINT.*/

%macro test;
  data table_renomme;
    retain %do j=1 %to &total;
             &&var&j
	   %end;;
    set an;
  run;

  proc print;
  run;
%mend test;

/* Invoke the macro */

%test


proc contents data=table out=newa(keep=name);
run;

data _null_;
  set newa end=last;
  i+1;
  call symput('var'||trim(left(put(i,8.))),trim(name));
  if last then call symput('total',trim(left(put(i,8.))));
run;

%macro test2;
  data table_renomme2;
   set table_renomme;
    %do j=1 %to &total;
		     format &&var&j.._comp $1.;
             &&var&j.._comp=(&&var&j.._m12=&&var&j.._m13);
	%end;
  run;
%mend test2;

%test2;


%macro reordre(table);
proc contents data=&table. out=newa(keep=name) noprint;
run;

/* Create macro variables for each variable name, and a count of the number of variables */

data _null_;
  set newa end=last;
  i+1;
  call symput('var'||trim(left(put(i,8.))),trim(name));
  if last then call symput('total',trim(left(put(i,8.))));
run;

/* Use a macro DO loop to generate the names of the variables on a RETAIN statement.  */
/* Placing the variable names on a RETAIN statement prior to the SET statement        */
/* ensures the variables are placed in the PDV in that order.                         */
/*                                                                                    */
/* If you do not need to permanently reorder the variables, just print them in        */
/* alphabetical order, you can use the macro DO LOOP on a VAR statement in PROC PRINT.*/

%macro test3;
  data &table.;
    retain %do j=1 %to &total;
             &&var&j
	   %end;;
    set &table.;
  run;

%mend test3;

%test3;

%mend;

%reordre(ano_m12);

/* exemple sur des donnees lamda anohosp */

%connect_oracle(newdim,bd,hop);

data ano_m12; set bd.had_anohosp(where=(periode="201412"));run;
data ano_m13; set bd.lmd_had_anohosp(where=(periode="201413"));run;

/* deux tables à comparer : variable pivot no_sejour */
proc sort data=ano_m12 nodupkey; by no_sejour; run;
proc sort data=ano_m13 nodupkey; by no_sejour; run;

proc sql noprint;
  select name into : var_lst12 separated by ' '
     from dictionary.columns
     where upcase(libname)='WORK' and
           upcase(memname)='ANO_M12'
		   and name ne 'NO_SEJOUR'
     order by name;

  select name into : var_lst13 separated by ' '
     from dictionary.columns
     where upcase(libname)='WORK' and
           upcase(memname)='ANO_M13'
		   and name ne 'NO_SEJOUR'
     order by name;

quit;


data ano_m13; set ano_m13;
%rename2(&var_lst13.,_m13);
run;


data ano_m12; set ano_m12;
%rename2(&var_lst12.,_m12);
run;

/* fusion par variable pivot no_sejour */
data ano_mm; merge ano_m12(in=a) ano_m13(in=b);
if a and b;
by no_sejour;
run;


%reordre(ano_mm);


data ano_name; set bd.had_anohosp(where=(periode="201412"));run;
proc contents data=ano_name out=newa(keep=name) noprint;
run;

/* Create macro variables for each variable name, and a count of the number of variables */

data _null_;
  set newa end=last;
  i+1;
  call symput('var'||trim(left(put(i,8.))),trim(name));
  if last then call symput('total',trim(left(put(i,8.))));
run;

%macro test2;
  data ano_mm2;
   set ano_mm;
    %do j=1 %to &total;
		    
			 %if "&&var&j.." ne "NO_SEJOUR" %then %do;
			  format &&var&j.._m2comp 1.;
         	 &&var&j.._m2comp=(&&var&j.._m12 ne &&var&j.._m13);%end;
	%end;
  run;
%mend test2;

%test2;

%reordre(ano_mm2);

proc sql noprint;
  select name into : comp separated by ' '
     from dictionary.columns
     where upcase(libname)='WORK' and
           upcase(memname)='ANO_MM2'
		  and index(name,"m2comp") >0
     order by name;
quit;


proc tabulate data=ano_mm2 order=freq;
var &comp.;
table &comp.,sum*f=10.;
run;
