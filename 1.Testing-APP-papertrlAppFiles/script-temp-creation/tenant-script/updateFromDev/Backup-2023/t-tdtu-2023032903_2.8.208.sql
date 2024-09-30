INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (38, 'Project Code User wise', '/common_service/sec_get_project_code_user_wise?categoryId=2&isCreate=false&billId=0');

UPDATE `common_grid_column_template` SET `drop_down_url_id` = 38 WHERE `id` = 672;

UPDATE `common_grid_column_template` SET `is_sortable` = 0 WHERE `id` = 672;