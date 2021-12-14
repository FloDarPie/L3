DROP FUNCTION question5(integer);
CREATE OR REPLACE FUNCTION question5(cli integer)
RETURNS integer AS $$
DECLARE
	res integer;
BEGIN
	SELECT INTO res SUM(nbBillets*prixVol) FROM Reserve, Vol WHERE unVol = noVol AND unClient = cli;
	RETURN res;
END; $$ LANGUAGE 'plpgsql' ;

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
INSERT INTO Vol VALUES(NEXTVAL('cleVol'),100,'Paris','Toulouse',2);
INSERT INTO Vol VALUES(NEXTVAL('cleVol'),150,'Paris','Rome',2);
INSERT INTO Reserve VALUES(1,1,DEFAULT,2);
INSERT INTO Reserve VALUES(2,1,DEFAULT,2);
INSERT INTO Reserve VALUES(3,1,DEFAULT,3);

SELECT question5(1); -- doit retourner 850
