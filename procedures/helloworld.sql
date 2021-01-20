-- Dumping structure for procedure health.hello_world
DELIMITER //
CREATE PROCEDURE `hello_world`()
BEGIN
	SELECT 'Hello World from MySQL' as Message;
END//
DELIMITER ;