---hashila--2.8.185------


UPDATE vendor_grid_column_template SET field = 'inv.submittedByName', sortable_field = 'inv.submittedByName' WHERE grid_id = 5 AND field = 'inv.submittedBy';
UPDATE vendor_grid_column_user_wice SET field = 'inv.submittedByName', sortable_field = 'inv.submittedByName' WHERE grid_id = 5 AND field = 'inv.submittedBy';

INSERT INTO vendor_drop_down_value(id, value, label) VALUES (33, 'O', 'Pending');
INSERT INTO vendor_drop_down_value(id, value, label) VALUES (34, 'U', 'Submitted');
INSERT INTO vendor_drop_down_value(id, value, label) VALUES (35, 'S', 'Success');
INSERT INTO vendor_drop_down_value(id, value, label) VALUES (36, 'F', 'Failed');

INSERT INTO vendor_drop_down(id, drop_down_name) VALUES (31, 'Transaction Status');

INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (31, 33);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (31, 34);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (31, 35);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (31, 36);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (31, 31);

UPDATE vendor_grid_column_template SET  search_type = 'dropdown', drop_down_id = 31 WHERE grid_id = 24 AND field = 'batchTxn.paymentStatus';
UPDATE vendor_grid_column_user_wice SET  search_type = 'dropdown', drop_down_id = 31 WHERE grid_id = 24 AND field = 'batchTxn.paymentStatus';

INSERT INTO vendor_drop_down_url(id, name, url) VALUES (5, 'Payment Types', '/tenant_management/sec_get_payment_types');

UPDATE vendor_grid_column_template SET drop_down_id = NULL, drop_down_url_id = 5 WHERE grid_id = 24 AND field = 'batchTxn.txnTypeName';
UPDATE vendor_grid_column_user_wice SET drop_down_id = NULL, drop_down_url_id = 5 WHERE grid_id = 24 AND field = 'batchTxn.txnTypeName';

INSERT INTO vendor_drop_down_url(id, name, url) VALUES (6, 'PO List', '/vendor_portal/sec_get_approved_po_list_for_vendor');


UPDATE vendor_grid_column_template SET drop_down_url_id = 6 WHERE grid_id = 27 AND field = 'creditNote.poId';
UPDATE vendor_grid_column_user_wice SET drop_down_url_id = 6 WHERE grid_id = 27 AND field = 'creditNote.poId';
