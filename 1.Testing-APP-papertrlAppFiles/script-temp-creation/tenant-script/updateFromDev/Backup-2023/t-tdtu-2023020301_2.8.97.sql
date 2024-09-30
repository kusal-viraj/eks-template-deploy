ALTER TABLE `vp_bill_create_detail` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_number`,
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;