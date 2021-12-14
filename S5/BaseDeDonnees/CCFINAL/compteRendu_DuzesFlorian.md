# L3 Base de Données
### Contrôle final  
## Construction du Schéma relationnel et des contraintes
# --------------------------------------
.  
**1) Construction du schema relationnel**  

##### Table Editeur _ 1NF
> nomEditeur(PK)  
> adresse (NOT NULL)  

##### Table Auteur _ 1NF
> noAuteur (PK)  
> nomAuteur  
> prenomAuteur
> emailAuteur (NOT NULL UNIQUE)  

##### Table Client _ 1NF
> noClient (PK)  
> nomClient  
> prenomClient  
> emailClient (NOT NULL UNIQUE)  

##### Table Livre _ 1NF
> noLivre (PK)  
> typeLivre  
> titre  
> prix (NOT NULL)  
> lEditeur(NOT NULL)

##### Table Exemplaire _ 2NF
> noExemplaire (PK)  
> `#`leLivre (NOT NULL)  
> `#`leClient  
> dateAchat

##### Table Contrat _ 2NF
> `#`unAuteur  
> `#`unEditeur  

##### Table Aecrit _ 2NF
> `#`unAuteur  
> `#`unLivre

.  
.  
**Etude des Contraintes**  
a) Un éditeur doit forcément avoir une adresse. **NOT NULL***sur la table Editeur au champs adresse*  
.  
b) Les clients et les auteurs ont forcément un email, unique pour les auteurs et les clients. **NOT NULL UNIQUE***sur la table Client au champs emailClient et sur la table Auteur au champs emailAuteur*     
.  
c) la date d'achat est par défaut la date du jour. **TRIGGER**  
.  
d) le type d'un livre est soit BD soit POCHE. **CONSTRAINT**  
.  
e) Le prix d'un livre est renseigné et ne doit pas pouvoir être augmenté de plus de 10 pour cent. **TRIGGER UPDATE**  
.  
f) Un auteur ne doit pas porter le même nom que son éditeur. **TRIGGER INSERT***on verifie a l'ajout d'un contrat si le nomAuteur et le nomEditeur son different*  
.  
g) Un livre écrit par un auteur ne peut être édité que par un éditeur chez qui l’auteur a un contrat. **TRIGGER INSERT***verification de la table Aecrit : on reqaurque sur le contrat de l'auteur si l'éditeur et celui du livre son les mêmes*   



A la fin de la Construction de la table, il reste les contraintes c), e), f) et g)
