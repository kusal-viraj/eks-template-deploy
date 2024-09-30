---------Amal------2.6.11---------

INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 'Bills', 'A', 'System ', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 'Purchase Orders', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (3, 'PO Receipts', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (4, 'Payments', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (5, 'Chart of Accounts', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (6, 'Expenses', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (7, 'Items', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (8, 'Projects', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (9, 'Vendors', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (10, 'Credit Note', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (11, 'Other', 'A', 'System', '2022-05-12 17:39:27', NULL, NULL, NULL, NULL);


ALTER TABLE `support_ticket` CHANGE COLUMN `feature_id` `feature_id` INT(10) NULL AFTER `vendor_mst_id`;