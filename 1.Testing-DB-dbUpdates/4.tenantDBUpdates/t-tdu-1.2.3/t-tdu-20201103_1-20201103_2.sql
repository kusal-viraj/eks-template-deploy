UPDATE common_product_mst a SET a.item_number = a.name WHERE a.id != '0';

ALTER TABLE `vp_grn_detail` MODIFY COLUMN `remaining_qty` int(15) NULL DEFAULT 0 AFTER `received_qty`, MODIFY COLUMN `po_detail_id` int(11) NULL AFTER `grn_mst_id`;

ALTER TABLE `vp_grn_mst` MODIFY COLUMN `grn_number` varchar(50) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL AFTER `grn_date`;