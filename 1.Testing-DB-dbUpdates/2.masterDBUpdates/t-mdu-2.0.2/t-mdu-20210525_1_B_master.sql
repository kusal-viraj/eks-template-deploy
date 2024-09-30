INSERT INTO `tp_integration_system_auth_type` (`id`, `name`, `status`) VALUES ('3', 'Basic', 'A');

ALTER TABLE `tp_integration_mst`
ADD COLUMN `third_party_username`  varchar(30) NULL AFTER `delete_on`,
ADD COLUMN `third_party_password`  varchar(60) NULL AFTER `third_party_username`,
ADD COLUMN `third_party_tenant_id`  varchar(60) NULL AFTER `third_party_password`,
ADD COLUMN `third_party_company_name`  varchar(60) NULL AFTER `third_party_tenant_id`;

