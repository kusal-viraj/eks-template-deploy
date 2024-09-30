---------Madhusha-----2.5.118---------

INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1049, 'Credit Note', 'Credit Note', 'fa fa-list-alt', '/home/credit-note', '0', 'S', 1015, NULL, 'Admin', 9, 'fa fa-list-alt', 'Credit Note', 'Credit Note', 'A', 0, 1, 0, 'V2', 'CREDIT_NOTE', 1, '1005,1015', 'System', '2022-04-15 14:39:10', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (478, 1049, 1, 'CREDIT_NOTE_CREATE', 'System', '2022-04-15 15:00:32', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (479, 1049, 2, 'CREDIT_NOTE_SEARCH', 'System', '2022-04-19 10:36:27', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (480, 1049, 3, 'CREDIT_NOTE_DETAIL_VIEW', 'System', '2022-04-19 10:40:33', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (481, 1049, 4, 'CREDIT_NOTE_EDIT', 'System', '2022-04-19 10:40:49', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (482, 1049, 5, 'CREDIT_NOTE_DELETE', 'System', '2022-04-19 10:42:43', NULL, NULL, NULL, NULL);