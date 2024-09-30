UPDATE `common_grid_column_template` SET `column_order` = 7 WHERE `id` = 34;

UPDATE `common_grid_column_template` SET `column_order` = 8 WHERE `id` = 37;

UPDATE `common_grid_column_template` SET `column_order` = 9 WHERE `id` = 38;

UPDATE `common_grid_column_template` SET `column_order` = 10 WHERE `id` = 39;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (5, 'item.parentId', 'Parent Item', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Parent Item', 6);

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,220,218,214,218,218,219,219,219' WHERE `id` = 5;
