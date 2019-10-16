DROP PROCEDURE IF EXISTS `procHasAppointmentOnTheDayTime`;

DELIMITER //

CREATE PROCEDURE `procHasAppointmentOnTheDayTime` (
    IN in_member_id INT,
    IN nearestTime DATETIME,
    OUT res TINYINT( 1 )
)
BEGIN
    DECLARE hasAppointment INT UNSIGNED DEFAULT 0;

    SELECT COUNT( * ) INTO hasAppointment FROM `appointments` WHERE `acceptor_id` = in_member_id
    AND `type` = 'chat' AND TIMESTAMP( `date_from` ) <= nearestTime AND TIMESTAMP( `date_to` ) >= nearestTime;

    IF ( hasAppointment > 0 ) THEN
        SET res := 1;
    ELSE
        SET res := 0;
    END IF;
END //

DELIMITER ;
