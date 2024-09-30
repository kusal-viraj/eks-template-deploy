---hashila 2.9.143---



ALTER TABLE vp_payment_v_card 
CHANGE COLUMN funding_Account_id funding_account_id int NULL DEFAULT NULL AFTER provider_id;

ALTER TABLE vp_payment_check 
CHANGE COLUMN funding_Account_id funding_account_id int NULL DEFAULT 0 AFTER sync_status;


---dasindu 2.9.144---



INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1029, 48, 'PAYMENT_PROCESS_PAYMENT_REQUEST_UPLOAD', 'System', '2024-04-02 11:10:06', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 570, NULL, 'Admin', '2024-04-02 22:43:59', NULL, NULL, NULL, NULL);