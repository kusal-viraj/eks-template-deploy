---------Indra------2.3.110-------

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1043, 'Show And Hide Fields', 'Show And Hide Fields', 'fa fa-align-left', '/home/settings', '3', 'S', 1002, NULL, 'Admin', 14, 'fa fa-align-left', 'Show And Hide Fields', 'Show And Hide Fields', 'A', 0, 1, 0, 'V2', 'SHOW_HIDE_FIELDS', 0, '1002,1014', 'System', '2021-12-28 21:52:12', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (114, 'Show And Hide Field', 'Show And Hide Field', 'SHOW_HIDE_FIELD', 'System', '2021-12-28 19:44:48', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (452, 1043, 114, 'SHOW_HIDE_FIELD', 'System', '2021-12-28 19:46:52', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 457, NULL, 'admin', '2021-12-28 04:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 1045, NULL, 'admin', '2021-12-28 04:00:00', NULL, NULL, NULL, NULL);