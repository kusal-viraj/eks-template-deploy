SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `vp_credit_card_statement`;
CREATE TABLE `vp_credit_card_statement`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attachment_url` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `header_row` int NOT NULL,
  `from_date` datetime(0) NULL DEFAULT NULL,
  `to_date` datetime(0) NULL DEFAULT NULL,
  `employee_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_format_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime(0) NOT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

DROP TABLE IF EXISTS `vp_credit_card_statement_detail`;
CREATE TABLE `vp_credit_card_statement_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `statement_id` int NOT NULL,
  `transaction_date` varchar(100) NULL,
  `posting_date` varchar(100) NULL,
  `merchant` varchar(300) NULL,
  `four_digit_number` varchar(50) NULL,
  `description` varchar(300) NULL,
  `amount` decimal(19, 2) NULL,
  `process_statement_id` int NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PROCESS_STATEMENT_ID_FK` FOREIGN KEY (`process_statement_id`) REFERENCES `vp_credit_card_process_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `STATEMENT_ID_FK_3` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

DROP TABLE IF EXISTS `vp_credit_card_for_employee`;
CREATE TABLE `vp_credit_card_for_employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100)NOT NULL,
  `created_on` datetime(0) NOT NULL,
  `update_by` varchar(100) NULL,
  `update_on` datetime(0) NULL,
  `delete_by` varchar(100) NULL,
  `delete_on` datetime(0) NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (50, 'CREDIT_CARD_STATEMENT_UPLOAD_LIST');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (50, 50, 0, 15, '100,210,210,210,210,210,210,210');

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (51, 'CREDIT_CARD_STATEMENT_CREDIT_CARD_LIST');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.fileName', 'File Name', 1, 1, 1, 1, 1, 'left', 'input', 'File Name', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.fromDate', 'Statement From Date', 1, 1, 1, 1, 1, 'center', 'date', 'Statement From Date', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.toDate', 'Statement To Date', 1, 1, 1, 1, 1, 'center', 'date', 'Statement To Date', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.employeeId', 'Employee', 1, 1, 1, 1, 1, 'left', 'input', 'Employee', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 7, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'statement.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 8, 28, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (50, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, '');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 2, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'card.cardNo', 'Card Number', 1, 1, 1, 1, 1, 'left', 'input', 'Card Number', 3, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'user.username', 'Employee', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Employee', 4, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'card.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 5, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'card.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 6, NULL, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'card.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 7, 1, '');
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (51, 'checkbox', NULL, 1, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '');

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (51, 51, 0, 15, '100,210,210,210,210,210');

DROP TABLE IF EXISTS `vp_credit_card_process_mst`;
CREATE TABLE `vp_credit_card_process_mst`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number_of_records` int NULL,
  `status` char(1) NOT NULL,
  `statement_availablity` tinyint(1) NULL,
  `amount` decimal(19, 2) NULL,
  `statement_id` int NOT NULL,
  `employee_id` varchar(100) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PROCESS_STATEMENT_FK` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (28, 'Credit Card Process Status');
INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (50, 'Pr', 'Processed');

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (28, 50);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (28, 43);

UPDATE `umm_menu` SET `super_type` = 1007, `hierachy` = '1007,1015' WHERE `id` = 1048;
UPDATE `umm_menu` SET `url` = '/home/expense' WHERE `id` = 1048;


SET FOREIGN_KEY_CHECKS = 1;
