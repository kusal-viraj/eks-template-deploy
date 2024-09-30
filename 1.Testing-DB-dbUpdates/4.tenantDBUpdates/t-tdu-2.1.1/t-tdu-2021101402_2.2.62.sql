ALTER TABLE `common_additional_document_relation` 
MODIFY COLUMN `created_by_name` varchar(150) NULL DEFAULT NULL AFTER `created_on`;