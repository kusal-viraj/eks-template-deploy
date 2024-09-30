DELETE FROM `common_grid_column_template` WHERE `id` = 491;

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (27, 12);

UPDATE `common_grid_column_template` SET `drop_down_id` = 27 WHERE `id` = 115;

ALTER TABLE `vp_po_mst` 
DROP COLUMN `po_status`;