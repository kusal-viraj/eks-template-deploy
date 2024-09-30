
DROP TABLE IF EXISTS `common_sms_type`;
CREATE TABLE IF NOT EXISTS `common_sms_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `common_sms_type` (`id`, `value`) VALUES
	(1, 'OTP'),
	(2, 'Other');


DROP TABLE IF EXISTS `common_sms_mst`;
CREATE TABLE IF NOT EXISTS `common_sms_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `type_id` int(11) DEFAULT 0,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_common_sms_mst_common_sms_type` (`type_id`),
  CONSTRAINT `FK_common_sms_mst_common_sms_type` FOREIGN KEY (`type_id`) REFERENCES `common_sms_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `common_one_time_password`;
CREATE TABLE IF NOT EXISTS `common_one_time_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expire_in` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `one_time_password` varchar(50) NOT NULL,
  `created_for` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


