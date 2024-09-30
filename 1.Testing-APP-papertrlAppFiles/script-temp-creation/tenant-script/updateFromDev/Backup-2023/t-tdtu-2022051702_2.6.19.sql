ALTER TABLE `vp_credit_note`
ADD COLUMN `submitted_by_vendor` tinyint(1) NULL AFTER `created_by_name`;

INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (30, 'Credit Note Status');

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (30, 1);

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (30, 48);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES (49, 'creditNote.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 11, 30);

UPDATE `common_grid_state_template` SET `column_widths` = '100,210,210,210,210,210,210,210,210,210' WHERE `id` = 49;