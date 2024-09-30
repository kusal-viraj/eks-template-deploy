CREATE TABLE `vp_bill_approval_stamp_format` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`format_name` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`format_code` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`active` TINYINT(1) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=8
;

INSERT INTO `vp_bill_approval_stamp_format` (`format_name`, `format_code`, `active`) VALUES ('Default', 'DEFAULT', 1);
INSERT INTO `vp_bill_approval_stamp_format` (`format_name`, `format_code`, `active`) VALUES ('TIDEWATER', 'TW', 0);