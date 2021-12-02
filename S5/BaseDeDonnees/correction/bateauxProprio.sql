DROP FUNCTION BateauxProprio(integer);
CREATE OR REPLACE FUNCTION BateauxProprio(idPro integer )
RETURNS SETOF Bateau.noImm%TYPE AS $$
DECLARE
	unBat Bateau.noImm%TYPE ;
BEGIN
	FOR unBat IN SELECT noImm FROM Bateau WHERE leProprio = idPro
	LOOP
		RETURN NEXT unBat;
	END LOOP;
	RETURN;
END; $$ LANGUAGE 'plpgsql' ;

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
INSERT INTO Bateau VALUES('Pirate','bateau Pirate',7,3,1);

-- on teste

SELECT BateauxProprio(1);