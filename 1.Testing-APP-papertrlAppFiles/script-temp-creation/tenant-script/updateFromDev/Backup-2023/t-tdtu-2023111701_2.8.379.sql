UPDATE common_automation_document_type_event SET automation_rule_event=0 WHERE  id=38;
UPDATE common_automation_document_type_event SET automation_rule_event=0 WHERE  id=39;

UPDATE common_grid_column_template SET column_width='160' WHERE  field=accdt.id and grid_id=4;
UPDATE common_grid_column_template SET column_width='160' WHERE  field=acc.isPurchaseAccount and grid_id=4;
UPDATE common_grid_column_template SET column_width='170' WHERE  field=vendorItem.vendorItemNumber and grid_id=68;
 
UPDATE common_grid_column_user_wice SET column_width=160 WHERE  field=accdt.id and grid_id=4;
UPDATE common_grid_column_user_wice SET column_width=160 WHERE  field=acc.isPurchaseAccount and grid_id=4;
UPDATE common_grid_column_user_wice SET column_width=170 WHERE  field=vendorItem.vendorItemNumber and grid_id=68;