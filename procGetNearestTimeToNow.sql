DROP PROCEDURE IF EXISTS `procGetNearestTimeToNow`;

DELIMITER //

CREATE PROCEDURE `procGetNearestTimeToNow` (
    OUT out_time DATETIME
)
BEGIN
    DECLARE currentTime DATETIME;
    DECLARE currentMinute INT;
    DECLARE nearestTime DATETIME;

    SELECT NOW() INTO currentTime;
    SELECT DATE_FORMAT( currentTime, '%i' ) INTO currentMinute;

    IF ( currentMinute < 30 ) THEN
        SELECT DATE_FORMAT( DATE_ADD( currentTime, INTERVAL 30 MINUTE ), '%Y-%m-%d %H:30' ) INTO nearestTime;
    ELSE
        SELECT DATE_FORMAT( DATE_ADD( currentTime, INTERVAL 1 HOUR ), '%Y-%m-%d %H:00' ) INTO nearestTime;
    END IF;
    
    SET out_time := nearestTime;
END //

DELIMITER ;
