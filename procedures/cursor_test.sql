CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_test`()
BEGIN
	DECLARE the_email VARCHAR(50); -- default initialization is null
    DECLARE registered_date DATE;
    DECLARE cursor1 CURSOR FOR SELECT email, registered FROM users ORDER BY id;
    
    OPEN cursor1;
		-- by default cursor returns the first row value in the result set
		FETCH cursor1 INTO the_email, registered_date;
    CLOSE cursor1;
    
    SELECT the_email, registered_date;
END

call cursor_test();