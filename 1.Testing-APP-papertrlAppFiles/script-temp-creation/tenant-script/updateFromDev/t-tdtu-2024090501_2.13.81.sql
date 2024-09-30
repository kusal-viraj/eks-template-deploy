ALTER TABLE `vp_payment_request_import_mst`
	ADD COLUMN `attachment_url` VARCHAR(300) NULL DEFAULT NULL AFTER `failed`;

ALTER TABLE `vp_payment_request_import_issue`
	ADD COLUMN `target_field` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `record`,
	ADD COLUMN `value` TEXT NULL DEFAULT NULL AFTER `target_field`;

ALTER TABLE `vp_payment_request_mst`
	ADD COLUMN `is_attended` TINYINT(1) NULL DEFAULT NULL AFTER `txn_id`;

ALTER TABLE `vp_payment_transaction`
	CHANGE COLUMN `txn_type` `txn_type` INT(11) NULL AFTER `txn_ref`;