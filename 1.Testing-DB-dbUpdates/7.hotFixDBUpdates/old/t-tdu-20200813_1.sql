ALTER TABLE `vp_vendor_invoice_audit_trail`
MODIFY COLUMN `comment` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
DEFAULT '' AFTER `user_name`;