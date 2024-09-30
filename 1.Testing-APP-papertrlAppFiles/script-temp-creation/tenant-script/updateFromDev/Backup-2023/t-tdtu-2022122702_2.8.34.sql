DROP TABLE IF EXISTS `vp_bill_po_receipt_detail`;
CREATE TABLE `vp_bill_po_receipt_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_id` int NULL DEFAULT NULL,
  `detail_id` int NULL DEFAULT NULL,
  `po_receipt_id` int NULL DEFAULT NULL,
  `billd_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;