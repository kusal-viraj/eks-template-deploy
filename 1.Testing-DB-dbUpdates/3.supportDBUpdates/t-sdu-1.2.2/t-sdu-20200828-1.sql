ALTER TABLE `umm_role_previlege` ADD COLUMN `sub_account_id` INT(11) NULL AFTER `privilege_id`;

ALTER TABLE `umm_menu` ADD COLUMN `portal_menu` TINYINT NOT NULL DEFAULT 0 AFTER `status`;
