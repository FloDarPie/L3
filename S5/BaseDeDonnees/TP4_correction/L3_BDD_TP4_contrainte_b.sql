DROP TRIGGER contrainte_b ON Vol;
DROP FUNCTION F_contrainte_b();

CREATE OR REPLACE FUNCTION F_contrainte_b() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.prixVol > 1.1*OLD.prixVol THEN
		RAISE NOTICE 'l augmentation de prix du vol ne peut pas depasser 10 pour cent';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte_b
	BEFORE UPDATE ON Vol
	FOR EACH ROW
	EXECUTE PROCEDURE F_contrainte_b();
	

-- on vide les tables avant les tests
	
DELETE FROM Reserve;
DELETE FROM Vol;
DELETE FROM Agence;
DELETE FROM Ville;
DELETE FROM Client;

ALTER SEQUENCE cleClient RESTART WITH 1;
ALTER SEQUENCE cleVol RESTART WITH 1;
ALTER SEQUENCE cleAgence RESTART WITH 1;

INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Dupond','Martin');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Skywalker','luc');
INSERT INTO Ville VALUES('Albi','France');
INSERT INTO Ville VALUES('Toulouse','France');
INSERT INTO Ville VALUES('Paris','France');
INSERT INTO Ville VALUES('Rome','Italie');
INSERT INTO Agence VALUES(NEXTVAL('cleAgence'),'3 rue champollion','Albi');
INSERT INTO Agence VALUES(NEXTVAL('cleAgence'),'23 rue du general Juin','Toulouse');
INSERT INTO Vol VALUES(NEXTVAL('cleVol'),100,'Toulouse','Paris',2);

-- un update qui passe

UPDATE Vol 
SET prixVol = 109
WHERE noVol = 1;

-- un update qui passe pas

UPDATE Vol 
SET prixVol = 120
WHERE noVol = 1;

SELECT * FROM Vol;
