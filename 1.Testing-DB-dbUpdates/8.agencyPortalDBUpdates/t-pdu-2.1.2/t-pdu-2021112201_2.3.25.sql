---------Hashila------2.3.25---------

DELETE FROM umm_privilages WHERE id in (113,114);
DELETE FROM umm_role_previlege WHERE privilege_id in (1042,1043,1044,1045,1046,1047);
DELETE FROM umm_menu_privilage WHERE id in (444,445,446,447,448,449,450,451,452,453,454,455,456);
DELETE FROM umm_menu WHERE id in (1043,1044,1045,1046,1047);

INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (113, 'Edit Email', 'Edit Email', 'EDIT_EMAIL', 'System', '2021-11-17 11:45:39', null, null, null, null);

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (444, 1042, 2, 'INBOX_SEARCH', 'System', '2021-11-02 11:11:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (445, 1042, 5, 'INBOX_DELETE', 'System', '2021-11-02 12:27:24', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (446, 1042, 108, 'INBOX_ATTACH_TO', 'System', '2021-11-02 12:35:24', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (447, 1042, 109, 'INBOX_REVIEW', 'System', '2021-11-02 12:40:07', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (448, 1042, 110, 'INBOX_MOVE_TO_TO_PROCESS', 'System', '2021-11-02 12:47:42', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (449, 1042, 111, 'INBOX_RECOVER', 'System', '2021-11-02 12:53:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (450, 1042, 113, 'INBOX_EMAIL_EDIT', 'System', '2021-11-02 12:53:41', null, null, null, null);
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (451, 1042, 112, 'INBOX_SEGREGATE', 'System', '2021-11-17 12:10:56', null, null, null, null);
