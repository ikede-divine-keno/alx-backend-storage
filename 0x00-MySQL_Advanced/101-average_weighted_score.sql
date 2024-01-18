-- Write a SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUsers that computes and
-- Procedure ComputeAverageScoreForUser computes for all users:
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$ ;

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN

    -- Update users table with the calculated weighted average score
    UPDATE users
    SET average_score = 
    (SELECT
        SUM(corrections.score * projects.weight) / SUM(projects.weight)  FROM projects
    JOIN corrections ON projects.id = corrections.project_id
    WHERE corrections.user_id = users.id);
END$$
DELIMITER ;
