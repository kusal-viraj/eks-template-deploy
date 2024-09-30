ALTER TABLE `vendor_classification`
DROP COLUMN `vendor_id`;


ALTER TABLE `vendor_classification_attachment`
DROP COLUMN `vendor_id`;


ALTER TABLE `vendor_classification_attachment`
DROP COLUMN `vendor_classification_relation_id`;
