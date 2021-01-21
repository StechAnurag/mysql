DELIMITER //
CREATE PROCEDURE `transactional_withdraw`(
	IN account_no INT,
    IN amount NUMERIC(7,2),
    OUT success BOOL
)
BEGIN	
    DECLARE current_balance NUMERIC(7,2) DEFAULT 0.0;
    START TRANSACTION;
		-- check the current balance of the account and put a lock on it
		SELECT balance INTO current_balance FROM accounts WHERE account_number = account_no FOR UPDATE;
		-- FOR UPDATE keywords put a lock on the selected row
        -- [Note - Put an index on balance column for efficiency]
		IF current_balance >= amount THEN
			UPDATE accounts SET balance = balance - amount WHERE account_number = account_no;
			SET success := true;
		ELSE
			SET success := false;
		END IF;
    COMMIT;
END//
DELIMITER ;

CALL transactional_withdraw(900123, 120, @status);
SELECT @status;