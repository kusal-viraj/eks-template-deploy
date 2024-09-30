ALTER TABLE `vp_vendor_invoice` MODIFY COLUMN `attachment_url` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `approved_date`;
ALTER TABLE `vp_vendor_invoice` MODIFY COLUMN `original_file_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `po_id`;

INSERT INTO `common_audit_trial_status` (`name`, `sort_order`, `icon`, `color`) VALUES ('Imported by', '14', 'fa fa-thumb-tack', 'bg-blue');