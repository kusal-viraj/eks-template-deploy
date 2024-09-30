----------Kavindu----2.8.397----------


DELETE FROM `vendor_grid_column_user_wice` WHERE `id`<>0;
DELETE FROM `vendor_grid_state_user_wice` WHERE `id`<>0;

ALTER TABLE `vendor_grid_state_user_wice`
	ADD COLUMN `table_width` INT(8) NULL DEFAULT NULL AFTER `column_widths`;

UPDATE `vendor_grid_column_template` SET `is_re_sizable`=1
WHERE `field` LIKE 'batchTxn.%' OR `field` LIKE 'vcard.%';
UPDATE `vendor_grid_column_user_wice` SET `is_re_sizable`=1
WHERE `field` LIKE 'batchTxn.%' OR `field` LIKE 'vcard.%';

UPDATE `vendor_grid_column_template` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `is_frozen` IS FALSE;
UPDATE `vendor_grid_column_user_wice` SET `is_re_orderable`=1 WHERE `is_re_sizable` IS TRUE AND `is_frozen` IS FALSE;

UPDATE `vendor_grid_state_template` SET `column_widths`='50,300,300,300,300,300,50' WHERE `grid_id`=1;
UPDATE `vendor_grid_state_template` SET `column_widths`='50,300,255,268,246,256,256,256,50' WHERE `grid_id`=2;
UPDATE `vendor_grid_state_template` SET `column_widths`='50,206,206,206,206,50' WHERE `grid_id`=3;
UPDATE `vendor_grid_state_template` SET `column_widths`='250,257,257,257,257,257,257,257,257,50' WHERE `grid_id`=4;
UPDATE `vendor_grid_state_template` SET `column_widths`='200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,50' WHERE `grid_id`=5;
UPDATE `vendor_grid_state_template` SET `column_widths`='210,210,210,210,210,210,210,50' WHERE `grid_id`=6;
UPDATE `vendor_grid_state_template` SET `column_widths`='210,210,210,210,210,50' WHERE `grid_id`=22;
UPDATE `vendor_grid_state_template` SET `column_widths`='50,100,210,210,210,50' WHERE `grid_id`=25;
UPDATE `vendor_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,210,210,210,50' WHERE `grid_id`=26;
UPDATE `vendor_grid_state_template` SET `column_widths`='210,210,210,210,210,210,210,210,210,50' WHERE `grid_id`=27;