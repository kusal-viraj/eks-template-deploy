DELETE FROM `common_grid_column_user_wice` WHERE `id`<>0;
DELETE FROM `common_grid_state_user_wice` WHERE `id`<>0;

ALTER TABLE `common_grid_state_user_wice`
	ADD COLUMN `table_width` INT(8) NULL DEFAULT NULL AFTER `column_widths`;
	
UPDATE `common_grid_column_template` SET `is_re_sizable`=1
WHERE `field` LIKE 'pPO.%' OR `field` LIKE 'pBill.%' OR `field` LIKE 'pdBill.%' OR `field` LIKE 'pEx.%';
UPDATE `common_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` LIKE 'pPO.%' OR `field` LIKE 'pBill.%' OR `field` LIKE 'pdBill.%' OR `field` LIKE 'pEx.%';
	

UPDATE `common_grid_column_template` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `is_frozen` IS FALSE;
UPDATE `common_grid_column_user_wice` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `is_frozen` IS FALSE;

UPDATE `common_grid_state_template` SET `column_widths`='50,250,200,268,246,256,256,50' WHERE `grid_id`=2;
UPDATE `common_grid_state_template` SET `column_widths`='50,100,307,307,307,307,50' WHERE `grid_id`=1;
UPDATE `common_grid_state_template` SET `column_widths`='50,300,306,306,306,307,50' WHERE `grid_id`=3;
UPDATE `common_grid_state_template` SET `column_widths`='100,100,100,100,50' WHERE `grid_id`=6;