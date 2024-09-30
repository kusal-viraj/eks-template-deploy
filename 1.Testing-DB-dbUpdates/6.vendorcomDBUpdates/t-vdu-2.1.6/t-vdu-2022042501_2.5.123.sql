-----------Indra----------2.5.123--------

ALTER TABLE `vendor_invoice`
	ADD COLUMN `automation_rule_id` INT(11) NULL DEFAULT NULL AFTER `automation_id`;