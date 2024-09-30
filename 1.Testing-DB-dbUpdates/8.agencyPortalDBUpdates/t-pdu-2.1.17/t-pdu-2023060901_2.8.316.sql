-----hashila 2.8.316-----------



INSERT INTO umm_privilages(id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (146, 'Top Up', 'Top Up', 'TOP_UP', 'System', '2023-06-09 15:00:41', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (547, 1059, 14, 'V_CARD_ACTIVE', 'System', '2023-06-09 14:59:14', NULL, NULL, NULL, NULL);
INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (548, 1059, 13, 'V_CARD_INACTIVE', 'System', '2023-06-09 14:59:47', NULL, NULL, NULL, NULL);
INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (549, 1059, 146, 'V_CARD_TOP_UP', 'System', '2023-06-09 15:01:28', NULL, NULL, NULL, NULL);

UPDATE umm_menu SET name = 'Virtual/ Digital Cards', display_text = 'Virtual/ Digital Cards', short_name = 'Virtual/ Digital Cards', detail_text = 'Virtual/ Digital Cards' WHERE id = 1059;