DELETE FROM Concerne;
DELETE FROM Dossier;
DELETE FROM Medecin;
DELETE FROM Service;
DELETE FROM Hopital;
DELETE FROM Maladie;

INSERT INTO Maladie VALUES
('maladie1','symptome1'),
('maladie2','symptome2'),
('maladie3','symptome3'),
('maladie4','symptome4'),
('maladie5','symptome5')
;

INSERT INTO Hopital VALUES
('hopital1','adresse1'),
('hopital2','adresse2');

INSERT INTO Service VALUES
(1,'service1','hopital1'),
(2,'service2','hopital1'),
(3,'service1','hopital2'),
(4,'service2','hopital2');

INSERT INTO Medecin VALUES
(1,'nom1','prenom1',3000,1),
(2,'nom2','prenom2',3000,1),
(3,'nom3','prenom3',3000,2),
(4,'nom4','prenom4',3000,2),
(5,'nom5','prenom5',3000,3),
(6,'nom6','prenom6',3000,3),
(7,'nom7','prenom7',3000,4);


INSERT INTO Dossier VALUES
(1,'nomP1','adresseP1','02/03/2022',1),
(2,'nomP2','adresseP2','02/03/2022',1),
(3,'nomP3','adresseP3','02/03/2022',2),
(4,'nomP4','adresseP4','02/03/2022',3),
(5,'nomP5','adresseP5','02/03/2022',4),
(6,'nomP6','adresseP6','02/03/2022',4),
(7,'nomP7','adresseP7','02/03/2022',5),
(8,'nomP8','adresseP8','02/03/2022',6),
(9,'nomP9','adresseP9','02/03/2022',7),
(10,'nomP10','adresseP10','02/03/2022',7),
(11,'nomP11','adresseP11','02/03/2022',7),
(12,'nomP12','adresseP12','02/03/2022',6);

INSERT INTO Concerne VALUES
(1,'maladie1'),
(2,'maladie2'),
(3,'maladie3'),
(4,'maladie4'),
(5,'maladie5'),
(6,'maladie5');