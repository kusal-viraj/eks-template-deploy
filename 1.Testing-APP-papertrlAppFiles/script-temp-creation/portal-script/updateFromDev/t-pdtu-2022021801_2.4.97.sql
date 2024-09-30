INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1045, 'PO Price Variance Configuration', 'PO Price Variance Configuration', 'pi pi-money-bill', '/home/settings', '0', 'S', 1002, NULL, 'Admin', 13, 'pi pi-money-bill', 'PO Price Variance Configuration', 'PO Price Variance Configuration', 'A', 0, 1, 0, 'V2', 'PO_PRICE_VARIANCE_CONFIGURATION', 0, '1002,1014', 'System', '2022-02-17 21:38:28', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 1, 'PO_PRICE_VARIANCE_CONFIGURATION_CREATE', 'System', '2022-02-17 13:58:31');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 2, 'PO_PRICE_VARIANCE_CONFIGURATION_SEARCH', 'System', '2022-02-17 13:59:57');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 4, 'PO_PRICE_VARIANCE_CONFIGURATION_EDIT', 'System', '2022-02-17 14:01:43');

INSERT INTO `umm_menu_privilage`(`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (1045, 5, 'PO_PRICE_VARIANCE_CONFIGURATION_DELETE', 'System', '2022-02-17 14:03:01');