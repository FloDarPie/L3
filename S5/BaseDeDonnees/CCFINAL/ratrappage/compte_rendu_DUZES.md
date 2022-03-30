# UE Bases de Données 2 : RATTRAPAGE

a) Tous les attributs sont renseignés  
b) Tous les hôpitaux ont des adresses différentes.  
c) Le salaire d'un médecin ne doit pas pouvoir être augmenté de plus de 10 pour cent.  
d) Un médecin ne peut pas suivre plus de 100 dossiers.  
e) Un patient ne peut pas avoir plusieurs dossiers dans le même service.  

___
**Question 1 :** *à rédiger sur votre rapport écrit pdf  
Traduisez ce diagramme E/A en schéma relationnel. Précisez les contraintes textuelles restantes et les nouvelles s’il y en a.
Les cles étrangères doivent porter le même nom que les attributs qu'elles référencent préfixée par un ou le, par exemple : leNumSer, unNumDos etc ...).
On ne stockera pas l’association « travaille dans » entre Médecin et Hôpital : expliquez pourquoi.
Précisez en quelle forme normale se trouve chaque relation (1NF, 2NF, 3NF, BCNF) justifiez.* </br>

Voici le schema relationnel :</br>

Maladie ( <u>nomMaladie </u>, symptomes NN)

Hopital ( <u>nomHopital </u>, adresseHop NN UQ)

Service ( <u> noService </u>, nomService NN, #lHopital NN)

Medecin ( <u> noMed </u>, nomMed NN, prenomMed NN, salaireMed NN, #leService NN)


Dossier ( <u> noDossier </u>, nomPatient NN, adressePatient NN, dateDerniereConsult NN, #leMedecin NN)

Concerne ( <u> #unDossier </u>,<u> #uneMaladie </u> )

Travaille_dans ( <u> #unMedecin </u>,<u> #unHopital </u> )

La contrainte 'a)' entraine la présence généralisé de NOT NULL dans chaque déclaration.  
Aussi, la contrainte 'b)' necessite que l'adresse soit UNIQUE.<br> <br>
De même que pour l'association "concerne", l'association "travaille_dans" ne peut être stockés dans "Medecin" ou "Hopital" car cela alourdirait l'une de ces tables avec des informations inutile lors du croisement des tables. Il est plus interessant de créer une table supplémentaires qui n'est constitué que des couples (noMed,nomHopital). <br><br>
Il reste que les contraintes c), d), et e).<br>
De plus, on peut voir quelques contraintes textuelles supplémentaires : <br>
 - "Un noMedecin est attribué à un seul couple (nomMed, prenomMed)" <br>
 - "Un medecin ne peut être sur deux dossiers à une même date"

De même que pour le précédents examen, j'observe que toutes les relations fonctionneles sont en BCNF, sauf Concerne et Travaille_dans à cause des clés secondaires, qui sont en 3NF.




___
**Question 2 :** *fichier creationTables.sql à rendre + rapport écrit  
reprenez le fichier creationTables.sql et complétez-le de façon à traduire le schéma
relationnel avec le maximum de contraintes : fichier creationTables.sql à rendre
Précisez exactement les contraintes restantes : sur votre rapport écrit*
<br> <br>
Les contraintes restantes sont c), d), e) et les contraintes supplémentaires relevés à la question 1.

___
**Question 3 :** *fichier question3.sql  
Il y a des contraintes liées aux cardinalités du diagramme E/A non prises en compte
dans le script de création des tables. Créez un fichier question3.sql, dans lequel vous
mettrez le code correspondant à la prise en compte d’une de ces cardinalités, ainsi
que les tests. Vous rendrez ce fichier question3.sql.*

___
**Question 4 :** *contrainte de cycle : fichier question4.sql  
dans un nouveau fichier mettez le code permettant de retrouver l’hôpital dans lequel
travaille un médecin, avec le test.
Rendre le fichier question4.sql*

___
**Question 5 :** *fichier question5.sql  
dans un nouveau fichier mettez le code correspondant au traitement de la contrainte
d), avec le test qui sera fait avec seulement 2 dossiers : l’insertion doit échouer à
partir de 3 dossiers.
Rendre le fichier question5.sql*

___
**Question 6 :** *fichier question6.sql  
dans un nouveau fichier mettez le code correspondant au traitement de la contrainte
e), avec le test. On supposera que tous les patients ont des noms différents.
Rendre le fichier question6.sql*

___
**Questions 7 :** *fichier question7.sql  
Dans le fichier question7.sql mettez le code d’une fonction permettant d’obtenir tous
les noms des patients suivis par un médecin, avec le test.*
