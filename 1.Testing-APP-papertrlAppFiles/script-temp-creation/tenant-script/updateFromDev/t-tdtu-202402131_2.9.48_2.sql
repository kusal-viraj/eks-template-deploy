INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (62, 'txn.providerName', 'txn.providerName', 'Payment Provider', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Payment Provider', 5, NULL, 170, NULL);

UPDATE common_grid_column_template SET  column_order = 6 WHERE grid_id = 62 AND field = 'txn.payeeName';
UPDATE common_grid_column_template SET  column_order = 7 WHERE grid_id = 62 AND field = 'txn.txnAmount';
UPDATE common_grid_column_template SET column_order = 8 WHERE grid_id = 62 AND field = 'txn.createdOn';
UPDATE common_grid_column_template SET column_order = 9 WHERE grid_id = 62 AND field = 'txn.status';
UPDATE common_grid_column_template SET column_order = 10 WHERE grid_id = 62 AND field = 'txn.txnType';
UPDATE common_grid_column_template SET column_order = 12 WHERE grid_id = 62 AND field = 'txn.reason';
UPDATE common_grid_column_template SET column_order = 15 WHERE grid_id = 62 AND field = 'action';
UPDATE common_grid_column_template SET column_order = 1 WHERE grid_id = 62 AND field = 'checkbox';
UPDATE common_grid_column_template SET column_order = 1 WHERE grid_id = 62 AND field = 'txn.isOnline';
UPDATE common_grid_column_template SET column_order = 13 WHERE grid_id = 62 AND field = 'txn.paymentStatus';
UPDATE common_grid_column_template SET column_order = 11 WHERE grid_id = 62 AND field = 'txn.documentType';

UPDATE common_grid_state_template SET column_widths = '50,250,232,232,231,231,232,232,232,232,232,232,345,50' WHERE id = 62;
