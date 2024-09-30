ALTER TABLE `vendor_invoice_template_mst`
CHANGE COLUMN `tenant_id` `client_id` VARCHAR(30) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `attachment_id`;