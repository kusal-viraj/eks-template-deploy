--------------------niron/hashila-------------------------------

ALTER TABLE `vp_vendor_mst`
ADD COLUMN `payment_type_id`  int(11) AFTER `community_id`;

INSERT INTO `common_automation_document_section` (`id`, `name`, `status`) VALUES ('10', 'Payment Information', 'A');
INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES ('18', '6', '10');

