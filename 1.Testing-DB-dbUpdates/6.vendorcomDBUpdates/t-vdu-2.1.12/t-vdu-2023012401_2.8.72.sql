------hashila-2.8.72-------


ALTER TABLE `vendor_grid_column_template` 
ADD COLUMN `column_width` int NULL AFTER `drop_down_url`;

ALTER TABLE `vendor_grid_column_user_wice` 
ADD COLUMN `column_width` int NULL AFTER `drop_down_url`;

ALTER TABLE `vendor_grid_column_template` 
ADD COLUMN `filter_show` tinyint(1) NULL AFTER `column_width`;

ALTER TABLE `vendor_grid_column_template` 
MODIFY COLUMN `filter_show` tinyint(1) NULL DEFAULT NULL AFTER `can_hide`;

ALTER TABLE `vendor_grid_column_user_wice` 
ADD COLUMN `filter_show` tinyint(1) NULL AFTER `can_hide`;

UPDATE vendor_grid_column_template tmpl SET tmpl.filter_show = tmpl.can_hide;

ALTER TABLE `vendor_grid_column_template` 
ADD COLUMN `is_frozen` tinyint(1) NULL AFTER `filter_show`,
ADD COLUMN `frozen_direction` varchar(50) NULL AFTER `is_frozen`;

ALTER TABLE `vendor_grid_column_user_wice` 
ADD COLUMN `is_frozen` tinyint(1) NULL AFTER `filter_show`,
ADD COLUMN `frozen_direction` varchar(50) NULL AFTER `is_frozen`;

CREATE TABLE `vendor_drop_down_url`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `vendor_grid_column_template` 
ADD COLUMN `drop_down_url_id` int NULL AFTER `column_width`,
ADD CONSTRAINT `DROPDOWN_URL_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `vendor_drop_down_url` (`id`);

ALTER TABLE `vendor_grid_column_template` 
DROP COLUMN `drop_down_url`;

ALTER TABLE `vendor_grid_column_user_wice` 
ADD COLUMN `drop_down_url_id` int NULL AFTER `column_width`,
ADD CONSTRAINT `DROPDOWN_URL_USER_WISE_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `vendor_drop_down_url` (`id`);

ALTER TABLE `vendor_grid_column_user_wice` 
DROP COLUMN `drop_down_url`;

UPDATE `vendor_menu` SET `display_icon` = 'fa fa-paper-plane' WHERE `id` = 1006;

UPDATE `vendor_grid_column_template` SET `column_width` = 150 WHERE `column_width` IS NULL;
UPDATE `vendor_grid_column_template` SET `is_frozen` = false WHERE `is_frozen` IS NULL;
UPDATE `vendor_grid_column_template` SET `column_width` = 50 WHERE `field` = "checkbox" OR `field` = "action";
UPDATE `vendor_grid_column_template` SET `is_frozen` = true, `frozen_direction`="left" WHERE `field` = "checkbox";
UPDATE `vendor_grid_column_template` SET `is_frozen` = true, `frozen_direction`="right", `column_order`=60, `header`= null WHERE `field` = "action";

TRUNCATE TABLE vendor_grid_state_user_wice;
TRUNCATE TABLE vendor_grid_column_user_wice;

UPDATE `vendor_grid_state_template` SET `total_rows` = 25;




