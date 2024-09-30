-----------2.6.23---Hashila---------

INSERT INTO `common_automation_document_type`(`id`, `document_type`, `short_code`, `status`, `show_hide_enable`, `automation_enable`, `automation_rule_enable`) VALUES (9, 'Credit Card', 'CREDIT_CARD', 'A', 0, 0, 0);

ALTER TABLE `vp_credit_card_statement_detail` 
ADD COLUMN `remarks` longtext NULL AFTER `billable`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.remarks', 'Comment', 1, 0, 1, 1, 1, 'left', '', 'Comment', 15, NULL, '');

UPDATE `common_grid_state_template` SET `column_widths` = '50,100,210,210,210,210,210,210,210,210,210,150,350,210,300' WHERE `id` = 54;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 16, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.approvedDate', 'Approved Date', 1, 1, 1, 1, 1, 'center', 'date', 'Approved Date', 18, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.approvalGroup', 'Approve Group', 1, 1, 1, 1, 1, 'left', 'input', 'Approve Group', 17, NULL, '');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.approver', 'Approver', 1, 0, 1, 1, 1, 'left', '', 'Approver', 19, NULL, '');

UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.employeeId', `header` = 'Employee', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Employee', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `field` = 'transaction.employeeId' AND `grid_id` = 54;

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 54;

DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 54;