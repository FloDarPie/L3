DROP FUNCTION F_question7();

CREATE OR REPLACE FUNCTION F_question7(l integer) 
RETURNS SETOF Exemplaire.noExemplaire%TYPE AS $$
DECLARE
	unEx Exemplaire.noExemplaire%TYPE ;
BEGIN
	FOR unEx IN SELECT noExemplaire FROM Exemplaire WHERE leLivre = l
	LOOP
		RETURN NEXT unEx;
	END LOOP;
	RETURN;
END; $$LANGUAGE 'plpgsql';
	

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
INSERT INTO aEcrit VALUES(1,1);
INSERT INTO aEcrit VALUES(2,2);



SELECT F_question7(1); -- doit retourner les exemplaires 1 et 2
