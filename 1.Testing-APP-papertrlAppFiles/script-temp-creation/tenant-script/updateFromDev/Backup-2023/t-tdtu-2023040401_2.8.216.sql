INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (141, 'Mandatory field configuration', 'Mandatory field configuration', 'FIELD_CONFIGURATION', 'System', '2023-04-04 13:21:56', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (535, 1046, 141, 'MANDATORY_FIELD_CONFIGURATION', 'System', '2023-04-04 13:30:09', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 535, NULL, 'System', '2023-04-04 13:33:34', NULL, NULL, NULL, NULL);

UPDATE common_document_field_section_config SET section_id=1  WHERE id=8;
UPDATE common_document_field_section_config SET section_id=2  WHERE id=9;
UPDATE common_document_field_section_config SET section_id=9  WHERE id=10;
