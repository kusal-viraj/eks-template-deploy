--------------Madhusha-----2.7.26----------------

ALTER TABLE `vp_po_receipt_account_detail` 
MODIFY COLUMN `account_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `amount`;