-------2.5.32----Hashila----

ALTER TABLE `hst_vp_po_mst` 
ADD COLUMN `price_variance` decimal(19, 2) NULL AFTER `remaining_celing`,
ADD COLUMN `remaining_price_variance` decimal(19, 2) NULL AFTER `price_variance`;