ALTER TABLE `payment_provider` 
ADD COLUMN `account_validation_client_id` varchar(250) NULL AFTER `delete_on`;

UPDATE `payment_provider` SET `account_validation_client_id` = 'USBTreas' WHERE `id` = 2;

UPDATE `payment_type_for_provider` SET `payment_type` = 50 WHERE `id` = 7;

INSERT INTO `payment_type_for_provider`(`status`, `short_code`, `payment_type`, `provider_credential_id`) VALUES ('A', 'AVS', 51, 2);



