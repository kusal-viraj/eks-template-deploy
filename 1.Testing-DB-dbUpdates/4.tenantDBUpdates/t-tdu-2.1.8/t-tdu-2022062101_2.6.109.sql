-----------Hashila-----2.6.109--------

ALTER TABLE `vp_bill_expense_cost_distribution` 
ADD COLUMN `transaction_id` int NULL AFTER `receipt_file_type`;

ALTER TABLE `hst_vp_bill_expense_cost_distribution` 
ADD COLUMN `transaction_id` int NULL AFTER `receipt_file_type`;

DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 50;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 51;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 53;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 54;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 55;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 56;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 57;

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 50;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 51;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 53;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 54;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 55;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 56;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 57;
