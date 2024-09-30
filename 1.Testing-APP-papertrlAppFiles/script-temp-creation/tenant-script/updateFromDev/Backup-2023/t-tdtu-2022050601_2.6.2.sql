--------Madhusha-------

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (485, 1032, 128, 'APPLY_CREDIT_NOTE_TO_APPROVED_BILLS', 'System', '2022-05-06 12:23:59');

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (129, 'View Attached Bills', 'View Attached Bills', 'CREDIT_NOTE_VIEW_ATTACHED_BILL', 'System', '2022-05-06 12:27:55', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (486, 1049, 129, 'CREDIT_NOTE_VIEW_ATTACHED_BILL', 'System', '2022-05-06 12:29:12');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 485, 'System', '2022-05-06 12:30:19');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 486, 'System', '2022-05-06 12:31:55');