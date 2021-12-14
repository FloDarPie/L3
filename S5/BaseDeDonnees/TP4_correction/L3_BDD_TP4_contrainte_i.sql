DROP TRIGGER contrainte_i ON Client;
DROP FUNCTION F_contrainte_i();

CREATE OR REPLACE FUNCTION F_contrainte_i() RETURNS TRIGGER AS $$
DECLARE
	n Client.nomC%TYPE;
	p Client.prenomC%TYPE;
BEGIN
	SELECT UPPER(nomC) INTO n FROM Client WHERE UPPER(nomC) = UPPER(NEW.prenomC);
	IF FOUND THEN
		RAISE NOTICE 'le nom d un client ne peut etre le prenom d un client';
		RETURN NULL;
	ELSE
		SELECT UPPER(prenomC) INTO p FROM Client WHERE UPPER(prenomC) = UPPER(NEW.nomC);
		IF FOUND THEN
			RAISE NOTICE 'le nom d un client ne peut etre le prenom d un client';
			RETURN NULL;
		ELSE
			RETURN NEW;
		END IF;
	END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte_i
	BEFORE INSERT OR UPDATE ON Client
	FOR EACH ROW
	EXECUTE PROCEDURE F_contrainte_i();
	

-- on vide les tables avant les tests
	
DELETE FROM Reserve;
DELETE FROM Vol;
DELETE FROM Agence;
DELETE FROM Ville;
DELETE FROM Client;

ALTER SEQUENCE cleClient RESTART WITH 1;
ALTER SEQUENCE cleVol RESTART WITH 1;
ALTER SEQUENCE cleAgence RESTART WITH 1;

INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Dupont','Martin');
INSERT INTO Client VALUES(NEXTVAL('cleClient'),'Martin','luc');


SELECT * FROM Client; -- la deuxiemme insertion est annulée
