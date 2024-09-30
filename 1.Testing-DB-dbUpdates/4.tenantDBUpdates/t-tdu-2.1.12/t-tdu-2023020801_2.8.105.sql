----hashila---2.8.105----


INSERT INTO `common_grid_state_template`(`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (65, 65, 0, 25, '100,210,210,210,210,210,210,210,210,210');


ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
MODIFY COLUMN `tp_txn_id` varchar(100) NULL DEFAULT NULL AFTER `id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction` 
ADD COLUMN `cancellable_date` datetime NULL AFTER `cancelled_on`;