/* Le but de ces macros simples est de récupérer le nom et le chemin du programme que l'on a exécuté pour par exemple : 
		
		- écrire la log 
		- sauvegarder des bases
		- ecrire les fichiers de résultats
		
	dans le même répertoire que le programme,
	et cela sans avoir à les préciser à chaque fois
*/


/* EXEMPLE :
Si le programme est : 
P:\Pressiat\Exemple\pgm_exemple.sas

la log sera écrite dans le fichier : 

P:\Pressiat\Projet_Exemple\pgm_exemple.log

%grab_path sera : 

P:\Pressiat\Projet_Exemple\

et enfin %grab_path_for_result sera : 

P:\Pressiat\Projet_Exemple\pgm_exemple ...

*/


/* Cette macro permet d'afficher la log dans un fichier externe à sas (ce qui permet de garder une trace).
ce fichier est enregistré dans le même répertoire que le programme, 
et avec le même nom que le .sas mais en .log
*/


%macro grab_path_for_log;
 %qsubstr(%sysget(SAS_EXECFILEPATH),1, %length(%sysget(SAS_EXECFILEPATH))-3)log
%mend grab_path_for_log;
%put %grab_path_for_log;

proc printto log="%grab_path_for_log" new ; run;


/* Penser à bien refermer le fichier .log à la fin du programme : 
proc printto;run;
sinon impossible de supprimer le fichier avant fermeture de sas
*/


/* Pour récupérer le répertoire courant */

%macro grab_path;
 %qsubstr(%sysget(SAS_EXECFILEPATH), 
 1, 
 %length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILEname))
 )
%mend grab_path;
%put %grab_path;

/* Cette macro permet de récupérer le chemin du programme exécuté pour produire les sorties et les résultats dans le même répertoire
Exemple :
	Pour un xls taper : file="%grab_path_for_result_resultat1.xls"
*/

%macro grab_path_for_result;
 %qsubstr(%sysget(SAS_EXECFILEPATH),1, %length(%sysget(SAS_EXECFILEPATH))-4)
%mend grab_path_for_result;
%put %grab_path_for_result;

