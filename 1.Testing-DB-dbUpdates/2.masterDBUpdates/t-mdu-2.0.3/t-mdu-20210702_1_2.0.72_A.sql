ALTER TABLE `tp_integration_mst` 
MODIFY COLUMN `third_party_username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `delete_on`,
MODIFY COLUMN `third_party_password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `third_party_username`,
MODIFY COLUMN `third_party_tenant_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `third_party_password`,
MODIFY COLUMN `third_party_company_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `third_party_tenant_id`,
MODIFY COLUMN `third_party_company_id` varbinary(200) NULL DEFAULT NULL AFTER `third_party_company_name`;

ALTER TABLE `tp_integration_mst` 
MODIFY COLUMN `third_party_company_id` varchar(200) NULL DEFAULT NULL AFTER `third_party_company_name`;