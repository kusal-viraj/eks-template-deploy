UPDATE `common_automation_event` SET `event_name` = 'Mark as Mailed' WHERE `event_name` = 'Mark as Mail';

UPDATE `common_grid_column_template` SET `placeholder` = 'Created Date' WHERE `header` = 'Created Date';
UPDATE `common_grid_column_template` SET `placeholder` = 'Created User' WHERE `header` = 'Created User';

ALTER TABLE `vp_bill_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_bill_payment_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `hst_vp_bill_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_expense_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_po_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_po_receipt_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_recurring_bill_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_vendor_mst_additional_data` 
MODIFY COLUMN `field_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_mst_id`;


