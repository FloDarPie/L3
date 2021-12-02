DROP FUNCTION proprioBateau(text);
CREATE OR REPLACE FUNCTION proprioBateau(immBat text)
RETURNS integer AS $$
DECLARE
	res integer;
BEGIN
	SELECT INTO res leProprio FROM Bateau WHERE noImm = immBat;
	RETURN res;
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
INSERT INTO Proprietaire VALUES(NEXTVAL('cleProprio'), 'titi','titi','titi@gmail.com');

INSERT INTO Bateau VALUES('TY Bateau','monBateau',5,3,1);
INSERT INTO Bateau VALUES('Pirate','bateau Pirate',7,3,2);

-- on teste

SELECT proprioBateau('Pirate');