CREATE TABLE `payment_client_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `routing_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;
