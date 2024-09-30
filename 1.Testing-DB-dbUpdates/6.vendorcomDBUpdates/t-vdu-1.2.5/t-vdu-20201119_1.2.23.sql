ALTER TABLE `vp_vendor_invoice`
DROP COLUMN `entered_to_the_system`;

ALTER TABLE `vp_vendor_invoice_temp`
	DROP COLUMN `entered_to_the_system`;

ALTER TABLE `vp_vendor_inv_einvoice_det`
	CHANGE COLUMN `no_of_units` `no_of_units` DECIMAL(12,2) NOT NULL DEFAULT 0 AFTER `unit_price`;