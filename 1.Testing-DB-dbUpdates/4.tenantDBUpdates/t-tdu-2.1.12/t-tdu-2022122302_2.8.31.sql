----Hashila---2.8.31----


UPDATE vp_payment_batch_bill_wise_transaction trx INNER JOIN vp_payment_batch batch on batch.id = trx.batch_id SET trx.batch_no = batch.tp_batch_id;


ALTER TABLE `common_grid_column_template` 
ADD COLUMN `is_frozen` tinyint(1) NULL AFTER `filter_show`,
ADD COLUMN `frozen_direction` varchar(50) NULL AFTER `is_frozen`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `is_frozen` tinyint(1) NULL AFTER `filter_show`,
ADD COLUMN `frozen_direction` varchar(50) NULL AFTER `is_frozen`;

CREATE TABLE `common_drop_down_url`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `common_grid_column_template` 
ADD COLUMN `drop_down_url_id` int NULL AFTER `column_width`,
ADD CONSTRAINT `DROPDOWN_URL_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `common_drop_down_url` (`id`);

ALTER TABLE `common_grid_column_template` 
DROP COLUMN `drop_down_url`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `drop_down_url_id` int NULL AFTER `column_width`,
ADD CONSTRAINT `DROPDOWN_URL_USER_WISE_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `common_drop_down_url` (`id`);

ALTER TABLE `common_grid_column_user_wice` 
DROP COLUMN `drop_down_url`;


INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (63, 'APPROVED_DOCUMENT_LIST');

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'checkbox', NULL, 1, 0, 0, 0, 0, 0, 1, 'left', 'center', 'checkbox', '', 1, NULL, 50, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.docNo', 'Document No.', 1, 1, 0, 0, 0, 1, 1, 'left', 'left', 'input', 'Document No.', 2, NULL, 160, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.payee', 'Payee', 1, 1, 0, 0, 0, 1, 1, 'left', 'left', 'input', 'Payee', 3, NULL, 160, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.docDate', 'Date', 1, 1, 0, 0, 1, 1, 0, NULL, 'center', 'date', 'Date', 4, NULL, 160, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.dueDate', 'Due Date', 1, 1, 0, 0, 1, 0, 0, NULL, 'center', 'date', 'Due Date', 5, NULL, 160, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.amount', 'Amount', 1, 1, 0, 0, 1, 1, 0, NULL, 'right', 'numeric', 'Amount', 6, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.paidAmount', 'Paid Amount', 1, 1, 0, 0, 1, 1, 0, NULL, 'right', 'numeric', 'Paid Amount', 7, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.paymentUnderProcessing', 'In Process', 1, 1, 0, 0, 1, 0, 0, NULL, 'right', 'numeric', 'In Process', 8, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.balanceAmount', 'Balance', 1, 1, 0, 0, 1, 0, 0, NULL, 'right', 'numeric', 'Balance', 9, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.referenceNo', 'Reference No', 1, 0, 0, 0, 1, 0, 0, NULL, 'left', 'input', 'Reference No', 12, NULL, 160, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.txnType', 'Transaction Type', 1, 0, 0, 0, 1, 0, 0, NULL, 'left', 'input', 'Transaction Type', 10, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.txnAmount', 'Transaction Amount', 1, 0, 0, 0, 1, 0, 0, NULL, 'right', 'numeric', 'Transaction Amount', 13, NULL, 160, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.comment', 'Comment', 1, 0, 0, 0, 1, 0, 0, NULL, 'left', 'input', 'Comment', 14, NULL, 170, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.applicableDiscountAmount', 'Disc.', 1, 0, 0, 0, 1, 0, 0, NULL, 'right', 'numeric', 'Disc.', 15, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.paymentStatus', 'Payment Status', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'dropdown', 'Payment Status', 17, 25, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.creditAmount', 'Credit Amount', 1, 0, 0, 0, 1, 0, 0, NULL, 'right', 'numeric', 'Credit Amount', 16, NULL, 140, NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.paymentDate', 'Payment Date', 1, 0, 0, 0, 1, 0, 0, NULL, 'center', 'date', 'Payment Date', 11, NULL, 160, NULL);

INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (63, 63, 0, 50, '50,20');

ALTER TABLE `vp_expense_mst` 
ADD COLUMN `paid_amount` decimal(19, 2) NULL AFTER `total_mileage_amount`,
ADD COLUMN `payment_under_processing` decimal(19, 2) NULL AFTER `paid_amount`,
ADD COLUMN `balance_amount` decimal(19, 2) NULL AFTER `payment_under_processing`,
ADD COLUMN `payment_status` char(2) NULL AFTER `status`;

ALTER TABLE `hst_vp_expense_mst` 
ADD COLUMN `paid_amount` decimal(19, 2) NULL AFTER `total_mileage_amount`,
ADD COLUMN `payment_under_processing` decimal(19, 2) NULL AFTER `paid_amount`,
ADD COLUMN `balance_amount` decimal(19, 2) NULL AFTER `payment_under_processing`,
ADD COLUMN `payment_status` char(2) NULL AFTER `status`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
MODIFY COLUMN `bill_id` int NULL AFTER `payee_name`,
MODIFY COLUMN `bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' AFTER `bill_id`,
ADD COLUMN `created_by` varchar(100) NULL AFTER `bank_account_id`,
ADD COLUMN `created_by_name` varchar(200) NULL AFTER `created_on`,
ADD COLUMN `update_by` varchar(100) NULL AFTER `created_by_name`,
ADD COLUMN `update_on` datetime NULL AFTER `update_by`,
ADD COLUMN `delete_by` varchar(100) NULL AFTER `update_on`,
ADD COLUMN `delete_on` datetime(0) NULL AFTER `delete_by`,
ADD COLUMN `approval_user` varchar(100) NULL AFTER `delete_on`,
ADD COLUMN `approval_group_name` varchar(75) NULL AFTER `approval_user`,
ADD COLUMN `approval_group` int NULL AFTER `approval_group_name`,
ADD COLUMN `approval_user_name` varchar(200) NULL AFTER `approval_group`,
ADD COLUMN `workflow_id` int NULL AFTER `approval_user_name`,
ADD COLUMN `workflow_level` int NULL AFTER `workflow_id`,
ADD COLUMN `no_of_levels` int NULL AFTER `workflow_level`,
ADD COLUMN `approved_date` datetime NULL AFTER `no_of_levels`,
ADD COLUMN `cancelled_by` varchar(100) NULL AFTER `approved_date`,
ADD COLUMN `cancelled_on` datetime(0) NULL AFTER `cancelled_by`,
ADD COLUMN `export_status` char(1) NULL AFTER `cancelled_on`;

INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (1, 'Vendor List', '/vendor_portal/sec_local_vendor_dropdown_list_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (2, 'Payment Types', '/tenant_management/sec_get_payment_types');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (3, 'Payment Related Document Types', '/common_service/sec_get_payment_related_document_types');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (4, 'Department List', '/common_service/sec_get_department');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (5, 'Report Types', '/common_service/sec_view_report_types');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (6, 'Report Filers', '/common_service/sec_view_report_filters');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (7, 'Country List', '/common_service/sec_view_countries');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (8, 'Cities List', '/common_service/sec_view_cities');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (9, 'Approved By List', '/user_management/sec_get_userlist_dropdown');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (10, 'Approval Group List', '/user_management/sec_view_approval_group_list_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (11, 'Aging List', 'assets/demo/data/dropdowns/report/aging-data.json');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (12, 'Custom Field List', '/common_service/sec_get_detail_section_additional_fields_v2');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (13, 'Account List', '/common_service/sec_get_account_dropdown_list');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (14, 'TransAction Type List', 'assets/demo/data/dropdowns/report/transaction-type.json');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (15, 'Status List', 'assets/demo/data/dropdowns/report/status-list.json');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (16, 'Project Task List', '/common_service/sec_get_detailed_approval_codes_by_category');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (17, 'Po Billable Table Data', '/common_service/sec_get_billable_po_transactions_report');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (18, 'Bill Billable Table Data', '/common_service/sec_get_billable_bill_transactions_report');
INSERT INTO `common_drop_down_url`(`id`, `name`, `url`) VALUES (19, 'Expense Billable Table Data', '/common_service/sec_get_billable_expense_transactions_report');

UPDATE `support_type` SET `icon` = 'fa fa-question-circle' WHERE `name` = 'Other questions';
UPDATE `support_type` SET `icon` = 'fa fa-lightbulb' WHERE `name` = 'Suggest a new feature';

UPDATE `common_grid_column_template` SET `can_hide` = 0 WHERE `grid_id` = 63 AND `field` = 'doc.docNo';
UPDATE `common_grid_column_template` SET `can_hide` = 0 WHERE `grid_id` = 63 AND `field` = 'doc.payee';


UPDATE `common_grid_column_user_wice` SET `can_hide` = 0 WHERE `grid_id` = 63 AND `field` = 'doc.docNo';
UPDATE `common_grid_column_user_wice` SET `can_hide` = 0 WHERE `grid_id` = 63 AND `field` = 'doc.payee';

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `automation_id` int NULL AFTER `export_status`,
ADD COLUMN `automation_rule_id` int NULL AFTER `automation_id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
MODIFY COLUMN `vendor_id` int NULL AFTER `offline_payment_id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
MODIFY COLUMN `employee_id` varchar(100) NULL DEFAULT NULL AFTER `vendor_id`;

UPDATE `common_grid_column_template` SET `column_width` = 150 WHERE `column_width` IS NULL AND grid_id != 10;
UPDATE `common_grid_column_template` SET `is_frozen` = false WHERE `is_frozen` IS NULL AND grid_id != 10;
UPDATE `common_grid_column_template` SET `column_width` = 50 WHERE `field` = "checkbox" OR `field` = "action" AND grid_id != 10;
UPDATE `common_grid_column_template` SET `is_frozen` = true, `frozen_direction`="left" WHERE `field` = "checkbox" AND grid_id != 10;
UPDATE `common_grid_column_template` SET `is_frozen` = true, `frozen_direction`="right", `column_order`=60, `header`= null WHERE `field` = "action" AND grid_id != 10;

TRUNCATE TABLE common_grid_state_user_wice;
TRUNCATE TABLE common_grid_column_user_wice;

UPDATE `vp_payment_batch_bill_wise_transaction` SET `export_status` = 'N';

UPDATE `common_grid_state_template` SET `total_rows` = 25;
UPDATE `common_grid_state_template` SET `total_rows` = 10 WHERE `grid_id` = 63;

UPDATE `common_grid_column_template` SET `drop_down_url_id` = 3 WHERE `grid_id` = 62 AND `field` = 'txn.documentType';
UPDATE `common_grid_column_template` SET `drop_down_url_id` = 2 WHERE `grid_id` = 62 AND `field` = 'txn.txnType';
UPDATE `common_grid_column_template` SET `drop_down_url_id` = 2 WHERE `grid_id` = 63 AND `field` = 'doc.txnType';


