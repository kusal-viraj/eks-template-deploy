----Hashila-----

INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (63, 'doc.providerId', 'doc.providerId', 'Payment Channel', 1, 0, 0, 1, 1, 0, 0, NULL, 'left', 'input', 'Payment Channel', 5, NULL, 140, NULL);

UPDATE common_grid_column_template SET  column_order = 10 WHERE grid_id = 63 AND field = 'doc.docDate';
UPDATE common_grid_column_template SET  column_order = 11 WHERE grid_id = 63 AND field = 'doc.dueDate';
UPDATE common_grid_column_template SET  column_order = 12 WHERE grid_id = 63 AND field = 'doc.amount';
UPDATE common_grid_column_template SET  column_order = 13 WHERE grid_id = 63 AND field = 'doc.paidAmount';
UPDATE common_grid_column_template SET  column_order = 14 WHERE grid_id = 63 AND field = 'doc.paymentUnderProcessing';
UPDATE common_grid_column_template SET  column_order = 15 WHERE grid_id = 63 AND field = 'doc.balanceAmount';
UPDATE common_grid_column_template SET  column_order = 8 WHERE grid_id = 63 AND field = 'doc.referenceNo';
UPDATE common_grid_column_template SET  column_order = 4 WHERE grid_id = 63 AND field = 'doc.txnType';
UPDATE common_grid_column_template SET  column_order = 6 WHERE grid_id = 63 AND field = 'doc.txnAmount';
UPDATE common_grid_column_template SET  column_order = 9 WHERE grid_id = 63 AND field = 'doc.comment';
UPDATE common_grid_column_template SET  column_order = 18 WHERE grid_id = 63 AND field = 'doc.applicableDiscountAmount';
UPDATE common_grid_column_template SET  column_order = 17 WHERE grid_id = 63 AND field = 'doc.paymentStatus';
UPDATE common_grid_column_template SET  column_order = 16 WHERE grid_id = 63 AND field = 'doc.creditAmount';
UPDATE common_grid_column_template SET  column_order = 7 WHERE grid_id = 63 AND field = 'doc.paymentDate';
UPDATE common_grid_column_template SET  column_order = 19 WHERE grid_id = 63 AND field = 'doc.receipt';

UPDATE common_grid_state_template SET column_widths = '50,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,315' WHERE id = 63;

