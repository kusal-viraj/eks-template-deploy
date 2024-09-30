-------Madhusha-----2.7.21-----------

ALTER TABLE `vp_po_detail` 
ADD COLUMN `unbilled_qty` decimal(12, 2) NULL AFTER `taxable`;

ALTER TABLE `hst_vp_po_detail` 
ADD COLUMN `unbilled_qty` decimal(19, 2) NULL AFTER `taxable`;

UPDATE vp_po_detail poDet SET poDet.unbilled_qty=poDet.qty;

UPDATE hst_vp_po_detail poDet SET poDet.unbilled_qty=poDet.qty;