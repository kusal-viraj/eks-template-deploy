DROP TABLE IF EXISTS `vp_payment_type_detail`;

CREATE TABLE `vp_payment_type_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `preferred` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
