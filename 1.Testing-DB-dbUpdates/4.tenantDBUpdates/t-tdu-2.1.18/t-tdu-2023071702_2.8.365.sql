--indra--2.8.365-----



ALTER TABLE `vp_credit_card_statement_detail`
	ADD COLUMN `parent_id` INT(11) NULL DEFAULT NULL AFTER `remarks`;

ALTER TABLE `vp_credit_card_statement_detail`
	ADD COLUMN `split` TINYINT NOT NULL AFTER `parent_id`;
	
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (148, 'Delete Statement', 'Delete Statement', 'DELETE_STATEMENT', 'System', '2023-07-14 11:15:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (149, 'Delete Transaction', 'Delete Transaction', 'DELETE_TRANSACTION', 'System', '2023-07-14 11:15:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (150, 'View All Transactions', 'View All Transactions', 'VIEW_ALL_TRANSACTIONS', 'System', '2023-07-14 11:15:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (551, 1053, 148, 'CREDIT_CARD_DELETE_STATEMENT', 'System', '2023-07-14 11:31:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (552, 1054, 149, 'CREDIT_CARD_DELETE_TRANSACTION', 'System', '2023-07-14 11:31:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (553, 1054, 150, 'CREDIT_CARD_VIEW_ALL_TRANSACTIONS', 'System', '2023-07-14 11:31:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 551, NULL, 'bhagya.e@papertrl.com', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 552, NULL, 'bhagya.e@papertrl.com', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 553, NULL, 'bhagya.e@papertrl.com', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
