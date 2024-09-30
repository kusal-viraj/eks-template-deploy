----------Indra------2.1.84-----------

ALTER TABLE `vp_recurring_bill_template_mst`
	CHANGE COLUMN `template_name` `schedule_name` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `uuid`;
	
ALTER TABLE `vp_recurring_bill_template_mst`
	ADD COLUMN `custom_Interval_value` VARCHAR(50) NULL AFTER `interval_value`;

INSERT INTO `common_recurring_interval` (`interval_name`, `interval_value`, `status`) VALUES ('Custom', 'CUSTOM', 'A');

CREATE TABLE `common_recurring_custom_interval` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`custom_interval_name` VARCHAR(50) NOT NULL,
	`custom_interval_value` VARCHAR(50) NOT NULL,
	`status` CHAR(1) NOT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci';

DROP TABLE IF EXISTS `common_recurring_custom_interval`;
CREATE TABLE IF NOT EXISTS `common_recurring_custom_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_interval_name` varchar(50) NOT NULL,
  `custom_interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `common_recurring_custom_interval` (`id`, `custom_interval_name`, `custom_interval_value`, `status`) VALUES
    (1, 'Day(s)', 'DAYS', 'A'),
    (2, 'Week(s)', 'WEEKS', 'A'),
    (3, 'Month(s)', 'MONTHS', 'A'),
    (4, 'Years(s)', 'YEARS', 'A');

DELETE FROM `common_recurring_day` WHERE  `id`=29;
DELETE FROM `common_recurring_day` WHERE  `id`=30;
DELETE FROM `common_recurring_day` WHERE  `id`=31;


UPDATE `common_recurring_occurrence_frequent` SET `occurrence_frequent`='Specific Date' WHERE  `id`=1;
UPDATE `common_recurring_occurrence_frequent` SET `occurrence_frequent_value`='SPEC_DATE' WHERE  `id`=1;
UPDATE `common_recurring_occurrence_frequent` SET `occurrence_frequent`='No. of occurences' WHERE  `id`=2;
UPDATE `common_recurring_occurrence_frequent` SET `occurrence_frequent_value`='NO_OF_OCC' WHERE  `id`=2;

UPDATE `common_grid_column_template` SET `field`='recBill.scheduleName', `header`='Schedule Name', `placeholder`='Schedule Name' WHERE (`id`='388');

