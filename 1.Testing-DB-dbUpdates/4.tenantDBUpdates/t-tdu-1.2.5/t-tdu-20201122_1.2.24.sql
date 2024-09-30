ALTER TABLE `vp_purchase_order_mst`
	CHANGE COLUMN `poc_name` `poc_name` VARCHAR(150) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `report_url`;