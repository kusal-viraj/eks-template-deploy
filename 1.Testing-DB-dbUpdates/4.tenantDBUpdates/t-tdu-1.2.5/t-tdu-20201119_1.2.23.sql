ALTER TABLE `vp_purchase_order_detail`
MODIFY COLUMN `qty`  decimal(12,2) NULL DEFAULT NULL AFTER `description`;


ALTER TABLE `vp_vendor_invoice`
DROP COLUMN `entered_to_the_system`;

ALTER TABLE `vp_vendor_invoice_temp`
	DROP COLUMN `entered_to_the_system`;

 
ALTER TABLE `vp_invoice_item_cost_distribution`
MODIFY COLUMN `qty`  decimal(12,2) NULL DEFAULT NULL AFTER `description`;

UPDATE vp_grn_detail det SET det.qty = 0 WHERE det.qty IS NULL;
ALTER TABLE `vp_grn_detail`
	CHANGE COLUMN `qty` `qty` DECIMAL(12,2) NOT NULL DEFAULT 0 AFTER `description`;
	
ALTER TABLE `vp_grn_detail`
	CHANGE COLUMN `received_qty` `received_qty` DECIMAL(12,2) NOT NULL DEFAULT 0 AFTER `id`,
	CHANGE COLUMN `remaining_qty` `remaining_qty` DECIMAL(12,2) NULL DEFAULT NULL AFTER `received_qty`;
	
ALTER TABLE `vp_vendor_inv_einvoice_det`
	CHANGE COLUMN `no_of_units` `no_of_units` DECIMAL(12,2) NOT NULL DEFAULT 0 AFTER `unit_price`;