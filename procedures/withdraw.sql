-- Dumping structure for procedure health.withdraw
DELIMITER //
CREATE PROCEDURE `withdraw`(
	IN account_no INT,
    IN amount NUMERIC(7,2),
    OUT success BOOL
)
BEGIN	
    DECLARE current_balance NUMERIC(7,2) DEFAULT 0.0;
	-- check the current balance of the account
    SELECT balance INTO current_balance FROM accounts WHERE account_number = account_no;
	-- If balance is big enough do the withdrawal
    IF current_balance >= amount THEN
		UPDATE accounts SET balance = balance - amount WHERE account_number = account_no;
        SET success := true;
	ELSE
		SET success := false;
	END IF;
END//
DELIMITER ;