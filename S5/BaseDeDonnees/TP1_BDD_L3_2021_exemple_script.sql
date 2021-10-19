-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (17/11/2011 6:35:50)
-- -----------------------------------------------------------------------------
--      Nom de la base : commandes
--      Auteur : Elyes Lamine
--      Date de dernière modification : 17/10/2013 6:35:30
-- -----------------------------------------------------------------------------
-- Ce fichier contient le script destiné à créer la base de données "commandes".
-- Ce script doit être exécuté en tant qu'utilisateur "postgres".

\echo [INFO] Debut du script
\c postgres
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS produit;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS fournisseur;

DROP DATABASE IF EXISTS commandes;

\echo [INFO] Creation de la base de donnees
CREATE DATABASE commandes ENCODING 'UTF8';

\echo [INFO] Connexion a la nouvelle base de donnees
\c commandes


\echo [INFO] Creation de la table client

create table Client 
(numcli int not null,
	nom varchar(20),
	prenom varchar(20),
	datenaiss date,
	rue varchar(30),
	cp int,
	ville varchar(30),
	constraint cle_client primary key (numcli)
);

\echo [INFO] Creation de la table fournisseur
create table fournisseur (
	numfour int not null,
	raisonsoc varchar(40),
	constraint cle_four primary key (numfour)
);

create table Produit (
	numprod int not null,
	desi varchar(40),
	prixuni decimal(6,2),
	numfour int not null constraint fk_numfour references fournisseur (numfour), 
	constraint cle_prod primary key (numprod)
);

create table commande (
	numcli int not null constraint fk_ncli references Client (numcli),
	numprod int not null constraint fk_nprod references Produit (numprod),
	quantite int,
	datec date,
	constraint cle_commande primary key (numcli,numprod)
); 


insert into Client values(1,'Dupont','Albert','1970-06-01','Rue de Crimee',69001,'Lyon');
insert into Client values(2,'West','james','1963-09-03','Studio',0,'Hollywood');
insert into Client values(3,'Martin','Marie','1978-06-05','Rue des Acacias',69130,'Ecully');
insert into Client values(4,'Durand','Gaston','1980-11-15','Rue de la Meuse',69008,'Lyon');
insert into Client values(5,'Titgoutte','Justine','1975-02-28','Chemin du Chateau',69630,'Chaponost');
insert into Client values(6,'Dupond','Noemie','1957-09-18','Rue de Dele',69007,'Lyon');

insert into fournisseur values(11,'Top Jouet');
insert into fournisseur values(12,'Mega fringue');
insert into fournisseur values(13,'Madame Meuble');
insert into fournisseur values(14,'Tout le Sport');

insert into Produit values(101,'Soldat qui tire',50.00,11);
insert into Produit values(102,'Cochon qui rit',50.00,11);
insert into Produit values(103,'poupee qui pleure',100,11);
insert into Produit values(104,'jean',250.00,12);
insert into Produit values(105,'Blouson',350.00,12);
insert into Produit values(106,'Chaussures',200.00,12);
insert into Produit values(107,'T-shirt',100.00,12);
insert into Produit values(108,'Table',500.00,13);
insert into Produit values(109,'Chaise',100.00,13);
insert into Produit values(110,'Armoire',1000,13);
insert into Produit values(111,'Lit',5000.00,13);
insert into Produit values(112,'Raquette de tennis',300.00,14);
insert into Produit values(113,'VTT',699.00,14);
insert into Produit values(114,'Ballon',75.00,14);

insert into commande values(1,110,1,'1999-09-24');
insert into commande values(1,108,1,'1999-09-24');
insert into commande values(1,109,4,'1999-09-24');
insert into commande values(3,101,2,'1999-09-24');
insert into commande values(3,102,1,'1999-09-24');
insert into commande values(4,104,3,'1999-09-24');
insert into commande values(4,105,1,'1999-09-24');
insert into commande values(4,106,2,'1999-09-24');
insert into commande values(4,107,5,'1999-09-24');
insert into commande values(5,114,10,'1999-09-24');
insert into commande values(6,102,2,'1999-09-24');
insert into commande values(6,103,5,'1999-09-24');
insert into commande (numcli,numprod,datec) values(6,114,'1999-09-24');


