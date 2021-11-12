

--Bateau 
--  (noImm(PK), nomB, longueurB, largeurB, #idProprio)

--Proprio
--  (idProprio(PK), nomP, prenomP, emailP)

--Emplacement
--  ( noEmpl(PK), longueur, #noImm, dateD, dateF)

--Reservation
--  (numResa, dateDebut, dateFin, #noImm, #noEmpl)

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
    idProprio int NOT NULL PRIMARY KEY,
    nomP varchar(30),
    prenomP varchar(30),
    emailP varchar(60)
);

CREATE TABLE Bateau (
    noImm int NOT NULL PRIMARY KEY,
    nomB varchar(60),
    longueurB int CONSTRAINT contrainte_longB CHECK (21>longueurB AND longueurB >2),
    largeurB int,
    idProprio int REFERENCES Proprio (idProprio)
    
);

CREATE TABLE Emplacement (
    noEmpl int NOT NULL PRIMARY KEY,
    longueur int CONSTRAINT contrainte_longueur CHECK (21>longueur AND longueur >2),
    noImm int REFERENCES Bateau(noImm),
    dateD int,
    dateF int
);

CREATE TABLE Reservation (
    numResa INTEGER PRIMARY KEY,
    dateDebut int not null,
    dateFin int not null,
    noImm int REFERENCES Bateau (noImm),
    noEmpl int REFERENCES Emplacement (noEmpl)
);
