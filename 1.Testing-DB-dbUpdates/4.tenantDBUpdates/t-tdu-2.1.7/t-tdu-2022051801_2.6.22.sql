----------2.6.22----madusha-----------------

INSERT INTO `common_notification_subscription_type`(`id`, `name`, `status`) VALUES (8, 'Credit Note', 'A');

INSERT INTO `common_notification_subscription_event`(`id`, `event`, `enable_notification`, `status`, `subscription_type_id`) VALUES (25, 'A credit note is submitted', 1, 'A', 8);

INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (59, 25, 478);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (60, 25, 479);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (61, 25, 480);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (62, 25, 481);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (63, 25, 482);

INSERT INTO `common_notification_message`(`id`, `notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES (24, 'Credit note', 8, 'has submitted', 1, 25);

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (132, 'Create Credit Note', 'Create Credit Note', 'CREATE_CREDIT_NOTE', 'System', '2022-05-18 15:15:27');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (489, 1021, 132, 'CREATE_CREDIT_NOTE', 'System', '2022-05-18 15:19:56');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 489, 'System', '2022-05-18 15:22:32');

UPDATE `common_grid_state_template` SET `column_widths` = '100,210,210,210,210,210,210,210,210,210,210' WHERE `grid_id` = 49;