---loshith---2.8.187-----


UPDATE common_grid_column_template SET align='left' WHERE  grid_id=5 AND field = 'item.taxable';
UPDATE common_grid_column_user_wice SET align='left' WHERE  grid_id=5 AND field = 'item.taxable';
UPDATE common_grid_column_template SET column_width = 180 WHERE  grid_id= 14 AND field = 'bill.balanceAmount';
UPDATE common_grid_column_user_wice SET column_width = 180 WHERE  grid_id= 14 AND field = 'bill.balanceAmount';