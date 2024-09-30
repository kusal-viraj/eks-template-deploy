UPDATE common_drop_down_url SET url = '/payment_service/sec_get_payment_types' WHERE id = 2;

INSERT INTO common_drop_down_value(id, value, label) VALUES (69, 'K', 'Created');
INSERT INTO common_drop_down_value(id, value, label) VALUES (70, 'J', 'In Progress');
INSERT INTO common_drop_down_value(id, value, label) VALUES (71, 'H', 'On Hold');

INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (25, 69);
INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (25, 70);
INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (25, 71);