--------2.7.8------hashila------

ALTER TABLE `vp_receipt_mst` 
ADD COLUMN `employee_id` varchar(100) NULL AFTER `description`,
ADD COLUMN `employee_name` varchar(200) NULL AFTER `employee_id`;

INSERT INTO `common_notification_subscription_type`(`id`, `name`, `status`) VALUES (10, 'Receipt', 'A');

INSERT INTO `common_notification_subscription_event`(`id`, `event`, `enable_notification`, `enable_email`, `status`, `subscription_type_id`) VALUES (35, 'A receipt upload by someone else on your behalf', 1, 0, 'A', 10);

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (135, 'Upload receipts for other users', 'Upload receipts for other users', 'RECEIPT_UPLOAD_FOR_USER', 'System', '2022-07-04 13:41:34', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (516, 1057, 135, 'CREDIT_CARD_RECEIPT_UPLOAD_FOR_USER', 'System', '2022-07-04 13:42:33', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 516, 'System', '2022-07-04 13:43:38');

INSERT INTO `common_notification_message`(`notification_type_name`, `notification_type_id`, `notification_message`, `clickable`, `event_id`) VALUES ('Credit card transaction', 10, 'A receipt has been uploaded by EMPLOYEE_NAME on your behalf.', 1, 35);

INSERT INTO `common_notification_subscription_privilege`(`subscription_event_id`, `menu_privilege`) VALUES (35, 516);

DELETE FROM `common_grid_column_template` WHERE `grid_id` = 57 AND `field` = 'vendor.id';

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 57 AND `field` = 'vendor.id';

DELETE FROM `common_grid_column_template` WHERE `grid_id` = 53 AND `field` = 'vendor.id';

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 53 AND `field` = 'vendor.id';

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,210,210,210,350,210' WHERE `id` = 53;

UPDATE `common_grid_state_user_wice` SET `column_widths` = '50,100,210,210,210,210,350,210' WHERE `id` = 53;

UPDATE `common_grid_state_template` SET `column_widths` = '210,210,210,210,210,100' WHERE `id` = 57;

UPDATE `common_grid_state_user_wice` SET `column_widths` = '210,210,210,210,210,100' WHERE `id` = 57;
