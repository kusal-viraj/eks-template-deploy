-----------Madhusha--------2.5.43------------

UPDATE `common_grid_column_template` SET `header` = 'Allowance' WHERE `id` = 488;

UPDATE `common_grid_column_template` SET `placeholder` = 'Allowance' WHERE `id` = 488;
 
UPDATE common_grid_column_user_wice wice SET wice.header='Allowance',wice.placeholder='Allowance' WHERE wice.grid_id = 48 AND wice.field='variance.priceVariance';