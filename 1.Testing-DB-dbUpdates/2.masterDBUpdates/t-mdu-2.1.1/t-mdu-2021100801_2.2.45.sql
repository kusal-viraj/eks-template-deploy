-----------Dhanuddara---------2.2.45------------

ALTER TABLE `tp_integration_mst` 
DROP COLUMN `third_party_company_name`,
DROP COLUMN `third_party_company_id`,
CHANGE COLUMN `third_party_tenant_id` `base_url` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `third_party_password`;