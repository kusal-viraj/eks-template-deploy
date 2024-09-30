----madusha---2.8.97-------

ALTER TABLE `vendor_recurring_invoice_template_detail` 
MODIFY COLUMN `item_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_number`,
MODIFY COLUMN `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `item_name`;