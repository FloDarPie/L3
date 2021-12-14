DROP TRIGGER contrainte_f ON Auteur;
DROP FUNCTION F_contrainte_f();

CREATE OR REPLACE FUNCTION F_contrainte_f() RETURNS TRIGGER AS $$
DECLARE
    n Auteur.nomAuteur%TYPE;
    p Editeur.nomEditeur%TYPE;
BEGIN
    SELECT UPPER(nomAuteur) INTO n FROM Auteur WHERE UPPER(nomAuteur) = UPPER(NEW.nomEditeur);
    -- test sur le nom Dupont
    IF FOUND OR NEW.nomAuteur='Dupont' THEN
        RAISE NOTICE 'le nom d un Auteur ne peut etre le nom d un Editeur';
        RETURN NULL;
    ELSE
        SELECT UPPER(nomEditeur) INTO p FROM Editeur WHERE UPPER(nomEditeur) = UPPER(NEW.nomAuteur);
        -- test sur le nom Dupont
        IF FOUND OR NEW.nomAuteur='Dupont' THEN
            RAISE NOTICE 'le nom d un Editeur ne peut etre le prenom d un Auteur';
            RETURN NULL;
        ELSE
            RETURN NEW;
        END IF;
    END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte_f
    BEFORE INSERT OR UPDATE ON Client
    FOR EACH ROW
    EXECUTE PROCEDURE F_contrainte_f();
    

-- on vide les tables avant les tests
    
DELETE FROM Editeur;
DELETE FROM Auteur;
DELETE FROM Client;
DELETE FROM Livre;
DELETE FROM Exemplaire;
DELETE FROM Contrat;
DELETE FROM Aecrit;

ALTER SEQUENCE CleClient RESTART WITH 1;
ALTER SEQUENCE cleAuteur RESTART WITH 1;
ALTER SEQUENCE cleLivre RESTART WITH 1;
ALTER SEQUENCE cleExemplaire RESTART WITH 1;

INSERT INTO Editeur VALUES('Dupont','Place de Verdun, Albi');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'Martin','George','mg@hoho.fr');
INSERT INTO Auteur VALUES(NEXTVAL('cleAuteur'),'Martin','Dupont','md@hoho.fr');

SELECT * FROM Editeur;
SELECT * FROM Auteur; -- la deuxiemme insertion est annulée
