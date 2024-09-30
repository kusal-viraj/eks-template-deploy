DELETE FROM vp_payment_transaction_audit_trial_data;

RENAME TABLE vp_payment_transaction_audit_trial_data TO vp_payment_v_card_audit_trial;

ALTER TABLE `vp_payment_v_card_audit_trial` 
DROP COLUMN `audit_trial_id`,
DROP COLUMN `request`,
DROP COLUMN `response`,
DROP COLUMN `attempt`,
DROP COLUMN `created_on`,
ADD COLUMN `action_date` datetime(0) NOT NULL AFTER `id`,
ADD COLUMN `status_id` int NOT NULL AFTER `action_date`,
ADD COLUMN `user_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `status_id`,
ADD COLUMN `user_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `user_id`,
ADD COLUMN `comment` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `user_name`,
ADD COLUMN `card_id` int NOT NULL AFTER `comment`,
ADD COLUMN `transaction_ref_no` varchar(150) NULL AFTER `card_id`,
ADD COLUMN `balance_amount` decimal(11, 2) NULL AFTER `transaction_ref_no`,
ADD COLUMN `amount` decimal(11, 2) NULL AFTER `balance_amount`,
ADD COLUMN `merchant_name` varchar(100) NULL AFTER `amount`,
ADD COLUMN `merchant_id` varchar(100) NULL AFTER `merchant_name`;

ALTER TABLE `vp_payment_v_card_audit_trial` 
ADD CONSTRAINT `cardId` FOREIGN KEY (`card_id`) REFERENCES `vp_payment_v_card` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;



INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (49, 'The card has been successfully created', 1, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (50, 'The card has been topped up', 2, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (51, 'The effective until date of the card has been updated', 3, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (52, 'The vendor has redeemed an amount on the card', 4, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (53, 'The card top-up attempt was unsuccessful', 5, 'fa-fa-check', 'bg-blue');
