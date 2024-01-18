-- Write a SQL script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store
-- Procedure ComputeAverageScoreForUser is taking 1 input:
-- user_id, a users.id value (you can assume user_id is linked to an existing users)
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$ ;

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE AVG_SCORE INT;
    -- Calculate total score
    UPDATE users SET average_score = (SELECT AVG(score) FROM corrections WHERE corrections.user_id = user_id)
 WHERE id = user_id;
END$$
DELIMITER ;
