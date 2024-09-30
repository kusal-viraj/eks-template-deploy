-------hashila---2.8.33----------


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

ALTER TABLE `common_grid_column_template` 
ADD COLUMN `is_frozen` tinyint(1) NULL AFTER `filter_show`,
ADD COLUMN `frozen_direction` varchar(50) NULL AFTER `is_frozen`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `is_frozen` tinyint(1) NULL AFTER `filter_show`,
ADD COLUMN `frozen_direction` varchar(50) NULL AFTER `is_frozen`;

CREATE TABLE `common_drop_down_url`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `common_grid_column_template` 
ADD COLUMN `drop_down_url_id` int NULL AFTER `column_width`,
ADD CONSTRAINT `DROPDOWN_URL_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `common_drop_down_url` (`id`);

ALTER TABLE `common_grid_column_template` 
DROP COLUMN `drop_down_url`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `drop_down_url_id` int NULL AFTER `column_width`,
ADD CONSTRAINT `DROPDOWN_URL_USER_WISE_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `common_drop_down_url` (`id`);

ALTER TABLE `common_grid_column_user_wice` 
DROP COLUMN `drop_down_url`;








