---------Niron------2.2.69--------------

DROP TABLE IF EXISTS `vendor_payment_batch_invoice_wise_transaction`;
CREATE TABLE IF NOT EXISTS `vendor_payment_batch_invoice_wise_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_txn_id` varchar(12) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `tp_batch_id` varchar(12) DEFAULT NULL,
  `offline_payment_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_no` varchar(50) NOT NULL DEFAULT '',
  `txn_ref` varchar(50) DEFAULT NULL,
  `txn_type` int(11) DEFAULT NULL,
  `txn_type_name` varchar(100) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `payment_status` char(1) NOT NULL,
  `reason` text DEFAULT NULL,
  `comment` varchar(500) DEFAULT '',
  `tenant_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO vendor_payment_batch_invoice_wise_transaction
SELECT NULL,NULL,NULL,NULL,pay.bill_payment_id,inv.vendor_id,
pay.invoice_id,inv.invoice_no,pay.payment_referance_no,
pt.id,pt.name,pay.amount,pay.discount_amount,NULL,pay.payment_date,pay.`status`,IF(pay.`status` LIKE '%V%', 'C','S'),NULL,NULL,pay.tenant_id
FROM vendor_invoice_payment AS pay
INNER JOIN vendor_invoice inv ON inv.id=pay.invoice_id
INNER JOIN papertrl_mst_db.payment_type pt ON pt.name=pay.payment_type_description;


INSERT INTO `vendor_drop_down` (`id`, `drop_down_name`) VALUES (24, 'Vendor Payment Status');

INSERT INTO `vendor_drop_down_connection` (`drop_down_id`, `drop_down_value_id`) VALUES (24, 17);
INSERT INTO `vendor_drop_down_connection` (`drop_down_id`, `drop_down_value_id`) VALUES (24, 18);

INSERT INTO `vendor_grid_template` (`id`, `grid_name`) VALUES (23, 'VENDOR_PAYMENT_APPROVED_BILL');
INSERT INTO `vendor_grid_template` (`id`, `grid_name`) VALUES (24, 'VENDOR_PAYMENT_UNDER_APPROVED_BILL');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'expand', '', 1, 0, 0, 0, 0, 'center', 'expand', '', 1, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.tenantId', 'Name Customer', 1, 1, 1, 1, 1, 'left', 'multiSelect', 'Name Customer', 2, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.invoiceNo', 'Invoice Number', 1, 1, 1, 1, 1, 'left', 'input', 'Invoice Number', 3, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.invoiceDate', 'Invoice Date', 1, 1, 1, 1, 1, 'center', 'date', 'Invoice Date', 4, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.dueDate', 'Due Date', 1, 1, 1, 1, 1, 'center', 'date', 'Due Date', 5, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.invoiceAmount', 'Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Amount', 6, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.balanceAmount', 'Balance Amount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Balance Amount', 8, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.applicableDiscountAmount', 'Applicable Discount', 1, 1, 1, 1, 1, 'right', 'numeric', 'Applied Discount', 10, NULL, NULL);
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (23, 'inv.paymentStatus', 'Payment Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Payment Status', 11, 24, NULL);



INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.batchId', 'Batch ID', 1, 0, 0, 0, 0, 'left', 'input', 'Batch ID', 1, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.txnRef', 'Reference Number', 1, 0, 0, 0, 0, 'left', 'input', 'Transaction Id', 2, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.paidAmount', 'Paid Amount', 1, 0, 0, 0, 0, 'right', 'numeric', 'Paid Amount', 3, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.txnDate', 'Transaction Date', 1, 0, 0, 0, 0, 'center', 'date', 'Transaction Date', 7, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.paymentDate', 'Payment Date', 1, 0, 0, 0, 0, 'center', 'date', 'Payment Date', 4, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.approvalStatus', 'Approval Status', 1, 0, 0, 0, 0, 'center', 'dropdown', 'Approval Status', 5, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.paymentType', 'Transaction Type', 1, 0, 0, 0, 0, 'left', 'dropdown', 'Transaction Type', 8, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.reason', 'Reason (If failed)', 1, 0, 0, 0, 0, 'left', 'input', 'Reason (If Faild)', 9, NULL, '');
INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (24, 'txn.paymentStatus', 'Payment Status', 1, 0, 0, 0, 0, 'center', 'input', 'Payment Status', 6, NULL, '');

INSERT INTO `vendor_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (23, 0, 10, '50,210,210,210,210,210,210,210,210');
INSERT INTO `vendor_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (24, 0, 10, '210,210,210,210,210,210,210,210,210');




