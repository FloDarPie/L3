DROP TRIGGER contrainte_c ON Vol;
DROP FUNCTION F_contrainte_c();

CREATE OR REPLACE FUNCTION F_contrainte_c() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.villeDepart = NEW.villeArrivee THEN
		RAISE NOTICE 'la vile de depart d un vol ne peut etre la ville d arrivee';
		RETURN NULL;
	ELSE
		RETURN NEW;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte_c
	BEFORE INSERT OR UPDATE ON Vol
	FOR EACH ROW
	EXECUTE PROCEDURE F_contrainte_c();
	

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
INSERT INTO Vol VALUES(NEXTVAL('cleVol'),100,'Toulouse','Toulouse',2);


SELECT * FROM Vol;
