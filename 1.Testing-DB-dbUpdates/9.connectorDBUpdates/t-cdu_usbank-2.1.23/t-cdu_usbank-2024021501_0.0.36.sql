ALTER TABLE `payment_bank_account` 
ADD COLUMN `v_card_account_id` varchar(255) NULL AFTER `company_id`,
ADD COLUMN `d_card_account_id` varchar(255) NULL AFTER `v_card_account_id`;


ALTER TABLE `payment_provider` 
DROP COLUMN `created_by`,
DROP COLUMN `created_on`,
DROP COLUMN `update_by`,
DROP COLUMN `update_on`,
DROP COLUMN `delete_by`,
DROP COLUMN `delete_on`,
CHANGE COLUMN `client_id` `ach_client_id` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `osn`,
ADD COLUMN `check_client_id` varchar(250) NULL AFTER `account_validation_client_id`;

UPDATE `payment_provider` SET `check_client_id` = 'APIPAPERTR' WHERE `id` = 2;


ALTER TABLE `payment_provider_for_customer` 
DROP COLUMN `company_id`;