ALTER TABLE `vp_purchase_order_detail`
MODIFY COLUMN `item_number`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' AFTER `sort_order`;

