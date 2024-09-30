------------2.3.61----Madhusha-------------------

UPDATE vendor_grid_column_template template 
SET template.field='recInv.termName' 
WHERE template.field='term.id' AND template.grid_id=26;


UPDATE vendor_grid_column_user_wice template 
SET template.field='recInv.termName' 
WHERE template.field='term.id' AND template.grid_id=26;