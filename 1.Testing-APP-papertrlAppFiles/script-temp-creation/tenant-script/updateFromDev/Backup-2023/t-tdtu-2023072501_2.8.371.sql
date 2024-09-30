INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (151, 'Split Transaction', 'Split Transaction', 'SPLIT_TRANSACTION', 'System', '2023-07-25 00:00:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (554, 1054, 151, 'CREDIT_CARD_SPLIT_TRANSACTION', 'system', '2023-07-25 10:21:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 551, NULL, 'admin', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 552, NULL, 'admin', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 553, NULL, 'admin', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 554, NULL, 'admin', '2021-07-25 10:23:00', NULL, NULL, NULL, NULL);

