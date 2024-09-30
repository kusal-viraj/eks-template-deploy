---dasindu 2.9.24----

ALTER TABLE `oauth_access_token`
	CHANGE COLUMN `authentication` `authentication` MEDIUMBLOB NULL AFTER `client_id`;