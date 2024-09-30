CREATE TABLE `vp_vendor_ach_details_request` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`uuid` VARCHAR(100) NOT NULL,
	`vendor_id` INT(11) NOT NULL,
	`community_vendor_id` INT(11) NULL DEFAULT NULL,
	`request_by` VARCHAR(150) NOT NULL,
	`status` CHAR(1) NOT NULL,
	`requested_new_link` TINYINT(1) NOT NULL DEFAULT '0',
	`created_by` VARCHAR(100) NOT NULL,
	`created_on` DATETIME NOT NULL,
	`update_by` VARCHAR(100) NULL DEFAULT NULL,
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(100) NULL DEFAULT NULL,
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK_VENDOR_ID` (`vendor_id`) USING BTREE,
	CONSTRAINT `FK1_VENDOR_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);
