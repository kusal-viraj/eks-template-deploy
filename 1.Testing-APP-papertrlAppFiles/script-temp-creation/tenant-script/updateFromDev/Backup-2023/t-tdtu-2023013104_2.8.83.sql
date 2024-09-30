ALTER TABLE `common_item_mst` 
MODIFY COLUMN `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `common_item_mst` 
MODIFY COLUMN `sales_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `purchase_description`;

ALTER TABLE `common_item_mst` 
MODIFY COLUMN `purchase_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `status`;

ALTER TABLE `common_item_vendor_wise` 
MODIFY COLUMN `vendor_item_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`;


ALTER TABLE `hst_vp_bill_item_cost_distribution` 
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_id`,
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`;

ALTER TABLE `vp_bill_item_cost_distribution` 
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_id`,
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_number`;

ALTER TABLE `common_description_base_memorization` 
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;

ALTER TABLE `vp_credit_note_item_details` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`,
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;

ALTER TABLE `vp_po_receipt_detail` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`,
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;

ALTER TABLE `vp_po_detail` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`;

ALTER TABLE `vp_po_detail` 
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;

ALTER TABLE `hst_vp_po_detail` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`,
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;

ALTER TABLE `vp_recurring_bill_item_cost_distribution` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_item_number`,
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;