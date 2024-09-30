
ALTER TABLE `vp_credit_card_for_employee` 
ADD COLUMN `vendor_id` int NULL AFTER `employee_id`;

CREATE TABLE `vp_credit_card_missing_receipt_form`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(300) NOT NULL,
  `transaction_id` int NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `MISSING_RECEIPT_TRANSACTION_FK` FOREIGN KEY (`transaction_id`) REFERENCES `vp_credit_card_statement_detail` (`id`)
);

CREATE TABLE `vp_credit_card_missing_receipt_form_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `missing_receipt_form_id` int NOT NULL,
  `item_id` int NULL,
  `qty` decimal(12, 2) NULL,
  `rate` decimal(19, 2) NULL,
  PRIMARY KEY (`id`)
);

DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 50;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 51;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 53;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 54;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id` = 55;

DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 50;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 51;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 53;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 54;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id` = 55;

UPDATE `common_grid_column_template` SET `grid_id` = 50, `field` = 'statement.createdBy', `header` = 'Uploaded By', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Uploaded By', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 508;
UPDATE `common_grid_column_template` SET `grid_id` = 50, `field` = 'statement.createdOn', `header` = 'Uploaded Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Uploaded Date', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 509;


UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'checkbox', `header` = '', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'checkbox', `placeholder` = '', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 534;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'action', `header` = 'Action', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'actionButton', `placeholder` = '', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 535;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.transactionDate', `header` = 'Transaction Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Transaction Date', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 536;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.postingDate', `header` = 'Posting Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Posting Date', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 537;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.merchant', `header` = 'Merchant', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Merchant', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 538;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.cardNo', `header` = 'Card Number', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Card Number', `column_order` = 13, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 539;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.description', `header` = 'Description', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Description', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 540;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 541;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.status', `header` = 'Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Status', `column_order` = 14, `drop_down_id` = 28, `drop_down_url` = '' WHERE `id` = 542;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.account', `header` = 'Account', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Account', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 543;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.projectCode', `header` = 'Project / Task', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Project Code', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 544;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.missingReceiptAvailability', `header` = 'Missing Receipt', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = '', `placeholder` = 'Missing Receipt', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 545;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.receipt', `header` = 'Receipt', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Receipt', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 546;
UPDATE `common_grid_column_template` SET `grid_id` = 54, `field` = 'transaction.billable', `header` = 'Billable', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Billable', `column_order` = 12, `drop_down_id` = 20, `drop_down_url` = '' WHERE `id` = 547;

UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'checkbox', `header` = '', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'checkbox', `placeholder` = '', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 548;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'action', `header` = 'Action', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'actionButton', `placeholder` = '', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 549;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.transactionDate', `header` = 'Transaction Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Transaction Date', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 550;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.postingDate', `header` = 'Posting Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Posting Date', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 551;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.merchant', `header` = 'Merchant', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Merchant', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 552;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.cardNo', `header` = 'Card Number', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Card Number', `column_order` = 14, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 553;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.description', `header` = 'Description', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Description', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 554;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.amount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 555;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.employeeId', `header` = 'Employee', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Employee', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 556;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.account', `header` = 'Account', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Account', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 557;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.projectCode', `header` = 'Project / Task', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Project Code', `column_order` = 12, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 558;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.missingReceiptAvailability', `header` = 'Missing Receipt', `column_show` = 0, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = '', `placeholder` = 'Missing Receipt', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 559;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.receipt', `header` = 'Receipt', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Receipt', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 560;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.billable', `header` = 'Billable', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Billable', `column_order` = 13, `drop_down_id` = 20, `drop_down_url` = '' WHERE `id` = 561;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.remarks', `header` = 'Comment', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Comment', `column_order` = 17, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 563;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.approvalUserName', `header` = 'Approval User', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Approval User', `column_order` = 18, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 564;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.approvedDate', `header` = 'Approved Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Approved Date', `column_order` = 20, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 565;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.approvalGroup', `header` = 'Approve Group', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Approve Group', `column_order` = 19, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 566;
UPDATE `common_grid_column_template` SET `grid_id` = 55, `field` = 'transaction.approver', `header` = 'Next Assignee', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = '', `placeholder` = 'Next Assignee', `column_order` = 16, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 567;

UPDATE `common_grid_state_template` SET `grid_id` = 54, `start_from` = 0, `total_rows` = 15, `column_widths` = '50,100,80,210,180,180,210,300,210,210,210,120,210,210' WHERE `id` = 54;
UPDATE `common_grid_state_template` SET `grid_id` = 55, `start_from` = 0, `total_rows` = 15, `column_widths` = '50,100,210,180,180,210,210,300,210,210,210,120,210,210,210,210,210,210,210' WHERE `id` = 55;







