-----------Madhusha------2.3.7-----------

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1041', 'Departments', 'Departments', 'fa fa-sitemap', '/home/admin', '3', 'S', '1001', NULL, 'Admin', '12', 'fa fa-sitemap', 'Departments', 'Departments', 'A', '0', '1', '0', 'V2', 'DEPARTMENTS', '0', '1001,1014', 'System', '2021-04-13 15:10:36', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('438', '1041', '1', 'DEPARTMENT_CREATE', 'System', '2021-11-11 10:13:05', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('439', '1041', '4', 'DEPARTMENT_EDIT', 'System', '2021-11-11 10:15:26', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('440', '1041', '5', 'DEPARTMENT_DELETE', 'System', '2021-11-11 10:16:21', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('441', '1041', '13', 'DEPARTMENT_INACTIVE', 'System', '2021-11-11 10:17:25', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('442', '1041', '14', 'DEPARTMENT_ACTIVE', 'System', '2021-11-11 10:18:04', NULL, NULL, NULL, NULL);