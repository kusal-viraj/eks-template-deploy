CREATE TABLE `vp_credit_card_transaction_cache`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NULL,
  `vendor_name` varchar(150) NULL,
  `transaction_id` int NOT NULL,
  `amount` decimal(19, 2) NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime(0) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CREDIT_CARD_TRANSACTION_CACHE_VENDOR_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
);