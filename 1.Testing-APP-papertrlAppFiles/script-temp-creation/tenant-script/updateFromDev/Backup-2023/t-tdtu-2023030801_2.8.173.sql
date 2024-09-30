INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (37, 'Company List', '/integration/sec_get_selected_companies_v2');
UPDATE `common_grid_column_template` SET `drop_down_url_id` = 37 WHERE `grid_id` = 59 AND `field` = 'incompleteDetail.tpCompanyId';
UPDATE `common_grid_column_template` SET `drop_down_url_id` = 37 WHERE `grid_id` = 21 AND `field` = 'syncDetail.tpCompanyId';
