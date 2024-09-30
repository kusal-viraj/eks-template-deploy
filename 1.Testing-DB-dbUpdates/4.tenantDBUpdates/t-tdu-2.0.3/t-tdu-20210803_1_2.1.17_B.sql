ALTER TABLE `common_object_sync_mst` 
MODIFY COLUMN `created_on` datetime(0) NOT NULL AFTER `created_by`;