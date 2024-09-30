CREATE TABLE `common_integration_incomplete_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `object_type` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `string_data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `byte_data` mediumblob NULL,
  `system_short_code` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` date NOT NULL,
  `attempt` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
