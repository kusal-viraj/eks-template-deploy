-----------Hashila-------2.7.116-------------

CREATE TABLE `common_automation_condition_template`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `automation_id` int NOT NULL,
  `template` text NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `AUTOMATION_CONDITION_TEMPLATE_FK` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
);

ALTER TABLE `common_automation_field` 
ADD COLUMN `field_weight` int NULL AFTER `notification_enable`;



