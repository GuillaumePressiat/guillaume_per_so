
# Pratiques sur SAS Enterprise Guide (SEG)

### Sommaire

<!-- MarkdownTOC -->

- [Échanger avec la plateforme](#echanger-avec-la-plateforme)
- [Quelques tables vues une par une](#quelques-tables-vues-une-par-une)
	- [Table mco fixe](#table-mco-fixe)
	- [Table mco diag](#table-mco-diag)
	- [Table um](#table-um)
	- [Les tables en SSR](#les-tables-en-ssr)
- [Les colonnes "ident" - ifiantes](#les-colonnes-ident---ifiantes)
	- [En MCO](#en-mco)
	- [En SSR, PSY et HAD](#en-ssr-psy-et-had)
	- [Des nomenclatures](#des-nomenclatures)
- [Import / Export](#import--export)
	- [Exporter un fichier en .txt](#exporter-un-fichier-en-txt)
	- [Exporter une table sas](#exporter-une-table-sas)
	- [Exporter un résultat table en Excel](#exporter-un-resultat-table-en-excel)
	- [Importer un référentiel](#importer-un-referentiel)
- [Programmation](#programmation)
	- [SEG et le Générateur de requêtes](#seg-et-le-generateur-de-requetes)
	- [Faire du SAS avec SEG](#faire-du-sas-avec-seg)
	- [Sauvegarder son programme avec Notepad++](#sauvegarder-son-programme-avec-notepad)
- [En cas de difficultés](#en-cas-de-difficultes)

<!-- /MarkdownTOC -->


<br><br><br>


### Échanger avec la plateforme

Le Presse-Papiers de votre PC est indépendant du Presse-Papiers du Bureau Distant : le copier-coller de l'un vers l'autre ne fonctionne pas.*

> *Nous verrons comment pallier à cette difficulté avec Notepad++.

Par ailleurs, au cours des travaux, il sera nécessaire d'exporter des résultats, d'importer des référentiels dans le logiciel.
Avant de voir comment faire cela, il faut comprendre comment les échanges de fichiers sont rendus possibles avec la plateforme.


```{sas}
 	- Une fois connecté à la plateforme (en ayant coché la case Lecteurs)
 	- ouvrir l'explorateur de fichiers
 	- Comprendre la structuration des disques et lecteurs réseaux
 	- Il s'agit d'un remote Desktop, les réseaux habituellement connectés à votre ordinateur sont présentés ainsi : 
 		- G on SAP5111857 (ordi au Siège)
 		- K on SAP5111857 (ordi au Siège)
 		- C on ABC1234567 (ordi à Antoine Béclère)
 	- Les échanges de fichiers sont possibles par glisser-déposer entre la plateforme et ces "lecteurs"

 	- Un conseil : se créer un répertoire style SEGEXPORT à la racine du C:\SEGEXPORT pour avoir un accès rapide 
 	(Le C de votre ordinateur, pas le C de l'ordi du bureau distant)
```


### Quelques tables vues une par une

<em>
Comment appeler une table ?

```{sas}
	- clic droit sur la librairie dans le panneau serveur
	- Propriétés
	- le libname de la table est "libref"
	- le chemin matériel des bases est "Emplacement"
```
</em>

Autrement dit avec les tables mco15bd : 
```{sas}
data truc; set mco15bd.fixe (obs = 100); run;
```

#### Table mco fixe

Ne retenir que les patients au chaînage valide : 

```{sas}
	- Les codes retours du chaînage FOIN3 sont concaténés en une seule colonne
	- Créer une variable intermédiare : translate(ano_retour,'','0')
	- Cette syntaxe remplace tous les '0' de ano_retour : '000000000' par des ''
	- Filtrer sur translate(ano_retour,'','0') = '' vous permettra de ne retenir que les patients chaînables
	- La formule fonctionne quels que soient le nombre de codes retours 7, 9, ...
```

#### Table um

C'est ici que l'on trouve l'entité géographique AP-HP : à l'AP-HP un séjour = un finess géographique.
On ne ramène pas de doublons par la jointure du RSA avec le finess um.

> *Attention : ce n'est pas le cas sur toute la BN*


#### Les tables en SSR


### Les colonnes "ident" - ifiantes

#### En MCO

Une seule colonne identifiante du séjour (ident). Les informations séquentielles sont codées dans la table um avec les passages de rum d'un séjour.

#### En SSR, PSY et HAD

Deux colonnes sont identifiantes : 
	- l'une identifie le séjour (ident_sej)
	- l'autre identifie le résumé hebdomadaire, la séquence, la sous-séquence (ident).


#### Des nomenclatures

### Import / Export

#### Exporter un fichier en .txt

Comment exporter un fichier au séparateur tabulation dans les répertoires et sous-répertoires de la plateforme.

Un proc export au format txt est possible en tapant les morceaux de programmes suivants.
Dans SEG : Fichier > Nouveau > Programme

Exemples avec la table "maps.belize" : 

##### Répertoire commun

```{sas}
proc export data=maps.belize outfile="~/commun/belize.txt" ; run;
```

##### Répertoire perso
```{sas}
proc export data=maps.belize outfile="~/perso/belize.txt" ; run;
```

##### Répertoire perso/mon_rep

```{sas}
proc export data=maps.belize outfile="~/perso/mon_rep/belize.txt" ; run;
```

Vu autrement : 
```{sas}
proc export data=maps.belize outfile="/export/home/gpressiat-6770/perso/mon_rep/belize.txt" ; run;
```

> NB : Il est nécessaire de savoir taper le symbole ~ : sur windows : "Alt Gr + é" puis espace pour faire apparaître ce caractère spécial
> Plutôt considérer perso comme un répertoire de programmes / projet SEG .egp, et considérer commun comme l'endroit où stocker les tables
> L'espace perso correspond à la lettre X
> L'espace commun correspond à la lettre Z
> L'espace documentation correspond à la lettre Y

#### Exporter une table sas

##### Méthode programme classique
```{sas}
libname save "~/commun/me/"
data save.table; set table; run;
```
##### Méthode prise en main SEG

Clic bouton

```{sas}
	- Ouvrir la table
	- Données > Exporter des données vers un PC
	- Suivre les indications et exporter la table vers ~/commun/me
```

#### Exporter un résultat table en Excel

```{sas}
	- Ouvrir la table contenant le résultat
	- CLiquer sur Envoyer à > Microsoft Excel
	- Excel s'ouvre avec le résultat
```

#### Importer un référentiel

##### Créer un répertoire contenant un référentiel

> Placer dans le répertoire commun/REFS un référentiel au format sas et au format txt

##### Importer un référentiel au format sas

```{sas}
libname refs "~/commun/REFS";
data tarifs; set refs.tarif; run;
```

##### Importer un référentiel au format fichier texte et en faire un table sas

> *C'est la procédure identique à celle dans SAS.*

```{sas}
%let an         = 16;
%let classtarif = 008;
 
filename txtarif "~/commun/REFS/sources/Tarifs_11_20&an..csv";

data tarif&an.; 
infile txtarif dlm=";" firstobs=2 dsd truncover missover;
	format noghs $4. ghm $6. lib_ghm $200. noseqta $3. anseqta $4.;
	input  noghs     ghm     lib_ghm
		   binf      bsup    tbase 
		   fexb      texb    texh;
	

	anseqta   = "20&an.";
	noseqta   = "&classtarif.";

	label
	noseqta       = "N° séquence tarif"
	anseqta       = "Année séquence tarif"
	noghs         = "GHS"
	ghm           = "GHM"
	binf          = "Borne basse"
	bsup          = "Borne haute"
	tbase         = "Tarif de base (€)"
	fexb          = "Forfait Extrême bas (€)"
	texb          = "Tarif Extrême bas (€)"
	texh          = "Tarif Extrême haut (€)";
run;
```


### Programmation

#### SEG et le Générateur de requêtes

> Principe général du générateur de requêtes : 

> Une ou plusieurs tables en entrée > une table ou un rapport en sortie (résultat).

##### Filtrer une table

> Filtrer la table des tarifs tout juste importée


```{sas}
	- Une fois la table importée et ouverte dans SEG
	- Cliquer sur générateur de requêtes
	- Glisser/déposer les variables à conserver dans la table résultat
	- Choisir les modalités du filtre
	- éventuellement trier les données
```

> Observer le résultat décrit par le schéma du flux de processus.

##### Colonne calculée : exemple des 0 jours (booléen)

Étapes préliminaires au calcul des taux de chirurgie ambulatoire par finess.
Filtrer sur les ghm rsatype 'C'.
Créer une colonne 0 jour / > 0 jour.

```{sas}
	- Glisser dans l'environnement flux de processus de SEG la table mco15bd.fixe
	- Double cliquer dessus
	- Cliquer sur générateur de requêtes
	- Glisser/déposer les variables du rapport sur lesquelles on va "compter" : finess ghm duree
	- filtrer sur les ghm en C (substr(ghm2,3,1)='C' ou ghm2 like '%C%')
	- Cliquer sur colonne calculée : colonne calculée (duree=0)
	- On obtient une table que l'on peut renommer dans le flux de processus
```

##### Colonne calculée : Compter par agrégation

Compter le nombre de séjours par finess et ghm dans la BN

```{sas}
	- Glisser dans l'environnement flux de processus de SEG la table mco15bd.fixe
	- Double cliquer dessus
	- Cliquer sur générateur de requêtes
	- Glisser/déposer les variables du rapport sur lesquelles on va "compter" : finess ghm2
	- Cliquer sur colonne calculée : colonne agrégée
	- Le générateur de requête group by puis count()
	- On obtient une table que l'on peut renommer
	- clic droit sur générateur de requêtes dans le flux de processus
	- Dans le champ nom de la sortie taper : work.finess_ghm.
```

> NB : Pour modifier une requête clic droit sur générateur > modifier dans le flux de processus


##### Jointure avec le générateur de requêtes (orienté SQL)

Repartir de la table des séjours par finess / GHM.
On va ajouter les informations raison sociale et statut d'établissement, et uniquement retenir les établissements DGF.

```{sas}
	- Filtrer les établissements MCO dans la table des établissements (nom_gen.finess)
	- filtrer sur les établissements ex DGF
	- enregistrer le résultat dans la table work.publics_mco
	- puis : 
	- partir de la table work.finess_ghm
	- Double cliquer dessus
	- Cliquer sur générateur de requêtes
	- Cliquer sur joindre des tables
	- Cliquer sur ajout tables > naviguer dans l'arborescence du serveur
	- Choisir la table work.public_mco
	- le schéma SQLien décrit quelle jointure va être produite : ici inner join (tout ce qui est dans a et dans b)
	- Glisser/déposer les variables que l'on souhaite ajouter : rs t2a
	- On nomme la table et on exécute la requête
```

> *dans le feuillet "Code" de la fenêtre le code du proc sql est affiché*

##### Exporter un résultat à partir du flux de processus

```{sas}
	- Ouvrir la table en double cliquant dessus
	- Suivre la méthode Données >  Télécharger des fichiers vers un PC > ...
```

#### Faire du SAS avec SEG

Nous avons vu les possibilités proposées par SEG via son Générateur de requêtes.
Si vos programmes sont tout prêts en SAS, il n'y a pas forcément d'intérêt à les transcrire en requêtes SEG avec un flux de processus.
Dans ce cas, pratiquer le SAS est possible.

Voici comment faire : 

```{sas}
	- Fichier > Nouveau > ouvrir un programme
	- Copier votre programme et adapter le à la structure des tables
	- à chaque exécution d'une étape data, le journal est régénéré
	- pour suivre le bon déroulement du programme suivre le feuillet "résumé du journal" 
	(à part gros problème l'essentiel y est indiqué)
```

#### Sauvegarder son programme avec Notepad++

La plateforme montre parfois des difficultés pour sauvegarder des projets / programmes.
> Pour ne pas s'arracher les cheveux en perdant tout son travail, mieux vaut copier coller son programme de manière régulière en ouvrant un Notepad++ distant en parallèle.

> Notepad ++ présente l'intérêt de recharger les fichiers depuis le disque : lorsque vous souhaitez envoyer des bouts de programme de votre PC vers la plateforme, c'est le bon intermédiare :
> dans votre Notepad++ sur votre PC, vous pouvez copier un bout de programme / sauvegarder le fichier : il s'affichera dans le fichier ouvert dans le Notepad++ de la plateforme. 


#### Exemples de requêtes SAS


##### Filtrer une table

> Filtrer la table des tarifs importée précédemment

```{sas}
	PROC SQL;
		CREATE TABLE WORK.filtre1 AS 
		SELECT t1.ghm, 
				t1.tbase
			FROM WORK.TARIF16 t1
			WHERE t1.tbase >= 3000;
	QUIT;
```

> NB: Pour éxécuter une sélection, contrairement à SAS, F8 ne fonctionne plus, c'est F3. Sinon cliquer sur exécuter -- exécuter la sélection

##### Colonne calculée : exemple des 0 jours (booléen)

Étapes préliminaires au calcul des taux de chirurgie ambulatoire par finess.
Filtrer sur les ghm rsatype 'C'.
Créer une colonne 0 jour / > 0 jour.

```{sas}
	PROC SQL;
	CREATE TABLE WORK.ambuz AS 
	SELECT t1.duree, 
			t1.finess, 
			/* zero_jour */
				((duree=0)) AS zero_jour, 
			t1.ghm2
		FROM MCO15BD.FIXE t1
		WHERE substr(ghm2,3,1) = 'C';
	QUIT;
```

##### Colonne calculée : Compter par agrégation

Compter le nombre de séjours par finess et ghm dans la BN

```{sas}
	PROC SQL;
	CREATE TABLE WORK.Case_mix AS 
	SELECT t1.finess, 
			t1.ghm2, 
			/* Combien */
				(COUNT(t1.ghm2)) AS Combien
		FROM MCO15BD.FIXE t1
		GROUP BY t1.finess,
				t1.ghm2;
	QUIT;
```


##### Jointure

Repartir de la table des séjours par finess / GHM.
On va ajouter les informations raison sociale et statut d'établissement, et uniquement retenir les établissements DGF.

```{sas}
	PROC SQL;
	CREATE TABLE WORK.fin_public AS 
	SELECT t1.finess, 
			t1.rs, 
			t1.T2A, 
			t1.mco
		FROM NOM_GEN.FINESS t1
		WHERE t1.mco = '1' and t1.secteur = 'DGF';
	QUIT;

	PROC SQL;
	CREATE TABLE WORK.matable AS 
	SELECT t1.finess, 
			t1.ghm2, 
			t1.Combien, 
			t2.rs, 
			t2.T2A
		FROM WORK.CASE_MIX t1
			INNER JOIN WORK.FIN_PUBLIC t2 ON (t1.finess = t2.finess);
	QUIT;
```


##### Un exemple contextualisé

> On s'intéresse au taux de chainage valide par établissement sur la base 2015
 
```{sas}

* Créer la variable cok : chainage valide;
PROC SQL;
   CREATE TABLE WORK.chainons AS 
   SELECT t1.finess, 
          t1.ano_retour, 
		  t1.duree,
          /* cok */
            ((translate(ano_retour,'','0')='')) AS cok
      FROM MCO15BD.FIXE t1;
QUIT;

* Compter le nombre de lignes de la variable duree;
proc means data=chainons nway noprint;
class finess cok;
var duree;
output out = chainons2(drop=_:) n(duree) = nb;
run;

/* Transposer la variable cok : permet d'avoir deux colonnes  le nombre de rsa
invalides, le nombre de rsa valides, sur une même ligne, par finess*/
proc transpose data=chainons2 out=chainons3(drop=_:) prefix=cok_;
by finess;
id cok;
var nb;
run;

* Remplacer les valeurs manquantes pour les variables numériques par des 0;
proc stdize data=chainons3 out=chainons3 reponly missing=0;
var _numeric_;
run;
* Calculer le taux de chainage valide;
data chainons3; set chainons3;
freqchaine = cok_1/(cok_0 + cok_1);
run;

* Ajouter la raison sociale et la catégorie d'établissement;
proc sql undo_policy=none;
create table chainons3 
as
select distinct a.*, b.rs, b.categ
from chainons3 a inner join nom_gen.finess b
on a.finess=b.finess
order by  freqchaine desc;
quit;

```
### En cas de difficultés

Contacter le support de la plateforme SEG - Atih
"
en cas de problème, vous pouvez contacter le support :
support@atih.sante.fr ou 0 820 77 1 2 3 4
"


> <center>SIMAP / DOMU / AP-HP -- 2016
<img src="LOGO-BLEU-APHP1.jpg" title alt width="200"/>
</center>
