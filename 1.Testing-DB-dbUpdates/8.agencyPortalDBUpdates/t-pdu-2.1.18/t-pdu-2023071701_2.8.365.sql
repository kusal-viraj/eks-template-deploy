--indra--2.8.365-----



INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (148, 'Delete Statement', 'Delete Statement', 'DELETE_STATEMENT', 'System', '2023-07-14 11:15:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (149, 'Delete Transaction', 'Delete Transaction', 'DELETE_TRANSACTION', 'System', '2023-07-14 11:15:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (150, 'View All Transactions', 'View All Transactions', 'VIEW_ALL_TRANSACTIONS', 'System', '2023-07-14 11:15:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (551, 1053, 148, 'CREDIT_CARD_DELETE_STATEMENT', 'System', '2023-07-14 11:31:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (552, 1054, 149, 'CREDIT_CARD_DELETE_TRANSACTION', 'System', '2023-07-14 11:31:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (553, 1054, 150, 'CREDIT_CARD_VIEW_ALL_TRANSACTIONS', 'System', '2023-07-14 11:31:00', NULL, NULL, NULL, NULL);