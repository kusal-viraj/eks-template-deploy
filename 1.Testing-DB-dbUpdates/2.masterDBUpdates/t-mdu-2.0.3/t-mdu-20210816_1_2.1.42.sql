


CREATE TABLE `payment_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NULL,
  `description` varchar(250) NULL,
  `created_by` varchar(100) NULL,
  `created_on` datetime(0) NULL,
  `update_by` varchar(100) NULL,
  `update_on` datetime(0) NULL,
  `delete_by` varchar(100) NULL,
  `delete_on` datetime(0) NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `payment_provider`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NULL,
  `description` varchar(250) NULL,
  `logo_image` MEDIUMBLOB NULL,
  `created_by` varchar(100) NULL,
  `created_on` datetime(0) NULL,
  `update_by` varchar(100) NULL,
  `update_on` datetime(0) NULL,
  `delete_by` varchar(100) NULL,
  `delete_on` datetime(0) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `payment_type_for_provider`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` char(1) NULL,
  `payment_type` int NOT NULL,
  `payment_provider` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment_type` FOREIGN KEY (`payment_type`) REFERENCES `payment_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_payment_provider` FOREIGN KEY (`payment_provider`) REFERENCES `payment_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);


CREATE TABLE `payment_provider_for_customer` (
	`id` int NOT NULL AUTO_INCREMENT,
	`status` char(1) NULL,
	`default_provider` tinyint(1) NULL,
	`payment_provider` int NOT NULL,
	`tenant` int NOT NULL,
	`tenant_id` varchar(30) NOT NULL,
	`created_by` varchar(100) NULL,
	  `created_on` datetime(0) NULL,
	  `update_by` varchar(100) NULL,
	  `update_on` datetime(0) NULL,
	  `delete_by` varchar(100) NULL,
	  `delete_on` datetime(0) NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_payment_providers` FOREIGN KEY (`payment_provider`) REFERENCES `payment_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT `fk_tenant` FOREIGN KEY (`tenant`) REFERENCES `papertrl_master_tenant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
);