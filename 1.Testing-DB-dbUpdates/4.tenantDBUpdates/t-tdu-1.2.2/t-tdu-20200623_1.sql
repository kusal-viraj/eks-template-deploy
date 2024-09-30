ALTER TABLE `vp_expense_attachments`
MODIFY COLUMN `description` varchar(200) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL AFTER `deleted_on`;
