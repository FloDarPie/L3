DROP TRIGGER question7 ON aEcrit;
DROP FUNCTION F_question7();

-- Il faut vérifier que TOUS les auteurs du livre ont bien un contrat chez l editeur du livre.

CREATE OR REPLACE FUNCTION F_question7() RETURNS TRIGGER AS $$
DECLARE
	un_Editeur1 Editeur.nomEditeur%TYPE;
	un_Editeur2 Editeur.nomEditeur%TYPE;
	OK BOOLEAN;
BEGIN
	OK = FALSE;
	SELECT INTO un_Editeur1 lEditeur FROM Livre WHERE noLivre = NEW.unLivre;
	FOR un_Editeur2 IN SELECT unEditeur FROM Contrat WHERE NEW.unAuteur = Contrat.unAuteur
	LOOP
		IF un_Editeur1 = un_Editeur2 THEN
			OK = TRUE;
		END IF;
	END LOOP;
	IF OK = FALSE THEN
		RAISE NOTICE 'tous les auteurs d un livre doivent avoir un contrat chez l editeur de ce livre';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER question7
	BEFORE INSERT OR UPDATE ON aEcrit
	FOR EACH ROW
	EXECUTE PROCEDURE F_question7();
	

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
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'MOI','Francois','fMoi@free.fr');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'AutreMOI','Francois2','fMoi2@free.fr');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Dupont','Albert','adupont@free.fr');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Tournesol','Tryphon','ttournesol@savant.fr');
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'POCHE','la peste',15,'editeur1');
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'BD','le coche et la mouche',20,'editeur2');
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,1,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,NULL,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),2,2,DEFAULT);
INSERT INTO Contrat VALUES(1,'editeur1');
INSERT INTO Contrat VALUES(2,'editeur2');
INSERT INTO Contrat VALUES(4,'editeur1');
INSERT INTO aEcrit VALUES(1,1);
INSERT INTO aEcrit VALUES(2,2);
INSERT INTO aEcrit VALUES(3,2);
INSERT INTO aEcrit VALUES(4,2);



SELECT * FROM aEcrit;
