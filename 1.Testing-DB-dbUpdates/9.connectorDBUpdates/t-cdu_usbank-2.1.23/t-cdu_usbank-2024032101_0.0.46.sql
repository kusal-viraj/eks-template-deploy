---Danuddara 0.0.46---



ALTER TABLE `tenant_wise_transaction` 
ADD COLUMN `provider_id` int NULL AFTER `status`;


ALTER TABLE `audit_log` 
ADD COLUMN `provider_id` int NULL AFTER `status_received`;