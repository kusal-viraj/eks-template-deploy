----sithum 2.8.379----


UPDATE common_audit_trial_status SET name= 'Transaction cancellation completed by' WHERE  id=54;

UPDATE common_grid_column_template SET column_width='160' WHERE  field='accdt.id' and grid_id=4;
UPDATE common_grid_column_template SET column_width='160' WHERE  field='acc.isPurchaseAccount' and grid_id=4;
UPDATE common_grid_column_template SET column_width='170' WHERE  field='vendorItem.vendorItemNumber' and grid_id=68;
 
UPDATE common_grid_column_user_wice SET column_width=160 WHERE  field='accdt.id' and grid_id=4;
UPDATE common_grid_column_user_wice SET column_width=160 WHERE  field='acc.isPurchaseAccount' and grid_id=4;
UPDATE common_grid_column_user_wice SET column_width=170 WHERE  field='vendorItem.vendorItemNumber' and grid_id=68;