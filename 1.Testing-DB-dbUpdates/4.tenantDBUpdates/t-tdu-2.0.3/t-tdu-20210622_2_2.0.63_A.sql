ALTER TABLE `vp_customer_vendor_relation` 
ADD COLUMN `vendor_deleted` tinyint(1) NOT NULL DEFAULT 0 AFTER `request_on`;

UPDATE `common_automation_document_type` SET `status`='I' WHERE  `id`=6;