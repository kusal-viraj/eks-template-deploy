---danuddara 0.0.41--


ALTER TABLE `payment_transaction` 
ADD COLUMN `provider_id` int NULL AFTER `tp_id`;

ALTER TABLE `payment_configuration` 
ADD COLUMN `provider_id` int NOT NULL AFTER `attribute_name`;

ALTER TABLE `payment_customer_wise_config_value` 
ADD COLUMN `provider_id` int NOT NULL AFTER `dcard_account_id`;


ALTER TABLE `payment_provider_for_customer` 
DROP COLUMN `created_by`,
DROP COLUMN `created_on`,
DROP COLUMN `update_by`,
DROP COLUMN `update_on`,
DROP COLUMN `delete_by`,
DROP COLUMN `delete_on`;

ALTER TABLE `payment_provider_for_customer` 
ADD COLUMN `provider_id` int NULL AFTER `base_url`;


INSERT INTO `payment_provider`(`id`, `name`, `status`, `description`, `logo_image`, `osn`, `ach_client_id`, `account_validation_client_id`, `check_client_id`) VALUES (4, 'Elan', 'A', 'Elan provides corporate and virtual credit cards and payment services that reduce costs, improve oversight and control, and optimize cash flow.', NULL, '7STRNG', NULL, NULL, NULL);


UPDATE `payment_provider_for_customer` SET `provider_id` = 2;