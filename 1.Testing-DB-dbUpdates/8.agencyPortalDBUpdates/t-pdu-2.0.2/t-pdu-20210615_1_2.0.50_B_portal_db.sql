INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`) VALUES ('1027', 'PO Number Configuration', 'PO Number Configuration', 'fa fa-building', '/home/settings', '0', 'S', '1002', 'Admin', '13', 'fa fa-pencil-square-o', 'PO Number Configuration', 'PO Number Configuration', 'A', '1', '0', 'V2', 'PO_NUMBER_CONFIGURATION', '0', '1002,1014', 'System', '2021-06-14 21:38:28');

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('378', '1027', '1', 'PO_NUMBER_CONFIGURATION_CREATE', 'System', '2021-06-14 21:41:05');

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('379', '1027', '2', 'PO_NUMBER_CONFIGURATION_SEARCH', 'System', '2021-06-14 21:41:57');

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('380', '1027', '4', 'PO_NUMBER_CONFIGURATION_EDIT', 'System', '2021-06-14 21:42:42');

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('381', '1027', '5', 'PO_NUMBER_CONFIGURATION_DELETE', 'System', '2021-06-14 21:43:22');