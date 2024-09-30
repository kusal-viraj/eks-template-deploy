INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (49, 'creditNote.creditBalance', 'Credit Balance', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Balance', 8);

UPDATE `common_grid_column_template` SET `column_order` = 9 WHERE `id` = 500;

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `id` = 501;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (14, 'bill.creditAmount', 'Credit Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Credit Amount', 25);

UPDATE `common_grid_state_template` SET `column_widths` = '51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200' WHERE `id` = 14;

UPDATE `umm_menu` SET `url` = '/home/bills' WHERE `id` = 1049;