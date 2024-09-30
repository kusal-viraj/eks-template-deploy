-----hashila 2.8.316---------



UPDATE vendor_menu SET name = 'Digital Cards' WHERE id = 1024;
UPDATE vendor_menu SET display_text = 'Digital Cards', short_name = 'Digital Cards', detail_text = 'Digital Cards' WHERE id = 1024;

UPDATE vendor_grid_column_template SET can_hide = 1 WHERE grid_id = 28 AND field = 'vcard.documentNos';
