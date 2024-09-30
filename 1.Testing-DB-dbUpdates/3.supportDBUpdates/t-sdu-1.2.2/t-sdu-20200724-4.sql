INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `type`, `super_type`,
`super_type_2`, `department`, `date_created`, `created_user`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`) VALUES 
(47, 'Integration Configuration', 'Integration Configuration', ' card text-white bg-info', '/home/support/integration-management/integration-config', 'S', 15, NULL, 'Admin',
'2020-06-25 13:17:49', 'System', 8, 'fa fa-plug', 'Integration', ' Configuration', 'A');

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`, `data_created`, `user_inserted`) VALUES
(73, 47, 1, '2020-06-25 13:51:20', 'System');

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `inserted_date`, `inserted_user`) VALUES 
(1, 73, '2020-06-25 13:52:26', 'support');


