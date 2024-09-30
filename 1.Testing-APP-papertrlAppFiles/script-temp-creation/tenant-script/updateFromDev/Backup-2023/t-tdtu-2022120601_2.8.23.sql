ALTER TABLE `common_additional_document_relation` 
ADD COLUMN `appear_on_report` tinyint(1) NULL AFTER `display_order`,
ADD COLUMN `header_appear_on_report` varchar(6) NULL AFTER `appear_on_report`;