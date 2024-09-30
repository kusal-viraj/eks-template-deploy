------------------------2.9.185 dasindu------------

ALTER TABLE `vendor_mst`
	ADD COLUMN `avs_validated` TINYINT(1) NOT NULL DEFAULT '0' AFTER `vendor_code`;