-------Madhusha----2.4.54----------

ALTER TABLE common_item_venor_wise
RENAME TO common_item_vendor_wise;

ALTER TABLE `vp_po_detail` 
ADD COLUMN `vendor_item_number` varchar(50) NULL AFTER `item_number`;

ALTER TABLE `vp_bill_item_cost_distribution` 
ADD COLUMN `vendor_item_number` varchar(50) NULL AFTER `department_id`;

ALTER TABLE `vp_po_receipt_detail` 
ADD COLUMN `vendor_item_number` varchar(50) NULL AFTER `item_number`;

ALTER TABLE `hst_vp_bill_item_cost_distribution` 
ADD COLUMN `vendor_item_number` varchar(50) NULL AFTER `item_number`;

ALTER TABLE `vp_recurring_bill_item_cost_distribution` 
ADD COLUMN `vendor_item_number` varchar(50) NULL AFTER `item_number`;