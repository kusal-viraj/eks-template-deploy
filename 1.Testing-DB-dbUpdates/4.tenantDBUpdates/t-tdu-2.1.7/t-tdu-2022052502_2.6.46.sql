----------Hashila-----2.6.46-------------

UPDATE `common_grid_column_template` SET `search_type` = 'number' WHERE `id` = 510;

DELETE FROM `common_drop_down_connection` WHERE `id` = 97;
DELETE FROM `common_drop_down_connection` WHERE `id` = 99;

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (56, 'CREDIT_CARD_APPROVED_LIST');


INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.transactionDate', 'Transaction Date', 1, 1, 1, 1, 1, 'center', 'date', 'Transaction Date', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.postingDate', 'Posting Date', 1, 1, 1, 1, 1, 'center', 'date', 'Posting Date', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.merchant', 'Merchant', 1, 1, 1, 1, 1, 'left', 'input', 'Merchant', 8, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.cardNo', 'Card Number', 1, 1, 1, 1, 1, 'left', 'input', 'Card Number', 14, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 9, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 10, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.employeeId', 'Employee', 1, 1, 1, 1, 1, 'left', 'input', 'Employee', 7, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.account', 'Account', 1, 0, 1, 1, 1, 'left', '', 'Account', 11, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.projectCode', 'Project / Task', 1, 0, 1, 1, 1, 'left', '', 'Project Code', 12, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.missingReceiptAvailability', 'Missing Receipt', 0, 0, 0, 0, 0, 'center', '', 'Missing Receipt', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.receipt', 'Receipt', 1, 0, 1, 1, 1, 'left', '', 'Receipt', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.billable', 'Billable', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Billable', 13, 20, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.remarks', 'Comment', 1, 0, 1, 1, 1, 'left', '', 'Comment', 17, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.approvalUserName', 'Approval User', 1, 1, 1, 1, 1, 'left', 'input', 'Approval User', 18, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.approvedDate', 'Approved Date', 1, 1, 1, 1, 1, 'center', 'date', 'Approved Date', 20, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (56, 'transaction.approvalGroup', 'Approve Group', 1, 1, 1, 1, 1, 'left', 'input', 'Approve Group', 19, NULL, '');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (56, 56, 0, 15, '50,100,210,180,180,210,210,300,210,210,210,120,210,210,210,210,210,210');



















