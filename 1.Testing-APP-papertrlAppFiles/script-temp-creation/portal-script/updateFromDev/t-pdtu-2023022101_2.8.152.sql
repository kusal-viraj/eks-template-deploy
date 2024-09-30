ALTER TABLE `common_grid_column_template`
	ADD COLUMN `sortable_field` VARCHAR(50) NOT NULL AFTER `field`;
	
UPDATE common_grid_column_template tmp SET tmp.sortable_field=tmp.`field`
WHERE tmp.`field` IS NOT NULL;


ALTER TABLE `common_grid_column_user_wice`
	ADD COLUMN `sortable_field` VARCHAR(50) NOT NULL AFTER `field`;
	
UPDATE common_grid_column_user_wice tmp SET tmp.sortable_field=tmp.`field`
WHERE tmp.`field` IS NOT NULL;
