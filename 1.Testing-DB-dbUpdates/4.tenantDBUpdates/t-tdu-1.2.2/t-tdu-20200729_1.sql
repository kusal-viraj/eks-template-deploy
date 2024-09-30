ALTER TABLE `vp_payment_additional_field_attachments` MODIFY COLUMN `file_type` varchar(100) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `file_name`;

ALTER TABLE `vp_vendor_invoice_additional_field_attachments` MODIFY COLUMN `file_type` varchar(100) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT NULL AFTER `file_name`;