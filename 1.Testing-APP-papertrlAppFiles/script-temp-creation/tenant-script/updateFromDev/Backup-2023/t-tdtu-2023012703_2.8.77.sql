CREATE TABLE `umm_user_address`  (
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

ALTER TABLE `umm_user_address` 
ADD CONSTRAINT `umm_user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE `vp_payment_recipient_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient_type` varchar(100) NULL,
  `recipient_first_name` varchar(200) NULL,
  `recipient_last_name` varchar(200) NULL,
  `account_type` varchar(100) NULL,
  `account_number` varchar(100) NULL,
  `account_routing_number` varchar(100) NULL,
  `vendor_id` int NULL,
  `user_id` int NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `recipient_user_fk` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`),
  CONSTRAINT `recipient_vendor_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
);




