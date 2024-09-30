UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.docDate';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.dueDate';
UPDATE common_grid_column_template SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.amount';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paidAmount';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paymentUnderProcessing';
UPDATE common_grid_column_template SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.balanceAmount';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.referenceNo';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.txnType';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.txnAmount';
UPDATE common_grid_column_template SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.comment';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.applicableDiscountAmount';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paymentStatus';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.creditAmount';
UPDATE common_grid_column_template SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paymentDate';
UPDATE common_grid_column_template SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.receipt';

UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.docDate';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.dueDate';
UPDATE common_grid_column_user_wice SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.amount';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paidAmount';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paymentUnderProcessing';
UPDATE common_grid_column_user_wice SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.balanceAmount';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.referenceNo';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.txnType';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.txnAmount';
UPDATE common_grid_column_user_wice SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.comment';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.applicableDiscountAmount';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paymentStatus';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.creditAmount';
UPDATE common_grid_column_user_wice SET  column_show = 1 WHERE grid_id = 63 AND field = 'doc.paymentDate';
UPDATE common_grid_column_user_wice SET column_show = 1 WHERE grid_id = 63 AND field = 'doc.receipt';


ALTER TABLE vp_payment_batch 
MODIFY COLUMN provider_id int(11) NULL AFTER id;
