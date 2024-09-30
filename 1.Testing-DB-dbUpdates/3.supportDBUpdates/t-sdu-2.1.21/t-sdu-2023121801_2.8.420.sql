-----Thiwanka-----2.8.420---

CREATE TABLE IF NOT EXISTS `umm_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(300) DEFAULT NULL,
  `address_line_2` varchar(300) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `city` varchar(200) DEFAULT '',
  `country` varchar(200) DEFAULT '',
  `address_state` varchar(200) DEFAULT '',
  `zipcode` varchar(30) DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `umm_user_address_ibfk_1` (`user_id`),
  CONSTRAINT `umm_user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`)
);