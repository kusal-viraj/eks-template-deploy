---------------------Hashila------2.1.119--------------


UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.batchId', `header` = 'Batch ID', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Batch ID', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 328;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.txnRef', `header` = 'Reference Number', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Transaction Id', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 329;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Paid Amount', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 331;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.txnDate', `header` = 'Transaction Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Transaction Date', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 332;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paymentDate', `header` = 'Payment Date', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'date', `placeholder` = 'Payment Date', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 333;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.approvalStatus', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Approval Status', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 394;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paymentType', `header` = 'Transaction Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'Transaction Type', `column_order` = 8, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 395;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.reason', `header` = 'Reason (If failed)', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Reason (If Faild)', `column_order` = 9, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 396;
UPDATE `common_grid_column_template` SET `grid_id` = 33, `field` = 'txn.paymentStatus', `header` = 'Payment Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'input', `placeholder` = 'Payment Status', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 450;


UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.billNo', `header` = 'Bill No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Bill No', `column_order` = 1, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 439;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.txnRef', `header` = 'Payment Reference No', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Payment Reference No', `column_order` = 2, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 440;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.paidAmount', `header` = 'Paid Amount', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'number', `placeholder` = 'Paid Amount', `column_order` = 3, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 441;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.paymentStatus', `header` = 'Payment Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'number', `placeholder` = 'Payment Status', `column_order` = 5, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 442;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.paymentType', `header` = 'Payment Type', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'left', `search_type` = 'input', `placeholder` = 'Payment Type', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 443;
UPDATE `common_grid_column_template` SET `grid_id` = 44, `field` = 'txn.approvalStatus', `header` = 'Approval Status', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'center', `search_type` = 'input', `placeholder` = 'Approval Status', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 444;

UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.noOfVendor', `header` = 'No. of Vendors', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No. of Vendors', `column_order` = 6, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 352;
UPDATE `common_grid_column_template` SET `grid_id` = 36, `field` = 'batch.noOfBills', `header` = 'No. of Bills', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No. of Bills', `column_order` = 7, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 353;

UPDATE `common_grid_column_template` SET `grid_id` = 38, `field` = 'pay.noOfBills', `header` = 'No. Of Bills', `column_show` = 1, `is_sortable` = 0, `is_re_orderable` = 0, `is_re_sizable` = 0, `can_hide` = 0, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'No. Of Bills', `column_order` = 4, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 373;

UPDATE `common_grid_column_template` SET `grid_id` = 32, `field` = 'bill.paymentUnderProcessing', `header` = 'Payment Under Processing', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'right', `search_type` = 'numeric', `placeholder` = 'Payment Under Processing', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 448;

UPDATE `common_grid_column_template` SET `id`='371', `grid_id`='38', `field`='action', `header`='Action', `column_show`='1', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0', `align`='center', `search_type`='actionButton', `placeholder`='', `column_order`='1', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='371');
UPDATE `common_grid_column_template` SET `id`='372', `grid_id`='38', `field`='billTxn.vendorId', `header`='Vendor', `column_show`='1', `is_sortable`='1', `is_re_orderable`='0', `is_re_sizable`='1', `can_hide`='1', `align`='left', `search_type`='multiSelect', `placeholder`='Vendor', `column_order`='2', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='372');
UPDATE `common_grid_column_template` SET `id`='373', `grid_id`='38', `field`='pay.noOfBills', `header`='No Of Bills', `column_show`='1', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0', `align`='right', `search_type`='numeric', `placeholder`='No Of Bills', `column_order`='3', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='373');
UPDATE `common_grid_column_template` SET `id`='374', `grid_id`='38', `field`='pay.paymentAmount', `header`='Paid Amount', `column_show`='1', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0', `align`='right', `search_type`='numeric', `placeholder`='Paid Amount', `column_order`='4', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='374');
UPDATE `common_grid_column_template` SET `id`='375', `grid_id`='38', `field`='pay.balanceToBePaid', `header`='Due Amount', `column_show`='1', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0', `align`='right', `search_type`='numeric', `placeholder`='Due Amount', `column_order`='4', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='375');
UPDATE `common_grid_column_template` SET `id`='376', `grid_id`='38', `field`='pay.discountedAmount', `header`='Total Discount', `column_show`='1', `is_sortable`='0', `is_re_orderable`='0', `is_re_sizable`='0', `can_hide`='0', `align`='right', `search_type`='numeric', `placeholder`='Total Discount', `column_order`='6', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='376');

UPDATE `common_grid_state_template` SET `id`='38', `grid_id`='38', `start_from`='0', `total_rows`='10', `column_widths`='135,210,210,210,210,210' WHERE (`id`='38');
