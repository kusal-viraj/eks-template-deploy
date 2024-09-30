ALTER TABLE `vp_vendor_mst`
	CHANGE COLUMN `fax` `fax` VARCHAR(50) NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `fatca_reporting_code`;
