-----------Dimuthu--------2.1.83-----------

UPDATE `common_grid_column_template` SET `grid_id` = 35, `field` = 'txn.billAmount', `header` = 'Bill Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Bill Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 343;
UPDATE `common_grid_column_template` SET `grid_id` = 35, `field` = 'txn.dueDate', `header` = 'Due Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Due Date', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 344;


UPDATE `common_grid_state_template` SET `grid_id` = 35, `start_from` = 0, `total_rows` = 10, `column_widths` = '0210,210,210,210,210,210,210,210,210,210' WHERE `id` = 35;

UPDATE `common_grid_state_template` SET `grid_id` = 35, `start_from` = 0, `total_rows` = 10, `column_widths` = '0210,210,210,210,210,210,210,210,210,210,50' WHERE `id` = 35;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (35, 'txn.txnRef', 'Reference No', 1, 0, 0, 0, 0, 'left', 'input', 'Reference No', 7, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (35, 'txn.paymentAmount', 'Payment Amount', 1, 0, 0, 0, 0, 'right', 'input', 'Payment Amount', 9, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (35, 'txn.appliedDiscount', 'Applied Discount', 1, 0, 0, 0, 0, 'right', 'input', 'Applied Discount', 10, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (35, 'txn.comment', 'Comment', 1, 0, 0, 0, 0, 'left', 'input', 'Comment', 11, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (35, 'delete', NULL, 1, 0, 0, 0, 0, 'center', 'deleteButton', '', 12, NULL, '');



UPDATE `common_grid_column_template` SET `grid_id` = 34, `field` = 'pay.balanceToBePaid', `header` = 'Balance To Be Paid', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Balance to be Paid', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 336;


ALTER TABLE `vp_payment_batch` 
MODIFY COLUMN `total_amount` decimal(10, 2) NULL AFTER `no_of_bills`;

ALTER TABLE `vp_payment_batch` 
MODIFY COLUMN `tp_batch_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `provider_name`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
MODIFY COLUMN `tp_txn_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `id`;

ALTER TABLE `vp_payment_batch`
ADD COLUMN `automation_id` int(11) NULL DEFAULT NULL AFTER `cancelled_on`;

ALTER TABLE `vp_payment_batch`
ADD COLUMN `export_status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `automation_id`;

ALTER TABLE `vp_payment_batch` DROP FOREIGN KEY `PAYMENT_STATUS_FK_1`;

ALTER TABLE `vp_payment_batch`
MODIFY COLUMN `status` char(1) NOT NULL AFTER `cancellable_date`;

 
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.status', `header` = 'Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Status', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 332;

DELETE FROM `common_grid_column_template` WHERE grid_id = 33 AND field = 'txn.paymentStatus';
DELETE FROM `common_grid_column_template` WHERE grid_id = 35 AND field = 'txn.paymentStatus';

UPDATE `common_grid_state_template` SET `grid_id` = 33, `start_from` = 0, `total_rows` = 10, `column_widths` = '210,210,210,210,210' WHERE `id` = 33;

UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.batchId', `header` = 'Batch ID', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Batch ID', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 328;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.txnId', `header` = 'Transaction Id', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Transaction Id', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 329;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.vendor', `header` = 'Vendor', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Vendor', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 330;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Paid Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 331;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.txnDate', `header` = 'Transaction Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Transaction Date', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 332;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paymentDate', `header` = 'Payment Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Payment Date', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 333;

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (33, 'txn.status', 'Status', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Status', 7, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (33, 'txn.paymentType', 'Transaction Type', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Transaction Type', 8, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (33, 'txn.reason', 'Reason (If Faild)', 1, 0, 0, 0, 0, 'left', 'input', 'Reason (If Faild)', 9, NULL, '');

UPDATE `common_grid_state_template` SET `grid_id` = 34, `start_from` = 0, `total_rows` = 10, `column_widths` = '50,200,200,200,200,200,210,210,210,210' WHERE `id` = 34;


INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 16, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 17, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 18, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (34, 'emptyColumn', NULL, 1, 0, 0, 0, 0, 'left', 'input', '', 19, NULL, '');

UPDATE `common_grid_column_template` SET `grid_id` = 37, `field` = 'txn.reason', `header` = 'Reason (If failed)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reason (If Faild)', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 370;

UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.reason', `header` = 'Reason (If failed)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reason (If Faild)', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 396;

DELETE FROM `common_grid_column_template` WHERE id = 330;

UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.status', `header` = 'Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Status', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 394;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paymentType', `header` = 'Transaction Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Transaction Type', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 395;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.reason', `header` = 'Reason (If failed)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reason (If Faild)', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 396;

UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.batchId', `header` = 'Batch ID', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Batch ID', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 328;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.txnId', `header` = 'Transaction Id', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Transaction Id', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 329;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Paid Amount', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 331;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.txnDate', `header` = 'Transaction Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Transaction Date', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 332;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paymentDate', `header` = 'Payment Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Payment Date', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 333;

UPDATE `umm_menu` SET `menu_style`='fa fa-credit-card' WHERE (`id`='1029');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('93', 'Pay Now', 'Pay Now', 'PAY_NOW', 'System', '2021-09-02 09:43:40', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('94', 'Make an Offline Payment', 'Make an Offline Payment', 'MAKE_AN_OFFLINE_PAYMENT', 'System', '2021-09-02 09:44:21', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('95', 'Schedule Payment', 'Schedule Payment', 'SCHEDULE_PAYMENT', 'System', '2021-09-02 09:45:47', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('96', 'Cancel Batch Payment', 'Cancel Batch Payment', 'CANCEL_BATCH_PAYMENT', 'System', '2021-09-02 09:46:42', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '3', 'PAYMENT_DETAIL_VIEW', 'System', '2021-09-02 10:53:27', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '6', 'PAYMENT_APPROVE', 'System', '2021-09-02 10:53:52', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '7', 'PAYMENT_REJECT', 'System', '2021-09-02 10:54:15', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '11', 'PAYMENT_SUBMIT', 'System', '2021-09-02 10:54:48', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '93', 'PAYMENT_PAY_NOW', 'System', '2021-09-02 10:55:40', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '94', 'PAYMENT_MAKE_AN_OFFLINE_PAYMENT', 'System', '2021-09-02 11:00:33', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '95', 'PAYMENT_SCHEDULE_PAYMENT', 'System', '2021-09-02 11:00:58', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '96', 'PAYMENT_CANCEL_BATCH_PAYMENT', 'System', '2021-09-02 11:01:31', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1029', '40', 'PAYMENT_OVERRIDE_APPROVAL', 'System', '2021-09-02 11:27:38', NULL, NULL, NULL, NULL);

