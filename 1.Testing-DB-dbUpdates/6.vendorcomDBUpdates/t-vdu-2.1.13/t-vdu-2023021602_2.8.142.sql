----loshitha---2.8.142-----


UPDATE vendor_grid_column_template SET field = 'batchTxn.tpBatchId' WHERE header = 'Batch ID' AND grid_id = 24;
UPDATE vendor_grid_column_template SET field = 'batchTxn.txnRef' WHERE header = 'Reference Number' AND grid_id = 24; 
UPDATE vendor_grid_column_template SET field = 'batchTxn.txnAmount' WHERE header = 'Paid Amount' AND grid_id = 24;
UPDATE vendor_grid_column_template SET field = 'batchTxn.paymentDate' WHERE header = 'Payment Date' AND grid_id = 24; 
UPDATE vendor_grid_column_template SET field = 'batchTxn.txnTypeName' WHERE header = 'Transaction Type' AND grid_id = 24; 
UPDATE vendor_grid_column_template SET field = 'batchTxn.reason' WHERE header = 'Reason (If failed)' AND grid_id = 24; 
UPDATE vendor_grid_column_template SET field = 'batchTxn.paymentStatus' WHERE header = 'Payment Status' AND grid_id = 24; 
UPDATE vendor_grid_column_template SET field = 'batchTxn.txnDate' WHERE header = 'Transaction Date' AND grid_id = 24; 
UPDATE vendor_grid_column_template SET field = 'batchTxn.status' WHERE header = 'Approval Status' AND grid_id = 24; 