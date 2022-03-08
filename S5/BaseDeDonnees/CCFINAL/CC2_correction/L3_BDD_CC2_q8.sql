DROP FUNCTION F_question8();

CREATE OR REPLACE FUNCTION F_question8(cli integer) 
RETURNS Auteur.nomAuteur%TYPE AS $$
DECLARE
	lAuteur Auteur.nomAuteur%TYPE ;
	nolAuteur Auteur.noAuteur%TYPE;
BEGIN
	SELECT INTO nolAuteur, lAuteur noAuteur, nomAuteur 
	FROM Auteur, Exemplaire, aEcrit
	WHERE noAuteur = unAuteur
	AND leLivre = unLivre
	AND leClient = cli
	GROUP BY noAuteur, nomAuteur
	HAVING COUNT (DISTINCT unLivre) = 
	( SELECT MAX(nbLivre) FROM 
	( SELECT noAuteur, nomAuteur ,COUNT (DISTINCT unLivre) AS nbLivre
	  FROM Auteur, Exemplaire, aEcrit
	WHERE noAuteur = unAuteur
	AND leLivre = unLivre
	AND leClient = cli
	GROUP BY noAuteur, nomAuteur) AS T);
	RETURN lAuteur;
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
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'BD','le lion et le rat',20,'editeur1');
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,1,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),1,NULL,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),2,2,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),2,1,DEFAULT);
INSERT INTO Exemplaire VALUES(NEXTVAL('cleExemplaire'),3,1,DEFAULT);
INSERT INTO Contrat VALUES(1,'editeur1');
INSERT INTO Contrat VALUES(2,'editeur2');
INSERT INTO aEcrit VALUES(1,2);
INSERT INTO aEcrit VALUES(1,3);
INSERT INTO aEcrit VALUES(2,1);



SELECT F_question8(1); -- doit retourner de la Fontaine
