----------hashila-------2.8.13-------------------


ALTER TABLE `common_grid_column_template` 
ADD COLUMN `column_width` int NULL AFTER `drop_down_url`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `column_width` int NULL AFTER `drop_down_url`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `is_online` tinyint(1) NULL AFTER `batch_id`,
ADD COLUMN `document_type` int NULL AFTER `is_online`,
ADD COLUMN `document_id` int NULL AFTER `document_type`,
ADD COLUMN `document_no` int NULL AFTER `document_id`,
ADD COLUMN `employee_id` int NULL AFTER `vendor_id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
MODIFY COLUMN `document_no` varchar(50) NULL DEFAULT NULL AFTER `document_id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `batch_no` varchar(12) NULL AFTER `batch_id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `payee_name` varchar(255) NULL AFTER `employee_id`;

INSERT INTO `common_grid_template`(`id`, `grid_name`) VALUES (62, 'TRANSACTION_LIST');

ALTER TABLE `common_grid_column_template` 
ADD COLUMN `filter_show` tinyint(1) NULL AFTER `column_width`;

ALTER TABLE `common_grid_column_template` 
MODIFY COLUMN `filter_show` tinyint(1) NULL DEFAULT NULL AFTER `can_hide`;

ALTER TABLE `common_grid_column_user_wice` 
ADD COLUMN `filter_show` tinyint(1) NULL AFTER `can_hide`;

UPDATE common_grid_column_template tmpl SET tmpl.filter_show = tmpl.can_hide;

INSERT INTO `common_drop_down`(`id`, `drop_down_name`) VALUES (33, 'Payment Medium');

INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (67, '1', 'Online');
INSERT INTO `common_drop_down_value`(`id`, `value`, `label`) VALUES (68, '0', 'Offline');

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (33, 67);
INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (33, 68);

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.txnRef', 'Ref No.', 1, 1, 0, 0, 0, 0, 'left', 'input', 'Ref No.', 2, NULL, '', 160);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.batchNo', 'Batch No.', 1, 1, 0, 0, 1, 1, 'left', 'input', 'Batch No.', 3, NULL, '', 160);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.documentNo', 'Document No.', 1, 1, 0, 0, 1, 1, 'left', 'input', 'Document No.', 4, NULL, '', 160);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.payeeName', 'Payee', 1, 1, 0, 0, 1, 1, 'left', 'input', 'Payee', 5, NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 170);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.txnAmount', 'Amount', 1, 1, 0, 0, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, '', 140);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.createdOn', 'Created Date', 1, 1, 0, 0, 1, 1, 'left', 'date', 'Created Date', 7, NULL, '', 160);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.status', 'Approval Status', 1, 1, 0, 0, 1, 1, 'left', 'dropdown', 'Approval Status', 8, 15, '', 171);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.txnType', 'Transaction Type', 1, 1, 0, 0, 1, 1, 'left', 'dropdown', 'Transaction Type', 10, NULL, '/tenant_management/sec_get_payment_types', 160);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.reason', 'Reason (If failed)', 1, 1, 0, 0, 1, 1, 'left', 'input', 'Reason (If failed)', 12, NULL, '', 310);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'action', '', 1, 0, 0, 0, 0, 0, 'left', 'actionButton', '', 13, NULL, '', 50);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'checkbox', NULL, 1, 0, 0, 0, 0, 0, 'center', 'checkbox', '', 1, NULL, '', 50);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.isOnline', 'Online / Offline', 0, 0, 0, 0, 0, 1, 'left', 'dropdown', 'Online / Offline', 10, 33, '', NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.paymentStatus', 'Payment Status', 1, 1, 0, 0, 1, 1, 'left', 'dropdown', 'Payment Status', 9, 25, '', 171);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.documentType', 'Document Type', 0, 0, 0, 0, 0, 1, 'left', 'dropdown', 'Document Type', 1, NULL, '/common_service/sec_get_payment_related_document_types', NULL);
INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`, `column_width`) VALUES (62, 'txn.trxDate', 'Transaction Date', 1, 1, 0, 0, 1, 1, 'left', 'date', 'Transaction Date', 11, NULL, '', 160);


ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `created_on` datetime(0) NULL AFTER `bank_account_id`;

ALTER TABLE `common_automation_document_type` 
ADD COLUMN `payment_enable` tinyint(1) NOT NULL AFTER `notification_enable`;

UPDATE `common_automation_document_type` SET `payment_enable` = 0;
UPDATE `common_automation_document_type` SET `payment_enable` = 1 WHERE `id` = 1;
UPDATE `common_automation_document_type` SET `payment_enable` = 1 WHERE `id` = 4;

INSERT INTO `common_grid_state_template`(`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (62, 0, 10, '50,20');

UPDATE vp_payment_batch_bill_wise_transaction trx set trx.document_type = 1, trx.document_id = trx.bill_id, trx.document_no = trx.bill_no, trx.is_online = IF(trx.offline_payment_id is null,true,false);

UPDATE vp_payment_batch_bill_wise_transaction trx INNER JOIN vp_vendor_mst vendor on vendor.id = trx.vendor_id SET trx.payee_name = vendor.name;

UPDATE vp_payment_batch_bill_wise_transaction trx 
LEFT JOIN vp_payment_batch batch on trx.batch_id = batch.id 
LEFT JOIN vp_bill_payment offl on trx.offline_payment_id = offl.id 
SET trx.created_on = if(trx.offline_payment_id is null, batch.created_on, offl.created_on);
