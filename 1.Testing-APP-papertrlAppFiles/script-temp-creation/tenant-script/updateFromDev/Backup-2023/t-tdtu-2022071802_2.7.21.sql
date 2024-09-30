ALTER TABLE `vp_po_detail` 
ADD COLUMN `unbilled_qty` decimal(12, 2) NULL AFTER `taxable`;

ALTER TABLE `hst_vp_po_detail` 
ADD COLUMN `unbilled_qty` decimal(19, 2) NULL AFTER `taxable`;