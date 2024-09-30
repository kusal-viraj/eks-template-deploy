ALTER TABLE `common_product_mst`
ADD COLUMN `inventory_asset_account` int(11) NULL DEFAULT NULL AFTER `sales_description`;

ALTER TABLE `common_integration_failed_record`
ADD COLUMN `failed_reason` varchar(300) NULL AFTER `system_short_code`;

ALTER TABLE `common_integration_failed_record`
ADD COLUMN `exception_message` varchar(500) NULL AFTER `failed_date_time`;


ALTER TABLE `common_product_mst`
ADD COLUMN `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `vendor_id`,
ADD COLUMN `updated_on` date NULL AFTER `updated_by`;

ALTER TABLE `common_approval_code`
MODIFY COLUMN `description` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `long_name`;
