INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (32, 'Expense Approval Status');

UPDATE `common_grid_column_template` SET `drop_down_id` = 32 WHERE `id` = 148;

INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (66, 'T', 'Draft');

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (106, 32, 11);

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (107, 32, 12);

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (108, 32, 13);

INSERT INTO `common_drop_down_connection`(`id`, `drop_down_id`, `drop_down_value_id`) VALUES (109, 32, 66);