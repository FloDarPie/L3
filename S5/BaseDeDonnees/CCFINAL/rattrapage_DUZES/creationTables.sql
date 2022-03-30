\echo [INFO] Debut du script
\echo [INFO] Creation de la base de donnees l3rattrapage
DROP DATABASE IF EXISTS l3rattrapage;
CREATE DATABASE l3rattrapage ENCODING 'UTF8';

\echo [INFO] Connexion a la nouvelle base de donnees l3rattrapage

\c l3rattrapage

SET DATESTYLE='DMY';

DROP TABLE IF EXISTS Travaille_dans;
DROP TABLE IF EXISTS Concerne;
DROP TABLE IF EXISTS Dossier;
DROP TABLE IF EXISTS Medecin;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Hopital;
DROP TABLE IF EXISTS Maladie;

CREATE TABLE Maladie (
				nomMaladie VARCHAR(40)
				CONSTRAINT pkMaladie PRIMARY KEY,
				symptomes VARCHAR(40)
				CONSTRAINT nnSymptomes NOT NULL
);

CREATE TABLE Hopital (
				nomHopital VARCHAR(40)
				CONSTRAINT pkHopital PRIMARY KEY,
				adresseHop VARCHAR(40)
				CONSTRAINT nnAdresseHop NOT NULL
);

CREATE TABLE Service (
				noService INT
				CONSTRAINT pkService PRIMARY KEY,
				nomService VARCHAR(40)
				CONSTRAINT nnnomService NOT NULL,
				lHopital VARCHAR(40) NOT NULL
                CONSTRAINT fklHopital REFERENCES Hopital(nomHopital)
);

CREATE TABLE Medecin (
				noMed INT
				CONSTRAINT pkMedecin PRIMARY KEY,
				nomMed VARCHAR(40)
				CONSTRAINT nnnomMed NOT NULL,
				prenomMed VARCHAR(40)
				CONSTRAINT nnprenomMed NOT NULL,
				salaireMed INT
				CONSTRAINT nnsalaireMed NOT NULL,
				leService INT
				CONSTRAINT nnleService NOT NULL
                CONSTRAINT fkleService REFERENCES Service(noService)
);


CREATE TABLE Dossier (
				noDossier INT
				CONSTRAINT pkDossier PRIMARY KEY,
				nomPatient VARCHAR(40)
				CONSTRAINT nnnomPatient NOT NULL,
				adressePatient VARCHAR(40)
				CONSTRAINT nnprenomPatient NOT NULL,
				dateDerniereConsult DATE DEFAULT CURRENT_DATE
				CONSTRAINT nndateDerniereConsult NOT NULL,
				leMedecin INT
				CONSTRAINT nnleMedecin NOT NULL
                CONSTRAINT fkleMedecin REFERENCES Medecin(noMed)
);

CREATE TABLE Concerne (
				unDossier INT
				CONSTRAINT fkConcerneDossier REFERENCES Dossier(noDossier),
				uneMaladie VARCHAR(40)
				CONSTRAINT fkConcerneMaladie REFERENCES Maladie(nomMaladie),
                CONSTRAINT pkConcerne PRIMARY KEY (unDossier, uneMaladie)
);

CREATE TABLE Travaille_dans (
				unMedecin INT
				CONSTRAINT fkTravaille_dansMedecin REFERENCES Medecin(noMed),
				unHopital VARCHAR(40)
				CONSTRAINT fkTravaille_dansHopital REFERENCES Hopital(nomHopital),
                CONSTRAINT pkTravaille_dans PRIMARY KEY (unMedecin, unHopital)
);