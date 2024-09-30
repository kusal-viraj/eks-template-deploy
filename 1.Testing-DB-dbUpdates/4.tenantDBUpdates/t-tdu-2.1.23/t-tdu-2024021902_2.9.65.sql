---danuddara 2.9.65---



CREATE TABLE `vp_payment_attachment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attachment_url` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transaction_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_transaction_id`(`transaction_id`) USING BTREE,
  CONSTRAINT `fk_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `vp_payment_transaction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;