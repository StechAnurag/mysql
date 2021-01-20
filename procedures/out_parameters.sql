-- Dumping structure for procedure health.out_parameters
DELIMITER //
CREATE PROCEDURE `out_parameters`(
	IN theId INT,
    OUT sugarId INT,
    OUT ques VARCHAR(50)
)
BEGIN
	SELECT id, question INTO sugarId, ques FROM sugar WHERE id = theId;
END//
DELIMITER ;
