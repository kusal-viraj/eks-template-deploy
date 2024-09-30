------------Hashila----2.6.109-----------

ALTER TABLE `vp_bill_expense_cost_distribution` 
ADD COLUMN `transaction_id` int NULL AFTER `receipt_file_type`;

ALTER TABLE `hst_vp_bill_expense_cost_distribution` 
ADD COLUMN `transaction_id` int NULL AFTER `receipt_file_type`;