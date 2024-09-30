-----------------Dhanuddara------2.6.1----------

ALTER TABLE `tp_integration_mst` 
ADD COLUMN `parent_integration_mst_id` int NULL AFTER `tp_tenant_id`;