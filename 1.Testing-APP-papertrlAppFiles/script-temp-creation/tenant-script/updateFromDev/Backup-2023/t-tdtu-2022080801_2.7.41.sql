------------Hashila--------2.7.41--------------

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (136, 'Reminder Configuration', 'Reminder Configuration', 'REMINDER_CONFIGURATION', 'System', '2022-08-07 12:16:39', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (517, 1046, 136, 'REMINDER_CONFIGURATION', 'System', '2022-08-07 12:19:34', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 517, NULL, 'test@gmail.com', '2021-03-29 22:43:59', NULL, NULL, NULL, NULL);
