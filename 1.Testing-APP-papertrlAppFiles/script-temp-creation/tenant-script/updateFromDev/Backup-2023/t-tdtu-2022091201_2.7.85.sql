ALTER TABLE `common_object_sync_mst` 
MODIFY COLUMN `reference_no` varchar(300) NULL DEFAULT NULL AFTER `recode_status`;

ALTER TABLE `common_integration_failed_record` 
ADD COLUMN `object_sync_mst_id` int NULL AFTER `record_status`,
ADD COLUMN `incomplete_record_id` int NULL AFTER `object_sync_mst_id`;
