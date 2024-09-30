ALTER TABLE `common_additional_field` MODIFY COLUMN `module_id` INT(11) NOT NULL AFTER `id`;
ALTER TABLE `common_additional_field` MODIFY COLUMN `required` TINYINT(1) NOT NULL DEFAULT 0 AFTER `display_order`;
ALTER TABLE `common_additional_field` ADD COLUMN `field_id` INT(11) NOT NULL AFTER `required`;
ALTER TABLE `common_additional_field` ADD COLUMN `data_type` VARCHAR(150) NULL AFTER `field_id`;
ALTER TABLE `common_additional_field` ADD COLUMN `create_new` CHAR(1) NULL AFTER `data_type`;
ALTER TABLE `common_additional_field` ADD COLUMN `multiple` CHAR(1) NULL AFTER `create_new`;
ALTER TABLE `common_additional_field` ADD COLUMN `file_types` VARCHAR(100) NULL AFTER `multiple`;
ALTER TABLE `common_additional_field` ADD COLUMN `row_count` INT(50) NULL AFTER `status`;
ALTER TABLE `common_additional_field` ADD COLUMN `field_type` VARCHAR(50) NULL AFTER `field_id`;
ALTER TABLE `common_additional_field` ADD COLUMN `value` VARCHAR(80) NULL AFTER `row_count`;

ALTER TABLE `vp_expense_additional_data`
ADD COLUMN `field_value_date` date NULL AFTER `field_value`;
ALTER TABLE `vp_expense_additional_data` DROP FOREIGN KEY `FK__vp_expense_mst`;
ALTER TABLE `vp_expense_additional_data` ADD CONSTRAINT `FK__vp_expense_mst`
FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON DELETE
CASCADE ON UPDATE CASCADE;

CREATE TABLE `vp_expense_additional_field_attachments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_id` int(11) NOT NULL,
 `expense_mst_id` int(11) NOT NULL,
 `attachment_url` varchar(200) NOT NULL,
 `file_name` varchar(200) DEFAULT NULL,
 `file_type` varchar(30) DEFAULT NULL,
 `status` char(1) NOT NULL,
 `deleted_by` varchar(50) DEFAULT NULL,
 `deleted_on` datetime DEFAULT NULL,
 `field_name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `Fk_fieldId` (`field_id`),
 CONSTRAINT `Fk_fieldId` FOREIGN KEY (`field_id`) REFERENCES
`common_additional_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `common_additional_field_option` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_id` int(11) NOT NULL,
 `option_value` varchar(100) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_FIELD_ID` (`field_id`),
 CONSTRAINT `FK_FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES
`common_additional_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
