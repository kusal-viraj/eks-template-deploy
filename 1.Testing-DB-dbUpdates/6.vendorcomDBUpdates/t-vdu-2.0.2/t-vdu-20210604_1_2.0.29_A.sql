UPDATE `vendor_drop_down_value` SET `id`='7', `value`='Y', `label`='Paid' WHERE (`id`='7');

INSERT INTO `vendor_privilages`(`id`, `url`, `text`, `auth_code`, `created_on`, `created_by`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (49, 'Show PO Status Table', 'Show PO Status Table', 'SHOW_PO_STATUS_TABLE', '2021-06-04 10:19:36', '', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`(`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (196, 1007, 49, 'DASHBOARD_SHOW_PO_STATUS_TABLE', 'System', '2021-06-04 10:20:44', NULL, NULL, NULL, NULL);

DELETE FROM `vendor_drop_down_connection` WHERE `id` = 67;