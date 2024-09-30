-----hasila-2.8.42-------


UPDATE `vp_expense_mst` exp SET exp.`payment_status` = 'N', exp.balance_amount = exp.total_amount;
UPDATE `hst_vp_expense_mst` exp SET exp.`payment_status` = 'N', exp.balance_amount = exp.total_amount;
