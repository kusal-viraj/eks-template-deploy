
DELETE FROM tp_integration_header;
DELETE FROM tp_integration_detail;
DELETE FROM tp_integration_mst;
DELETE FROM tp_integration_system;


ALTER TABLE `tp_integration_system` AUTO_INCREMENT=0;

INSERT INTO `tp_integration_system` VALUES ('1', 'Quickbooks Desktop', 'A', 'admin', '2020-06-25');
INSERT INTO `tp_integration_system` VALUES ('2', 'Quickbooks Online', 'A', 'admin', '2020-07-21');


SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `tp_integration_mst`;
CREATE TABLE `tp_integration_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(30) NOT NULL,
  `tenant_id` int(30) NOT NULL,
  `auth_type` varchar(5) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `token_type` varchar(15) DEFAULT NULL,
  `grant_type` varchar(200) DEFAULT NULL,
  `access_token` text,
  `refresh_token` text,
  `refresh_token_expires_on` datetime DEFAULT NULL,
  `access_token_expires_on` datetime DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `authentication_end_point` varchar(255) DEFAULT NULL,
  `relaim_id` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tp_integration_authentication_tp_integration_system` (`system_id`),
  KEY `FK_tp_integration_authentication_papertrl_master_tenant` (`tenant_id`),
  CONSTRAINT `FK_tp_integration_authentication_papertrl_master_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `papertrl_master_tenant` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tp_integration_authentication_tp_integration_system` FOREIGN KEY (`system_id`) REFERENCES `tp_integration_system` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



