CREATE DEFINER=`root`@`localhost` PROCEDURE `while_demo`()
BEGIN
	DECLARE count INT DEFAULT 0;
    DECLARE numbers VARCHAR(30) DEFAULT '';
    
    WHILE count < 10 DO
		SET numbers := CONCAT(numbers, count);
        SET count := count + 1;
    END WHILE;
    SELECT numbers;
END

-- calling the procedure
CALL while_demo();