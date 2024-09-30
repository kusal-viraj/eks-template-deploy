---------Hashila--------2.2.32--------------------

ALTER TABLE `common_additional_field` 
MODIFY COLUMN `module_id` int NULL AFTER `id`;

ALTER TABLE `common_additional_field` 
MODIFY COLUMN `section_id` int NULL AFTER `field_type_id`;

CREATE TABLE `common_additional_document_relation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_id` int NULL,
  `module_id` int NULL,
  `field_id` int NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) NULL,
  `update_on` datetime NULL,
  `delete_by` varchar(100) NULL,
  `delete_on` date NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_field` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`)
);