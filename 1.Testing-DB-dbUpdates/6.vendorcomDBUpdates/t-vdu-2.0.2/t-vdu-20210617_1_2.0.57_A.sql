UPDATE `vendor_menu` SET `name` = 'Vendor', `display_text` = 'Company Profile', `menu_style` = 'fa fa-user', `url` = 'profile', `tab` = NULL, `type` = 'S', `super_type` = 1004, `super_type_2` = NULL, `department` = 'Admin', `menu_order` = 7, `display_icon` = 'fa fa-street-view', `short_name` = 'Vendor', `detail_text` = 'Management', `status` = 'A', `portal_menu` = 0, `individual_tenant_menu` = 0, `vendor_community_menu` = 1, `version` = 'V2', `auth_code` = 'VENDOR', `slim_menu` = 1, `created_by` = 'System', `created_on` = '2021-06-17 02:12:32', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL, `hierachy` = '1004' WHERE `id` = 1005;

INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (197, 1009, 10, 'INVIOCE_VIEW_AUDIT_TRAIL', 'System', '2021-06-18 08:59:35', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 197, NULL, 'admin', '2021-06-18 09:01:42', NULL, NULL, NULL, NULL);