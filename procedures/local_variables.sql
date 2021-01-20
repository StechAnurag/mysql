-- Dumping structure for procedure health.local_variables
DELIMITER //
CREATE PROCEDURE `local_variables`(IN flag BOOL)
BEGIN
	DECLARE test INT;
    DECLARE current_balance NUMERIC(7,2) DEFAULT 0.0;
    
    SET test := 7;
    SELECT test, current_balance;
END//
DELIMITER ;