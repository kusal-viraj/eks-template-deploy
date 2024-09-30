ALTER TABLE `vp_app_wkflw_mst` ADD COLUMN `client_id` int(11) NULL AFTER `defaultWrkflow`;

ALTER TABLE `umm_user_approval_group` DROP FOREIGN KEY `AP_GROUP_FK1`;

ALTER TABLE `umm_user_approval_group` ADD CONSTRAINT `AP_GROUP_FK1` FOREIGN KEY (`approval_group_id`) REFERENCES `umm_approval_group` (`id`) ON
DELETE CASCADE ON UPDATE CASCADE;

DELETE FROM `umm_approval_group` WHERE (`id`='2');

DELETE FROM `umm_menu` WHERE (`id`='44');