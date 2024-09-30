ALTER TABLE `common_integration_failed_record` 
ADD COLUMN `papertrl_id` int NULL AFTER `tp_id`;

ALTER TABLE `common_integration_failed_record` 
MODIFY COLUMN `tp_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `id`;