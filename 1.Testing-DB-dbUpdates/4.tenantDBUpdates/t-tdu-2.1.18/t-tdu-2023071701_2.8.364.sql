--hasila--2.8.364----

ALTER TABLE vp_expense_detail 
ADD COLUMN receipt_id int NULL AFTER mileage_amount;

ALTER TABLE vp_expense_detail 
ADD CONSTRAINT EXPENSE_RECEIPT_ID_FK_1 FOREIGN KEY (receipt_id) REFERENCES vp_receipt_mst (id);

UPDATE common_grid_column_template SET field = 'receipt.fileName', sortable_field = 'receipt.fileName', header = 'File Name',placeholder = 'File Name' WHERE grid_id = 53 AND field = 'receipt.cardNo';
UPDATE common_grid_column_user_wice SET field = 'receipt.fileName', sortable_field = 'receipt.fileName', header = 'File Name',placeholder = 'File Name' WHERE grid_id = 53 AND field = 'receipt.cardNo';

UPDATE common_grid_column_template SET column_width = 170 WHERE grid_id = 53 AND field = 'receipt.description';
UPDATE common_grid_column_user_wice SET column_width = 170 WHERE grid_id = 53 AND field = 'receipt.description';

UPDATE common_grid_column_template SET column_width = 350 WHERE grid_id = 53 AND field = 'receipt.fileName';
UPDATE common_grid_column_template SET column_width = 100 WHERE grid_id = 53 AND field = 'receipt.amount';
UPDATE common_grid_column_template SET column_width = 200 WHERE grid_id = 53 AND field = 'receipt.merchant';
UPDATE common_grid_column_template SET column_width = 350 WHERE grid_id = 53 AND field = 'receipt.description';
UPDATE common_grid_column_template SET column_width = 200 WHERE grid_id = 53 AND field = 'receipt.createdByName';

UPDATE common_grid_column_user_wice SET column_width = 350 WHERE grid_id = 53 AND field = 'receipt.fileName';
UPDATE common_grid_column_user_wice SET column_width = 100 WHERE grid_id = 53 AND field = 'receipt.amount';
UPDATE common_grid_column_user_wice SET column_width = 200 WHERE grid_id = 53 AND field = 'receipt.merchant';
UPDATE common_grid_column_user_wice SET column_width = 350 WHERE grid_id = 53 AND field = 'receipt.description';
UPDATE common_grid_column_user_wice SET column_width = 200 WHERE grid_id = 53 AND field = 'receipt.createdByName';
