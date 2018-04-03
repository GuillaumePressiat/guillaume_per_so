ods listing close;
ods tagsets.excelxp file='P:\Pressiat\class.xls' style=xls_titl
options(embedded_titles='yes'
embedded_footnotes='yes');

title 'Titre';
footnote  'Pied';

ods tagsets.excelxp;

proc report data=sashelp.class nowd;
columns name age;
define name/display 'Nom';
define age /display 'Age';
run;

ods tagsets.excelxp close;
ods listing;

ods listing close;
ods tagsets.excelxp file='P:\Pressiat\header_footer.xls'
options(sheet_name='Exemple'
print_header='à définir'
print_footer='à définir');
proc print data=sashelp.class;
run;
ods tagsets.excelxp close;
ods listing;


proc template;
define style styles.xls_titl;
parent=styles.rtf;

style systemtitle from systemtitle /
background=transparent
foreground=#000000
font_style=roman
font_weight = medium
font_size=18pt
font_face='Arial';

style systemfooter from systemfooter/
background=transparent
foreground=#000000
font_style=roman
font_weight = medium
font_size=14pt
font_face='Arial';

end;
run;

ods listing close;
ods tagsets.excelxp file='P:\Pressiat\class2.xls' style=xls_titl
options(embedded_titles='yes'
embedded_footnotes='yes'
row_heights='0,0,0,45,40,0,0');

title 'Titre sur 2 lignes';
footnote 'Pied-de-page sur 2 lignes';
ods tagsets.excelxp;

proc report data=sashelp.class nowd;
columns name age;
define name/display 'Nom';
define age /display 'Age';
run;

ods tagsets.excelxp close;
ods listing;

ods listing close;

  ods tagsets.excelxp file="P:\Pressiat\embed.xls" style=statistical
      options( embedded_titles='yes' embedded_footnotes='yes' );

  title "My First Title";
  title3 "My Third Title";

  footnote "My First Footnote";
  footnote3 "My Third Footnote";
  proc print data=sashelp.class (obs=5); run;


  ods tagsets.excelxp close;

  ods listing;


/* Couleur si */
 proc format;
value age
low-<13='light yellow';
run;

ods rtf file='P:\Pressiat\couleur_fond.rtf';
proc report data=sashelp.class nowd;
columns name age;
define name / display;
define age / display style(column)=[background=age.];
run;
ods rtf close;

PROC PRINTTO PRINT=PRINT;run;
PROC PRINTTO PRINT='P:\Pressiat\auto.lst' NEW;
RUN;
proc print data=sashelp.class (obs=5); run;

options noxwait;
%sysexec del "P:\Pressiat\auto2.lst";
