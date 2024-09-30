ALTER TABLE `payment_customer_wise_config_value` 
CHANGE COLUMN `account_id` `vcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `routing_number`,
ADD COLUMN `dcard_account_id` varchar(75) NULL AFTER `payment_account_token`;

UPDATE `payment_configuration` SET `payment_type_id` = 3, `field_caption` = 'Virtual Card Account ID', `field_name` = 'vcardAccountId', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '^[0-9*]+$', `max_length` = 12, `attribute_name` = 'paymentAccountID' WHERE `id` = 4;

INSERT INTO `payment_configuration`(`id`, `payment_type_id`, `field_caption`, `field_name`, `sort_order`, `status`, `required`, `data_type`, `max_length`, `attribute_name`) VALUES (5, 3, 'Digital Card Account ID', 'dcardAccountId', 1, 'A', 1, '^[0-9*]+$', 12, 'paymentAccountID');
