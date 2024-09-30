INSERT INTO `common_automation_document_section` (`id`, `name`, `status`) VALUES ('6', 'Postal Address', 'A');
INSERT INTO `common_automation_document_section` (`id`, `name`, `status`) VALUES ('7', 'Remit Address', 'A');
INSERT INTO `common_automation_document_section` (`id`, `name`, `status`) VALUES ('8', 'W9 Form Information', 'A');
INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES ('13', '6', '6');
INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES ('14', '6', '7');
INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES ('15', '6', '8');