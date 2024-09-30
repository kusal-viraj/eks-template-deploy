-----Deshan--2.8.57----

ALTER TABLE `vendor_payment_recipient_detail`
	ADD COLUMN `remittance_email_address` VARCHAR(150) NULL DEFAULT '' AFTER `preferred_payment_type`;
	
ALTER TABLE `vendor_payment_recipient_detail`
	CHANGE COLUMN `account_routing_number` `account_routing_number` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `account_type`,
	ADD COLUMN `encoded_account_routing_number` VARCHAR(100) NULL DEFAULT NULL AFTER `account_routing_number`,
	ADD COLUMN `encoded_account_number` VARCHAR(100) NULL DEFAULT NULL AFTER `account_number`;