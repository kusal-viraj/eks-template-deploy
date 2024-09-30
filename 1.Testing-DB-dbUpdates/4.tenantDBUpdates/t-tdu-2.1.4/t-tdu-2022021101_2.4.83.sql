------Indra-------2.4.83----------

ALTER TABLE `vp_bill_capturing_audit_trial`
	CHANGE COLUMN `bill_id` `bill_id` INT(15) NOT NULL AFTER `response_data`,
	DROP INDEX `FK__vp_bill`,
	DROP FOREIGN KEY `FK__vp_bill`;