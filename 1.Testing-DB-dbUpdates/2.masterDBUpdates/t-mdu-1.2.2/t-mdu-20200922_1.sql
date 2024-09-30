ALTER TABLE `tp_integration_mst`
	CHANGE COLUMN `access_token` `access_token` TEXT(65535) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `grant_type`,
	CHANGE COLUMN `refresh_token` `refresh_token` TEXT(65535) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `access_token`;