-----------------Indra----------------2.2.13---------------

INSERT INTO `vendor_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('50', 'Clone', 'Clone', 'CLONE', 'admin', '2021-09-30 07:27:00');
INSERT INTO `vendor_menu_privilage` (`id`, `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (198, 1003, 50, 'ROLES_CLONE', 'System', '2021-09-30 07:33:00', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES ('1', '198', 'vokojej225@sc2hub.com', '2021-09-30 07:49:00');