---------------Madhusha--------2.5.74-----------------

INSERT INTO `common_report_type`(`id`, `name`, `status`, `report_category_id`) VALUES (13, 'Project Purchase Orders Summary', 'A', 1);

INSERT INTO `common_report_filter_field`(`id`, `field_name`) VALUES (21, 'PROJECT_CODE');

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (13, 21);

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (13, 2);

