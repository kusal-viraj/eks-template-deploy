---------Dhanuddara-------2.7.3------------

ALTER TABLE `common_object_sync_mst` 
ADD COLUMN `reference_no` varbinary(300) NULL AFTER `recode_status`,
ADD COLUMN `amount` decimal(19, 2) NULL AFTER `reference_no`;

INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (31, 'Sync Events');

INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (63, 'C', 'Create');
INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (64, 'U', 'Update');
INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (65, 'D', 'Delete');

INSERT INTO `common_drop_down_connection`( `drop_down_id`, `drop_down_value_id`) VALUES ( 31, 63);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES ( 31, 64);
INSERT INTO `common_drop_down_connection`( `drop_down_id`, `drop_down_value_id`) VALUES ( 31, 65);

INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 18, 'syncDetail.recodeStatus', 'Event', 1, 0, 1, 1, 1, 'center', 'dropdown', 'Event', 6, 31, '');
INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 19, 'syncDetail.recodeStatus', 'Event', 1, 0, 1, 1, 1, 'center', 'dropdown', 'Event', 6, 31, '');
INSERT INTO `common_grid_column_template`( `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 20, 'syncDetail.recodeStatus', 'Event', 1, 0, 1, 1, 1, 'center', 'dropdown', 'Event', 6, 31, '');


UPDATE `common_grid_state_template` SET `grid_id` = 18, `start_from` = 0, `total_rows` = 10, `column_widths` = '210,210,210,210,210' WHERE `id` = 17;
UPDATE `common_grid_state_template` SET `grid_id` = 19, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,210,210,210,210,210,210' WHERE `id` = 18;
UPDATE `common_grid_state_template` SET `grid_id` = 20, `start_from` = 0, `total_rows` = 10, `column_widths` = '210,210,210,210,210' WHERE `id` = 19;


UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'syncDetail.referenceNo', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 18 AND `field` = 'reference';
UPDATE `common_grid_column_template` SET `grid_id` = 18, `field` = 'syncDetail.amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 18 AND `field` = 'amount';

UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'syncDetail.referenceNo', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 19 AND `field` = 'reference';
UPDATE `common_grid_column_template` SET `grid_id` = 19, `field` = 'syncDetail.amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 19 AND `field` = 'amount';

UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'syncDetail.referenceNo', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE `grid_id` = 20 AND `field` = 'reference';
UPDATE `common_grid_column_template` SET `grid_id` = 20, `field` = 'syncDetail.amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = NULL WHERE  `grid_id` = 20 AND `field` = 'amount';



CREATE TABLE `common_object_received_mst`  (
  `id` int NOT NULL,
  `papertrl_id` int NOT NULL,
  `tp_id` varbinary(200) NOT NULL,
  `object_type` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `system_id` int NOT NULL,
  `system_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `record_status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `reference_no` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `sync_date_time` datetime(0) NOT NULL,
  `tp_company_id` varbinary(200) NOT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;