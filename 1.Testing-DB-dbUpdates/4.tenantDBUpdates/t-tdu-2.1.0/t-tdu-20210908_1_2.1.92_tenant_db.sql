------Madhusha---------2.1.92-----------

ALTER TABLE `common_automation_mst`
ADD COLUMN `created_by_name`  varchar(100) NULL AFTER `created_by`;

UPDATE `common_grid_column_template` SET `field`='automation.createdByName' WHERE (`id`='102');

UPDATE common_grid_column_user_wice SET common_grid_column_user_wice.field='automation.createdByName' WHERE common_grid_column_user_wice.field='automation.createdBy';

UPDATE common_automation_mst  
INNER JOIN umm_user_mst ON common_automation_mst.created_by=umm_user_mst.user_name 
SET common_automation_mst.created_by_name=umm_user_mst.`name`;