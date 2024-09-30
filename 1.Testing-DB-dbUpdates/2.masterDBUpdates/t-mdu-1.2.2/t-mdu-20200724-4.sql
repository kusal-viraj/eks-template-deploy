DROP TABLE IF EXISTS `tp_integration_system`;
CREATE TABLE IF NOT EXISTS `tp_integration_system` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
 `status` char(1) NOT NULL DEFAULT 'A',
 `created_by` varchar(50) NOT NULL,
 `created_date` date NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tp_integration_system` (`id`, `name`, `status`, `created_by`, `created_date`) VALUES
(1, 'Costpoint deltek', 'A', 'admin', '2020-06-25'),
(2, 'Quickbooks', 'A', 'admin', '2020-07-21'),
(3, 'Microsoft Dynamics 365 Business Central', 'A', 'admin', '2020-07-21');

ALTER TABLE `tp_integration_mst`
DROP COLUMN `tenant_id`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `system_name`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `auth_type`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `other_params`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `access_token`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `refresh_token`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `user_name`;
ALTER TABLE `tp_integration_mst`
DROP COLUMN `password`;
ALTER TABLE `tp_integration_mst`
CHANGE COLUMN `created_by` `created_by` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `id`;
ALTER TABLE `tp_integration_mst`
ADD COLUMN `auth_type` VARCHAR(5) NOT NULL AFTER `id`,
ADD COLUMN `user_id` VARCHAR(30) NULL AFTER `auth_type`,
ADD COLUMN `password` VARCHAR(60) NULL AFTER `user_id`,
ADD COLUMN `token_type` VARCHAR(15) NULL AFTER `password`,
ADD COLUMN `grant_type` VARCHAR(200) NULL AFTER `token_type`,
ADD COLUMN `access_token` VARCHAR(256) NULL AFTER `grant_type`,
ADD COLUMN `refresh_token` VARCHAR(256) NULL AFTER `access_token`,
ADD COLUMN `client_id` VARCHAR(256) NULL AFTER `refresh_token`,
ADD COLUMN `client_secret` VARCHAR(256) NULL AFTER `client_id`,
ADD COLUMN `authentication_end_point` VARCHAR(256) NULL AFTER `client_secret`,
ADD COLUMN `status` CHAR(1) NOT NULL AFTER `authentication_end_point`,
ADD COLUMN `system_id` INT(30) NOT NULL AFTER `status`,
ADD COLUMN `tenant_id` INT(30) NOT NULL AFTER `system_id`;
ALTER TABLE `tp_integration_mst`
ADD CONSTRAINT `FK_tp_integration_mst_tp_integration_system` FOREIGN KEY (`system_id`) REFERENCES
`tp_integration_system` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `FK_tp_integration_mst_papertrl_master_tenant` FOREIGN KEY (`tenant_id`)
REFERENCES `papertrl_master_tenant` (`id`) ON UPDATE CASCADE;


ALTER TABLE `tp_integration_detail`
DROP INDEX `INTEGRATION_ID_MST_FK`,
DROP FOREIGN KEY `tp_integration_detail_ibfk_1`;
ALTER TABLE `tp_integration_detail`
DROP COLUMN `integration_id`,
DROP COLUMN `service_name`,
DROP COLUMN `end_point`;
ALTER TABLE `tp_integration_detail`
ADD COLUMN `end_point_url` VARCHAR(250) NOT NULL AFTER `id`,
ADD COLUMN `json_template` TEXT NULL AFTER `end_point_url`,
ADD COLUMN `request_method` VARCHAR(10) NOT NULL AFTER `json_template`,
ADD COLUMN `system_name` VARCHAR(50) NOT NULL AFTER `request_method`,
ADD COLUMN `integration_id` INT(11) NOT NULL AFTER `system_name`;
ALTER TABLE `tp_integration_detail`
ADD CONSTRAINT `FK_tp_integration_detail_tp_integration_mst` FOREIGN KEY (`integration_id`) REFERENCES
`tp_integration_mst` (`id`) ON UPDATE CASCADE ON DELETE CASCADE;


DROP TABLE IF EXISTS `tp_integration_header`;
CREATE TABLE IF NOT EXISTS `tp_integration_header` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `header_name` varchar(50) NOT NULL,
 `header_value` varchar(50) NOT NULL,
 `integration_detail_id` int(30) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK__tp_integration_detail` (`integration_detail_id`),
 CONSTRAINT `FK__tp_integration_detail` FOREIGN KEY (`integration_detail_id`) REFERENCES
`tp_integration_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tp_integration_service_name`;
CREATE TABLE IF NOT EXISTS `tp_integration_service_name` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
`status` char(1) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `tp_integration_service_name` (`id`, `name`, `status`) VALUES
(1, 'Vendor', 'A'),
(2, 'Payment', 'A'),
(3, 'Invoice', 'A');


DROP TABLE IF EXISTS `tp_integration_service_property`;
CREATE TABLE IF NOT EXISTS `tp_integration_service_property` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
 `status` char(1) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `tp_integration_service_property` (`id`, `name`, `status`) VALUES
(1, 'Auto Create', 'A'),
(2, 'Auto Update', 'A'),
(3, 'Auto Fetch', 'A');


DROP TABLE IF EXISTS `tp_integration_json_template`;
CREATE TABLE IF NOT EXISTS `tp_integration_json_template` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `template_data` mediumblob NOT NULL,
 `file_type` varchar(50) NOT NULL,
 `file_name` varchar(200) NOT NULL,
 `scope` varchar(50) NOT NULL,
 `integration_detail_id` int(11) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_tp_integration_json_template_tp_integration_detail` (`integration_detail_id`),
 CONSTRAINT `FK_tp_integration_json_template_tp_integration_detail` FOREIGN KEY (`integration_detail_id`)
REFERENCES `tp_integration_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


