-----Amal---2.4.72-----

UPDATE `vendor_drop_down_connection` SET `drop_down_value_id`='7' WHERE  `id`=73;

INSERT INTO `vendor_privilages` (`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (53, 'Process Invoice', 'Process Invoice', 'PROCESS_INVOICE', '2021-09-30 03:54:36', 'System', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage` (`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (215, 1009, 53, 'PROCESS_INVOICE', 'System', '2021-12-02 18:50:50', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 215, NULL, 'System', '2022-02-09 16:38:57', NULL, NULL, NULL, NULL);
