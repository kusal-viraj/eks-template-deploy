------2.5.9----madusha----

ALTER TABLE `vp_po_mst` 
ADD COLUMN `price_variance` decimal(19, 2) NULL AFTER `remaining_celing`,
ADD COLUMN `remaining_price_variance` decimal(19, 2) NULL AFTER `price_variance`;

ALTER TABLE `vp_po_price_variance` 
MODIFY COLUMN `price_variance` decimal(19, 2) NULL DEFAULT NULL AFTER `vendor_name`;