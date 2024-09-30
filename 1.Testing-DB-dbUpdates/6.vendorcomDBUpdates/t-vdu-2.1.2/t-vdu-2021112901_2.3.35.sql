----------Amal------2.3.35----------

ALTER TABLE `vendor_invoice_template_mst`
	CHANGE COLUMN `bill_amount` `bill_amount` DECIMAL(19,2) NULL DEFAULT '0.00' AFTER `po_no`;