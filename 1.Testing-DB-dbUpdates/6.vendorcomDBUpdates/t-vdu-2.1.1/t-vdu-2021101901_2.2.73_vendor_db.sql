-------------------Indra-----------2.2.73----------------

ALTER TABLE `vendor_user_mst`
	CHANGE COLUMN `telephone_no` `telephone_no` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `email`;
	
	
INSERT INTO `vendor_privilages` (`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (51, 'Create Invoice', 'Create Invoice', 'CREATE_INVOICE', '2021-10-12 11:14:13', 'System', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_menu_privilage` (`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (199, 1007, 51, 'PO_INVOICE_CREATE', 'System', '2021-10-12 11:14:27', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 199, NULL, 'System', '2021-10-12 11:06:12', NULL, NULL, NULL, NULL);