----2.9.97---Thiwanka----

CREATE TABLE `vendor_ach_details_request` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`uuid` VARCHAR(100) NOT NULL,
	`vendor_id` INT(11) NOT NULL,
	`tenant_id` VARCHAR(30) NOT NULL,
	`status` CHAR(1) NOT NULL,
	`created_by` VARCHAR(100) NOT NULL,
	`created_on` DATETIME NOT NULL,
	`update_by` VARCHAR(100) NULL DEFAULT NULL,
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(100) NULL DEFAULT NULL,
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
);
