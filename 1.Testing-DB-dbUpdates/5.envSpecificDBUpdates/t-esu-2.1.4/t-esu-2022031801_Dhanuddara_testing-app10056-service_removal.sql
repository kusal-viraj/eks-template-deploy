DELETE FROM `common_integration_service_status` WHERE service_id = 1;
DELETE FROM `common_integration_service_status` WHERE service_id = 5;
DELETE FROM `common_integration_service_status` WHERE service_id = 6;
DELETE FROM `common_integration_service_status` WHERE service_id = 7;
DELETE FROM `common_integration_service_status` WHERE service_id = 11;
DELETE FROM `common_integration_service_status` WHERE service_id = 13;
DELETE FROM `common_integration_service_status` WHERE service_id = 14;
DELETE FROM `common_integration_service_status` WHERE service_id = 16;
DELETE FROM `common_integration_service_status` WHERE service_id = 18;
DELETE FROM `common_integration_service_status` WHERE service_id = 21;


DELETE FROM `common_integration_system_service` WHERE service_id = 1 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 5 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 6 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 7 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 11 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 13 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 14 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 16 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 18 AND system_id = 4;
DELETE FROM `common_integration_system_service` WHERE service_id = 21 AND system_id = 4;


UPDATE `common_integration_service_group` SET `visibility` = 0 WHERE `id` = 3;
UPDATE `common_integration_service_group` SET `visibility` = 0 WHERE `id` = 8;
UPDATE `common_integration_service_group` SET `visibility` = 0 WHERE `id` = 10;

