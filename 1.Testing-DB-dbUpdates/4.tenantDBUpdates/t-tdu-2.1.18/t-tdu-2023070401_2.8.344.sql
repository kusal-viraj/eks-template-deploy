
--loshitha--2.8.344-----

UPDATE common_grid_column_template ct SET header='Expense Account', placeholder='Expense Account' WHERE  ct.grid_id= 54 AND ct.field= 'transaction.account';
UPDATE common_grid_column_template ct SET header='Expense Account', placeholder='Expense Account' WHERE  ct.grid_id= 55 AND ct.field= 'transaction.account';

UPDATE common_grid_column_template ct SET header='Period – Month', placeholder='Period – Month' WHERE  ct.grid_id= 14 AND ct.field= 'bill.accountPeriodMonth';
UPDATE common_grid_column_template ct SET header='Period – Year', placeholder='Period – Year' WHERE  ct.grid_id= 14 AND ct.field= 'bill.accountPeriodYear';