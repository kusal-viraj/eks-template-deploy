ALTER TABLE `common_grid_column_template` 
ADD COLUMN `column_width` int NULL AFTER `drop_down_url`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `column_width` int NULL AFTER `drop_down_url`;

ALTER TABLE `common_grid_column_template` 
ADD COLUMN `filter_show` tinyint(1) NULL AFTER `column_width`;

ALTER TABLE `common_grid_column_template` 
MODIFY COLUMN `filter_show` tinyint(1) NULL DEFAULT NULL AFTER `can_hide`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `filter_show` tinyint(1) NULL AFTER `can_hide`;

UPDATE common_grid_column_template tmpl SET tmpl.filter_show = tmpl.can_hide;
