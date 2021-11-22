

--Bateau 
--  (noImm(PK), nomB, longueurB, largeurB, #idProprio (NOT NULL))

--Proprio
--  (idProprio(PK), nomP, prenomP, emailP)

--Emplacement
--  ( noEmpl(PK), longueur, #noImm (UNIQUE), dateD, dateF)

--Reservation
--  (numResa(PK), dateDebut, dateFin, #noImm (NOT NULL), #noEmpl (NOT NULL))

\c postgres

--securité pour pas réécrire la base de donné
DROP DATABASE IF EXISTS "Gestion des bateaux";

CREATE database "Gestion des bateaux" ENCODING "UTF8";

\c "Gestion des bateaux" 
--ne pas oublier de le mettre au bon endroit

--securité 2 pour pas réécrire les tables
--DROP TABLE IF EXISTS Reservation;
--DROP TABLE IF EXISTS Emplacement;
--DROP TABLE IF EXISTS Bateau;
--DROP TABLE IF EXISTS Proprio;


CREATE TABLE Proprio (
    idProprio int PRIMARY KEY,
    nomP varchar(30) NOT NULL,
    prenomP varchar(30) NOT NULL,
    emailP varchar(60),
    
    CONSTRAINT identite UNIQUE (nomP,prenomP)
);

CREATE TABLE Bateau (
    noImm int PRIMARY KEY,
    nomB varchar(60),
    longueurB int NOT NULL CONSTRAINT contrainte_longB CHECK (longueurB BETWEEN 3 AND 20),
    largeurB int NOT NULL CONSTRAINT contrainte_largB CHECK (largeurB <= 6),
    idProprio int NOT NULL REFERENCES Proprio (idProprio)
    
);

CREATE TABLE Emplacement (
    noEmpl SERIAL PRIMARY KEY,
    longueur int NOT NULL CONSTRAINT contrainte_longueur CHECK (longueur BETWEEN 3 AND 20),
    noImm int NOT NULL CONSTRAINT contrainte_noImm REFERENCES Bateau(noImm),
    dateD DATE NOT NULL,
    dateF DATE NOT NULL
);

CREATE TABLE Reservation (
    numResa int PRIMARY KEY,
    dateDebut DATE NOT NULL,
    dateFin DATE NOT NULL,
    noImm int REFERENCES Bateau (noImm),
    noEmpl int REFERENCES Emplacement (noEmpl)
);

CREATE SEQUENCE autoIdproprio MINVALUE 1;
--CREATE SEQUENCE autoNoEmpl MINVALUE 1 INCREMENT 1 NO CYCLE; //Preferer l'utilisatoin de SERIAL
CREATE SEQUENCE autoNumResa MINVALUE 1;

INSERT INTO Proprio VALUES(NEXTVAL('autoIdproprio'),'Huc','Quentin','blabla@gamil.com');
INSERT INTO Proprio VALUES(NEXTVAL('autoIdproprio'),'Cadilhac','Gabriel','salut@gamil.com');
INSERT INTO Proprio VALUES(NEXTVAL('autoIdproprio'),'La','Creme','lacremedelacreme@gamil.com');
INSERT INTO Proprio VALUES(NEXTVAL('autoIdproprio'),'Flo','Padie',NULL);

INSERT INTO Bateau VALUES(100,'Titanic2021',8,4,1);
INSERT INTO Bateau VALUES(101,'les copain d''abord',15,4,2);
INSERT INTO Bateau VALUES(102,'mon petit bateau',19,5,3);
INSERT INTO Bateau VALUES(103,'La Creme',20,6,4);


INSERT INTO Emplacement VALUES(NEXTVAL('emplacement_noempl_seq'), 8, 100, '2021-11-17','2021-11-29');
INSERT INTO Emplacement VALUES( NEXTVAL('emplacement_noempl_seq'), 16, 101, '2021-10-17','2021-11-29') ;
INSERT INTO Emplacement VALUES( NEXTVAL('emplacement_noempl_seq'), 4, 102, '2003-11-17','2021-11-29') ;


INSERT INTO Emplacement (longueur, noImm, dateD,dateF) VALUES ( 12, 103, '2021-11-03','2021-11-29');

--Les contraintes restantes :
--  La date de début de réservation précède la date de fin de réservation
-- Un bateau ne peut stationner dans un emplacement que si une réservation correspondante a été effectuée.
