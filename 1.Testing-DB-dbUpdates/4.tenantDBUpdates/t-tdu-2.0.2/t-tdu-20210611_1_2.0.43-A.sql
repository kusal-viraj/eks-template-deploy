UPDATE `common_notification_message` SET `notification_message`='has submitted for your approval' WHERE  `id`=1;
UPDATE `common_notification_message` SET `notification_message`='has approved' WHERE  `id`=2;
UPDATE `common_notification_message` SET `notification_message`='has rejected' WHERE  `id`=3;
UPDATE `common_notification_message` SET `notification_message`='has submitted for your approval group' WHERE  `id`=4;
UPDATE `common_notification_message` SET `notification_message`='no users in an assigned approval group' WHERE  `id`=5;
UPDATE `common_notification_message` SET `notification_message`='has submitted for your approval' WHERE  `id`=6;
UPDATE `common_notification_message` SET `notification_message`='has approved' WHERE  `id`=7;
UPDATE `common_notification_message` SET `notification_message`='has rejected' WHERE  `id`=8;
UPDATE `common_notification_message` SET `notification_message`='has submitted for your approval group' WHERE  `id`=9;
UPDATE `common_notification_message` SET `notification_message`='no users in an assigned approval group' WHERE  `id`=10;
UPDATE `common_notification_message` SET `notification_message`='has submitted for your approval' WHERE  `id`=11;
UPDATE `common_notification_message` SET `notification_message`='has approved' WHERE  `id`=12;
UPDATE `common_notification_message` SET `notification_message`='has rejected' WHERE  `id`=13;
UPDATE `common_notification_message` SET `notification_message`='has submitted for your approval group' WHERE  `id`=14;
UPDATE `common_notification_message` SET `notification_message`='no users in an assigned approval group' WHERE  `id`=15;

INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (10, 'appCode.description', 'Description', 1, 0, 0, 1, 1, 'left', 'input', 'Description', 4, NULL, '');
INSERT INTO `umm_menu_privilage`( `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1011, 5, 'USERS_DELETE', 'System', '2021-06-11 13:30:32', NULL, NULL, NULL, NULL);

UPDATE `vp_bill` SET `submitted_by_vendor` = 0 WHERE `submitted_by_vendor` IS NULL;