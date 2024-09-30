UPDATE `vp_expense_mst` exp SET `balance_amount` = exp.total_amount;

UPDATE `vp_expense_mst` SET `payment_under_processing` = 0;
