------------Danuddara------2.0.97-----
UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'reference', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 170;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'reference', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 179;
UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'reference', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 186;


CREATE TABLE `common_integration_system_service`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `system_id` int NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_SERVICE`(`service_id`) USING BTREE,
  CONSTRAINT `FK_SERVICE` FOREIGN KEY (`service_id`) REFERENCES `common_integration_service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `common_integration_system_service` VALUES (1, 1, 1);
INSERT INTO `common_integration_system_service` VALUES (2, 1, 2);
INSERT INTO `common_integration_system_service` VALUES (3, 1, 3);
INSERT INTO `common_integration_system_service` VALUES (4, 1, 4);
INSERT INTO `common_integration_system_service` VALUES (5, 1, 5);
INSERT INTO `common_integration_system_service` VALUES (6, 1, 6);
INSERT INTO `common_integration_system_service` VALUES (7, 1, 7);
INSERT INTO `common_integration_system_service` VALUES (8, 1, 8);
INSERT INTO `common_integration_system_service` VALUES (9, 1, 9);
INSERT INTO `common_integration_system_service` VALUES (10, 1, 10);
INSERT INTO `common_integration_system_service` VALUES (11, 1, 11);
INSERT INTO `common_integration_system_service` VALUES (12, 1, 12);
INSERT INTO `common_integration_system_service` VALUES (13, 1, 13);
INSERT INTO `common_integration_system_service` VALUES (14, 1, 14);
INSERT INTO `common_integration_system_service` VALUES (15, 1, 15);
INSERT INTO `common_integration_system_service` VALUES (16, 1, 16);
INSERT INTO `common_integration_system_service` VALUES (17, 1, 17);
INSERT INTO `common_integration_system_service` VALUES (18, 1, 18);
INSERT INTO `common_integration_system_service` VALUES (19, 1, 19);
INSERT INTO `common_integration_system_service` VALUES (20, 1, 20);
INSERT INTO `common_integration_system_service` VALUES (21, 1, 21);
INSERT INTO `common_integration_system_service` VALUES (22, 1, 22);
INSERT INTO `common_integration_system_service` VALUES (23, 1, 23);
INSERT INTO `common_integration_system_service` VALUES (24, 1, 24);
INSERT INTO `common_integration_system_service` VALUES (25, 1, 25);
INSERT INTO `common_integration_system_service` VALUES (26, 2, 1);
INSERT INTO `common_integration_system_service` VALUES (27, 2, 2);
INSERT INTO `common_integration_system_service` VALUES (28, 2, 5);
INSERT INTO `common_integration_system_service` VALUES (29, 2, 6);
INSERT INTO `common_integration_system_service` VALUES (30, 2, 7);
INSERT INTO `common_integration_system_service` VALUES (31, 2, 8);
INSERT INTO `common_integration_system_service` VALUES (32, 2, 9);
INSERT INTO `common_integration_system_service` VALUES (33, 2, 10);
INSERT INTO `common_integration_system_service` VALUES (34, 2, 11);
INSERT INTO `common_integration_system_service` VALUES (35, 2, 12);
INSERT INTO `common_integration_system_service` VALUES (36, 2, 13);
INSERT INTO `common_integration_system_service` VALUES (37, 2, 14);
INSERT INTO `common_integration_system_service` VALUES (38, 2, 15);
INSERT INTO `common_integration_system_service` VALUES (39, 2, 16);
INSERT INTO `common_integration_system_service` VALUES (41, 2, 20);
INSERT INTO `common_integration_system_service` VALUES (42, 2, 23);
INSERT INTO `common_integration_system_service` VALUES (43, 2, 24);
INSERT INTO `common_integration_system_service` VALUES (44, 2, 25);
INSERT INTO `common_integration_system_service` VALUES (45, 3, 1);
INSERT INTO `common_integration_system_service` VALUES (46, 3, 2);
INSERT INTO `common_integration_system_service` VALUES (47, 3, 3);
INSERT INTO `common_integration_system_service` VALUES (48, 3, 4);
INSERT INTO `common_integration_system_service` VALUES (49, 3, 5);
INSERT INTO `common_integration_system_service` VALUES (50, 3, 6);
INSERT INTO `common_integration_system_service` VALUES (51, 3, 7);
INSERT INTO `common_integration_system_service` VALUES (52, 3, 8);
INSERT INTO `common_integration_system_service` VALUES (53, 3, 9);
INSERT INTO `common_integration_system_service` VALUES (54, 3, 10);
INSERT INTO `common_integration_system_service` VALUES (55, 3, 11);
INSERT INTO `common_integration_system_service` VALUES (56, 3, 12);
INSERT INTO `common_integration_system_service` VALUES (57, 3, 13);
INSERT INTO `common_integration_system_service` VALUES (58, 3, 14);
INSERT INTO `common_integration_system_service` VALUES (59, 3, 15);
INSERT INTO `common_integration_system_service` VALUES (60, 3, 16);
INSERT INTO `common_integration_system_service` VALUES (61, 3, 17);
INSERT INTO `common_integration_system_service` VALUES (62, 3, 18);
INSERT INTO `common_integration_system_service` VALUES (64, 3, 20);
INSERT INTO `common_integration_system_service` VALUES (65, 3, 21);
INSERT INTO `common_integration_system_service` VALUES (66, 3, 22);
INSERT INTO `common_integration_system_service` VALUES (67, 3, 23);
INSERT INTO `common_integration_system_service` VALUES (68, 3, 24);
INSERT INTO `common_integration_system_service` VALUES (69, 3, 25);
INSERT INTO `common_integration_system_service` VALUES (70, 4, 2);
INSERT INTO `common_integration_system_service` VALUES (71, 4, 3);
INSERT INTO `common_integration_system_service` VALUES (72, 4, 4);
INSERT INTO `common_integration_system_service` VALUES (73, 4, 5);
INSERT INTO `common_integration_system_service` VALUES (74, 4, 6);
INSERT INTO `common_integration_system_service` VALUES (75, 4, 7);
INSERT INTO `common_integration_system_service` VALUES (76, 4, 8);
INSERT INTO `common_integration_system_service` VALUES (77, 4, 9);
INSERT INTO `common_integration_system_service` VALUES (78, 4, 10);
INSERT INTO `common_integration_system_service` VALUES (79, 4, 11);
INSERT INTO `common_integration_system_service` VALUES (80, 4, 12);
INSERT INTO `common_integration_system_service` VALUES (81, 4, 13);
INSERT INTO `common_integration_system_service` VALUES (82, 4, 14);
INSERT INTO `common_integration_system_service` VALUES (83, 4, 15);
INSERT INTO `common_integration_system_service` VALUES (84, 4, 16);
INSERT INTO `common_integration_system_service` VALUES (86, 4, 20);
INSERT INTO `common_integration_system_service` VALUES (87, 4, 21);
INSERT INTO `common_integration_system_service` VALUES (88, 4, 23);
INSERT INTO `common_integration_system_service` VALUES (89, 4, 24);
INSERT INTO `common_integration_system_service` VALUES (90, 4, 25);
INSERT INTO `common_integration_system_service` VALUES (91, 2, 21);
