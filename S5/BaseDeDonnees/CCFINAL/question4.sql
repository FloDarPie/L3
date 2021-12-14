DROP TRIGGER contrainte4 ON Livre;
DROP FUNCTION F_contrainte4();

CREATE OR REPLACE FUNCTION F_contrainte4() RETURNS TRIGGER AS $$
BEGIN
        IF (NEW.prix > 1.1 * OLD.prix) THEN
            RAISE NOTICE 'Le prix ne peux être augmenter de plus de 10%.';
            RETURN NULL;
        ELSE
            RETURN NEW;
        END IF;
END; $$LANGUAGE 'plpgsql';

CREATE TRIGGER contrainte4
    BEFORE UPDATE ON Livre
    FOR EACH ROW
    EXECUTE PROCEDURE F_contrainte4();

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

-- on fait les insertions en vue de tester
    
INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'BD', 'Asterix', 13, 'Flammarion');
UPDATE Livre
SET prix = 14
WHERE noLivre = 1;

INSERT INTO Livre VALUES(NEXTVAL('cleLivre'),'POCHE', 'Fondations', 8, 'Bragelonne');
SELECT * FROM Livre;
UPDATE Livre
SET prix = 140
WHERE noLivre = 1;

-- on verifie que seule la première insertion a été réalisée

SELECT * FROM Livre;
