DELETE FROM `umm_privilages` WHERE (`id`='55');
DELETE FROM `umm_privilages` WHERE (`id`='56');
DELETE FROM `umm_privilages` WHERE (`id`='57');
DELETE FROM `umm_privilages` WHERE (`id`='58');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `date_created`, `created_user`) VALUES ('58', 'Subscribe for email services', 'Subscribe for email services', '2021-01-07 11:42:46', 'System');

INSERT INTO `umm_menu_privilage` (`menu_id`, `prililage_id`, `data_created`, `user_inserted`) VALUES ('49', '58', '2021-01-08 21:06:40', 'System');

INSERT INTO `umm_menu_privilage` (`menu_id`, `prililage_id`, `data_created`, `user_inserted`) VALUES ('28', '52', '2021-01-08 21:11:40', 'System');