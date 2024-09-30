--------------------------Indra----------2.2.13-------------------

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('70', 'Clone', 'Clone', 'CLONE', 'admin', '2021-09-30 07:27:00');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (43, 1004, 70, 'ROLES_CLONE', 'System', '2021-09-30 07:33:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES ('1', '43', 'support', '2021-09-30 07:55:00');