-------2.7.11------Madusha------------

ALTER TABLE `vp_bill_item_cost_distribution` 
ADD COLUMN `po_receipt_id` int NULL AFTER `vendor_item_number`;

ALTER TABLE `vp_bill_expense_cost_distribution` 
ADD COLUMN `po_id` int NULL AFTER `transaction_id`,
ADD COLUMN `po_receipt_id` int NULL AFTER `po_id`;

ALTER TABLE `vp_bill_expense_cost_distribution` 
CHANGE COLUMN `tax` `taxable` tinyint(1) NULL DEFAULT NULL AFTER `billable`;

ALTER TABLE `hst_vp_bill_expense_cost_distribution` 
CHANGE COLUMN `tax` `taxable` tinyint(1) NULL DEFAULT NULL AFTER `billable`;

ALTER TABLE `hst_vp_bill_expense_cost_distribution` 
ADD COLUMN `po_receipt_id` int NULL AFTER `transaction_id`,
ADD COLUMN `po_id` int NULL AFTER `po_receipt_id`;

ALTER TABLE `vp_bill_item_cost_distribution` 
CHANGE COLUMN `tax` `taxable` tinyint(1) NULL DEFAULT NULL AFTER `billable`;

ALTER TABLE `hst_vp_bill_item_cost_distribution` 
CHANGE COLUMN `tax` `taxable` tinyint(1) NULL DEFAULT NULL AFTER `billable`;

ALTER TABLE `hst_vp_bill_item_cost_distribution` 
ADD COLUMN `po_receipt_id` int NULL AFTER `receipt_file_type`;

ALTER TABLE `vp_bill_expense_cost_distribution` 
ADD CONSTRAINT `PO_REC_ID_FK_1` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `vp_bill_item_cost_distribution` 
ADD CONSTRAINT `PO_REC_ID_FK_2` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `hst_vp_bill_expense_cost_distribution` 
ADD CONSTRAINT `PO_REC_ID_FK_3` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `hst_vp_bill_item_cost_distribution` 
ADD CONSTRAINT `PO_REC_ID_FK_4` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `vp_recurring_bill_expense_cost_distribution` 
CHANGE COLUMN `tax` `taxable` tinyint(1) NULL DEFAULT NULL AFTER `billable`;

ALTER TABLE `vp_recurring_bill_item_cost_distribution` 
CHANGE COLUMN `tax` `taxable` tinyint(1) NULL DEFAULT NULL AFTER `billable`;

ALTER TABLE `vp_po_detail` 
ADD COLUMN `billable` tinyint(1) NULL AFTER `department_id`,
ADD COLUMN `taxable` tinyint(1) NULL AFTER `billable`;

ALTER TABLE `hst_vp_po_detail` 
ADD COLUMN `billable` tinyint(1) NULL AFTER `hst_recode_id`,
ADD COLUMN `taxable` tinyint(1) NULL AFTER `billable`;

ALTER TABLE `vp_po_account_detail` 
ADD COLUMN `billable` tinyint(1) NULL AFTER `received`,
ADD COLUMN `taxable` tinyint(1) NULL AFTER `billable`;

ALTER TABLE `hst_vp_po_account_detail` 
ADD COLUMN `billable` tinyint(1) NULL AFTER `hst_recode_id`,
ADD COLUMN `taxable` tinyint(1) NULL AFTER `billable`;

ALTER TABLE `vp_expense_detail` 
ADD COLUMN `billable` tinyint(1) NULL AFTER `expense_type`,
ADD COLUMN `taxable` tinyint(1) NULL AFTER `billable`;

ALTER TABLE `hst_vp_expense_detail` 
ADD COLUMN `billable` tinyint(1) NULL AFTER `hst_recode_id`,
ADD COLUMN `taxable` tinyint(1) NULL AFTER `billable`;