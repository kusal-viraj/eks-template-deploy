INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (78, 'Show Discount Applicable Bill Table', 'Show Discount Applicable Bill Table', 'SHOW_DISCOUNT_APPLICABLE_BILL_TABLE', 'System', '2021-04-20 12:23:27', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (374, 1000, 78, 'DASHBOARD_SHOW_DISCOUNT_APPLICABLE_BILL_TABLE', 'System', '2021-05-21 02:17:33', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (79, 'Manage Vendor Community', 'Manage Vendor Community', 'VENDORS_MANAGE_VENDOR_COMMUNITY', 'System', '2021-05-20 05:21:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (375, 1004, 79, 'VENDORS_MANAGE_VENDOR_COMMUNITY', 'System', '2021-05-21 02:19:38', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 374, NULL, 'admin', '2021-05-21 02:21:20', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 375, NULL, 'admin', '2021-05-21 02:21:20', NULL, NULL, NULL, NULL);
