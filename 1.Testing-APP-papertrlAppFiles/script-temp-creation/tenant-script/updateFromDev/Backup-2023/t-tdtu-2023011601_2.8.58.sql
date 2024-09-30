INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (34, 'Approval Status for Payment');

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (34, 11);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (34, 12);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (34, 13);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (34, 8);

UPDATE `common_grid_column_template` SET `drop_down_id` = 34 WHERE `grid_id` = 62 AND `field` = 'txn.status';

UPDATE `umm_privilages` SET `url` = 'Cancel Payment', `text` = 'Cancel Payment' WHERE `id` = 28;
UPDATE `umm_menu_privilage` SET `menu_id` = 1020 WHERE `id` = 83;

DELETE FROM `umm_role_previlege` WHERE `privilege_id` = 83;
