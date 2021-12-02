DROP TRIGGER contrainte5 ON Emplacement;
DROP FUNCTION F_contrainte5();

CREATE OR REPLACE FUNCTION F_contrainte5() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.dateDebut > NEW.dateFin THEN
		RAISE NOTICE 'la date debut doit etre anterieure à la dateFin';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte5
	BEFORE INSERT OR UPDATE ON Emplacement
	FOR EACH ROW
	EXECUTE PROCEDURE F_contrainte5();

-- on vide les tables avant les tests
	
DELETE FROM Reservation;
DELETE FROM Emplacement;
DELETE FROM Bateau;
DELETE FROM Proprietaire;

ALTER SEQUENCE cleProprio RESTART WITH 1;
ALTER SEQUENCE cleEmp RESTART WITH 1;
ALTER SEQUENCE cleResa RESTART WITH 1;

-- on fait les insertions en vue de tester
	
INSERT INTO Emplacement VALUES(1,10, null, '12/10/2021','11/10/2021');	
INSERT INTO Emplacement VALUES(2,10, null, '10/10/2021','11/10/2021');

-- on verifie que seule la deuxieme insertion a été réalisée

SELECT * FROM Emplacement;