-------------hashila-2.8.43-----------



ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `scheduled_date` datetime NULL AFTER `automation_rule_id`,
ADD COLUMN `scheduled_time` varchar(5) NULL AFTER `scheduled_date`;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (63, 'doc.receipt', 'Receipt', 1, 0, 0, 0, 1, 0, 0, NULL, 'left', 'input', 'Receipt', 18, NULL, 180, NULL);

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `remarks` varchar(500) NULL AFTER `approved_date`;

UPDATE `common_grid_column_template` SET `header` = 'Payment Type', `placeholder` = 'Payment Type' WHERE `grid_id` = 63 AND `field` = 'doc.txnType';
UPDATE `common_grid_column_template` SET `header` = 'Payment Type', `placeholder` = 'Payment Type' WHERE `grid_id` = 62 AND `field` = 'txn.txnType';

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (15, 'expense.paymentStatus', 'Payment Status', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'dropdown', 'Payment Status', 14, 16, 150, NULL);

UPDATE `vp_expense_mst` SET `payment_status` = 'N';

