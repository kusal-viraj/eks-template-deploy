ALTER TABLE `common_product_mst`
ADD COLUMN `item_number` varchar(50) NOT NULL AFTER `name`;

ALTER TABLE `common_product_mst`
MODIFY COLUMN `name` varchar(50) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL AFTER `id`;

ALTER TABLE `vp_purchase_order_detail`
ADD COLUMN `product_id` int(11) NOT NULL AFTER `amount`;

ALTER TABLE `vp_grn_detail`
ADD COLUMN `item_number` varchar(20) NULL AFTER `po_detail_id`,
ADD COLUMN `description` varchar(200) NULL AFTER `item_number`,
ADD COLUMN `qty` int(5) NULL AFTER `description`,
ADD COLUMN `uom_id` int(11) NULL AFTER `qty`,
ADD COLUMN `product_id` int(11) NULL AFTER `uom_id`;

