ALTER TABLE `vp_credit_card_merchant` 
ADD COLUMN `account_id` int NULL AFTER `name`,
ADD CONSTRAINT `MERCHANT_ACCOUNT_FK` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`);