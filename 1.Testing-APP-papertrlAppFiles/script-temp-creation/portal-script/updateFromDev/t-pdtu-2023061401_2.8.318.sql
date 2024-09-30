
INSERT INTO umm_privilages(id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (147, 'Create Digital Card', 'Create Digital Card', 'CREATE_DIGITAL_CARD', 'System', '2023-06-14 10:09:50', NULL, NULL, NULL, NULL);

UPDATE umm_menu_privilage SET menu_id = 1021 WHERE id = 546;
UPDATE umm_menu_privilage SET privilage_id = 147 WHERE id = 546;

INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (550, 1059, 1, 'V_CARD_CREATE', 'System', '2023-06-14 10:12:13', NULL, NULL, NULL, NULL);
