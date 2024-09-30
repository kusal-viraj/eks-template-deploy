-----sithum-2.13.38-------

DELETE FROM umm_role_previlege WHERE  role_id=1064 AND privilege_id = 164;

DELETE FROM umm_menu_privilage WHERE  menu_id=1064 AND privilage_id = 164;

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on) VALUES (571, 1064, 164, 'PAYMENT_ACKNOWLEDGEMENT', 'System', '2024-07-25 13:42:22');

INSERT INTO umm_role_previlege (role_id, privilege_id, created_by, created_on) VALUES (1, 571, 'admin', '2024-07-25 13:45:22');