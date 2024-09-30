UPDATE `common_report_type` SET `name`='Cash Requirement Report' WHERE  `id`=1;

INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (9, 'Expenses by Custom Field', NULL, 'A', 1);
INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (10, 'Expenses by Acccount Summary', NULL, 'A', 1);
INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (11, 'Expenses by Account Detail', NULL, 'A', 1);

INSERT INTO `common_report_filter_field` (`id`, `field_name`) VALUES (15, 'CUSTOM_FIELD');
INSERT INTO `common_report_filter_field` (`id`, `field_name`) VALUES (16, 'ACCOUNT');

INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (28, 9, 15);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (29, 10, 12);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (30, 10, 16);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (31, 10, 1);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (32, 11, 12);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (33, 11, 16);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (34, 11, 1);
