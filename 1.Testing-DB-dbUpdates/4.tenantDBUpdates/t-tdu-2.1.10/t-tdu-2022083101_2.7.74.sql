----------Madhusha------2.7.74---------------

UPDATE `vp_recurring_bill_expense_cost_distribution` SET `billable` = 0 WHERE `billable` IS NULL;
UPDATE `vp_recurring_bill_expense_cost_distribution` SET `taxable` = 0 WHERE `taxable` IS NULL;

UPDATE `vp_recurring_bill_item_cost_distribution` SET `billable` = 0 WHERE `billable` IS NULL;
UPDATE `vp_recurring_bill_item_cost_distribution` SET `taxable` = 0 WHERE `taxable` IS NULL;