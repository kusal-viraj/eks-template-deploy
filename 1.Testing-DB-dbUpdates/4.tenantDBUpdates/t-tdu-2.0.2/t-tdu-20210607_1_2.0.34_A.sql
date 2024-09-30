UPDATE `common_notification_subscription_event` SET `event`='A bill is submitted for your approval' WHERE  `id`=1;
UPDATE `common_notification_subscription_event` SET `event`='A bill you submitted is approved' WHERE  `id`=2;
UPDATE `common_notification_subscription_event` SET `event`='A bill you submitted is rejected' WHERE  `id`=3;
UPDATE `common_notification_subscription_event` SET `event`='A bill is submitted for your approval group' WHERE  `id`=13;
UPDATE `common_notification_subscription_event` SET `event`='There are no users in an assigned approval group' WHERE  `id`=14;
UPDATE `common_notification_subscription_event` SET `event`='A purchase order is submitted for your approval' WHERE  `id`=4;
UPDATE `common_notification_subscription_event` SET `event`='A purchase order you submitted is approved' WHERE  `id`=5;
UPDATE `common_notification_subscription_event` SET `event`='A purchase order you submitted is rejected' WHERE  `id`=6;
UPDATE `common_notification_subscription_event` SET `event`='A purchase order is submitted for your approval group' WHERE  `id`=15;
UPDATE `common_notification_subscription_event` SET `event`='There are no users in an assigned approval group' WHERE  `id`=16;
UPDATE `common_notification_subscription_event` SET `event`='An expense report is submitted for your approval' WHERE  `id`=7;
UPDATE `common_notification_subscription_event` SET `event`='An expense report you submitted is approved' WHERE  `id`=8;
UPDATE `common_notification_subscription_event` SET `event`='An expense report you submitted is rejected' WHERE  `id`=9;
UPDATE `common_notification_subscription_event` SET `event`='An expense report is submitted for your approval group' WHERE  `id`=17;
UPDATE `common_notification_subscription_event` SET `event`='There are no users in an assigned approval group' WHERE  `id`=18;



ALTER TABLE `common_integration_service_group`
ADD COLUMN `sort_order` int NOT NULL AFTER `visibility`;


UPDATE `common_integration_service_group` SET `name` = 'Chart of Accounts', `visibility` = 1, `sort_order` = 1 WHERE `id` = 1;
UPDATE `common_integration_service_group` SET `name` = 'UOMs', `visibility` = 0, `sort_order` = 11 WHERE `id` = 2;
UPDATE `common_integration_service_group` SET `name` = 'Items', `visibility` = 1, `sort_order` = 8 WHERE `id` = 3;
UPDATE `common_integration_service_group` SET `name` = 'Item Categories', `visibility` = 0, `sort_order` = 12 WHERE `id` = 4;
UPDATE `common_integration_service_group` SET `name` = 'Project Codes', `visibility` = 1, `sort_order` = 9 WHERE `id` = 5;
UPDATE `common_integration_service_group` SET `name` = 'Terms', `visibility` = 0, `sort_order` = 13 WHERE `id` = 6;
UPDATE `common_integration_service_group` SET `name` = 'Vendors', `visibility` = 1, `sort_order` = 2 WHERE `id` = 7;
UPDATE `common_integration_service_group` SET `name` = 'Purchase Order', `visibility` = 1, `sort_order` = 5 WHERE `id` = 8;
UPDATE `common_integration_service_group` SET `name` = 'Bills', `visibility` = 1, `sort_order` = 3 WHERE `id` = 9;
UPDATE `common_integration_service_group` SET `name` = 'Purchase Order Receipts', `visibility` = 1, `sort_order` = 6 WHERE `id` = 10;
UPDATE `common_integration_service_group` SET `name` = 'Payments', `visibility` = 1, `sort_order` = 4 WHERE `id` = 11;
UPDATE `common_integration_service_group` SET `name` = 'Expenses', `visibility` = 1, `sort_order` = 7 WHERE `id` = 12;
UPDATE `common_integration_service_group` SET `name` = 'Deleted Records', `visibility` = 1, `sort_order` = 10 WHERE `id` = 13;



UPDATE `common_integration_service` SET `name` = 'Push accounts to', `status` = 'A', `service_type` = 1, `service_group_id` = 1 WHERE `id` = 1;
UPDATE `common_integration_service` SET `name` = 'Pull accounts from', `status` = 'A', `service_type` = 2, `service_group_id` = 1 WHERE `id` = 2;
UPDATE `common_integration_service` SET `name` = 'Pull unit of measurements from', `status` = 'A', `service_type` = 2, `service_group_id` = 2 WHERE `id` = 3;
UPDATE `common_integration_service` SET `name` = 'Push unit of measurements to', `status` = 'A', `service_type` = 1, `service_group_id` = 2 WHERE `id` = 4;
UPDATE `common_integration_service` SET `name` = 'Push items to', `status` = 'A', `service_type` = 1, `service_group_id` = 3 WHERE `id` = 5;
UPDATE `common_integration_service` SET `name` = 'Pull items from', `status` = 'A', `service_type` = 2, `service_group_id` = 3 WHERE `id` = 6;
UPDATE `common_integration_service` SET `name` = 'Push project codes to', `status` = 'A', `service_type` = 1, `service_group_id` = 5 WHERE `id` = 7;
UPDATE `common_integration_service` SET `name` = 'Pull project codes from', `status` = 'A', `service_type` = 2, `service_group_id` = 5 WHERE `id` = 8;
UPDATE `common_integration_service` SET `name` = 'Push payment terms to', `status` = 'A', `service_type` = 1, `service_group_id` = 6 WHERE `id` = 9;
UPDATE `common_integration_service` SET `name` = 'Pull payment terms from', `status` = 'A', `service_type` = 2, `service_group_id` = 6 WHERE `id` = 10;
UPDATE `common_integration_service` SET `name` = 'Push vendors to', `status` = 'A', `service_type` = 1, `service_group_id` = 7 WHERE `id` = 11;
UPDATE `common_integration_service` SET `name` = 'Pull vendors from', `status` = 'A', `service_type` = 2, `service_group_id` = 7 WHERE `id` = 12;
UPDATE `common_integration_service` SET `name` = 'Push purchase orders to', `status` = 'A', `service_type` = 1, `service_group_id` = 8 WHERE `id` = 13;
UPDATE `common_integration_service` SET `name` = 'Pull purchase orders from', `status` = 'A', `service_type` = 2, `service_group_id` = 8 WHERE `id` = 14;
UPDATE `common_integration_service` SET `name` = 'Push bills to', `status` = 'A', `service_type` = 1, `service_group_id` = 9 WHERE `id` = 15;
UPDATE `common_integration_service` SET `name` = 'Pull bills from', `status` = 'A', `service_type` = 2, `service_group_id` = 9 WHERE `id` = 16;
UPDATE `common_integration_service` SET `name` = 'Push purchase order receipts to', `status` = 'A', `service_type` = 1, `service_group_id` = 10 WHERE `id` = 17;
UPDATE `common_integration_service` SET `name` = 'Pull purchase order receipts from', `status` = 'A', `service_type` = 2, `service_group_id` = 10 WHERE `id` = 18;
UPDATE `common_integration_service` SET `name` = 'Push payments to', `status` = 'A', `service_type` = 1, `service_group_id` = 11 WHERE `id` = 19;
UPDATE `common_integration_service` SET `name` = 'Pull payments from', `status` = 'A', `service_type` = 2, `service_group_id` = 11 WHERE `id` = 20;
UPDATE `common_integration_service` SET `name` = 'Push deleted records to', `status` = 'A', `service_type` = 1, `service_group_id` = 13 WHERE `id` = 21;
UPDATE `common_integration_service` SET `name` = 'Pull deleted records from', `status` = 'A', `service_type` = 2, `service_group_id` = 13 WHERE `id` = 22;
UPDATE `common_integration_service` SET `name` = 'Push expenses to', `status` = 'A', `service_type` = 1, `service_group_id` = 12 WHERE `id` = 23;
UPDATE `common_integration_service` SET `name` = 'Pull item categories from', `status` = 'A', `service_type` = 2, `service_group_id` = 4 WHERE `id` = 24;
UPDATE `common_integration_service` SET `name` = 'Push item categories to', `status` = 'A', `service_type` = 1, `service_group_id` = 4 WHERE `id` = 25;


DELETE FROM `common_grid_column_template` WHERE `id` = 175;
DELETE FROM `common_grid_column_template` WHERE `id` = 176;
DELETE FROM `common_grid_column_template` WHERE `id` = 184;
DELETE FROM `common_grid_column_template` WHERE `id` = 185;
DELETE FROM `common_grid_column_template` WHERE `id` = 191;
DELETE FROM `common_grid_column_template` WHERE `id` = 192;


UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'reference', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Reference No', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 170;
UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 172;
UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'syncDetail.syncDateTime', `header` = 'Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Date', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 173;
UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'syncDetail.objectType', `header` = 'Data Type', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Data Type', `column_order` = 2, `drop_down_id` = 19, `drop_down_url` = NULL WHERE `id` = 174;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'checkbox', `header` = NULL, `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'checkbox', `placeholder` = '', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 177;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'action', `header` = 'Action', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'actionButton', `placeholder` = '', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 178;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'reference', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Reference No', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 179;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 181;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'syncDetail.syncDateTime', `header` = 'Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Date', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 182;
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'syncDetail.objectType', `header` = 'Data Type', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Data Type', `column_order` = 4, `drop_down_id` = 19, `drop_down_url` = NULL WHERE `id` = 183;
UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'reference', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Reference No', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 186;
UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 188;
UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'syncDetail.syncDateTime', `header` = 'Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Date', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `id` = 189;
UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'syncDetail.objectType', `header` = 'Data Type', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Data Type', `column_order` = 2, `drop_down_id` = 19, `drop_down_url` = NULL WHERE `id` = 190;


DELETE FROM `common_grid_state_user_wice`;
DELETE FROM `common_grid_column_user_wice`;