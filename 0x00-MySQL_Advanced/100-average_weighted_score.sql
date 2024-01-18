-- Write a SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUser that computes and
-- Procedure ComputeAverageScoreForUser is taking 1 input:
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$ ;

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE WEIGHTG_AVG_SCORE FLOAT;
    -- Calculate total score
   -- Calculate total score
    SELECT
        SUM(corrections.score * projects.weight) / SUM(projects.weight)
    INTO WEIGHTG_AVG_SCORE
    FROM corrections
    JOIN projects ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    -- Update users table with the calculated weighted average score
    UPDATE users
    SET average_score = IFNULL(WEIGHTG_AVG_SCORE, 0)
    WHERE id = user_id;
END$$
DELIMITER ;
