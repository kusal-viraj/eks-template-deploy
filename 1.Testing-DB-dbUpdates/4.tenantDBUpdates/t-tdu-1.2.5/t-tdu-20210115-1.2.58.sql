ALTER TABLE `vp_expense_detail`
MODIFY COLUMN `file_name`  varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `expense_date`;