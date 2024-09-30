UPDATE common_grid_column_template SET is_re_orderable = 0;

UPDATE common_grid_column_template cg SET cg.column_width = 180 WHERE cg.field = 'bill.applicableDiscountAmount' AND cg.grid_id = 14;
UPDATE common_grid_column_template cg SET cg.column_width = 200 WHERE cg.field = 'bill.discountApplicableDate' AND cg.grid_id = 14;
UPDATE common_grid_column_template cg SET cg.column_width = 200 WHERE cg.field = 'receipt.id' AND cg.grid_id = 14;

UPDATE common_grid_column_template cg SET cg.column_width = 200 WHERE cg.field = 'recBill.noOfGeneration' AND cg.grid_id = 40;
UPDATE common_grid_column_template cg SET cg.column_width = 200 WHERE cg.field = 'recBill.lastGenerationDate' AND cg.grid_id = 40;

UPDATE common_grid_column_template cg SET cg.column_width = 200 WHERE cg.field = 'creditNote.creditNoteNo' AND cg.grid_id = 49;