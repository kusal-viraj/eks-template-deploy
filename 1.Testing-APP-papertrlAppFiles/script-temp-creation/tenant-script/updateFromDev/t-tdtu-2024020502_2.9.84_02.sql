ALTER TABLE vp_payment_type_for_vendor
	DROP COLUMN provider_id;

ALTER TABLE vp_payment_type_for_user
	DROP COLUMN provider_id;

ALTER TABLE vp_payment_bank_account
	ADD COLUMN `account_type` VARCHAR(50) NULL DEFAULT NULL AFTER `digital_card_acc_id`;
 
ALTER TABLE vp_bank_payment_type
	ADD COLUMN `is_default` TINYINT NULL DEFAULT NULL AFTER `bank_account_id`;
 
ALTER TABLE vp_bank_payment_type
	ADD COLUMN `payment_channel_id` INT NULL DEFAULT NULL AFTER `is_default`;