-----------Dhanuddara------2.7.5--------------

DELETE  FROM `common_grid_state_user_wice` WHERE grid_id IN (18,19,20,21);

INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 21, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, NULL);
INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 21, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, NULL);
INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 21, 'syncDetail.recodeStatus', 'Event', 1, 0, 1, 1, 1, 'center', 'dropdown', 'Event', 6, 31, '');
INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 21, 'syncDetail.tpCompanyId', 'Company', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Company', 8, NULL, '');

UPDATE `common_grid_column_template` SET `grid_id` = 21, `field` = 'syncDetail.referenceNo', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Name', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 21 AND `header` = 'Reference No';
UPDATE `common_grid_column_template` SET `grid_id` = 21, `field` = 'syncDetail.objectType', `header` = 'Data Type', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'dropdown', `placeholder` = 'Object Type', `column_order` = 4, `drop_down_id` = 19, `drop_down_url` = NULL WHERE `grid_id` = 21 AND `header` = 'Data Type';
UPDATE `common_grid_column_template` SET `grid_id` = 21, `field` = 'fail.failedDateTime', `header` = 'Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Date', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 21 AND `header` = 'Date';
UPDATE `common_grid_column_template` SET `grid_id` = 21, `field` = 'fail.failedReason', `header` = 'Message', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Message', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 21 AND `header` = 'Message';

UPDATE `common_grid_state_template` SET `grid_id` = 21, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,210,210,210,210,210,300,210' WHERE `id` = 20;

ALTER TABLE `common_integration_failed_record` 
ADD COLUMN `tp_company_id` varbinary(200) NULL AFTER `system_name`;

INSERT INTO `common_grid_template`(`grid_name`) VALUES ('SYNC_ACCOUNT_COMPLETED_PULL');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (58, 'pullDetail.referenceNo', 'Reference No', 1, 0, 0, 1, 1, 'left', 'input', 'Reference No', 3, NULL, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (58, 'pullDetail.amount', 'Amount', 1, 0, 1, 1, 1, 'right', 'numeric', 'Amount', 3, NULL, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (58, 'pullDetail.syncDateTime', 'Date', 1, 0, 1, 1, 1, 'center', 'date', 'Date', 1, NULL, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (58, 'pullDetail.objectType', 'Data Type', 1, 0, 1, 1, 1, 'left', 'dropdown', 'Data Type', 2, 19, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (58, 'pullDetail.recodeStatus', 'Event', 1, 0, 1, 1, 1, 'center', 'dropdown', 'Event', 6, 31, '');

INSERT INTO `common_grid_state_template`(`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (58, 0, 10, '210,210,210,210,210');



