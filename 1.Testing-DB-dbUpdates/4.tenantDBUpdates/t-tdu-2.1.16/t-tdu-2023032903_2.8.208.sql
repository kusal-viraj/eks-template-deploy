----madusha 2.8.208



INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (38, 'Project Code User wise', '/common_service/sec_get_project_code_user_wise?categoryId=2&isCreate=false&billId=0');

UPDATE `common_grid_column_template` SET `drop_down_url_id` = 38 WHERE `id` = 672;

UPDATE `common_grid_column_template` SET `is_sortable` = 0 WHERE `id` = 672;

UPDATE common_grid_column_user_wice wice 
SET wice.drop_down_url_id=38,wice.is_sortable=0
WHERE wice.grid_id=14 AND wice.field="code.id" AND wice.header="Project";