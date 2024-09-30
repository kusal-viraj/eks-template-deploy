---sithum 2.10.37---



INSERT INTO common_drop_down (drop_down_name) VALUES ('Expense Payment Status');

INSERT INTO common_drop_down_connection (drop_down_id, drop_down_value_id) VALUES (39, 34);

INSERT INTO common_drop_down_connection (drop_down_id, drop_down_value_id) VALUES (39, 17);

INSERT INTO common_drop_down_connection (drop_down_id, drop_down_value_id) VALUES (39, 18);

UPDATE common_grid_column_template SET drop_down_id=39 WHERE  grid_id=15 AND `field`="expense.paymentStatus";
