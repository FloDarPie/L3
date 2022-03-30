\echo [Question 4] - 
DROP FUNCTION F_question4();

CREATE OR REPLACE FUNCTION F_question4(numero INT) 
RETURNS SETOF Hopital.nomHopital%TYPE AS $$
BEGIN
    --SELECT lHopital FROM Service WHERE Service.noService =
    (
    SELECT leService FROM Medecin WHERE Medecin.noMed = numero
    );
	RETURN;
END; $$LANGUAGE 'plpgsql';

\i insertions.sql

SELECT F_question4(1);
SELECT F_question4(2);