----Dhanuddara----2.4.7---------

ALTER TABLE `tp_integration_mst` 
ADD COLUMN `tp_tenant_id` varchar(300) NULL AFTER `api_subscription_key`;

UPDATE `tp_integration_system` SET `name` = 'Business Central V15' WHERE `id` = 4;

INSERT INTO `tp_integration_system`(`name`, `client_id`, `client_secret`, `type_id`, `auth_type_id`, `grant_type_id`, `scope`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`, `api_subscription_key`) VALUES ('Business Central Cloud', NULL, NULL, 1, 3, NULL, NULL, 'A', 'support', '2021-06-29 00:03:48', NULL, NULL, NULL, NULL, NULL);
