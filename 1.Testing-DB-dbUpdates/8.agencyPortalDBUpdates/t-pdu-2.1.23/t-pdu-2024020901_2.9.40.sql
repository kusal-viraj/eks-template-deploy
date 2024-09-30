---kavindu 2.9.40---


ALTER TABLE vp_payment_type_for_user 
ADD COLUMN provider_id int NULL AFTER user_name;


INSERT INTO umm_menu (id,name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, mobile_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (1062,'Funding Accounts', 'Funding Accounts', 'fa fa-building-columns', '/home/settings', '6', 'S', 1002, NULL, 'Admin', 8, 'fa fa-users', 'Funding Accounts', 'Funding Accounts', 'A', 0, 1, 0, 0, 'V2', 'FUNDING_ACCOUNT', 1, '1002,1014', 'System', '2023-10-26 08:34:32', NULL, NULL, NULL, NULL);

INSERT INTO umm_privilages (id,url, text, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (155,'Mark as Default', 'Mark as Default', 'FUNDING_ACCOUNT_MARK_AS_DEFAULT', 'System', '2023-08-25 10:51:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (559,1062, 1, 'FUNDING_ACCOUNT_CREATE', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (560,1062, 4, 'FUNDING_ACCOUNT_EDIT', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (561,1062, 5, 'FUNDING_ACCOUNT_DELETE', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) 
VALUES (562,1062, 155, 'FUNDING_ACCOUNT_MARK_AS_DEFAULT', 'System', '2024-01-25 13:00:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on) 
VALUES (563,1062, '13', 'FUNDING_ACCOUNT_INACTIVE', 'System', '2024-02-08 17:24:37');

INSERT INTO umm_menu_privilage (id,menu_id, privilage_id, auth_code, created_by, created_on) 
VALUES (564,1062, '14', 'FUNDING_ACCOUNT_ACTIVE', 'System', '2024-02-08 17:29:02');