----------Amal------2.6.69---------

DELETE FROM `umm_menu_privilage` WHERE  `id`=487;
DELETE FROM `umm_privilages` WHERE  `id`=131;
DELETE FROM `umm_role_previlege` WHERE `privilege_id`=487;
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `created_by`, `created_on`) VALUES ('1', '1014', 'System', '2022-06-06 07:11:00');
