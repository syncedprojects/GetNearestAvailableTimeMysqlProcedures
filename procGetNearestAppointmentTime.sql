DROP PROCEDURE IF EXISTS `procGetNearestAppointmentTime`;

DELIMITER //

CREATE PROCEDURE `procGetNearestAppointmentTime` (
    IN in_member_id INT,
    OUT out_time DATETIME
)
BEGIN
    DECLARE nearestTime DATETIME;
    DECLARE initialDayName VARCHAR( 10 ) CHARACTER SET 'utf8';
    DECLARE initialDayTime CHAR( 5 ) CHARACTER SET 'utf8';
    DECLARE dayName VARCHAR( 10 ) CHARACTER SET 'utf8';
    DECLARE dayTime CHAR( 5 ) CHARACTER SET 'utf8';
    DECLARE dayTimeTo CHAR( 5 ) CHARACTER SET 'utf8';
    DECLARE firstCycle TINYINT( 1 );
    DECLARE doesWork TINYINT( 1 );
    DECLARE hasAppointment TINYINT( 1 );

    DECLARE outTime DATETIME;

    CALL procGetNearestTimeToNow( nearestTime );

    SELECT LOWER( DAYNAME( nearestTime ) ) INTO initialDayName;
    SELECT TIME_FORMAT( nearestTime, '%H:%i' ) INTO initialDayTime;
    SET firstCycle := 1;


    theLoop: WHILE ( 1 ) DO

        SELECT LOWER( DAYNAME( nearestTime ) ) INTO dayName;
        SELECT TIME_FORMAT( nearestTime, '%H:%i' ) INTO dayTime;

        IF ( firstCycle = 0 AND ( initialDayName = dayName AND initialDayTime = dayTime ) ) THEN
            SELECT NULL INTO outTime;
            LEAVE theLoop;
        END IF;

        CALL procAddMinutesToTime( dayTime, 29, dayTimeTo );
        CALL procDoesWorkOnTheDayTime( in_member_id, dayName, dayTime, dayTimeTo, doesWork );
        IF ( doesWork = 1 ) THEN

            CALL procHasAppointmentOnTheDayTime( in_member_id, nearestTime, hasAppointment );

            IF ( hasAppointment = 1 ) THEN
                CALL procAddMinutesToDatetime( nearestTime, 30, nearestTime );
                ITERATE theLoop;
            ELSE
                SET outTime := nearestTime;
                LEAVE theLoop;
            END IF;
        ELSE
            CALL procAddMinutesToDatetime( nearestTime, 30, nearestTime );
        END IF;
    
        SET firstCycle := 0;
    
    END WHILE theLoop;
    
    SET out_time := outTime;
END //

DELIMITER ;
