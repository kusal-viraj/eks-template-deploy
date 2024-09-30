ALTER TABLE `tp_integration_system`
ADD COLUMN `client_id`  varchar(256) NULL AFTER `name`,
ADD COLUMN `client_secret`  varchar(256) NULL AFTER `client_id`;

ALTER TABLE `tp_integration_mst`
DROP COLUMN `client_id`,
DROP COLUMN `client_secret`;

ALTER TABLE `tp_integration_mst`
ADD COLUMN `redirect_url`  varchar(255) NULL AFTER `authentication_end_point`;

