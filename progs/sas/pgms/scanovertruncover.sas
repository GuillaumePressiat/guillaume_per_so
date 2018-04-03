filename phonebk host-specific-path;
data _null_;
  file phonebk;
  input line $80.;
  put line;
  datalines;
    Jenny's Phone Book
    Jim Johanson phone: 619-555-9340
       Jim wants a scarf for the holidays.
    Jane Jovalley phone: (213) 555-4820
       Jane started growing cabbage in her garden.
       Her dog's name is Juniper.
    J.R. Hauptman phone: (49)12 34-56 78-90
       J.R. is my brother.
   ;
run;


data test;
   infile phonebk truncover scanover;
   input @'phone:' phone $32.;
   put phone=;
run;

/* http://support.sas.com/documentation/cdl/en/lrdict/64316/HTML/default/viewer.htm#a000146932.htm
example 3 
*/
