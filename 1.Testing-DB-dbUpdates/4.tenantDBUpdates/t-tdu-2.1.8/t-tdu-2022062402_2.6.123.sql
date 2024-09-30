------------Hashila-------2.6.123----------

ALTER TABLE `vp_credit_card_statement_detail` 
ADD COLUMN `submitted_date` datetime NULL AFTER `employee_name`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (55, 'transaction.submittedDate', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submitted Date', 21);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (56, 'transaction.submittedDate', 'Submitted Date', 1, 1, 1, 1, 1, 'center', 'date', 'Submitted Date', 21);

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,180,180,210,210,300,210,210,210,120,210,210,210,210,210,210,210,210' WHERE `id` = 55;

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,180,180,210,210,300,210,210,210,120,210,210,210,210,210,210,210' WHERE `id` = 56;


DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 55;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 56;