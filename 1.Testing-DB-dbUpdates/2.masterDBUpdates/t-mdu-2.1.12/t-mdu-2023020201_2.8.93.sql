---danuddara---2.8.93------

CREATE TABLE `papertrl_tenant_wise_payment_mapping`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_id` int NOT NULL,
  `transaction_id` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider_id` int NOT NULL,
  `correlation_id` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;