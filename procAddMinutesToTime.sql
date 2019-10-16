DROP PROCEDURE IF EXISTS `procAddMinutesToTime`;

DELIMITER //

CREATE PROCEDURE `procAddMinutesToTime` (
    IN in_time CHAR( 5 ) CHARACTER SET 'utf8',
    IN in_minutes INT,
    OUT out_time CHAR( 5 ) CHARACTER SET 'utf8'
)
BEGIN
    DECLARE outTime CHAR( 5 ) CHARACTER SET 'utf8';
    
    SELECT TIME_FORMAT( MAKETIME( SUBSTRING( in_time, 1, 2 ), SUBSTRING( in_time, 4, 2 ), 0 ) + INTERVAL in_minutes MINUTE, '%H:%i' ) INTO outTime;
    
    SET out_time := outTime;
END //

DELIMITER ;
