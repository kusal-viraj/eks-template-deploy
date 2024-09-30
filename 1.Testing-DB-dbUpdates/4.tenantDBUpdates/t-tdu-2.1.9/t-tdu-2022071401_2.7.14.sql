---------------Hashila-------2.7.14------------

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (53, 'receipt.createdBy', 'Uploaded By', 1, 1, 1, 1, 1, 'left', 'input', 'Uploaded By', 9);

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `grid_id` = 53 AND `field` = 'receipt.createdOn';

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,210,210,210,350,210,210' WHERE `id` = 53;

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 53;

DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 53;

UPDATE `common_notification_message` SET `notification_message` = 'A receipt has been uploaded by EMPLOYEE_NAME on your behalf' WHERE `event_id` = 35 AND `notification_type_id` = 10;

















