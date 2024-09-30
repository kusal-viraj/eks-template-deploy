
CREATE TABLE `common_object_sync_date_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(50) NOT NULL,
  `system_id` int(11) NOT NULL,
  `sync_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `common_integration_error`;
CREATE TABLE `common_integration_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(200) DEFAULT NULL,
  `error_message` text,
  `error_detail` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
