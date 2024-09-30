ALTER TABLE `umm_menu`
	ADD COLUMN `mobile_menu` TINYINT(1) NOT NULL AFTER `vendor_community_menu`;
	
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1000;
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1005;
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1006;
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1007;
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1019;
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1021;
UPDATE `umm_menu` SET `mobile_menu`='1' WHERE  `id`=1051;
