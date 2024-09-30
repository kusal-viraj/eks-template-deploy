---------------Madhusha-------2.2.24------------

ALTER TABLE `vp_vendor_classification`
DROP COLUMN `vendor_mst_id`,
DROP COLUMN `vendor_temp_id`;

ALTER TABLE `vp_vendor_classification_attachment`
DROP COLUMN `vendor_classification_relation_id`;
