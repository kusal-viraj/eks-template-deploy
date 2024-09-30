------2.8.59----indara------



INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `mobile_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1058, 'Vendor Groups', 'Vendor Groups', 'fa fa-users', '/home/vendor', '5', 'S', 1004, NULL, 'Admin', 5, 'fa fa-users', 'Vendor Groups', 'Vendor Groups', 'A', 0, 1, 0, 0, 'V2', 'VENDOR_GROUPS', 0, '1004,1015', 'System', '2023-01-15 13:34:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (521, 1058, 1, 'VENDOR_GROUP_CREATE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (522, 1058, 4, 'VENDOR_GROUP_EDIT', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (523, 1058, 5, 'VENDOR_GROUP_DELETE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (524, 1058, 13, 'VENDOR_GROUP_INACTIVATE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (525, 1058, 14, 'VENDOR_GROUP_ACTIVATE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);


INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 1058, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 521, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 522, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 523, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 524, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 525, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);