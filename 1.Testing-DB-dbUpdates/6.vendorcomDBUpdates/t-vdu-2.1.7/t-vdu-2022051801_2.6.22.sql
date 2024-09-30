----------2.6.22----madusha-----------------

INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 216, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 217, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 218, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 219, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 220, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 221, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 222, 'system', '2022-05-18 15:28:30');
INSERT INTO `vendor_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 223, 'system', '2022-05-18 15:28:30');

UPDATE `vendor_grid_state_template` SET `column_widths` = '100,210,210,210,210,210,210,210,210,210' WHERE `grid_id` = 27;

INSERT INTO `vendor_drop_down_value`(`id`, `value`, `label`) VALUES (32, 'S', 'Inactive');

UPDATE `vendor_drop_down_connection` SET `drop_down_value_id` = 32 WHERE `drop_down_id` = 30 AND `drop_down_value_id` = 2;