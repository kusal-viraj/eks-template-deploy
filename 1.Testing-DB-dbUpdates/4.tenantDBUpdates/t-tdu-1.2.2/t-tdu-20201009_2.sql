ALTER TABLE `common_product_mst`
MODIFY COLUMN `buying_price` decimal(19,2) NULL AFTER `taxable`;

ALTER TABLE `common_uom`
MODIFY COLUMN `unit` varchar(100) CHARACTER SET latin1 COLLATE
latin1_swedish_ci NULL DEFAULT '' AFTER `id`;

DELETE FROM common_integration_failed_record;
DELETE FROM common_integration_id_connection;
