-------------------Indra------------2.2.13--------------------

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('99', 'Clone', 'Clone', 'CLONE', 'System', '2021-09-30 07:27:00');

UPDATE `umm_privilages` SET `created_by`='System' WHERE  `id`=97;
UPDATE `umm_privilages` SET `created_by`='System' WHERE  `id`=98;

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (426, 1012, 99, 'ROLES_CLONE', 'System', '2021-09-30 07:33:00', NULL, NULL, NULL, NULL);

