---kavindu 2.9.66---



INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (6, 'tenant.packageName', 'tenant.packageName', 'Package', 1, 1, 0, 1, 1, 1, NULL, NULL, 'center', 'input', 'Package', 4, NULL, 150, NULL);
 
UPDATE `common_grid_state_template` SET `column_widths`='100,220,220,220,220' WHERE `grid_id`=6;
 
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id`=6;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id`=6;

UPDATE `common_grid_column_template` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `field` LIKE 'tenant.%';
UPDATE `common_grid_column_user_wice` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `field` LIKE 'tenant.%';