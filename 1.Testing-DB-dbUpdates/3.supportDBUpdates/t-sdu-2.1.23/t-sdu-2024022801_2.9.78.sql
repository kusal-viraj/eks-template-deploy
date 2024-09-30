---sithum---2.9.78---


INSERT INTO common_drop_down_value (id, value, label) VALUES (18, '1', 'Credit');
INSERT INTO common_drop_down_value (id, value, label) VALUES (19, '0', 'Deposit');
INSERT INTO common_drop_down (id,drop_down_name) VALUES (5,'Deposit Credit Status Drop Down');
INSERT INTO common_drop_down_connection (drop_down_id, drop_down_value_id) VALUES (5, 18);
INSERT INTO common_drop_down_connection (drop_down_id, drop_down_value_id) VALUES (5, 19);

INSERT INTO common_grid_column_template (grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, align, search_type, placeholder, column_order, drop_down_id) VALUES (11, 'pay.optionId', 'pay.optionId', 'Account Type', 1, 1, 1, 1, 1, 1, 'left', 'dropdown', 'Account Type', 6, 5);

