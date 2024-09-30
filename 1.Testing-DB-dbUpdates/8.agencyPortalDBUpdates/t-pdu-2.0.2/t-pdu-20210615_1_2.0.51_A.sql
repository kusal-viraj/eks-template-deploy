INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (377, 1011, 5, 'USERS_DELETE', 'System', '2021-06-11 13:30:32', NULL, NULL, NULL, NULL);

UPDATE `umm_menu_privilage` SET `menu_id` = 1011, `privilage_id` = 5, `auth_code` = 'USERS_DELETE', `created_by` = 'System', `created_on` = '2021-06-11 13:30:32', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 376;
UPDATE `umm_menu_privilage` SET `menu_id` = 1021, `privilage_id` = 70, `auth_code` = 'PURCHASE_ORDER_SEND_VENDOR_APPROVAL', `created_by` = 'System', `created_on` = '2021-05-21 21:32:36', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 377;



INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (382, 1019, 16, 'BILL_CHANGE_ASSIGNEE', 'System', '2021-06-15 13:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (383, 1007, 3, 'EXPENSES_DETAIL_VIEW', 'System', '2021-06-15 13:48:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 382, NULL, 'admin', '2021-06-15 13:52:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 383, NULL, 'admin', '2021-06-15 13:52:00', NULL, NULL, NULL, NULL);