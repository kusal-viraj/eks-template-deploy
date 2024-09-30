ALTER TABLE `common_integration_failed_record`
ADD COLUMN `reference_number`  varchar(255) NULL DEFAULT NULL AFTER `failed_reason`,
ADD COLUMN `system_id`  int(11) NOT NULL AFTER `exception_message`,
ADD COLUMN `system_name`  varchar(50) NOT NULL AFTER `system_id`;


INSERT INTO `common_integration_service` VALUES (23, 'Expense push', 'A');


/*-----DROP QUERY------*/
DROP TABLE  `common_system_sync_property`;