UPDATE `vendor_menu_privilage` SET `menu_id` = 1007, `prililage_id` = 45, `auth_code` = 'PO_ADD_NOTE', `created_by` = 'System', `created_on` = '2021-05-31 22:26:04', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 185;
UPDATE `vendor_menu_privilage` SET `menu_id` = 1009, `prililage_id` = 45, `auth_code` = 'INVOICE_ADD_NOTE', `created_by` = 'System', `created_on` = '2021-05-31 22:26:07', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 186;
UPDATE `vendor_menu_privilage` SET `menu_id` = 1010, `prililage_id` = 45, `auth_code` = 'PAYMENT_ADD_NOTE', `created_by` = 'System', `created_on` = '2021-05-31 22:26:15', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 187;

UPDATE `vendor_menu_privilage` SET `menu_id` = 1010, `prililage_id` = 2, `auth_code` = 'PAYMENT_SEARCH', `created_by` = 'System', `created_on` = '2021-05-31 22:28:52', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 175;
DELETE FROM `vendor_menu_privilage` WHERE `id` = 34;

UPDATE `vendor_privilages` SET `url` = 'Send Request', `text` = 'Send Request', `auth_code` = 'SEND_REQUEST', `created_on` = '2021-05-31 22:41:28', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 31;
UPDATE `vendor_privilages` SET `url` = 'Delete Request', `text` = 'Delete Request', `auth_code` = 'DELETE_REQUEST', `created_on` = '2021-05-31 22:42:22', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 32;
UPDATE `vendor_privilages` SET `url` = 'Resend Request', `text` = 'Resend Request', `auth_code` = 'RESEND_REQUEST', `created_on` = '2021-05-31 22:40:43', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 33;

UPDATE `vendor_menu_privilage` SET `menu_id` = 1006, `prililage_id` = 31, `auth_code` = 'CUSTOMERS_SEND_REQUEST', `created_by` = 'System', `created_on` = '2021-05-31 22:44:25', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 172;

UPDATE `vendor_menu` SET `name` = 'Invoices', `display_text` = 'Invoices', `menu_style` = 'fa fa-file-text-o', `url` = 'invoices', `tab` = NULL, `type` = 'S', `super_type` = 1004, `super_type_2` = NULL, `department` = 'Admin', `menu_order` = 6, `display_icon` = 'fa fa-file-text-o', `short_name` = 'Invoices', `detail_text` = 'Invoices', `status` = 'A', `portal_menu` = 0, `individual_tenant_menu` = 1, `vendor_community_menu` = 1, `version` = 'V2', `auth_code` = 'INVOICE_MANAGEMENT', `slim_menu` = 1, `created_by` = 'System', `created_on` = '2021-04-15 18:30:06', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL, `hierachy` = '1004' WHERE `id` = 1008;

UPDATE `vendor_privilages` SET `url` = 'Show Pending PO Card', `text` = 'Show Pending PO Card', `auth_code` = 'SHOW_PENDING_PO_CARD', `created_on` = '2021-06-01 00:21:46', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 37;
UPDATE `vendor_privilages` SET `url` = 'Show Pending Invoices Card', `text` = 'Show Pending Invoices Card', `auth_code` = 'SHOW_PENDING_INVOICES_CARD', `created_on` = '2021-06-01 00:22:25', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 38;
UPDATE `vendor_privilages` SET `url` = 'Show Received Payments Card', `text` = 'Show Received Payments Card', `auth_code` = 'SHOW_RECEIVED_PAYMENTS_CARD', `created_on` = '2021-06-01 00:23:42', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 42;
UPDATE `vendor_privilages` SET `url` = 'Show Invoice Status Table ', `text` = 'Show Invoice Status Table ', `auth_code` = 'SHOW_INVOICE_STATUS_TABLE', `created_on` = '2021-06-01 00:24:19', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 44;

INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (188, 1006, 32, 'CUSTOMERS_DELETE_REQUEST', 'System', '2021-06-01 12:16:01', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (189, 1006, 33, 'CUSTOMERS_RESEND_REQUEST', 'System', '2021-06-01 12:17:04', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (190, 1000, 37, 'DASHBOARD_SHOW_PENDING_PO_CARD', 'System', '2021-06-01 13:59:48', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (191, 1000, 38, 'DASHBOARD_SHOW_PENDING_INVOICES_CARD', 'System', '2021-06-01 14:00:37', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (192, 1000, 42, 'DASHBOARD_SHOW_RECEIVED_PAYMENTS_CARD', 'System', '2021-06-01 14:01:30', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (193, 1000, 44, 'DASHBOARD_SHOW_INVOICE_STATUS_TABLE', 'System', '2021-06-01 14:02:02', NULL, NULL, NULL, NULL);