ALTER TABLE `vp_credit_card_statement_detail` 
ADD COLUMN `employee_name` varchar(200) NULL AFTER `receipt_id`;

ALTER TABLE `vp_credit_card_for_employee` 
ADD COLUMN `employee_name` varchar(200) NULL AFTER `employee_id`;

ALTER TABLE `vp_receipt_mst` 
ADD COLUMN `created_by_name` varchar(200) NULL AFTER `created_by`;

UPDATE `common_grid_column_template` SET `field` = 'transaction.employeeName' WHERE `grid_id` = 56 AND `header` = 'Employee';
UPDATE `common_grid_column_template` SET `field` = 'transaction.employeeName' WHERE `grid_id` = 55 AND `header` = 'Employee';

UPDATE `common_grid_column_template` SET `search_type` = 'input', `field` = 'card.employeeName' WHERE `field` = 'card.employeeId' AND `grid_id` = 51;

UPDATE `common_grid_column_template` SET `field` = 'transaction.approvalGroupName' WHERE `grid_id` = 55 AND `header` = 'Approve Group';
UPDATE `common_grid_column_template` SET `field` = 'transaction.approvalGroupName' WHERE `grid_id` = 56 AND `header` = 'Approve Group';

INSERT INTO `common_grid_column_template`(`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (587, 53, 'receipt.createdOn', 'Uploaded Date', 1, 1, 1, 1, 1, 'center', 'date', 'Uploaded Date', 8, NULL, '');

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,210,210,210,350,210' WHERE `id` = 53;

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 53;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 55;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 56;

DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 53;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 55;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 56;


