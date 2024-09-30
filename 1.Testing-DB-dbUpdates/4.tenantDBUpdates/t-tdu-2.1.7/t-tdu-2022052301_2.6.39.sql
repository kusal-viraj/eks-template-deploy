--------Madhusha----2.6.39---------

INSERT INTO `common_notification_subscription_event`(`id`, `event`, `enable_notification`, `status`, `subscription_type_id`) VALUES (26, 'A credit note is deleted', 1, 'A', 8);

INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (64, 26, 478);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (65, 26, 479);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (66, 26, 480);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (67, 26, 481);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (68, 26, 482);

INSERT INTO `common_notification_message`(`id`, `notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES (25, 'Credit note', 8, 'has deleted', 0, 26);


INSERT INTO `common_notification_subscription_event`(`id`, `event`, `enable_notification`, `status`, `subscription_type_id`) VALUES (27, 'A credit note is canceled', 1, 'A', 8);

INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (69, 27, 478);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (70, 27, 479);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (71, 27, 480);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (72, 27, 481);
INSERT INTO `common_notification_subscription_privilege`(`id`, `subscription_event_id`, `menu_privilege`) VALUES (73, 27, 482);

INSERT INTO `common_notification_message`(`id`, `notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES (26, 'Credit note', 8, 'has canceled', 1, 27);