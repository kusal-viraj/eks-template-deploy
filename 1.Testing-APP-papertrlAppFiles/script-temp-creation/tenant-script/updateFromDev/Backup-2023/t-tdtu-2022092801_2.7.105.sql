ALTER TABLE `vp_po_audit_trail` 
MODIFY COLUMN `comment` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `header`;