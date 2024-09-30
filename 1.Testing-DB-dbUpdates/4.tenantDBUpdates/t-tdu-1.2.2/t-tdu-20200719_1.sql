ALTER TABLE `common_additional_field`
MODIFY COLUMN `value` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci
NULL DEFAULT NULL AFTER `row_count`;

ALTER TABLE `vp_purchase_order_additional_field_attachments`
MODIFY COLUMN `file_type` varchar(100) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `file_name`;

ALTER TABLE `vp_expense_additional_field_attachments`
MODIFY COLUMN `file_type` varchar(100) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `file_name`;

ALTER TABLE `vp_grn_additional_field_attachments`
MODIFY COLUMN `file_type` varchar(100) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `file_name`;

ALTER TABLE `vp_expense_additional_data`
MODIFY COLUMN `field_value` varchar(300) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `id`;

ALTER TABLE `vp_purchase_order_additional_data`
MODIFY COLUMN `field_value` varchar(300) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `id`;

ALTER TABLE `vp_grn_additional_data`
MODIFY COLUMN `field_value` varchar(300) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `id`;



