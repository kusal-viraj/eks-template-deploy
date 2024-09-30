ALTER TABLE `vendor_invoice_template_mst`
ADD COLUMN `tenant_id` VARCHAR(30) NULL DEFAULT NULL AFTER `attachment_id`;