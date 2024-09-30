
UPDATE `common_grid_column_template` SET `column_width` = 150 WHERE `column_width` IS NULL;
UPDATE `common_grid_column_template` SET `is_frozen` = false WHERE `is_frozen` IS NULL;
UPDATE `common_grid_column_template` SET `column_width` = 50 WHERE `field` = "checkbox" OR `field` = "action";
UPDATE `common_grid_column_template` SET `is_frozen` = true, `frozen_direction`="left" WHERE `field` = "checkbox";
UPDATE `common_grid_column_template` SET `is_frozen` = true, `frozen_direction`="right", `column_order`=60, `header`= null WHERE `field` = "action";
