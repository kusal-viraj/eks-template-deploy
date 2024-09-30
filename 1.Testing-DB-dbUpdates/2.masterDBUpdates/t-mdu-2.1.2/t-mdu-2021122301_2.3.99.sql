--------------Amal-------------

CREATE TABLE `papertrl_master_tenant_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(300) DEFAULT NULL,
  `address_line_2` varchar(300) DEFAULT NULL,
  `city` varchar(200) DEFAULT '',
  `country` varchar(200) DEFAULT '',
  `address_state` varchar(200) DEFAULT '',
  `tenant_mst_id` int(11) NOT NULL DEFAULT 0,
  `zipcode` varchar(50) DEFAULT '',
  `time_zone` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;

CREATE TABLE `papertrl_master_tenant_profile_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_mst_id` int(11) NOT NULL DEFAULT 0,
  `picture_data` mediumblob DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
