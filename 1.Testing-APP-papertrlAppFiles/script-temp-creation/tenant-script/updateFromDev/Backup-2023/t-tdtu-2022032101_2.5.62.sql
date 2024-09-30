INSERT INTO `umm_menu`(`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1046, 'Configurations', 'Configurations', 'fa fa-cogs', '/home/settings', '2', 'S', 1002, NULL, 'Admin', 13, 'fa fa-cogs', 'Configurations', 'Configurations', 'A', 0, 1, 0, 'V2', 'CONFIGURATIONS', 0, '1002,1014', 'System', '2022-02-23 13:56:16', NULL, NULL, NULL, NULL);

UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1045;

UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1044;

UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1043;		

UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1028;

UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1027;

UPDATE `umm_menu` SET `status` = 'I' WHERE `id` = 1018;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (121, 'Configure PO Variance Allowance', 'Configure PO Variance Allowance', 'CONFIGURE_PO_VARIANCE_ALLOWANCE', 'System', '2022-03-09 13:11:42', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (122, 'Manage Additional Fields', 'Manage Additional Fields', 'MANAGE_ADDITIONAL_FIELDS', 'System', '2022-03-09 13:12:40', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (123, 'Manage Show/Hide Fields', 'Manage Show/Hide Fields', 'MANAGE_SHOW_HIDE_FIELDS', 'System', '2022-03-09 13:13:49', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (124, 'PO Number Configuration', 'PO Number Configuration', 'PO_NO_CONFIGURATION', 'System', '2022-03-09 13:14:53', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (471, 1046, 121, 'CONFIGURE_PO_VARIANCE_ALLOWANCE', 'System', '2022-03-09 13:32:20', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (472, 1046, 122, 'MANAGE_ADDITIONAL_FIELDS', 'System', '2022-03-09 13:32:42', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (473, 1046, 123, 'MANAGE_SHOW_HIDE_FIELDS', 'System', '2022-03-09 13:33:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (474, 1046, 124, 'PO_NO_CONFIGURATION', 'System', '2022-03-09 13:33:25', NULL, NULL, NULL, NULL);

UPDATE `umm_menu` SET `tab` = '1' WHERE `id` = 1041;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (125, 'Payment Configuration', 'Payment Configuration', 'PAYMENT_CONFIGURATION', 'System', '2022-03-09 15:41:28');

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (126, 'Feature Configuration', 'Feature Configuration', 'FEATURE_CONFIGURATION', 'System', '2022-03-09 15:42:30');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (475, 1046, 125, 'PAYMENT_CONFIGURATION', 'System', '2022-03-09 15:44:47');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (476, 1046, 126, 'FEATURE_CONFIGURATION', 'System', '2022-03-09 15:53:28');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 1046, 'system', '2022-03-21 16:11:25');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 471, 'system', '2022-03-21 16:11:25');
