--------Madhusha----2.4.49---------

ALTER TABLE `common_item_mst` 
MODIFY COLUMN `partner_service` tinyint(1) NULL DEFAULT 0 AFTER `item_number`;


CREATE TABLE `common_item_venor_wise`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NULL DEFAULT NULL,
  `vendor_item_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vendor_item_description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vendor_item_price` decimal(19, 2) NULL DEFAULT NULL,
  `lead_time` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `min_order_qty` int NULL DEFAULT NULL,
  `vendor_item_image_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_mst_id` int NOT NULL,
  `image_file_type` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image_file_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;