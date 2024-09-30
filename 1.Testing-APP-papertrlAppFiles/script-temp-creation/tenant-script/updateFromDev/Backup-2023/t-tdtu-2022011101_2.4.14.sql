INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (116, 'Enable Access To Confidential Documents', 'Enable Access To Confidential Documents', 'ENABLE_ACCESS_TO_CONFIDENTIAL_DOCUMENTS', 'System', '2022-01-05 14:40:28');

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES (457, 1035, 116, 'ENABLE_ACCESS_TO_CONFIDENTIAL_DOCUMENTS', 'System', '2022-01-05 14:43:42');

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 457, 'System', '2022-01-05 14:48:01');

ALTER TABLE `vp_vendor_mst` 
ADD COLUMN `confidential` tinyint(1) NULL DEFAULT 0 AFTER `payment_type_id`;