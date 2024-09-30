-----------hashila-2.8.77-----

CREATE TABLE `vendor_user_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(300) NULL DEFAULT NULL,
  `address_line_2` varchar(300) NULL DEFAULT NULL,
  `type` varchar(5) NULL DEFAULT NULL,
  `city` varchar(200) NULL DEFAULT '',
  `country` varchar(200) NULL DEFAULT '',
  `address_state` varchar(200) NULL DEFAULT '',
  `zipcode` varchar(30) NULL DEFAULT '',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE `vendor_user_address` 
ADD CONSTRAINT `vendor_user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `vendor_user_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
