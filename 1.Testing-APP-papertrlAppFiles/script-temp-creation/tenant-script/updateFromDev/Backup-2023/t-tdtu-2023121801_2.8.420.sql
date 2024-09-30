-----Thiwanka---

UPDATE `common_automation_field` SET `field_name`='Tax Amount / Tax Percentage' WHERE `field_name`='Tax Amount';

UPDATE `common_grid_column_template` SET `search_type`='number' WHERE `id`=10;

UPDATE `common_grid_state_template` SET `column_widths`='50,250,232,232,231,231,232,232,232,232,232,345,50' WHERE `id`=62;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id`=62;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id`=62;
UPDATE `common_grid_state_template` SET `column_widths`='50,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,315' WHERE `id`=63;
DELETE FROM `common_grid_state_user_wice` WHERE `grid_id`=63;
DELETE FROM `common_grid_column_user_wice` WHERE `grid_id`=63;