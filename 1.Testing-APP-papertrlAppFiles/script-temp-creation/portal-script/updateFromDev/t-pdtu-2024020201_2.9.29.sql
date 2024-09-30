ALTER TABLE `umm_user_role_relation`
	ADD COLUMN `status` CHAR(1) NULL DEFAULT NULL AFTER `role_id`;