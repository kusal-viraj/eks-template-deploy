ALTER TABLE `umm_user_role_relation`
	ADD COLUMN `status` CHAR(1) NULL DEFAULT NULL AFTER `role_id`;

DELIMITER //

CREATE PROCEDURE UpdateAllUserRolesStatus()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE roleIdVar INT;
    DECLARE statusVar CHAR(1);

    DECLARE roleStatusCursor CURSOR FOR SELECT id,status FROM umm_role_mst;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
    OPEN roleStatusCursor;

    read_loop: LOOP
        FETCH roleStatusCursor INTO roleIdVar, statusVar;

        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE umm_user_role_relation
        SET status = statusVar
        WHERE role_id = roleIdVar;
    END LOOP;

    CLOSE roleStatusCursor;
END //

DELIMITER ;

CALL UpdateAllUserRolesStatus();

DROP PROCEDURE IF EXISTS UpdateAllUserRolesStatus;