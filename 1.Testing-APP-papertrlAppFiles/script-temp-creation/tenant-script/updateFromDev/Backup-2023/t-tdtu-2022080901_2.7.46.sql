ALTER TABLE `common_object_sync_mst`
ADD INDEX `mst_id`(`object_mst_id`) USING BTREE,
ADD INDEX `obj_type`(`object_type`) USING BTREE,
ADD INDEX `sys_id`(`system_id`) USING BTREE,
ADD INDEX `company_id`(`tp_company_id`) USING BTREE;