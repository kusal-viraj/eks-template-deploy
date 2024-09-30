-----hashila---2.8.63------


INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (42, 'Activated by', 1, 'fa fa', 'bg-green');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (43, 'Inactivated by', 1, 'fa fa', 'bg-red');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (526, 1019, 13, 'BILL_INACTIVATE', 'System', '2023-01-17 15:03:31', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (527, 1019, 14, 'BILL_ACTIVATE', 'System', '2023-01-17 15:03:34', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 526, NULL, 'System', '2023-01-17 15:05:43', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 527, NULL, 'System', '2023-01-17 15:05:44', NULL, NULL, NULL, NULL);
