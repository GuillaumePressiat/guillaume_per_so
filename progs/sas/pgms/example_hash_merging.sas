/*********************/
/* Datasets creation */
/*********************/
data city_table1;
length city $12. state $4.; 
 input city $ state $;
   datalines;
fresno ca
stockton ca
oakland	ca
fremont	ca
sacramento ca
irvine ca
Jacksonville fl
miami fl
tampa fl
orlando	fl
hialeah	fl
atlanta	ga
augusta	ga
columbus ga
savannah ga
macon ga
dallas tx
houston tx
austin tx
franklin tx
chicago il
;
run;


data city_table;
		set city_table1;
sales = int(ranuni(3)*1000000);
format sales dollar10.;
run;


data state_table;
length state $4. full_state $10.; 
 input state $ full_state $;
   datalines;
ca california
fl florida
ga georgia
tx texas
co colorado
;
run;


/***************************/
/* General merge statement */
/***************************/

proc sort data = city_table;
by state;
run;

proc sort data = state_table;
by state;
run;


data general_merge1;
merge city_table(in=a) state_table(in=b);
by state;
if a;
run;

data general_merge;
set general_merge1;
if full_state = '' then full_state = 'unknown';
run;


/************/
/* Sql Join */
/************/

proc sql;
  create table sql_join1 as
  select city_table.city, city_table.state, state_table.full_state, city_table.sales
  from city_table left join state_table
  on city_table.state = state_table.state
  order by city_table.state;
quit;

data sql_join;
set sql_join1;
if full_state = '' then full_state = 'unknown';
run;


/**************/
/* Hash merge */
/**************/

data hash_merge2(drop = rc);
attrib nbs length=8;
if _N_ = 1 then do;
		    declare hash h_cle_rsa(dataset:'Search2');
		    h_cle_rsa.definekey('cle_rsa');
			h_cle_rsa.DefineData ('nbs');
		    h_cle_rsa.definedone();
end;
set search;

rc = h_cle_rsa.find();

if rc ne 0 then nbs = 'unknown';

run;


/*********************/
/* proc format merge */
/*********************/

data key; set state_table (keep = state full_state);
/* These variables translate to the FORMAT values in the metadata */
fmtname = '$key';
label = full_state;
rename state = start;
run;

proc sort data=key;
by start;
run;

proc format cntlin=key;
run;

data format_merge;
set city_table;
length full_state $15.;
full_state=put(state,$key.);
if put(state,$key.) = state then full_state = 'unknown';
run;

%let an=12;
libname rum&an. "P:\04-Bases_Ref_SAS_RX\RUM&an.";


data rum&an. ;  set rum.rum;run;

data ano&an. ; set rum.anohosp;run;

%let debut_h=%sysfunc(time(), time.);

data rum&an.(drop = rc);
attrib noanon length=$17.;

	   
if _N_ = 1 then do;
		    declare hash h(dataset:"rum&an..anohosp");
		    h.definekey('noda');
			h.DefineData ('noanon');
		    h.definedone();
end;
set rum&an.;

rc = h.find();

if rc ne 0 then do; noanon = 'not found' ; end;

run;



%let fin_h=%sysfunc(time(), time.);


%put &debut_h; 
%put &fin_h;

data rum&an. ;  set rum.rum;run;

%let debut_m=%sysfunc(time(), time.);
data rum&an.; merge rum&an.(in=a) ano&an.(in=b keep=noda noanon) ;

if a; 
by noda; 
run;
%let fin_m=%sysfunc(time(), time.);

%put &debut_m; 
%put &fin_m;
