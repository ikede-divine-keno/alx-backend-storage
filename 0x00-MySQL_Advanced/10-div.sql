-- Write a SQL script that creates a function SafeDiv that divides
-- (and returns) the first by the second number
DROP FUNCTION IF EXISTS SafeDiv;
DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT -- Adjust the precision and scale as needed
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a / b;
    END IF;
END//

DELIMITER ;
