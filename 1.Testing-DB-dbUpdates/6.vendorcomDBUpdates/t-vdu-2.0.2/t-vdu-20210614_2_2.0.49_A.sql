ALTER TABLE `vendor_po_mst` 
MODIFY COLUMN `poc_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `approval_user_name`,
MODIFY COLUMN `poc_phone` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `poc_name`;