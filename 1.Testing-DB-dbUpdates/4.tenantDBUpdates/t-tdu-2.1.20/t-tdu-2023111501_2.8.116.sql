----danuddara 2.8.116---


ALTER TABLE `common_integration_failed_record` 
ADD INDEX `tp_id_obj_type_company_id`(`tp_id`, `object_type`, `tp_company_id`) USING BTREE;