DROP PROCEDURE IF EXISTS `procAddMinutesToDatetime`;

DELIMITER //

CREATE PROCEDURE `procAddMinutesToDatetime` (
    IN in_datetime DATETIME,
    IN in_minutes INT,
    OUT out_datetime DATETIME
)
BEGIN
    DECLARE outTime DATETIME;
    
    SELECT DATE_FORMAT( DATE_ADD( in_datetime, INTERVAL in_minutes MINUTE ), '%Y-%m-%d %H:%i' ) INTO outTime;
    
    SET out_datetime := outTime;
END //

DELIMITER ;
