DROP TRIGGER contrainte6 ON Emplacement;
DROP FUNCTION F_contrainte6();

CREATE OR REPLACE FUNCTION F_contrainte6() RETURNS TRIGGER AS $$
DECLARE
	ok boolean;
	ligneResa Reservation%ROWTYPE;
BEGIN
	IF ( NEW.leBateau IS NOT NULL and NEW.dateDebut IS NOT NULL and NEW.dateFin IS NOT NULL) THEN
		ok = FALSE;
		FOR ligneResa IN SELECT * FROM Reservation WHERE leBateau = NEW.leBateau
		LOOP
			IF ( NEW.dateDebut = ligneResa.dateDebut AND NEW.dateFin = ligneResa.dateFin) THEN
				ok = TRUE;
			END IF;
		END LOOP;
		IF (ok) THEN
			RETURN NEW;
		ELSE
			RAISE NOTICE 'la reservation n existe pas !!!';
			RETURN NULL;
		END IF;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte6
	BEFORE UPDATE ON Emplacement
	FOR EACH ROW
	EXECUTE PROCEDURE F_contrainte6();
	


-- on vide les tables avant les tests
	
DELETE FROM Reservation;
DELETE FROM Emplacement;
DELETE FROM Bateau;
DELETE FROM Proprietaire;

ALTER SEQUENCE cleProprio RESTART WITH 1;
ALTER SEQUENCE cleEmp RESTART WITH 1;
ALTER SEQUENCE cleResa RESTART WITH 1;

-- on fait les insertions en vue de tester
-- REMARQUE : on insere d'abord dans Emplacement des t-uples ou le bateau n'est pas renseigné
-- ce n'est qu'après avoir inséré un t-uple dans Reservation qu'on peut ensuite modifier un emplacement en y mettant un bateau
-- c'est pourquoi le trigger ne se déclenche qu'à la modification d'un t-uple dela table emplacement



INSERT INTO Proprietaire VALUES(NEXTVAL('cleProprio'), 'toto','toto','toto@gmail.com');
INSERT INTO Bateau VALUES('TY Bateau','monBateau',5,3,1);

INSERT INTO Emplacement VALUES(NEXTVAL('cleEmp'),10,NULL,NULL,NULL);

INSERT INTO Reservation VALUES(NEXTVAL('cleResa'),'10/10/2021','11/10/2021',1,'TY Bateau');

UPDATE Emplacement
SET leBateau = 'TY Bateau',
dateDebut = '10/10/2021',
dateFin = '17/10/2021'
WHERE noEmpl = 1;