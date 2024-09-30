CREATE TABLE `common_integration_service`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;


INSERT INTO `common_integration_service` VALUES (1, 'Account push', 'A');
INSERT INTO `common_integration_service` VALUES (2, 'Account pull', 'A');
INSERT INTO `common_integration_service` VALUES (3, 'UOM pull', 'A');
INSERT INTO `common_integration_service` VALUES (4, 'UOM push', 'A');
INSERT INTO `common_integration_service` VALUES (5, 'Item push', 'A');
INSERT INTO `common_integration_service` VALUES (6, 'Item pull', 'A');
INSERT INTO `common_integration_service` VALUES (7, 'Client push', 'A');
INSERT INTO `common_integration_service` VALUES (8, 'Client pull', 'A');
INSERT INTO `common_integration_service` VALUES (9, 'Term push', 'A');
INSERT INTO `common_integration_service` VALUES (10, 'Term pull', 'A');
INSERT INTO `common_integration_service` VALUES (11, 'Vendor push', 'A');
INSERT INTO `common_integration_service` VALUES (12, 'Vendor pull', 'A');
INSERT INTO `common_integration_service` VALUES (13, 'Purchase order push', 'A');
INSERT INTO `common_integration_service` VALUES (14, 'Purchase order pull', 'A');
INSERT INTO `common_integration_service` VALUES (15, 'Invoice push', 'A');
INSERT INTO `common_integration_service` VALUES (16, 'Invoice pull', 'A');
INSERT INTO `common_integration_service` VALUES (17, 'Purchase order recipt push', 'A');
INSERT INTO `common_integration_service` VALUES (18, 'Purchase order recipt pull', 'A');
INSERT INTO `common_integration_service` VALUES (19, 'Payment push', 'A');
INSERT INTO `common_integration_service` VALUES (20, 'Payment pull', 'A');
INSERT INTO `common_integration_service` VALUES (21, 'Deletes push', 'A');
INSERT INTO `common_integration_service` VALUES (22, 'Deletes pull', 'A');


CREATE TABLE `common_integration_service_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `system_id` int NOT NULL,
  `service_id` int NOT NULL,
  `syncable` tinyint(1) NOT NULL DEFAULT 0,
  `created_on` date NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;