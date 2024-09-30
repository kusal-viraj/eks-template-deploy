----2.8.227-----



UPDATE `umm_menu` SET `url` = '/home/expense', `tab` = '3', `super_type` = 1007, `menu_order` = 3, `slim_menu` = 0, `hierachy` = '1015,1007' WHERE `id` = 1059;

DELETE FROM umm_role_previlege WHERE privilege_id=1059;

INSERT INTO `umm_privilages`(`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES (142, 'Activity Log', 'Activity log', 'ACTIVITY_LOG', 'System', '2023-04-10 16:58:41');

UPDATE umm_menu_privilage priv SET priv.auth_code="V_CARD_ACTIVITY_LOG", priv.privilage_id=142 WHERE priv.menu_id=1059 AND priv.privilage_id=10;