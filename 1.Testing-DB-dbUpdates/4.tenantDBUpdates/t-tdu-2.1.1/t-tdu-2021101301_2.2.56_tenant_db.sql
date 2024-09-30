------------------------Amal-------------2.2.56----------------

UPDATE `umm_menu` SET `display_text` = 'Projects' WHERE (`id` = '1010');

UPDATE `umm_menu` SET `display_text` = 'Automations' WHERE (`id` = '1003');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (470, 2, 'usm.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 9, NULL, '');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (471, 2, 'usm.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'left', 'date', 'Created Date', 10, NULL, '');

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,255,268,246,256,256,256,256,256' WHERE (`id` = '3');

