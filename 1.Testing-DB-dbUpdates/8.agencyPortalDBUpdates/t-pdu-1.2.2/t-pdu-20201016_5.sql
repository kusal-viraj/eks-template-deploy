UPDATE `umm_menu` SET `status`='A', `portal_menu`='0' WHERE`id`=22;
UPDATE `umm_menu` SET `super_type`='46' WHERE (`id`='22');
DELETE FROM umm_role_previlege WHERE privilege_id IN (65,66,67,68,69);