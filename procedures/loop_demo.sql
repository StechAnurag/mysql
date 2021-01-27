CREATE DEFINER=`root`@`localhost` PROCEDURE `loop_demo`()
BEGIN
	DECLARE count INT DEFAULT 0;
    DECLARE numberList VARCHAR(30) DEFAULT '';
    
    the_loop : LOOP
		IF count = 10 THEN
			LEAVE the_loop;
        END IF;
        
        SET numberList := CONCAT(numberList, count);
        IF count != 9 THEN
			SET numberList := CONCAT(numberList, ', ');
        END IF;
        -- SET numberList := CONCAT(numberList, count, ', ');
        SET count := count + 1;
    END LOOP;
    
    SELECT numberList;
END
-- calling the procedure
CALL loop_demo();