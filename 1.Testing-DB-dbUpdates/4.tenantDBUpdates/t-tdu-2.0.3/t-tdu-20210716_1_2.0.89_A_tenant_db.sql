ALTER TABLE `common_approval_code`
	CHANGE COLUMN `contract_value` `contract_value` DECIMAL(20,2) NULL DEFAULT '0.00' AFTER `status`;