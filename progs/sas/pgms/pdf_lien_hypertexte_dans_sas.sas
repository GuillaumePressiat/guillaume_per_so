

ods escapechar='^';

ods listing close;
ods pdf file='D:\hypertexte.pdf';

ods pdf text='Table des matières';
ods pdf text='';
ods pdf text='^S={url="#hommes"}1. Hommes';
ods pdf text='^S={url="#femmes"}2. Femmes';

ods pdf anchor='hommes';
ods pdf text='1. Hommes';
proc print data=sashelp.class(where=(sex='M'));
run;

ods pdf anchor='femmes';
ods pdf text='2. Femmes';
proc print data=sashelp.class(where=(sex='F'));
run;

ods pdf close;
ods listing;

/* thesasreference.wordpress.com/tag/lien-hypertexte */ 

/* amélioré */

%let titl=vjust=middle
cellheight=30pt
cellwidth=17cm
font_face=arial
activelinkcolor=white
visitedlinkcolor=green
linkcolor=white;
%let titl1=&titl indent=5cm font_size=16pt font_weight=bold;
%let titl2=&titl indent=6cm font_size=12pt;

title;
options nonumber nodate;
ods escapechar='^';

ods listing close;
ods pdf file='D:\hypertexte2.pdf' notoc startpage=never;

ods pdf text='';
ods pdf text="^S={&titl1.}Table des Matières";

ods pdf text='';
ods pdf text="^S={&titl2. url='#hommes'}1. Hommes";
ods pdf text="^S={&titl2. url='#femmes'}2. Femmes";

ods pdf startpage=now;

ods pdf anchor='hommes';
ods pdf text='';
ods pdf text="^S={&titl2.}1. Hommes";
proc print data=sashelp.class(where=(sex='M'));
run;

ods pdf anchor='femmes';
ods pdf text='';
ods pdf text="^S={&titl2.}2. Femmes";
proc print data=sashelp.class(where=(sex='F'));
run;
ods pdf close;
ods listing;





/* PDF avec lien hypertexte dans table des matières et lien hypertexte dans cellule */
DATA class;
SET sashelp.class;
url=compress("http://www.google.fr/#q="||name);
run;

%let titl=vjust=middle
cellheight=30pt
cellwidth=17cm
font_face=arial
activelinkcolor=white
visitedlinkcolor=green
linkcolor=white;
%let titl1=&titl indent=5cm font_size=16pt font_weight=bold;
%let titl2=&titl indent=6cm font_size=12pt;

title;
options nonumber nodate;
ods escapechar='^';

ods listing close;
ods pdf file='D:\hypertexte3.pdf' notoc startpage=never;

ods pdf text='';
ods pdf text="^S={&titl1.}Table des Matières";

ods pdf text='';
ods pdf text="^S={&titl2. url='#hommes'}1. Hommes";
ods pdf text="^S={&titl2. url='#femmes'}2. Femmes";

ods pdf startpage=now;

ods pdf anchor='hommes';
ods pdf text='';
ods pdf text="^S={&titl2.}1. Hommes";
proc print data=sashelp.class(where=(sex='M'));
run;

ods pdf anchor='femmes';
ods pdf text='';
ods pdf text="^S={&titl2.}2. Femmes";
proc report DATA=class(where=(sex='F')) missing nowd ;
	COLUMN  name  sex  age url;
	define name /'NOM' style(column)=[cellwidth=7cm];
	define sex /'SEXE' style(column)=[cellwidth=2cm just=c];
	define age /'AGE'  style(column)=[cellwidth=2cm just=c];
	define url / noprint ;
	compute url ;

			if name="Carol" then do;
		
					CALL DEFINE("name", 'URL', url );
					call define("name", "style", "style=[background=red foreground=black font_size=10pt FONT_WEIGHT=bold]");	
end;


	endcomp;
run;

ods pdf anchor='femmes';
ods pdf text='';
ods pdf text="^S={&titl2.}3. Femmes";
proc report DATA=class(where=(sex='F')) missing nowd ;
	COLUMN  name  sex  age url;
	define name /'NOM' style(column)=[cellwidth=7cm];
	define sex /'SEXE' style(column)=[cellwidth=2cm just=c];
	define age /'AGE'  style(column)=[cellwidth=2cm just=c];
	define url / noprint ;
	compute url ;

			if name="Carol" then do;
		
					CALL DEFINE("name", 'URL', url );
					call define("name", "style", "style=[background=red foreground=black font_size=10pt FONT_WEIGHT=bold]");	
end;


	endcomp;
run;
ods pdf close;
ods listing;



/* http://www.developpez.net/forums/d1155942/logiciels/solutions-d-entreprise/business-intelligence/sas/ods-reporting/ods-tagsets-excelxp-proc-report-call-define/ */


/* lien hypertexte dans cellule excel */

%LET CHEMIN=D:;
 
DATA class;
SET sashelp.class;
url="http://www.google.fr";
run;
TITLE ;
ods  Tagsets.excelxp file="&chemin\Exemple.xls" 
options(sheet_interval='none' embedded_footnotes='yes' sheet_name="EXEMPLE"	embedded_titles= 'yes' fittopage='yes'
ABSOLUTE_COLUMN_WIDTH='50,9,9,9,9,9,9' AUTOFIT_HEIGHT='yes');
proc report DATA=class missing nowd ;
	COLUMN  name  sex  age url;
	define name /'NOM' style(column)=[cellwidth=7cm];
	define sex /'SEXE' style(column)=[cellwidth=2cm just=c];
	define age /'AGE'  style(column)=[cellwidth=2cm just=c];
	define url / noprint ;
	compute url ;
			IF sex="F" then do;
					CALL DEFINE("name", 'URL', url );
					call define("name", "style", "style=[background=red foreground=black font_size=10pt FONT_WEIGHT=bold]");	
			end;
			else do;
					CALL DEFINE("name", 'URL', url );
					call define("name", "style", "style=[background=grey foreground=black font_size=10pt FONT_WEIGHT=bold]");
			end;
	endcomp;
run;
ods Tagsets.excelxp close;
