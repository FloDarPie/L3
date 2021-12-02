DROP TRIGGER contrainte7 ON Emplacement;
DROP FUNCTION F_contrainte7();

CREATE OR REPLACE FUNCTION F_contrainte7() RETURNS TRIGGER AS $$
DECLARE
	longBat INTEGER;
	LongEmp INTEGER;
BEGIN
	SELECT longueur INTO longEmp FROM Emplacement WHERE noEmpl = NEW.lEmplacement;
	SELECT longueurB INTO longBat FROM Bateau WHERE noImm = NEW.leBateau;
	IF (longBat > longEmp) THEN
		RAISE NOTICE 'la longueur de lemplacement choisi doit être superieure a la longueur du Bateau';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;

END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte7
	BEFORE INSERT OR UPDATE ON Reservation
	FOR EACH ROW
	EXECUTE PROCEDURE F_contrainte7();
	


-- on vide les tables avant les tests
	
DELETE FROM Reservation;
DELETE FROM Emplacement;
DELETE FROM Bateau;
DELETE FROM Proprietaire;

ALTER SEQUENCE cleProprio RESTART WITH 1;
ALTER SEQUENCE cleEmp RESTART WITH 1;
ALTER SEQUENCE cleResa RESTART WITH 1;

-- on fait les insertions en vue de tester

INSERT INTO Proprietaire VALUES(NEXTVAL('cleProprio'), 'toto','toto','toto@gmail.com');
INSERT INTO Bateau VALUES('TY Bateau','monBateau',5,3,1);

INSERT INTO Emplacement VALUES(NEXTVAL('cleEmp'),10,NULL,NULL,NULL);
INSERT INTO Emplacement VALUES(NEXTVAL('cleEmp'),4,NULL,NULL,NULL);

INSERT INTO Reservation VALUES(NEXTVAL('cleResa'),'10/10/2021','11/10/2021',1,'TY Bateau');
INSERT INTO Reservation VALUES(NEXTVAL('cleResa'),'10/12/2021','11/12/2021',2,'TY Bateau');