UPDATE common_grid_column_template SET can_hide = 1 WHERE grid_id = 66 AND field = 'vcard.documentNos';

INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (62, 'Card activation rejected', 10, 'fa fa-ban', 'bg-blue');
INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (63, 'Card inactivation rejected', 11, 'fa fa-ban', 'bg-blue');


INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (64, 'Card topup completed', 12, 'fa-regular fa-circle-check', 'bg-blue');
INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (65, 'Card topup rejected', 13, 'fa fa-ban', 'bg-blue');

INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (66, 'Card activation completed', 14, 'fa-regular fa-circle-check', 'bg-blue');
INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (67, 'Card inactivation completed', 15, 'fa-regular fa-circle-check', 'bg-blue');

INSERT INTO umm_privilages(id, url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (146, 'Top Up', 'Top Up', 'TOP_UP', 'System', '2023-06-09 15:00:41', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (547, 1059, 14, 'V_CARD_ACTIVE', 'System', '2023-06-09 14:59:14', NULL, NULL, NULL, NULL);
INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (548, 1059, 13, 'V_CARD_INACTIVE', 'System', '2023-06-09 14:59:47', NULL, NULL, NULL, NULL);
INSERT INTO umm_menu_privilage(id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (549, 1059, 146, 'V_CARD_TOP_UP', 'System', '2023-06-09 15:01:28', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege(role_id, privilege_id, created_by, created_on) VALUES (1, 547, 'admin', '2023-06-09 15:02:26');
INSERT INTO umm_role_previlege(role_id, privilege_id, created_by, created_on) VALUES (1, 548, 'admin', '2023-06-09 15:02:26');
INSERT INTO umm_role_previlege(role_id, privilege_id, created_by, created_on) VALUES (1, 549, 'admin', '2023-06-09 15:02:26');

UPDATE umm_menu SET name = 'Virtual/ Digital Cards', display_text = 'Virtual/ Digital Cards', short_name = 'Virtual/ Digital Cards', detail_text = 'Virtual/ Digital Cards' WHERE id = 1059;