----------------------sithum 2.11.7---------------------------------


DELETE FROM common_grid_column_user_wice WHERE grid_id=73; 

INSERT INTO common_grid_column_template ( grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES ( 73, 'pPaymentReq.txnDate', 'pPaymentReq.txnDate', 'Check Date', 0, 1, 1, 1, 1, 1, 0, NULL, 'center', 'date', 'Check Date', 8, NULL, 160, NULL);

ALTER TABLE vp_payment_request_import_batch
	ADD COLUMN created_user_name VARCHAR(100) NULL DEFAULT NULL AFTER created_on;

UPDATE common_grid_column_template SET can_hide=1 WHERE grid_id=73 AND 'field'= "pPaymentReq.txnAmount";


