----------Hashila-----2.1.99-----------------

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (43, 'VENDOR_WISE_SUMMARY');
INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (44, 'VENDOR_WISE_UNDER_SUMMARY');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (43, 43, 0, 10, '50,210,210,210,210,210,210,210,210');
INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (44, 44, 0, 10, '210,210,210,210,210,210');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (430, 43, 'vendor.billNo', 'Bill No', 1, 0, 0, 0, 0, 'left', 'input', 'Billl No', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (431, 43, 'expand', NULL, 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (432, 43, 'vendor.billDate', 'Bill Date', 1, 0, 0, 0, 0, 'center', 'date', 'Bill Date', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (433, 43, 'vendor.billAmount', 'Bill Amount', 1, 0, 0, 0, 0, 'right', 'number', 'Bill Amount', 4, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (434, 43, 'vendor.paidAmount', 'Paid Amount', 1, 0, 0, 0, 0, 'right', 'number', 'Paid Amount', 5, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (435, 43, 'vendor.balanceAmount', 'Balance Amount', 1, 0, 0, 0, 0, 'right', 'number', 'Balance Amount', 6, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (436, 43, 'vendor.applicableDiscount', 'Applicable Discount', 1, 0, 0, 0, 0, 'right', 'number', 'Applicable Discount', 7, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (437, 43, 'vendor.discountApplicableDate', 'Discount Applicable Date', 1, 0, 0, 0, 0, 'center', 'date', 'Discount Applicable Date', 8, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (438, 43, 'vendor.dueDate', 'Due Date', 1, 0, 0, 0, 0, 'center', 'date', 'Due Date', 9, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (439, 44, 'txn.batchId', 'Batch ID', 1, 0, 0, 0, 0, 'left', 'input', 'Batch ID', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (440, 44, 'txn.paymentRef', 'Payment Reference No', 1, 0, 0, 0, 0, 'left', 'input', 'Payment Reference No', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (441, 44, 'txn.paymentDate', 'Payment Date', 1, 0, 0, 0, 0, 'center', 'date', 'Payment Date', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (442, 44, 'txn.paymentAmount', 'Payment Amount', 1, 0, 0, 0, 0, 'right', 'number', 'Payment Amount', 4, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (443, 44, 'txn.paymentType', 'Payment Type', 1, 0, 0, 0, 0, 'left', 'input', 'Payment Type', 5, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (444, 44, 'txn.status', 'Status', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Status', 6, NULL, '');

UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'vendor.vendorName', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'dropdown', `placeholder` = 'Vendor', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 314;

UPDATE `common_grid_column_template` SET `field`='txn.approvalStatus' WHERE (`id`='394');
UPDATE `common_grid_column_template` SET `field`='txn.paymentStatus' WHERE (`id`='404');
UPDATE `common_grid_column_template` SET `header`='Payment Status' WHERE (`id`='404');
UPDATE `common_grid_column_template` SET `header`='Approval Status' WHERE (`id`='394');

UPDATE `common_grid_column_template` SET `field`='txn.approvalStatus', `header`='Approval Status' WHERE (`id`='368');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (NULL, '37', 'txn.paymentStatus', 'Payment Status', '1', '0', '0', '0', '0', 'center', 'input', 'Payment Status', '8', NULL, '');
UPDATE `common_grid_column_template` SET `placeholder`='Approval Status' WHERE (`id`='368');

UPDATE `common_grid_column_template` SET `placeholder`='Payment Status' WHERE (`id`='404');
UPDATE `common_grid_column_template` SET `placeholder`='Approval Status' WHERE (`id`='394');


UPDATE `common_grid_column_template` SET `grid_id` = 41, `field` = 'pay.vendor', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Vendor', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 411;
UPDATE `common_grid_column_template` SET `grid_id` = 41, `field` = 'pay.noOfBills', `header` = 'No. of Bills', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'No. of Bills', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 412;
UPDATE `common_grid_column_template` SET `grid_id` = 41, `field` = 'pay.paymentAmount', `header` = 'Payment Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Payment Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 413;
UPDATE `common_grid_column_template` SET `grid_id` = 41, `field` = 'pay.balanceToBePaid', `header` = 'Balance to be Paid', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Balance to be Paid', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 414;

UPDATE `common_grid_column_template` SET `grid_id` = 42, `field` = 'txn.paymentTypeName', `header` = 'Payment Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Payment Type', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 420;

UPDATE `common_grid_state_template` SET `grid_id` = 33, `start_from` = 0, `total_rows` = 10, `column_widths` = '210,210,210,210,210,210,250,210,210,210' WHERE `id` = 33;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.cancellableDate', `header` = 'Time Remaining to Cancel', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'time', `placeholder` = 'Time Remaining to Cancel', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 354;

ALTER TABLE `vp_payment_batch_bill_wise_transaction`
CHANGE COLUMN `status` `approval_status`  char(1) NOT NULL AFTER `payment_date`,
ADD COLUMN `payment_status`  char(1) NOT NULL AFTER `approval_status`;

ALTER TABLE `vp_payment_batch`
CHANGE COLUMN `status` `approval_status`  char(1) NOT NULL AFTER `cancellable_date`,
CHANGE COLUMN `api_status` `payment_status`  char(1) NULL DEFAULT '' AFTER `approval_status`;

ALTER TABLE `vp_payment_batch`
CHANGE COLUMN `approval_status` `status`  char(1)  NOT NULL AFTER `cancellable_date`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction`
CHANGE COLUMN `approval_status` `status`  char(1) NOT NULL AFTER `payment_date`;


UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.approvalStatus', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Approval Status', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 404;

ALTER TABLE vp_payment_vendor_wise_transaction RENAME TO vp_payment_batch_vendor_wise_transaction;

DROP TABLE vp_payment_batch_vendor_wise_transaction;

DROP TABLE vp_payment_status;

INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (25, 'Payment Status of Batch');
INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (26, 'Approval Status of Batch');

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (39, 'TP', 'Transaction Pending');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (40, 'TU', 'Transaction Submitted');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (41, 'TS', 'Transaction Success');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (42, 'TF', 'Transaction Faild');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (43, 'No', 'Unprocessed');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (44, 'Approved', 'Approved');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (45, 'Rejected', 'Rejected');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (46, 'Pending', 'Pending');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (69, 25, 39);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (70, 25, 40);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (71, 25, 41);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (72, 25, 42);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (73, 25, 43);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (74, 26, 44);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (75, 26, 45);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (76, 26, 46);



UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.approvalStatus', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Approval Status', `column_order` = 9, `drop_down_id` = 26, `drop_down_url` = '' WHERE `id` = 355;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.paymentStatus', `header` = 'Payment Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Payment Status', `column_order` = 10, `drop_down_id` = 25, `drop_down_url` = '' WHERE `id` = 356;

UPDATE `common_grid_column_template` SET `grid_id` = 38, `field` = 'expand', `header` = NULL, `column_show` = 0, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'expand', `placeholder` = '', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 379;

UPDATE `common_grid_state_template` SET `grid_id` = 38, `start_from` = 0, `total_rows` = 10, `column_widths` = '100,210,210,210,210,210,210' WHERE `id` = 38;

UPDATE `common_grid_column_template` SET `field`='pay.paymentAmount', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0' WHERE (`id`='374');
UPDATE `common_grid_column_template` SET `field`='pay.balanceToBePaid', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0' WHERE (`id`='375');
UPDATE `common_grid_column_template` SET `field`='pay.discountedAmount', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0' WHERE (`id`='376');
DELETE FROM `common_grid_column_template` WHERE (`id`='377');
DELETE FROM `common_grid_column_template` WHERE (`id`='378');
DELETE FROM `common_grid_column_template` WHERE (`id`='379');

UPDATE `common_grid_column_template` SET `field`='pay.vendorId' WHERE (`id`='372');
UPDATE `common_grid_column_template` SET `field`='pay.noOfBills', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0' WHERE (`id`='373');

UPDATE `common_grid_column_template` SET `field`='pay.vendorId' WHERE (`id`='335');
UPDATE `common_grid_column_template` SET `field`='pay.vendorId' WHERE (`id`='411');

UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.billNo', `header` = 'Bill No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Billl No', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 430;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'expand', `header` = NULL, `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'expand', `placeholder` = '', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 431;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.billDate', `header` = 'Bill Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Bill Date', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 432;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.billAmount', `header` = 'Bill Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Bill Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 433;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Paid Amount', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 434;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.balanceAmount', `header` = 'Balance Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Balance Amount', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 435;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.applicableDiscountAmount', `header` = 'Applicable Discount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Applicable Discount', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 436;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.discountApplicableDate', `header` = 'Discount Applicable Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Discount Applicable Date', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 437;
UPDATE `common_grid_column_template` SET `grid_id` = 43, `field` = 'bill.dueDate', `header` = 'Due Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Due Date', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 438;

UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.billNo', `header` = 'Bill No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Bill No', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 439;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.txnRef', `header` = 'Payment Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Payment Reference No', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 440;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Paid Amount', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 441;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.paymentStatus', `header` = 'Payment Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'number', `placeholder` = 'Payment Status', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 442;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.paymentType', `header` = 'Payment Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Payment Type', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 443;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.approvalStatus', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'input', `placeholder` = 'Approval Status', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 444;


UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.timeToCancel', `header` = 'Time Remaining to Cancel', `column_show` = 0, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'time', `placeholder` = 'Time Remaining to Cancel', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 354;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.providerId', `header` = 'Payment Provider', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'input', `placeholder` = 'Payment Provider', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 357;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.noOfVendor', `header` = 'No of Vendors', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No of Vendors', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 352;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.noOfBills', `header` = 'No of Bills', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No of Bills', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 353;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.approvalStatus', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Approval Status', `column_order` = 9, `drop_down_id` = 26, `drop_down_url` = '' WHERE `id` = 355;

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (448, 32, 'bill.paymentUnderProcessing', 'Payment Under Processing', 1, 1, 1, 1, 1, 'center', 'input', 'Payment Under Processing', 10, NULL, '');
UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.referenceNo', `header` = 'Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reference No', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 327;
UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.balanceAmount', `header` = 'Balance Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Balance Amount', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 319;
UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.paymentType', `header` = 'Payment Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Payment Type', `column_order` = 12, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 320;
UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.paymentAmount', `header` = 'Payment Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Payment Amount', `column_order` = 13, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 321;
UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.applicableDiscount', `header` = 'Applied Discount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Applied Discount', `column_order` = 15, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 322;
UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.paymentStatus', `header` = 'Payment Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Payment Status', `column_order` = 16, `drop_down_id` = 16, `drop_down_url` = '' WHERE `id` = 323;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.approvedDate', `header` = 'Approve Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Approved Date', `column_order` = 14, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 360;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.createdOn', `header` = 'Created Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Created Date', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 350;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.totalAmount', `header` = 'Amount', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Amount', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 351;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.status', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Approval Status', `column_order` = 9, `drop_down_id` = 26, `drop_down_url` = '' WHERE `id` = 355;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.approvalUserName', `header` = 'Approval User', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Approved By', `column_order` = 13, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 359;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.tpBatchId', `header` = 'Batch ID', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Batch Id', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 349;

UPDATE `common_grid_column_template` SET `grid_id` = 38, `field` = 'billTxn.vendorId', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 0, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'multiSelect', `placeholder` = 'Vendor', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 372;

UPDATE `common_grid_state_template` SET `grid_id` = 32, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,50,100,210,210,210,210,210,210,210,210,210,210,210,210,300,210' WHERE `id` = 32;
UPDATE `common_grid_state_template` SET `grid_id` = 35, `start_from` = 0, `total_rows` = 10, `column_widths` = '210,210,210,210,210,210,210,210,210,210,50' WHERE `id` = 35;


UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.applicableDiscount', `header` = 'Applied Discount (If The Payment Date is Today)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Applied Discount', `column_order` = 15, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 322;

ALTER TABLE `vp_bill`
ADD COLUMN `payment_under_processing`  decimal(19,2) NULL AFTER `paid_amount`;

ALTER TABLE `vp_bill_temp`
ADD COLUMN `paid_amount`  decimal(19,2) NULL DEFAULT NULL AFTER `created_by`,
ADD COLUMN `payment_under_processing`  decimal(19,2) NULL DEFAULT NULL AFTER `paid_amount`;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.providerId', `header` = 'Payment Provider', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Payment Provider', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 357;



UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.timeToCancel', `header` = 'Time Remaining to Cancel', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'time', `placeholder` = 'Time Remaining to Cancel', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 354;

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (47, 'P', 'Processing');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (77, 16, 47);

UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.applicableDiscount', `header` = 'Applicable Discount (If The Payment Date is Today)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'input', `placeholder` = 'Applied Discount', `column_order` = 15, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 322;

UPDATE `common_grid_state_template` SET `grid_id` = 32, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,50,100,210,210,210,210,210,210,210,210,210,210,210,210,320,210' WHERE `id` = 32;

DELETE FROM `common_grid_column_template` WHERE id = 404;
DELETE FROM `common_grid_column_template` WHERE id = 405;
DELETE FROM `common_grid_column_template` WHERE id = 406;