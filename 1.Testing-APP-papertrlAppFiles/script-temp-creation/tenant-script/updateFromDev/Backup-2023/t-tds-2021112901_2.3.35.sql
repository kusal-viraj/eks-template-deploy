ALTER TABLE `vp_bill_template_mst`
	CHANGE COLUMN `bill_amount` `bill_amount` DECIMAL(19,2) NULL DEFAULT '0.00' AFTER `po_no`;
