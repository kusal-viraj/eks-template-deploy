CREATE TABLE `common_integration_service_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

INSERT INTO `common_integration_service_group` VALUES (1, 'Account');
INSERT INTO `common_integration_service_group` VALUES (2, 'UOM');
INSERT INTO `common_integration_service_group` VALUES (3, 'Item');
INSERT INTO `common_integration_service_group` VALUES (4, 'Item Category');
INSERT INTO `common_integration_service_group` VALUES (5, 'Client');
INSERT INTO `common_integration_service_group` VALUES (6, 'Term');
INSERT INTO `common_integration_service_group` VALUES (7, 'Vendor');
INSERT INTO `common_integration_service_group` VALUES (8, 'Purchase Order');
INSERT INTO `common_integration_service_group` VALUES (9, 'Bill');
INSERT INTO `common_integration_service_group` VALUES (10, 'Purchase Order Receipt');
INSERT INTO `common_integration_service_group` VALUES (11, 'Payment');
INSERT INTO `common_integration_service_group` VALUES (12, 'Expense');
INSERT INTO `common_integration_service_group` VALUES (13, 'Deleted Records');

ALTER TABLE `common_integration_service` 
ADD COLUMN `service_group_id` int NOT NULL AFTER `service_type`;


UPDATE `common_integration_service` SET `name` = 'Push Account from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 1 WHERE `id` = 1;
UPDATE `common_integration_service` SET `name` = 'Pull Account to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 1 WHERE `id` = 2;
UPDATE `common_integration_service` SET `name` = 'Pull UOM to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 2 WHERE `id` = 3;
UPDATE `common_integration_service` SET `name` = 'Push UOM from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 2 WHERE `id` = 4;
UPDATE `common_integration_service` SET `name` = 'Push Item from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 3 WHERE `id` = 5;
UPDATE `common_integration_service` SET `name` = 'Pull Item to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 3 WHERE `id` = 6;
UPDATE `common_integration_service` SET `name` = 'Push Client from Papertrl ', `status` = 'A', `service_type` = 1, `service_group_id` = 5 WHERE `id` = 7;
UPDATE `common_integration_service` SET `name` = 'Pull Client to Papertrl ', `status` = 'A', `service_type` = 2, `service_group_id` = 5 WHERE `id` = 8;
UPDATE `common_integration_service` SET `name` = 'Push Term from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 6 WHERE `id` = 9;
UPDATE `common_integration_service` SET `name` = 'Pull Term to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 6 WHERE `id` = 10;
UPDATE `common_integration_service` SET `name` = 'Push Vendor from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 7 WHERE `id` = 11;
UPDATE `common_integration_service` SET `name` = 'Pull Vendor to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 7 WHERE `id` = 12;
UPDATE `common_integration_service` SET `name` = 'Push Purchase Order from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 8 WHERE `id` = 13;
UPDATE `common_integration_service` SET `name` = 'Pull Purchase Order to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 8 WHERE `id` = 14;
UPDATE `common_integration_service` SET `name` = 'Push Bill from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 9 WHERE `id` = 15;
UPDATE `common_integration_service` SET `name` = 'Pull Bill  to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 9 WHERE `id` = 16;
UPDATE `common_integration_service` SET `name` = 'Push Purchase Order Receipt from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 10 WHERE `id` = 17;
UPDATE `common_integration_service` SET `name` = 'Pull Purchase Order Receipt to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 10 WHERE `id` = 18;
UPDATE `common_integration_service` SET `name` = 'Push Payment from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 11 WHERE `id` = 19;
UPDATE `common_integration_service` SET `name` = 'Pull Payment to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 11 WHERE `id` = 20;
UPDATE `common_integration_service` SET `name` = 'Push Deleted Record from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 13 WHERE `id` = 21;
UPDATE `common_integration_service` SET `name` = 'Pull Deleted Record to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 13 WHERE `id` = 22;
UPDATE `common_integration_service` SET `name` = 'Push Expense from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 12 WHERE `id` = 23;
UPDATE `common_integration_service` SET `name` = 'Pull Item Category to Papertrl', `status` = 'A', `service_type` = 2, `service_group_id` = 4 WHERE `id` = 24;
UPDATE `common_integration_service` SET `name` = 'Push Item Category from Papertrl', `status` = 'A', `service_type` = 1, `service_group_id` = 4 WHERE `id` = 25;

INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 1, 0, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 2, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 3, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 4, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 5, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 6, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 7, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 8, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 9, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 10, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 11, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 12, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 13, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 14, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 15, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 16, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 17, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 18, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 19, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 20, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 21, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 22, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 23, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 22, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 24, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `common_integration_service_status`(`system_id`, `service_id`, `syncable`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 25, 1, 'add', '2021-01-31 00:00:00', NULL, NULL, NULL, NULL);

