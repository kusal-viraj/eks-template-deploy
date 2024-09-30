-----------Madhusha-------2.3.7---------

ALTER TABLE `common_department`
ADD COLUMN `created_username`  varchar(100) NULL AFTER `delete_on`;


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('46', 'DEPARTMENT_LIST');


INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('46', 'dept.departmentCode', 'Department Code', '1', '1', '1', '1', '1', 'left', 'input', 'Department Code', '3');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('46', 'dept.departmentName', 'Department Name', '1', '1', '1', '1', '1', 'left', 'input', 'Department Name', '4');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('46', 'dept.createdUsername', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '5');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('46', 'dept.createdOn', 'Created Date', '1', '1', '1', '1', '1', 'center', 'date', 'Created Date', '6');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('46', 'dept.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Status', '7');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('46', 'checkbox', '1', '0', '0', '0', '0', 'center', 'checkbox', '1');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('46', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '2');


INSERT INTO `common_grid_state_template` (`grid_id`, `total_rows`, `column_widths`) VALUES ('46', '15', '50,100,210,210,210,210,210');


INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1041', 'Departments', 'Departments', 'fa fa-sitemap', '/home/admin', '3', 'S', '1001', NULL, 'Admin', '12', 'fa fa-sitemap', 'Departments', 'Departments', 'A', '0', '1', '0', 'V2', 'DEPARTMENTS', '0', '1001,1014', 'System', '2021-04-13 15:10:36', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('438', '1041', '1', 'DEPARTMENT_CREATE', 'System', '2021-11-11 10:13:05', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('439', '1041', '4', 'DEPARTMENT_EDIT', 'System', '2021-11-11 10:15:26', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('440', '1041', '5', 'DEPARTMENT_DELETE', 'System', '2021-11-11 10:16:21', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('441', '1041', '13', 'DEPARTMENT_INACTIVE', 'System', '2021-11-11 10:17:25', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('442', '1041', '14', 'DEPARTMENT_ACTIVE', 'System', '2021-11-11 10:18:04', NULL, NULL, NULL, NULL);


