--Client (Noclient(PK), nom, prenom )
--Vehicule (NumImm(PK), #NomModele(NV))
--Modele ( NomModele(PK), Marque, Puissance)
--Alquiler (#Noclient, #NumImm, Duree)

\c postgres

--securité pour pas réécrire la base de donné
DROP DATABASE IF EXISTS "Gestion des locations";

CREATE database "Gestion des locations" ENCODING "UTF8";

\c "Gestion des locations"

--securité 2 pour pas réécrire les tables
--DROP TABLE IF EXISTS Alquiler;
--DROP TABLE IF EXISTS Vehicule;
--DROP TABLE IF EXISTS Modele;
--DROP TABLE IF EXISTS Client;


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