DROP TRIGGER question4 ON Livre;
DROP FUNCTION F_question4();

CREATE OR REPLACE FUNCTION F_question4() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.prix > 1.1*OLD.prix THEN
		RAISE NOTICE 'l augmentation de prix d un livre ne peut pas depasser 10 pour cent';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER question4
	BEFORE UPDATE ON Livre
	FOR EACH ROW
	EXECUTE PROCEDURE F_question4();
	

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
INSERT INTO Editeur VALUES('editeur2','45 av laperouse Albi');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'de La Fontaine','Jean','jlafontaine@orange.fr');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'Camus','Albert','acamus@free.fr');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Dupont','Albert','adupont@free.fr');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Tournesol','Tryphon','ttournesol@savant.fr');
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'POCHE','la peste',15,'editeur2');
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'BD','le coche et la mouche',20,'editeur1');
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,1,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,NULL,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),2,2,DEFAULT);
INSERT INTO Contrat VALUES(1,'editeur1');
INSERT INTO Contrat VALUES(2,'editeur2');
INSERT INTO aEcrit VALUES(1,2);
INSERT INTO aEcrit VALUES(2,1);

-- un update qui passe

UPDATE Livre
SET prix = 16
WHERE noLivre = 1;

-- un update qui passe pas

UPDATE Livre
SET prix = 30
WHERE noLivre = 1;

SELECT * FROM Livre;
