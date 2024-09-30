-------------madusha-2.8.76-------



	CREATE TABLE `vp_payment_type_details`  (
	  `id` int NOT NULL AUTO_INCREMENT,
	  `provider_id` int NULL,
	  `payment_type_id` int NULL,
	  `field_name` varchar(50) NULL,
	  `field_value` varchar(50) NULL,
	    `sort_order` int NULL,
	  PRIMARY KEY (`id`)
	);
	
INSERT INTO `vp_payment_type_details`(`id`, `provider_id`, `payment_type_id`, `field_name`, `sort_order`) VALUES (1, 2, 1, 'Company ID', 1);

INSERT INTO `vp_payment_type_details`(`id`, `provider_id`, `payment_type_id`, `field_name`, `sort_order`) VALUES (2, 2, 2, 'Accounting Number', 1);

INSERT INTO `vp_payment_type_details`(`id`, `provider_id`, `payment_type_id`, `field_name`, `sort_order`) VALUES (3, 2, 2, 'Routing Number', 2);

INSERT INTO `vp_payment_type_details`(`id`, `provider_id`, `payment_type_id`, `field_name`, `sort_order`) VALUES (4, 2, 3, 'Account ID', 1);

INSERT INTO `vp_payment_type_details`(`id`, `provider_id`, `payment_type_id`, `field_name`, `sort_order`) VALUES (5, 2, 4, 'Account ID', 1);