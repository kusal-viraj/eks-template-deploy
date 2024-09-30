DELETE FROM `vendor_grid_column_template` WHERE `id` = 232;
DELETE FROM `vendor_grid_column_template` WHERE `id` = 259;

UPDATE `vendor_grid_state_template` SET `grid_id` = 7, `start_from` = 0, `total_rows` = 15, `column_widths` = '210,210,210,210,210,210,210,210,210' WHERE `id` = 7;
UPDATE `vendor_grid_state_template` SET `grid_id` = 9, `start_from` = 0, `total_rows` = 15, `column_widths` = '210,210,210,210,210,210' WHERE `id` = 24;

DELETE  FROM `vendor_grid_state_user_wice`;
DELETE FROM `vendor_grid_column_user_wice`;

UPDATE `vendor_menu` SET `name` = 'Vendor', `display_text` = 'Company Profile', `menu_style` = 'fa fa-user', `url` = 'profile', `tab` = NULL, `type` = 'S', `super_type` = 1004, `super_type_2` = NULL, `department` = 'Admin', `menu_order` = 3, `display_icon` = 'fa fa-street-view', `short_name` = 'Vendor', `detail_text` = 'Management', `status` = 'A', `portal_menu` = 0, `individual_tenant_menu` = 0, `vendor_community_menu` = 1, `version` = 'V2', `auth_code` = 'VENDOR', `slim_menu` = 1, `created_by` = 'System', `created_on` = '2021-04-15 18:29:58', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL, `hierachy` = '1004' WHERE `id` = 1005;


UPDATE `vendor_menu_privilage` SET `menu_id` = 1000 WHERE `id` = 196;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 190;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 191;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 192;

DELETE FROM `vendor_menu_privilage` WHERE `id` = 185;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 186;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 187;


UPDATE `vendor_role_mst` SET `name` = 'All Privileges' WHERE `id` = 1;
DELETE FROM `vendor_role_previlege` WHERE role_id=1;


INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 46, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1000, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 193, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 195, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1001, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1002, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 2, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 3, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 4, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 5, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 34, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 38, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 182, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 183, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 184, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1003, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 6, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 7, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 8, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 9, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 10, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 39, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 40, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1004, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1005, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 14, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1006, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 172, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 188, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 189, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1007, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 160, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 161, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 166, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 170, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 194, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 196, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1008, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1010, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 175, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 1009, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 174, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 176, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 177, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 178, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 179, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 180, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege`( `role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1, 181, NULL, 'bemaje4477@geekale.com', '2021-06-04 02:24:12', NULL, NULL, NULL, NULL);

