ALTER TABLE `vp_credit_card_statement` 
DROP COLUMN `from_date`,
DROP COLUMN `to_date`,
DROP COLUMN `employee_id`;

DELETE FROM `common_grid_column_template` WHERE `field` = 'statement.fromDate';
DELETE FROM `common_grid_column_template` WHERE `field` = 'statement.toDate';
DELETE FROM `common_grid_column_template` WHERE `field` = 'statement.employeeId';

DELETE FROM `common_grid_column_user_wice` WHERE `field` = 'statement.fromDate';
DELETE FROM `common_grid_column_user_wice` WHERE `field` = 'statement.toDate';
DELETE FROM `common_grid_column_user_wice` WHERE `field` = 'statement.employeeId';

UPDATE `common_grid_state_template` SET `column_widths` = '100,210,210,210,210' WHERE `grid_id` = 50;
UPDATE `common_grid_state_user_wice` SET `column_widths` = '100,210,210,210,210' WHERE `grid_id` = 50;

DELETE FROM `common_drop_down_connection` WHERE `drop_down_id` = 28;

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (28, 11);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (28, 12);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (28, 13);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (28, 43);


ALTER TABLE `vp_credit_card_process_mst` 
ADD COLUMN `card_no` varchar(16) NULL AFTER `id`;

CREATE TABLE `vp_receipt_mst`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) NULL,
  `transaction_date` datetime NULL,
  `amount` decimal(19, 2) NULL,
  `merchant` varchar(300) NULL,
  `description` varchar(300) NULL,
  `file_name` varchar(255) NULL,
  `file_type` varchar(200) NULL,
  `attachment_url` varchar(255) NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime(0) NOT NULL,
  `update_by` varchar(100) NULL,
  `update_on` datetime(0) NULL,
  `delete_by` varchar(100) NULL,
  `delete_on` datetime(0) NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `vp_credit_card_statement_detail` DROP FOREIGN KEY `PROCESS_STATEMENT_ID_FK`;

ALTER TABLE `vp_credit_card_statement_detail` 
DROP COLUMN `process_statement_id`,
MODIFY COLUMN `amount` decimal(19, 2) NULL AFTER `description`,
ADD COLUMN `status` char(255) NOT NULL AFTER `amount`,
ADD COLUMN `employee_id` varchar(100) NULL AFTER `status`;

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (53, 'CREDIT_CARD_RECEIPT');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (53, 53, 0, 15, '50,100,210,210,210,210,350');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'receipt.cardNo', 'Card Number', 1, 1, 1, 1, 1, 'right', 'input', 'Card Number', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'receipt.transactionDate', 'Transaction Date', 1, 1, 1, 1, 1, 'center', 'date', 'Transaction Date', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'receipt.amount', 'Transaction Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Transaction Amount', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'receipt.merchant', 'Merchant', 1, 1, 1, 1, 1, 'left', 'input', 'Merchant', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (53, 'receipt.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 7, NULL, '');


ALTER TABLE `vp_credit_card_statement_detail` 
MODIFY COLUMN `statement_id` int NULL AFTER `id`;

ALTER TABLE `vp_credit_card_statement_detail` 
ADD COLUMN `receipt_id` int NULL AFTER `employee_id`,
ADD COLUMN `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `receipt_id`,
ADD COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`,
ADD COLUMN `created_by_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `created_on`,
ADD COLUMN `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `created_by_name`,
ADD COLUMN `update_on` datetime(0) NULL DEFAULT NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL DEFAULT NULL AFTER `delete_by`,
ADD COLUMN `approval_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `delete_on`,
ADD COLUMN `approval_group_name` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approval_user`,
ADD COLUMN `approval_group` int NULL DEFAULT NULL AFTER `approval_group_name`,
ADD COLUMN `approval_user_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `approval_group`,
ADD COLUMN `workflow_id` int NULL DEFAULT NULL AFTER `approval_user_name`,
ADD COLUMN `workflow_level` int NULL DEFAULT NULL AFTER `workflow_id`,
ADD COLUMN `no_of_levels` int NULL DEFAULT NULL AFTER `workflow_level`,
ADD COLUMN `approved_date` datetime(0) NULL DEFAULT NULL AFTER `no_of_levels`,
ADD COLUMN `automation_id` int NULL DEFAULT NULL AFTER `approved_date`,
ADD COLUMN `export_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `automation_id`,
ADD CONSTRAINT `RECEIPT_ID_STATEMENT_DETAIL_RECEIPT_ID_KF` FOREIGN KEY (`receipt_id`) REFERENCES `vp_receipt_mst` (`id`);


ALTER TABLE `vp_credit_card_statement_detail` 
CHANGE COLUMN `four_digit_number` `card_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `merchant`;

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (54, 'CREDIT_CARD_PROCESS_LIST');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.transactionDate', 'Transaction Date', 1, 1, 1, 1, 1, 'center', 'date', 'Transaction Date', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.postingDate', 'Posting Date', 1, 1, 1, 1, 1, 'center', 'date', 'Posting Date', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.merchant', 'Merchant', 1, 1, 1, 1, 1, 'left', 'input', 'Merchant', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.cardNo', 'Card Number', 1, 1, 1, 1, 1, 'left', 'input', 'Card Number', 7, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 8, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 9, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 5, 28, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.account', 'Account', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account', 10, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.projectCode', 'Project / Task', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Project Code', 11, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.missingReceiptAvailability', 'Missing Receipt', 1, 0, 1, 1, 1, 'center', '', 'Missing Receipt', 12, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.receipt', 'Receipt', 1, 0, 1, 1, 1, 'left', '', 'Receipt', 13, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (54, 'transaction.billable', 'Billable', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Billable', 14, 20, '');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (54, 54, 0, 15, '50,100,210,210,210,210,210,210,210,210,210,150,350,210');


ALTER TABLE `vp_credit_card_statement_detail` 
ADD COLUMN `automation_rule_id` int NULL AFTER `export_status`;

ALTER TABLE `vp_credit_card_statement_detail` 
ADD COLUMN `missing_report_availability` char(1) NULL AFTER `automation_rule_id`,
ADD COLUMN `missing_report_id` int NULL AFTER `missing_report_availability`,
ADD COLUMN `account_id` int NULL AFTER `missing_report_id`,
ADD COLUMN `project_code_id` int NULL AFTER `account_id`,
ADD COLUMN `billable` char(1) NULL AFTER `project_code_id`;

ALTER TABLE `vp_credit_card_statement_detail` 
CHANGE COLUMN `missing_report_availability` `missing_receipt_availability` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `automation_rule_id`,
CHANGE COLUMN `missing_report_id` `missing_receipt_form_id` int NULL DEFAULT NULL AFTER `missing_receipt_availability`;

ALTER TABLE `vp_receipt_mst` 
ADD COLUMN `attached` char(1) NULL AFTER `attachment_url`;

CREATE TABLE `vp_credit_card_merchant`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (55, 'CREDIT_CARD_TRANSACTION_LIST');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'checkbox', '', 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.transactionDate', 'Transaction Date', 1, 1, 1, 1, 1, 'center', 'date', 'Transaction Date', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.postingDate', 'Posting Date', 1, 1, 1, 1, 1, 'center', 'date', 'Posting Date', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.merchant', 'Merchant', 1, 1, 1, 1, 1, 'left', 'input', 'Merchant', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.cardNo', 'Card Number', 1, 1, 1, 1, 1, 'left', 'input', 'Card Number', 7, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 8, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.amount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 9, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.employeeId', 'Employee', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Employee', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.account', 'Account', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account', 10, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.projectCode', 'Project / Task', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Project Code', 11, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.missingReceiptAvailability', 'Missing Receipt', 1, 0, 1, 1, 1, 'center', '', 'Missing Receipt', 12, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.receipt', 'Receipt', 1, 0, 1, 1, 1, 'left', '', 'Receipt', 13, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (55, 'transaction.billable', 'Billable', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Billable', 14, 20, '');
																																																													   
INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (55, 55, 0, 15, '50,100,210,210,210,210,210,210,210,210,210,150,350,210');

ALTER TABLE `vp_credit_card_statement` 
ADD COLUMN `total_records` int NULL AFTER `date_format_id`;

UPDATE `common_grid_column_template` SET `grid_id` = 49, `field` = 'statement.totalRecords', `header` = 'Total Records', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Total Records', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `field` = 'statement.status';

UPDATE `common_grid_state_template` SET `column_widths` = '100,210,210,210,150' WHERE `id` = 49;



