--------Amal------2.6.9-----------

CREATE TABLE `papertrl_support_system_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auth_url` varchar(400) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `service_desk_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
