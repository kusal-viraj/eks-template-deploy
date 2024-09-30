----loshitha-2.8.248---


INSERT INTO vendor_drop_down_url (id, name, url) VALUES (7, 'Interval List', '/vendor_portal/sec_get_recurring_interval_list');

UPDATE vendor_grid_column_template SET drop_down_url_id=7 WHERE  field ='recInv.intervalValue' AND grid_id=26 ;