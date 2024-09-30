CREATE TABLE `papertrl_document_section`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `papertrl_document_section` VALUES (1, 'Detail section', 'A');
INSERT INTO `papertrl_document_section` VALUES (2, 'Line item section', 'A');
INSERT INTO `papertrl_document_section` VALUES (3, 'Additional field section', 'A');



CREATE TABLE `papertrl_module_section`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_id` int NULL DEFAULT NULL,
  `section_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `papertrl_module_section` VALUES (1, 1, 1);
INSERT INTO `papertrl_module_section` VALUES (2, 1, 2);
INSERT INTO `papertrl_module_section` VALUES (3, 1, 3);
INSERT INTO `papertrl_module_section` VALUES (4, 2, 1);
INSERT INTO `papertrl_module_section` VALUES (5, 2, 2);
INSERT INTO `papertrl_module_section` VALUES (6, 2, 3);
INSERT INTO `papertrl_module_section` VALUES (7, 3, 1);
INSERT INTO `papertrl_module_section` VALUES (8, 3, 2);
INSERT INTO `papertrl_module_section` VALUES (9, 3, 3);
INSERT INTO `papertrl_module_section` VALUES (10, 4, 1);
INSERT INTO `papertrl_module_section` VALUES (11, 4, 2);
INSERT INTO `papertrl_module_section` VALUES (12, 4, 3);
INSERT INTO `papertrl_module_section` VALUES (13, 5, 1);
INSERT INTO `papertrl_module_section` VALUES (14, 5, 2);
INSERT INTO `papertrl_module_section` VALUES (15, 5, 3);
INSERT INTO `papertrl_module_section` VALUES (16, 6, 1);
INSERT INTO `papertrl_module_section` VALUES (17, 6, 2);
INSERT INTO `papertrl_module_section` VALUES (18, 6, 3);
INSERT INTO `papertrl_module_section` VALUES (19, 7, 1);
INSERT INTO `papertrl_module_section` VALUES (20, 7, 2);
INSERT INTO `papertrl_module_section` VALUES (21, 7, 3);
INSERT INTO `papertrl_module_section` VALUES (22, 8, 1);
INSERT INTO `papertrl_module_section` VALUES (23, 8, 2);
INSERT INTO `papertrl_module_section` VALUES (24, 8, 3);
INSERT INTO `papertrl_module_section` VALUES (25, 9, 1);
INSERT INTO `papertrl_module_section` VALUES (26, 9, 2);
INSERT INTO `papertrl_module_section` VALUES (27, 9, 3);
INSERT INTO `papertrl_module_section` VALUES (28, 10, 1);
INSERT INTO `papertrl_module_section` VALUES (29, 10, 2);
INSERT INTO `papertrl_module_section` VALUES (30, 10, 3);