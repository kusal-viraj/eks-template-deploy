ALTER TABLE `payment_bank_account` 
ADD COLUMN `v_card_account_id` varchar(255) NULL AFTER `company_id`,
ADD COLUMN `d_card_account_id` varchar(255) NULL AFTER `v_card_account_id`;
