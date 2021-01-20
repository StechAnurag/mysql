-- Dumping structure for procedure health.set_variables
DELIMITER //
CREATE PROCEDURE `set_variables`(
	IN given_id INT
)
BEGIN
	#Method: 1
	-- SELECT @id := id, @ques := question FROM drink WHERE id = given_id;
    
    #Method: 2 (more prefered)
    SELECT id, question INTO @id, @question FROM drink WHERE id = given_id;
    SELECT @id, @question;
END//
DELIMITER ;