CREATE DEFINER=`root`@`localhost` PROCEDURE `error_handling`(
	IN account_no INT,
    IN amount NUMERIC(7,2),
    OUT success BOOL
)
BEGIN	
    DECLARE current_balance NUMERIC(7,2) DEFAULT 0.0;
    
    -- declare a handler for mysql errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
    END;
    
    -- declare a handler for mysql warning
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
		SHOW WARNINGS;
    END;
    
    START TRANSACTION;
		SELECT balance INTO current_balance FROM accounts WHERE account_number = account_no FOR UPDATE;
		IF current_balance >= amount THEN
			UPDATE accounts SET balance = balance - amount WHERE account_number = account_no;
			SET success := true;
		ELSE
			SET success := false;
		END IF;
    COMMIT;
END

-- an accountNum that does not exit: throws a warning
CALL error_handling(912124,150, @status);