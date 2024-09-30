---------Hashila---2.7.122-----

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (138, 'Offline Payment Processing', 'Offline Payment Processing', 'OFFLINE_PAYMENT_PROCESSING', 'System', '2022-11-02 17:53:01', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (519, 1019, 138, 'BILL_OFFLINE_PAYMENT_PROCESSING', 'System', '2022-11-02 17:54:44', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 519, 'System', '2022-11-02 17:56:08');