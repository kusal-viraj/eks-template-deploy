UPDATE `common_grid_column_template` SET `grid_id` = 9, `field` = 'req.vendorEmail', `header` = 'Email Address', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Email Address', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 73;
UPDATE `common_grid_column_template` SET `grid_id` = 9, `field` = 'req.status', `header` = 'Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Status', `column_order` = 8, `drop_down_id` = 15, `drop_down_url` = '' WHERE `id` = 75;
DELETE FROM `common_grid_column_user_wice`;