proc export data=test 
   outfile='P:\Pressiat\test.csv'
   dbms=csv
   replace;
run;
