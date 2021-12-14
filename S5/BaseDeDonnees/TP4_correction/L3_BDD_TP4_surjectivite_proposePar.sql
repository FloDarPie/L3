DROP VIEW surjectivite_proposePar;
CREATE VIEW surjectivite_proposePar AS(
SELECT noAgence
FROM Agence
EXCEPT
SELECT DISTINCT lAgence
FROM Vol);

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
INSERT INTO Vol VALUES(NEXTVAL('cleVol'),200,'Toulouse','Rome',2);

SELECT * FROM surjectivite_proposePar; --doit retourner l agence no 1
