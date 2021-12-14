\echo [INFO] Debut du script

-- \i C:/Users/fpouit/Documents/FP/L2_BDD_TP4.sql
\echo [INFO] Creation de la base de donnees cc2
\c postgres
DROP DATABASE IF EXISTS cc2;
CREATE DATABASE cc2 ENCODING 'UTF8';

\echo [INFO] Connexion a la nouvelle base de donnees cc2

\c cc2

SET DATESTYLE='DMY';

--DROP TABLE IF EXISTS aEcrit;
--DROP TABLE IF EXISTS Contrat;
--DROP TABLE IF EXISTS Exemplaire;
--DROP TABLE IF EXISTS Livre;
--DROP TABLE IF EXISTS Client;
--DROP TABLE IF EXISTS Auteur;
--DROP TABLE IF EXISTS Editeur;


CREATE TABLE Editeur
(
    nomEditeur VARCHAR(40)  PRIMARY KEY,
    adresse VARCHAR(40) NOT NULL
) ;

CREATE TABLE Auteur
(
    noAuteur INT  PRIMARY KEY,
    nomAuteur VARCHAR(40),
    prenomAuteur VARCHAR(40),
    emailAuteur VARCHAR(40) NOT NULL UNIQUE
) ;


CREATE TABLE Client
(
    noClient INT  PRIMARY KEY,
    nomClient VARCHAR(40),
    prenomClient VARCHAR(40),
    emailClient VARCHAR(40) NOT NULL UNIQUE
) ;

CREATE TABLE Livre
(
    noLivre INT PRIMARY KEY,
    typeLivre VARCHAR(40)
    CONSTRAINT ckType CHECK (typeLivre = 'BD' OR typeLivre = 'POCHE'),
    titre VARCHAR(40),
    prix INT NOT NULL,
    lEditeur VARCHAR(40) NOT NULL
) ;

CREATE TABLE Exemplaire(
    noExemplaire INT PRIMARY KEY,
    leLivre INT NOT NULL
    CONSTRAINT fkExemplaireLivre REFERENCES Livre(noLivre),
    leClient INT
    CONSTRAINT fkExemplaireClient REFERENCES Client(noClient),
    dateAchat DATE 
    );
    
CREATE TABLE Contrat(
    unAuteur INT
    CONSTRAINT fkContratAuteur REFERENCES Auteur(noAuteur),
    unEditeur VARCHAR(40)
    CONSTRAINT fkContratEditeur REFERENCES Editeur(nomEditeur)
    );
    
CREATE TABLE Aecrit
(unAuteur INT
    CONSTRAINT fkAecritAuteur REFERENCES Auteur(noAuteur),
    unLivre INT 
    CONSTRAINT fkAecritLivre REFERENCES Livre(noLivre)
) ;



CREATE SEQUENCE cleClient MINVALUE 1;

CREATE SEQUENCE cleAuteur MINVALUE 1;

CREATE SEQUENCE cleLivre MINVALUE 1;

CREATE SEQUENCE cleExemplaire MINVALUE 1;




    
