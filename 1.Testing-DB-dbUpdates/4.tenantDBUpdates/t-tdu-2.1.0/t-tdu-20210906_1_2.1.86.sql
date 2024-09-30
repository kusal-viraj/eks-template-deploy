---------------Hashila-----2.1.86--------------

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.noOfVendor', `header` = 'No of Vendors', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No of Vendors', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 352;


UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.txnId', `header` = 'Transaction ID', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Transaction Id', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 362;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.billNo', `header` = 'Bill No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Bill No', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 363;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.vendor', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Vendor', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 364;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Paid Amount', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 365;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.txnDate', `header` = 'Transaction Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Transaction Date', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 366;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.paymentDate', `header` = 'Payment Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Payment Date', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 367;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.status', `header` = 'Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'input', `placeholder` = 'Status', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 368;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.paymentType', `header` = 'Transaction Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'input', `placeholder` = 'Transaction Type', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 369;
UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.reason', `header` = 'Reason (If failed)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reason (If Faild)', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 370;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.batchId', `header` = 'Batch ID', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Batch Id', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 349;

UPDATE `common_grid_state_template` SET `grid_id` = 37, `start_from` = 0, `total_rows` = 10, `column_widths` = '100,150,100,100,75,75,210' WHERE `id` = 37;

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (41, 'BATCH_DETAIL_VIEW');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'pay.vendor', 'Vendor', 1, 0, 0, 0, 0, 'left', 'input', 'Vendor', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'pay.noOfBills', 'No. of Bills', 1, 0, 0, 0, 0, 'center', 'number', 'No. of Bills', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'pay.paidAmount', 'Paid Amount', 1, 0, 0, 0, 0, 'right', 'number', 'Paid Amount', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'pay.appliedDiscount', 'Applied Discount', 1, 0, 0, 0, 0, 'right', 'number', 'Applied Discount', 4, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'expand', NULL, 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, '');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (41, 41, 0, 10, '50,200,200,200,200');


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (42, 'BATCH_UNDER_DETAIL_VIEW');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.billNo', 'Bill No', 1, 0, 0, 0, 0, 'left', 'input', 'Bill No', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.billDate', 'Bill Date', 1, 0, 0, 0, 0, 'center', 'date', 'Bill Date', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.billAmount', 'Bill Amount', 1, 0, 0, 0, 0, 'right', 'numeric', 'Bill Amount', 4, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.dueDate', 'Due Date', 1, 0, 0, 0, 0, 'center', 'date', 'Due Date', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.paymentType', 'Payment Type', 1, 0, 0, 0, 0, 'left', 'input', 'Payment Type', 6, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.txnRef', 'Reference No', 1, 0, 0, 0, 0, 'left', 'input', 'Reference No', 7, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.paymentAmount', 'Payment Amount', 1, 0, 0, 0, 0, 'right', 'input', 'Payment Amount', 9, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.appliedDiscount', 'Applied Discount', 1, 0, 0, 0, 0, 'right', 'input', 'Applied Discount', 10, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'txn.comment', 'Comment', 1, 0, 0, 0, 0, 'left', 'input', 'Comment', 11, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (42, 'delete', NULL, 1, 0, 0, 0, 0, 'center', 'deleteButton', '', 12, NULL, '');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (42, 42, 0, 10, '0210,210,210,210,210,50,210,210,210,210');


INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 13, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 14, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 15, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (41, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'center', 'input', '', 16, NULL, '');

UPDATE `common_grid_state_template` SET `grid_id` = 41, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,200,200,200,200,200,200,200,200' WHERE `id` = 41;

UPDATE `common_grid_state_template` SET `grid_id` = 36, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,100,210,210,210,210,210,210,210,210,210,210,210,210,210' WHERE `id` = 36;

UPDATE `umm_menu` SET `display_icon`='fa fa-credit-card' WHERE (`id`='1029');

ALTER TABLE `vp_payment_batch`
MODIFY COLUMN `total_amount` decimal(19,2) NULL DEFAULT NULL AFTER `no_of_bills`,
ADD COLUMN `discount_amount` decimal(19,2) NULL AFTER `total_amount`;

ALTER TABLE `vp_payment_batch`
DROP COLUMN `discount_amount`;

ALTER TABLE `vp_payment_vendor_wise_transaction`
ADD COLUMN `discount_amount` decimal(19,2) NULL AFTER `payment_amount`;

ALTER TABLE `vp_payment_vendor_wise_cache`
ADD COLUMN `discount_amount` decimal(19,2) NULL AFTER `payment_amount`;

UPDATE `common_grid_column_template` SET `field`='txn.txnRef' WHERE (`id`='329');
UPDATE `common_grid_column_template` SET `field`='txn.txnRef', `header`='Reference Number' WHERE (`id`='329');

UPDATE `common_grid_column_template` SET `field`='txn.txnRef' WHERE (`id`='362');
UPDATE `common_grid_column_template` SET `header`='Reference Number' WHERE (`id`='362');
