INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`,
`url`, `type`, `super_type`, `super_type_2`, `department`,
`date_created`, `created_user`, `menu_order`, `display_icon`,
`short_name`, `detail_text`, `status`, `portal_menu`) VALUES (51,
'Item Management', 'Item Management', 'card text-white bg-info',
'/home/item-catalogue/management/item-management', 'S', 5, NULL,
'Admin', '2020-09-28 14:38:35', 'System', 309, 'fa fa-cube', 'Item',
'Management', 'A', 0);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (203, 51, 1, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (204, 51, 2, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (205, 51, 3, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (206, 51, 4, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (207, 51, 5, '2020-09-16 12:00:00', 'System');

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`,
`url`, `type`, `super_type`, `super_type_2`, `department`,
`date_created`, `created_user`, `menu_order`, `display_icon`,
`short_name`, `detail_text`, `status`, `portal_menu`) VALUES (52,
'Account Management', 'Account Management', 'card text-white bg-info',
'/home/account/management/account-management', 'S', 5, NULL, 'Admin',
'2020-09-28 18:20:40', 'System', 209, 'fa fa-usd', 'Account',
'Management', 'A', 0);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (208, 52, 1, '2020-09-17 19:40:52', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (209, 52, 2, '2020-09-17 19:41:24', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (210, 52, 4, '2020-09-28 18:26:43', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (211, 52, 5, '2020-09-17 19:43:07', 'System');
