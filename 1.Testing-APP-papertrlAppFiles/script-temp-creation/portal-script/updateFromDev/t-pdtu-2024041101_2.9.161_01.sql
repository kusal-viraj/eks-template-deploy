


INSERT INTO umm_privilages(id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (160, 'Check Stop Payment', 'Check Stop Payment', 'CHECK_STOP_PAYMENT', 'System', '2024-04-11 15:59:11', NULL, NULL, NULL, NULL);
INSERT INTO umm_privilages(id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (161, 'Check Return', 'Check Return', 'CHECK_RETURN', 'System', '2024-04-11 15:59:44', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (569, 1064, 160, 'PAYMENT_CHECK_STOP_PAYMENT', 'System', '2024-04-11 16:10:52', NULL, NULL, NULL, NULL);
INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (570, 1064, 161, 'PAYMENT_CHECK_RETURN', 'System', '2024-04-11 16:11:18', NULL, NULL, NULL, NULL);
