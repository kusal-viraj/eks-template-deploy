ALTER TABLE `common_additional_document_relation` 
ADD COLUMN `appear_on_export` tinyint(1) NULL AFTER `appear_on_report`;

UPDATE `common_additional_document_relation` SET `appear_on_export` = 1;

