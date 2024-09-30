----------2.8.6--dhanuddara----------

CREATE TABLE `common_integration_config_property`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `system_id` int NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `system_property` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `common_integration_config_property` VALUES (1, 6, 'Department Dimension Code', 0);
INSERT INTO `common_integration_config_property` VALUES (2, 6, 'Payment Journal Code(ACH)', 0);
INSERT INTO `common_integration_config_property` VALUES (3, 6, 'Payment Journal Code(Cash)', 0);
INSERT INTO `common_integration_config_property` VALUES (4, 6, 'Payment Journal Code(V Card)', 0);
INSERT INTO `common_integration_config_property` VALUES (5, 6, 'Payment Journal Code(Credit Card)', 0);
INSERT INTO `common_integration_config_property` VALUES (6, 6, 'Payment Journal Code(Check)', 0);


CREATE TABLE `common_integration_config_value`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `integration_mst_id` int NOT NULL,
  `company_id` int NULL DEFAULT NULL,
  `config_property_id` int NOT NULL,
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PROP_ID_FK`(`config_property_id`) USING BTREE,
  CONSTRAINT `PROP_ID_FK` FOREIGN KEY (`config_property_id`) REFERENCES `common_integration_config_property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



INSERT INTO `common_integration_system_service`(`system_id`, `service_id`) VALUES (6, 19);
