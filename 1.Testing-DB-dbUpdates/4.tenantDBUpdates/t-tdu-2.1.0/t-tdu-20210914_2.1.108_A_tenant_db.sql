-------------Indra--------2.1.108------------------

ALTER TABLE `vp_bill_create_detail`
	CHANGE COLUMN `item_name` `item_name` VARCHAR(300) NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `item_number`;
	
UPDATE `common_grid_column_template` SET `header`='No of Bill(s) Generated' WHERE  `id`=449;