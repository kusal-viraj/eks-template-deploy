------indra 2.8.337------



ALTER TABLE `papertrl_inbox_config`
	ADD COLUMN `access_token` TEXT NULL AFTER `tenant_id`,
	ADD COLUMN `refresh_token` TEXT NULL AFTER `access_token`,
	ADD COLUMN `access_token_expires_on` DATETIME NULL AFTER `refresh_token`,
	ADD COLUMN `refresh_token_expires_on` DATETIME NULL AFTER `access_token_expires_on`;