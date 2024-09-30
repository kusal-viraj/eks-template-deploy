INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (77, 'Check payment returned by', 23, 'fa-solid fa-rotate-left', 'bg-red');
INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (78, 'Check payment stopped by', 24, 'fa-regular fa-circle-stop', 'bg-red');

INSERT INTO common_drop_down_value(id, value, label) VALUES (76, 'R', 'Check Return');
INSERT INTO common_drop_down_value(id, value, label) VALUES (78, 'T', 'Stop Payment');

INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (25, 76);
INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (25, 77);