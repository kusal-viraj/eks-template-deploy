---------Dhanuddara------2.7.15----------

ALTER TABLE `common_item_mst` 
MODIFY COLUMN `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `id`;