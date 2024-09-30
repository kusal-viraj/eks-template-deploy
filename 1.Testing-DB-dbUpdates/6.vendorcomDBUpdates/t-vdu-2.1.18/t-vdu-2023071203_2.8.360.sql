--hasila--2.8.360-----



INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.status', 'vcard.status', 'Status', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'dropdown', 'All', 12, 32, 140, NULL);
UPDATE vendor_grid_column_template SET column_order = 13 WHERE grid_id = 28 AND field = 'action';
