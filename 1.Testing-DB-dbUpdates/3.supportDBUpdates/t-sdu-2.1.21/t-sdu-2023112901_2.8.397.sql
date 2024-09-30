----------Kavindu----2.8.397----------


DELETE FROM `common_grid_column_user_wice` WHERE `id`<>0;
DELETE FROM `common_grid_state_user_wice` WHERE `id`<>0;

ALTER TABLE `common_grid_state_user_wice`
	ADD COLUMN `table_width` INT(8) NULL DEFAULT NULL AFTER `column_widths`;