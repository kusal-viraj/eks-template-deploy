-------Dhanuddara-----2.6.10--------

ALTER TABLE `tp_integration_mst` 
ADD COLUMN `pull_init_data_from` int NULL AFTER `parent_integration_mst_id`;