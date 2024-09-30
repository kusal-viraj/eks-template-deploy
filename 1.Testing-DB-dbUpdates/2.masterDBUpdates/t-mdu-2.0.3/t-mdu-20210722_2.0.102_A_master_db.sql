ALTER TABLE `papertrl_master_tenant`
	CHANGE COLUMN `owner_email` `owner_email` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `business_address`,
	CHANGE COLUMN `update_by` `update_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `update_on`,
	CHANGE COLUMN `created_by` `created_by` VARCHAR(100) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `created_on`,
	CHANGE COLUMN `delete_by` `delete_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `delete_on`;