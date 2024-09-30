----------Hashila-----2.6.118---------

UPDATE `umm_menu` SET `slim_menu` = 1 WHERE `id` = 1005;
UPDATE `umm_menu` SET `slim_menu` = 0 WHERE `id` = 1019;

DELETE FROM `umm_menu_privilage` WHERE `auth_code` = 'PROJECT_CODES_CSV_EXPORT';

INSERT INTO `umm_menu_privilage`(`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (515, 1031, 42, 'RECURRING_BILLS_CREATE_BILL', 'System', '2022-06-22 17:43:21', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege`(`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES (1, 515, 'System', '2022-06-22 17:44:55');





