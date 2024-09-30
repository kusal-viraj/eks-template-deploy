DELETE FROM `vendor_grid_column_template` WHERE `id` = 243;
DELETE FROM `vendor_grid_column_template` WHERE `id` = 250;
UPDATE `vendor_grid_state_template` SET `grid_id` = 7, `start_from` = 0, `total_rows` = 15, `column_widths` = '100,210,210,210,210,210,210,210,210,210' WHERE `id` = 7;

DELETE FROM `vendor_grid_state_user_wice`
DELETE FROM `vendor_grid_column_user_wice`


UPDATE `vendor_privilages` SET `url` = 'Under Discussion', `text` = 'Under Discussion', `auth_code` = 'UNDER_DISCUSSION', `created_on` = '2021-05-29 07:11:01', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 39;
UPDATE `vendor_menu_privilage` SET `menu_id` = 1007, `prililage_id` = 39, `auth_code` = 'PO_UNDER_DISCUSSION', `created_by` = 'System', `created_on` = '2021-04-01 00:44:15', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 166;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 173;