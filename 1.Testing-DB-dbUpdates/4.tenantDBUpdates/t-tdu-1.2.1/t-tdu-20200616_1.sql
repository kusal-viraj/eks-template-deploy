ALTER TABLE `ar_opportunity_audit_trial` MODIFY COLUMN `comment` varchar(350) NULL DEFAULT NULL AFTER `user_name`;
ALTER TABLE `ar_project_audit_trial` MODIFY COLUMN `comment` varchar(350) NULL DEFAULT NULL AFTER `user_name`;
ALTER TABLE `ar_proposal_audit_trial` MODIFY COLUMN `comment` varchar(350) NULL DEFAULT NULL AFTER `user_name`;
ALTER TABLE `vp_purchase_order_audit_trail` MODIFY COLUMN `comment` varchar(350) NULL DEFAULT NULL AFTER `user_name`;
ALTER TABLE `vp_expense_audit_trail` MODIFY COLUMN `comment` varchar(350) NULL DEFAULT NULL AFTER `user_name`;