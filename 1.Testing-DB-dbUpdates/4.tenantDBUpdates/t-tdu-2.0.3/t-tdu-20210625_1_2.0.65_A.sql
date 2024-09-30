
UPDATE `umm_privilages` SET `url` = 'Send An Invitation', `text` = 'Send An Invitation' WHERE `id` = 57;
UPDATE `umm_privilages` SET `url` = 'Add To Local Vendor List', `text` = 'Add To Local Vendor List', `auth_code` = 'ADD_TO_LOCAL_VENDOR_LIST' WHERE `id` = 79;
UPDATE `umm_privilages` SET `url` = 'Approve Vendor Request', `text` = 'Approve Vendor Request', `auth_code` = 'APPROVE_VENDOR_REQUEST' WHERE `id` = 58;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (80, 'Resend An Invitation', 'Resend An Invitation', 'RESEND_VENDOR_INVITATION', 'System', '2021-06-23 01:44:07', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (81, 'Delete An Invitation', 'Delete An Invitation', 'DELETE_VENDOR_INVITATION', 'System', '2021-06-23 01:44:09', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (82, 'Reject Vendor Request', 'Reject Vendor Request', 'REJECT_VENDOR_REQUEST', 'System', '2021-06-23 01:44:12', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (83, 'Delete Vendor Request', 'Delete Vendor Request', 'DELETE_VENDOR_REQUEST', 'System', '2021-06-23 01:44:17', NULL, NULL, NULL, NULL);


UPDATE `umm_menu_privilage` SET `auth_code` = 'VENDORS_ADD_TO_LOCAL_VENDOR_LIST' WHERE `id` = 375;
UPDATE `umm_menu_privilage` SET `auth_code` = 'VENDORS_APPROVE_VENDOR_REQUEST' WHERE `id` = 58;

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (384, 1004, 5, 'VENDORS_DELETE', 'System', '2021-06-23 14:42:54', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (385, 1004, 80, 'VENDORS_RESEND_VENDOR_INVITATION', 'System', '2021-06-23 14:55:32', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (386, 1004, 81, 'VENDORS_DELETE_VENDOR_INVITATION', 'System', '2021-06-23 14:56:06', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (387, 1004, 82, 'VENDORS_REJECT_VENDOR_REQUEST', 'System', '2021-06-23 01:40:30', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (388, 1004, 83, 'VENDORS_DELETE_VENDOR_REQUEST', 'System', '2021-06-23 15:08:00', NULL, NULL, NULL, NULL);

