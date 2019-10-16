DROP PROCEDURE IF EXISTS `procDoesWorkOnTheDayTime`;

DELIMITER //

CREATE PROCEDURE `procDoesWorkOnTheDayTime` (
    IN in_member_id INT,
    IN day_name VARCHAR( 10 ) CHARACTER SET 'utf8',
    IN time_from CHAR( 5 ) CHARACTER SET 'utf8',
    IN time_to CHAR( 5 ) CHARACTER SET 'utf8',
    OUT res TINYINT( 1 )
)
BEGIN
    DECLARE doesWork INT UNSIGNED DEFAULT 0;

    IF ( day_name = 'monday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `monday_from`, 1, 2 ), SUBSTRING( `monday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `monday_to`, 1, 2 ), SUBSTRING( `monday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSEIF ( day_name = 'tuesday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `tuesday_from`, 1, 2 ), SUBSTRING( `tuesday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `tuesday_to`, 1, 2 ), SUBSTRING( `tuesday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSEIF ( day_name = 'wednesday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `wednesday_from`, 1, 2 ), SUBSTRING( `wednesday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `wednesday_to`, 1, 2 ), SUBSTRING( `wednesday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSEIF ( day_name = 'thursday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `thursday_from`, 1, 2 ), SUBSTRING( `thursday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `thursday_to`, 1, 2 ), SUBSTRING( `thursday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSEIF ( day_name = 'friday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `friday_from`, 1, 2 ), SUBSTRING( `friday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `friday_to`, 1, 2 ), SUBSTRING( `friday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSEIF ( day_name = 'saturday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `saturday_from`, 1, 2 ), SUBSTRING( `saturday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `saturday_to`, 1, 2 ), SUBSTRING( `saturday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSEIF ( day_name = 'sunday' ) THEN
        SELECT COUNT( * ) INTO doesWork FROM `member_schedule` WHERE `member_id` = in_member_id
        AND
        (
            MAKETIME( SUBSTRING( `sunday_from`, 1, 2 ), SUBSTRING( `sunday_from`, 4, 2 ), 0 ) <= MAKETIME( SUBSTRING( time_from, 1, 2 ), SUBSTRING( time_from, 4, 2 ), 0 )
            AND
            MAKETIME( SUBSTRING( `sunday_to`, 1, 2 ), SUBSTRING( `sunday_to`, 4, 2 ), 0 ) >= MAKETIME( SUBSTRING( time_to, 1, 2 ), SUBSTRING( time_to, 4, 2 ), 0 )
        );
    ELSE
        SET doesWork := 0;
    END IF;
    
    IF ( doesWork > 0 ) THEN
        SET res := 1;
    ELSE
        SET res := 0;
    END IF;
END //

DELIMITER ;
