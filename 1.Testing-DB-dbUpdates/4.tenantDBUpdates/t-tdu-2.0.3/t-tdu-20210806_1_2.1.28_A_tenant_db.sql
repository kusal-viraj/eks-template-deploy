INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('84', 'Show Bills Awaiting Your Approval Table', 'Show Bills Awaiting Your Approval Table', 'SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:02:24');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('85', 'Show POS Awaiting Your Approval Table', 'Show POs Awaiting Your Approval Table', 'SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:03:15');

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('86', 'Show Expense Reports Awaiting Your Approval Table', 'Show Expense Reports Awaiting Your Approval Table', 'SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:04:39');

INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('1000', '84', 'SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:06:25');

INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('1000', '85', 'SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:07:33');

INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1000', '86', 'SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE', 'System', '2021-08-06 17:08:06', NULL, NULL, NULL, NULL);

UPDATE `common_automation_field` SET `show_hide_enable`='0' WHERE (`id`='90');








