---dasindu 2.9.24---

INSERT INTO umm_menu (id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, mobile_menu, version, auth_code, slim_menu, hierachy, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1061,'Reminders', 'Reminders', 'fa fa-cogs', '/home/settings', '7', 'S', 1002, NULL, 'Admin', 8, 'fa fa-bell', 'Reminders', 'Reminders', 'A', 0, 1, 0, 0, 'V2', 'REMINDERS', 0, '1002,1014', 'System', '2023-10-26 08:34:32', NULL, NULL, NULL, NULL);

UPDATE umm_menu_privilage SET menu_id=1061 WHERE auth_code='REMINDER_CONFIGURATION';