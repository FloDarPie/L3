--Client (Noclient(PK), nom, prenom )
--Vehicule (NumImm(PK), #NomModele(NV))
--Modele ( NomModele(PK), Marque, Puissance)
--Alquiler (#Noclient, #NumImm, Duree)

\c postgres

--securité pour pas réécrire la base de donné
DROP DATABASE IF EXISTS "Gestion des locations";

CREATE database "Gestion des locations" ENCODING "UTF8";



--securité 2 pour pas réécrire les tables
--DROP TABLE IF EXISTS Alquiler;
--DROP TABLE IF EXISTS Vehicule;
--DROP TABLE IF EXISTS Modele;
--DROP TABLE IF EXISTS Client;

\c "Gestion des locations"


CREATE TABLE Client (
    Noclient int not null PRIMARY KEY,
    Nom varchar(60),
    Prenom varchar(60)
);

CREATE TABLE Modele(
    NomModele varchar(15) PRIMARY KEY,
    Marque varchar(15),
    Puissance INT
);

CREATE TABLE Vehicule(
    NoMatricule varchar(7) PRIMARY KEY,
    NomModele varchar(15) REFERENCES Modele (NomModele)
);



CREATE TABLE Alquiler(
    Duree INTEGER,
    Noclient int not null,
    NumImm varchar(7),
    CONSTRAINT cle_loca PRIMARY KEY (Noclient,NumImm),
    CONSTRAINT exist_client FOREIGN KEY (Noclient) REFERENCES Client (Noclient),
    CONSTRAINT exist_vehicule FOREIGN KEY (NumImm) REFERENCES Vehicule (NoMatricule)
);





-- ############################################################################################################
-- ##############################TP n°1 -Retour sur les commandes sql##########################################
-- ############################################################################################################
-- 1) Quels sont les modèles de la marque ROLLS ROYCE ?
-- Theo Cavailles ou la grenouille
SELECT DISTINCT nommodele AS "Les modeles de la marque"
FROM modele WHERE upper(marque) = upper('Rolls Royce');

SELECT * FROM MODELE WHERE marque = 'ROLLS ROYCE'; --FloPaDie le BossSS

-- 2) Quelles sont les marques qui ont au moins un modèle, de puissance supérieure ou égale à 30 ?

SELECT DISTINCT Marque 
FROM Modele 
WHERE Puissance>=30;

-- 3) Quels sont les clients qui n’ont fait aucune location ?

SELECT idpersonne,nom,prenom
FROM CLIENT 
WHERE idpersonne   NOT IN (SELECT idpersonne FROM LOCATION);

SELECT idpersonne
FROM CLIENT 
EXCEPT 
SELECT idpersonne FROM LOCATION;


-- 4) Quelles sont les puissances communes entre les marques Audi et BMW ?
SELECT puissance from Modele
where marque='BMW' and puissance in (SELECT puissance FROM Modele where marque ='Audi');

SELECT puissance from Modele
where marque='BMW' 
INTERSECT 
SELECT puissance FROM Modele where marque ='Audi'
;

--5) Quels sont les clients qui ont loué le modèle A6 ?
SELECT noClient,nom,prenom 
FROM CLIENT 
WHERE  noCLient IN (SELECT noCLient 
                    FROM (location INNER JOIN Vehicule USING(noIm)) 
                    WHERE Vehicule.nomModele = 'A6'); --joris 
                    
 SELECT  idpersonne,nom,prenom                   
 FROM CLIENT INNER JOIN LOCATION ON idpersonne = unclient
                                 INNER JOIN Vehicule ON unvehicule = noimm
 WHERE Vehicule.lemodele = 'A6'; 
 
--6) Quelle est la marque du véhicule immatriculé PLB 56 RE ?
SelEct marque 
fRom modele INNER JoIN vehicule ON nomModele = lemodele
whEre noImm ='PLB 56 RE';--joris


Select marque 
fROm modele, vehicule
wHeRE nomModele = lemodele
AND noImm ='PLB 56 RE'; 


--7) Quels sont les noms et prénoms des clients qui ont loué un véhicule au moins 15 jours ?
SeLeCt nom,prenom 
fRoM CLIENT INNER JOIN location USING(noClient) 
WHERE duree>14;--joris
--8) Quels sont les modèles qui sont loués ?
SeLeCt nomModele fRoM vehicule WhErE noIm iN (SeLeCt noIm from LOCATION);--joris
--9) Quels sont les modèles qui ne sont pas loués ?
SeLeCt nomModele fRoM vehicule WhErE noIm nOt iN(SeLeCt noIm from LOCATION);--joris

EXCEPT 

--10) Quels sont les modèles de la marque Citroen qui sont loués ?

SeLeCt nomModele fRoM (modele INNER JoIn vehicule USING(nomModele)) WhErE marque='Citroen' AnD  noIm  In(SeLeCt noIm fRoM LOCATION); --joris


SeLeCt DIStINCT nomModele fRoM MODELE WHERE marque = 'Citroen' AND nomModele IN
(SeLeCt nomModele fRoM VEHICULE WHERE noIm IN
(SeLeCt noIm fRoM LOCATION));

SeLeCt DISTINCT modele.nommodele fRoM location inner join (vehicule inner join modele on vehicule.nommodele = modele.nommodele) on vehicule.noim = location.noim where marque = 'Citroen'; 
--11) Quelles sont les marques qui ne sont pas louées ?
SeLeCt marque fRoM modele where marque not in (select DISTINCT modele.marque from location inner join (vehicule inner join modele on vehicule.nommodele = modele.nommodele) on vehicule.noim = location.noim);
--12) Quelles sont les marques louées par Gabriel FARAUT ?
SeLeCt marque from modele inner join (vehicule inner join (location inner join client on client.noClient = location.noClient) on vehicule.noIm = location.noIm) on modele.nomModele = vehicule.nomModele where client.nom = 'BERTRAND';

--13) Quels sont les noms des clients qui ont loué tous les véhicules de la marque ROLLS ROYCE ?
SeLeCt distinct client.nom from modele inner join (vehicule inner join (location inner join client on client.noClient = location.noClient) on vehicule.noIm = location.noIm) on modele.nomModele = vehicule.nomModele where modele.marque = 'ROLLS ROYCE';

-- ############################################################################################################
-- ##############################TP n°2 - Approfondissement sur la table location##############################
-- ############################################################################################################
-- 1) Quelles sont les marques ordonnées par ordre alphabétique ?

-- 2) Quels sont les noms et prénoms des Clients ordonnés par ordre alphabétique des noms et prénoms ?
-- 3) Quels sont les modèles de la marque Renault ordonnés par ordre alphabétique ?
-- 4) Quels sont les modèles qui ne sont représentés par aucun véhicule ?
-- 5) Quels sont les modèles qui ne sont représentés par aucun véhicule ? Vous donnerez le résultat par ordre alphabétique des modèles.
-- 6) Quels sont les noms des clients ayant loué un véhicule pour lequel la durée n’est pas renseignée ? (noms à ordonner dans l’ordre alphabétique)
-- 7) Quels sont les 4 derniers noms des clients ordonnés par ordre alphabétique des noms ?
-- 8) Quels sont les noms des modèles dont un véhicule a une plaque d’immatriculation qui commence par P et qui contient 1 ?

-- 9) Donnez la liste des modèles ordonnés par puissance décroissante et par ordre alphabétique
-- 10) Quelles sont les marques qui ont été louées sur une durée d’au moins 10 jours
-- 11) Quels sont les noms et prénoms des clients qui ont loué un véhicule sur une durée d’au moins 10 jours ?
-- 12) Quels sont les modèles qui ont été loués par le client no6, mais qui n’ont été loué par aucun autre client ?
-- 13) Quels sont les noms des Clients qui ont loué tous les véhicules dont la puissance est strictement supérieure à 30 ?
