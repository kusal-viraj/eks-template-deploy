--------kavindu-2.13.69-------

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (8, 'usm.createdOn', 'usm.createdOn', 'Create Date', 1, 1, 1, 1, 1, 1, 0, NULL, 'center', 'date', 'Create Date', 9, NULL, 150, NULL);
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id`=8;
UPDATE `common_grid_state_template` SET `column_widths`='50,250,200,250,250,250,250,250,50' WHERE  `grid_id`=8;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id`=8;

UPDATE `common_grid_column_template` SET `header`=NULL WHERE  `field`='action';
UPDATE `common_grid_column_user_wice` SET `header`=NULL WHERE  `field`='action';