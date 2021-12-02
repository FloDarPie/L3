\echo [INFO] Debut du script

-- \i C:/Users/fpouit/Documents/FP/L2_BDD_TP4.sql
\echo [INFO] Creation de la base de donnees ResaBateau
DROP DATABASE IF EXISTS ResaBateau;
CREATE DATABASE resabateau ENCODING 'UTF8';

\echo [INFO] Connexion a la nouvelle base de donnees ResaBateau

\c resabateau

SET DATESTYLE='DMY';

DROP TABLE IF EXISTS Reservation;

DROP TABLE IF EXISTS Emplacement;

DROP TABLE IF EXISTS Bateau;

DROP TABLE IF EXISTS Proprietaire;


CREATE TABLE Proprietaire
   (
    idProprio INT  PRIMARY KEY,
    nomP VARCHAR(40)  NOT NULL ,
    prenomP VARCHAR(40) NOT NULL,
	emailP VARCHAR(40) UNIQUE,
	CONSTRAINT uqnomPprenomP UNIQUE(nomP,prenomP)
   ) ;
   

CREATE TABLE Bateau
   (
    noImm VARCHAR(40)  PRIMARY KEY,
    nomB VARCHAR(40),
	longueurB INT 
	CONSTRAINT nnlongueurB NOT NULL -- la contrainte CHECK ne fonctionne pas si la longueur est à NULL !!!
	CONSTRAINT ckLongueurB CHECK (longueurB>=3 and longueurB <= 20),
	largeurB INT 
	CONSTRAINT nnlargeurB NOT NULL
	CONSTRAINT ckLargeurB CHECK (largeurB <= 6),
	leProprio INT NOT NULL
	CONSTRAINT fkBateauProprietaire REFERENCES Proprietaire(idProprio)
   ) ;
   
   
CREATE TABLE Emplacement
   (
    noEmpl INT  PRIMARY KEY,
    longueur INT
	CONSTRAINT nnlongueur NOT NULL
	CONSTRAINT ckLongueur CHECK (longueur>=3 and longueur <= 20),
	leBateau VARCHAR(40)
    CONSTRAINT fkEmplacementBateau REFERENCES Bateau(noImm),
    dateDebut DATE,
    dateFin DATE
   ) ;
   
CREATE TABLE Reservation
   (numResa INT  PRIMARY KEY,
    dateDebut DATE CONSTRAINT nndateDebut NOT NULL,
    dateFin DATE CONSTRAINT nndateFin NOT NULL,
	lEmplacement INT
	CONSTRAINT nnlEmplacement NOT NULL
	CONSTRAINT fkReservationEmplacement REFERENCES Emplacement(noEmpl),
	leBateau VARCHAR(40) CONSTRAINT nnleBateau NOT NULL
	CONSTRAINT fkReservationBateau REFERENCES Bateau(noImm)
   ) ;
   
   
DROP SEQUENCE IF EXISTS cleProprio;
CREATE SEQUENCE cleProprio MINVALUE 1;

DROP SEQUENCE IF EXISTS cleEmp;
CREATE SEQUENCE cleEmp MINVALUE 1;

DROP SEQUENCE IF EXISTS cleResa;
CREATE SEQUENCE cleResa MINVALUE 1;

INSERT INTO Proprietaire VALUES(NEXTVAL('cleProprio'), 'toto','toto','toto@gmail.com');
INSERT INTO Proprietaire VALUES(NEXTVAL('cleProprio'), 'titi','titi','titi@gmail.com');

INSERT INTO Bateau VALUES('TY Bateau','monBateau',5,3,1);
INSERT INTO Bateau VALUES('Pirate','bateau Pirate',7,3,2);

CREATE VIEW verifProprio AS(
SELECT idProprio
FROM Proprietaire
EXCEPT
SELECT DISTINCT leProprio
FROM Bateau);

	
