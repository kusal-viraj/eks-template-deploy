---------Dhanuddara------2.3.95------------

ALTER TABLE `tp_integration_system_grant_type` 
ADD COLUMN `value` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `name`;


UPDATE `tp_integration_system_grant_type` SET `name` = 'Authentication Code', `value` = 'authorization_code', `status` = 'A' WHERE `id` = 1;
UPDATE `tp_integration_system_grant_type` SET `name` = 'Password', `value` = 'password', `status` = 'A' WHERE `id` = 2;

ALTER TABLE `tp_integration_system` 
ADD COLUMN `api_subscription_key` varchar(500) NULL AFTER `delete_on`;