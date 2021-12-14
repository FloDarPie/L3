--Client
--    (noClient(PK), nomC (NOT NULL), prenomC (NOT NULL))
    
--Vol
--    (noVol(PK), prixVol (NOT NULL), #vilDep (Ville), #VilArr (Ville), #noAgence)

--Ville
--    (nomV(PK), pays)
    
--Agence
--    (noAgence(PK), adresseA, #nomV (Ville))

--Reservation
--    (dateResa , nbBillet,[#noVol (Vol), #noClient (Client) ] (PK) )

-- le prix d'un vol ne peut augmenter de plus de 10% et est renseigné.




-- TRIGGER se definissent sur les TABLES
-- evenement -> INSERT/UPDATE/DELETE
-- déclenché en BEFORE ou AFTER
-- def par CREATE TRIGGER

\c postgres
\echo Creation de base de donnees Gestion des vols

DROP DATABASE IF EXISTS "Gestion des vols";

CREATE DATABASE "Gestion des vols" ENCODING 'UTF8';
\c "Gestion des vols"
    
CREATE TABLE Client (
    noClient int PRIMARY KEY,
    nomC VARCHAR(64) NOT NULL, 
    prenomC VARCHAR(64) NOT NULL,
    
    CONSTRAINT identite CHECK (nomC != prenomC)
    );
    
INSERT INTO Client(noClient ,nomC , prenomC ) VALUES (1,'laCreme','Chantilly'), 
                                                     (2,'Jo','Ja');
INSERT INTO Client VALUES (3,'F','F');
    
CREATE TABLE Ville (
    nomV VARCHAR(128) PRIMARY KEY,
    pays VARCHAR(128)
    );

CREATE TABLE Agence (
    noAgence int PRIMARY KEY,
    adresseA VARCHAR(128),
    nomV VARCHAR(128) NOT NULL REFERENCES Ville (nomV)
    );
    
CREATE TABLE Vol (
    noVol int PRIMARY KEY,
    prixVol int NOT NULL, 
    vilDep VARCHAR(128) NOT NULL REFERENCES Ville (nomV),
    vilArr VARCHAR(128) NOT NULL REFERENCES Ville (nomV),
    noAgence int REFERENCES Agence (noAgence),
    
    CONSTRAINT verifVilles CHECK (vilDep != vilArr)
    );
    
CREATE TABLE Reservation (
    dateResa DATE,
    nbBillet int,
    
    noVol int REFERENCES Vol (noVol),
    noClient int REFERENCES Client (noClient),
    
    CONSTRAINT coupleVolCLient PRIMARY KEY (noVol,noClient)
    --[#noVol (Vol), #noClient (Client) ] (PK) 
    );

    
    INSERT INTO Reservation(longueur, noImm, dateD,dateF) VALUES ( 12, 103, '2021-11-03','2021-11-29');
