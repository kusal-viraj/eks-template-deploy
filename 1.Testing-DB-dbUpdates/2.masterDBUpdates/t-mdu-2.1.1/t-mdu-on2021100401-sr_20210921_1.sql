-----------Dhanuddara-------2.2.27------------------

CREATE TABLE `tp_integration_company`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tp_integration_mst_id` int NOT NULL,
  `tp_company_id` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tp_company_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime(0) NOT NULL,
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_TP_INTEGRATION_MST`(`tp_integration_mst_id`) USING BTREE,
  CONSTRAINT `FK_TP_INTEGRATION_MST` FOREIGN KEY (`tp_integration_mst_id`) REFERENCES `tp_integration_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
