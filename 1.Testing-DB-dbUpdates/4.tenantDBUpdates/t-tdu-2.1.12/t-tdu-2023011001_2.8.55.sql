---madusha-2.8.55-----------

ALTER TABLE `vp_po_mst` 
ADD COLUMN `tax_percentage` decimal(19, 2) NULL AFTER `credit_amount`;