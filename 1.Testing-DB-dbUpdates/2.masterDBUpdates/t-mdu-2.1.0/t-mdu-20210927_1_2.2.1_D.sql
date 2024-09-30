ALTER TABLE `payment_provider_for_customer`
ADD COLUMN `api_user`  varchar(100) NULL AFTER `status`,
ADD COLUMN `api_user_password`  varchar(200) NULL AFTER `api_user`,
ADD COLUMN `api_key`  varchar(200) NULL AFTER `api_user_password`;

ALTER TABLE `payment_provider_for_customer`
ADD COLUMN `company_id`  varchar(100) NULL AFTER `id`;