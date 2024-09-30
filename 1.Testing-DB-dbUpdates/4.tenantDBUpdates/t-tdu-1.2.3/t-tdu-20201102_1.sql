ALTER TABLE `vp_grn_detail`
ADD COLUMN `unit_price` decimal(19,2) NULL AFTER `product_id`;

ALTER TABLE `vp_vendor_inv_einvoice_det`
MODIFY COLUMN `description` varchar(150) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL AFTER `sku`;
