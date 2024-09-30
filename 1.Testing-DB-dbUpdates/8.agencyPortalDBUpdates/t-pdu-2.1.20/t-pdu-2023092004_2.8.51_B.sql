--------hashila 2.8.51---


INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on) VALUES (152, 'View All Po', 'View All Po', 'PURCHASE_ORDER_VIEW_ALL_PO', 'System', '2023-08-25 10:56:00');
INSERT INTO umm_privilages (id, url, text, auth_code, created_by, created_on) VALUES (153, 'View All Bills', 'View All Bills', 'BILL_VIEW_ALL_BILLS', 'System', '2023-08-25 10:51:00');

INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on) VALUES (555, 1021, 152, 'PURCHASE_ORDER_VIEW_ALL_PO', 'System', '2023-08-25 10:58:00');
INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on) VALUES (556, 1019, 153, 'BILL_VIEW_ALL_BILLS', 'System', '2023-08-25 10:53:00');


---Hashila---2.8.55-----

UPDATE `umm_menu` SET `status` = 'A' WHERE super_type = 1002;

------Deshan---2.8.58------

ALTER TABLE `vp_payment_recipient_detail`
	ADD COLUMN `remittance_email_address` VARCHAR(150) NULL DEFAULT NULL AFTER `preferred_payment_type`;
	
ALTER TABLE `vp_payment_recipient_detail`
	CHANGE COLUMN `account_routing_number` `account_routing_number` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `account_type`,
	ADD COLUMN `encoded_account_routing_number` VARCHAR(100) NULL DEFAULT NULL AFTER `account_routing_number`,
	ADD COLUMN `encoded_account_number` VARCHAR(100) NULL DEFAULT NULL AFTER `account_number`;


---sithum 2.8.74---

UPDATE umm_menu SET tab=5, menu_order=5 WHERE  id=1040;
 

UPDATE umm_menu SET tab=4, menu_order=4 WHERE  id=1058;

----dasindu 2.8.88---


INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1035, 47, 'VENDORS_CSV_EXPORT', 'System', '2023-10-16 11:10:06', NULL, NULL, NULL, NULL);


----sithum 2.8.91---


UPDATE umm_menu SET display_text='Create Vendors' WHERE  id=1035;


----chandima 2.8.98---


UPDATE umm_menu SET menu_style='pi pi-book', display_icon='pi pi-book' WHERE  id=1018;

UPDATE umm_menu SET menu_style='fa fa-usd', display_icon='fa fa-usd' WHERE  id=1028;

UPDATE umm_menu SET menu_style='fa fa-cart-arrow-down', display_icon='fa fa-cart-arrow-down' WHERE  id=1027;

---chandima 2.8.100---



UPDATE umm_menu SET tab='1' WHERE  id=1041;

UPDATE umm_menu SET tab='2' WHERE  id=1046;

UPDATE umm_menu SET name='General Settings', display_text='General Settings' WHERE  id=1046;

UPDATE umm_menu SET tab='4' WHERE  id=1028;

UPDATE umm_menu SET name='Online Payments', display_text='Online Payments' WHERE  id=1028;

UPDATE umm_menu SET tab='5' WHERE  id=1044;

UPDATE umm_menu SET name='Feature Settings', display_text='Feature Settings' WHERE  id=1044;

UPDATE umm_menu SET individual_tenant_menu='0' WHERE  id=1045;

UPDATE umm_menu SET tab='3' WHERE  id=1018;

UPDATE umm_menu SET name='Fields Configuration', display_text='Fields Configuration' WHERE  id=1018;

UPDATE umm_menu SET individual_tenant_menu='0' WHERE  id=1027;

UPDATE umm_menu SET individual_tenant_menu='0' WHERE  id=1043;

UPDATE umm_menu SET display_icon='fa fa-users' WHERE  id=1044;

UPDATE umm_menu SET menu_order='3' WHERE  id=1017;

UPDATE umm_menu SET menu_order='4' WHERE  id=1041;

UPDATE umm_menu SET menu_order='5' WHERE  id=1046;

UPDATE umm_menu SET menu_order='6' WHERE  id=1018;

UPDATE umm_menu SET menu_order='7' WHERE  id=1028;

UPDATE umm_menu SET menu_order='8' WHERE  id=1044;





