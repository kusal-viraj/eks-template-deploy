DELETE FROM `umm_privilages` WHERE (`id`='80');
DELETE FROM `umm_privilages` WHERE (`id`='81');
DELETE FROM `umm_privilages` WHERE (`id`='82');
DELETE FROM `umm_privilages` WHERE (`id`='83');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('80', 'Show Sub Account\'s Bills Summary', 'Show Sub Account\'s Bills Summary', 'SHOW_SUB_ACCOUNTS_BILL_SUMMARY', 'System', '2021-06-25 00:21:30', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('81', 'Show Sub Account\'s Bill Payments Summary', 'Show Sub Account\'s Bill Payments Summary', 'SHOW_SUB_ACCOUNTS_BILL_PAYMENT_SUMMARY', 'System', '2021-06-25 00:21:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('82', 'Show Sub Account\'s Purchase Orders Summary', 'Show Sub Account\'s Purchase Orders Summary', 'SHOW_SUB_ACCOUNTS_PURCHASE_ORDERS_SUMMARY', 'System', '2021-06-25 00:21:42', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('83', 'Show Sub Account\'s Expense Reports Summary', 'Show Sub Account\'s Expense Reports Summary', 'SHOW_SUB_ACCOUNTS_EXPENSE_REPORTS_SUMMARY', 'System', '2021-06-25 00:21:48', NULL, NULL, NULL, NULL);


UPDATE `umm_menu_privilage` SET `id`='369', `menu_id`='999', `privilage_id`='80', `auth_code`='DASHBOARD_SHOW_SUB_ACCOUNTS_BILL_SUMMARY', `created_by`='System', `created_on`='2021-06-24 23:50:57', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='369');
UPDATE `umm_menu_privilage` SET `id`='370', `menu_id`='999', `privilage_id`='81', `auth_code`='DASHBOARD_SHOW_SUB_ACCOUNTS_BILL_PAYMENT_SUMMARY', `created_by`='System', `created_on`='2021-06-24 23:51:32', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='370');
UPDATE `umm_menu_privilage` SET `id`='371', `menu_id`='999', `privilage_id`='82', `auth_code`='DASHBOARD_SHOW_SUB_ACCOUNTS_PURCHASE_ORDERS_SUMMARY', `created_by`='System', `created_on`='2021-06-24 23:52:13', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='371');
UPDATE `umm_menu_privilage` SET `id`='372', `menu_id`='999', `privilage_id`='83', `auth_code`='DASHBOARD_SHOW_SUB_ACCOUNTS_EXPENSE_REPORTS_SUMMARY', `created_by`='System', `created_on`='2021-06-24 23:52:16', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='372');


DELETE FROM `umm_menu_privilage` WHERE (`id`='373')