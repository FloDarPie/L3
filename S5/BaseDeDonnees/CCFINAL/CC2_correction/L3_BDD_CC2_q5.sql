DROP TRIGGER question5 ON Contrat;
DROP FUNCTION F_question5();

CREATE OR REPLACE FUNCTION F_question5() RETURNS TRIGGER AS $$
DECLARE
	nomA Auteur.nomAuteur%TYPE;
BEGIN
	SELECT UPPER(nomAuteur) INTO nomA FROM Auteur WHERE NEW.unAuteur = noAuteur;
	IF UPPER(NEW.unEditeur) = UPPER(nomA) THEN
		RAISE NOTICE 'le nom d un Auteur ne peut etre egal au nom de son editeur';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER question5
	BEFORE INSERT OR UPDATE ON Contrat
	FOR EACH ROW
	EXECUTE PROCEDURE F_question5();
	

-- on vide les tables avant les tests

DELETE FROM aEcrit;	
DELETE FROM Contrat;
DELETE FROM Exemplaire;
DELETE FROM Livre;
DELETE FROM Client;
DELETE FROM Auteur;
DELETE FROM Editeur;

ALTER SEQUENCE cleClient RESTART WITH 1;
ALTER SEQUENCE cleAuteur RESTART WITH 1;
ALTER SEQUENCE cleLivre RESTART WITH 1;
ALTER SEQUENCE cleExemplaire RESTART WITH 1;

INSERT INTO Editeur VALUES('editeur1','2 rue de Paris Albi');
INSERT INTO Editeur VALUES('Camus','45 av laperouse Albi');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'de La Fontaine','Jean','jlafontaine@orange.fr');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'Camus','Albert','acamus@free.fr');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Dupont','Albert','adupont@free.fr');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Tournesol','Tryphon','ttournesol@savant.fr');
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'POCHE','la peste',15,'Camus');
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'BD','le coche et la mouche',20,'editeur1');
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,1,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,NULL,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),2,2,DEFAULT);
INSERT INTO Contrat VALUES(1,'editeur1');
INSERT INTO Contrat VALUES(2,'Camus');
INSERT INTO aEcrit VALUES(1,1);
INSERT INTO aEcrit VALUES(2,2);


SELECT * FROM Auteur;
SELECT * FROM Editeur;
SELECT * FROM Contrat;
