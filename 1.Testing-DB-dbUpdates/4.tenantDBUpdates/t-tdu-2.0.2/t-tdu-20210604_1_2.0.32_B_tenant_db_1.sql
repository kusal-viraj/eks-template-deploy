ALTER TABLE `vp_vendor_mst_additional_data` 
ADD COLUMN `multiple_status` CHAR(1) NULL DEFAULT 'I' AFTER `display_order`;

UPDATE `common_grid_column_template` SET `is_re_orderable`='0', `is_re_sizable`='0' WHERE (`id`='153');

UPDATE `common_grid_column_user_wice` SET `is_re_orderable`='0', `is_re_sizable`='0' WHERE (`grid_id`='16' AND `field`='action');

UPDATE `common_automation_field` SET `field_name` = 'PO Number' WHERE `id` = 32;
