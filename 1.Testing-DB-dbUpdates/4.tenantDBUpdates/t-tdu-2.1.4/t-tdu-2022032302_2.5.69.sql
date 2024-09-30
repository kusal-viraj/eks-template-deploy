------------Madhusha-----2.5.69----------------

INSERT INTO `common_report_type`(`id`, `name`, `status`, `report_category_id`) VALUES (12, 'Transactions Awaiting Approval', 'A', 1);

INSERT INTO `common_report_filter_field`(`id`, `field_name`) VALUES (17, 'APPROVAL_GROUP');

INSERT INTO `common_report_filter_field`(`id`, `field_name`) VALUES (18, 'REFERENCE_NUMBER');

INSERT INTO `common_report_filter_field`(`id`, `field_name`) VALUES (19, 'TRANSACTION_TYPE');

INSERT INTO `common_report_filter_field`(`id`, `field_name`) VALUES (20, 'CURRENTLY_ASSIGNED_USER');

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (12, 2);

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (12, 17);

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (12, 18);

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (12, 19);

INSERT INTO `common_report_filter`(`report_type`, `filter_field`) VALUES (12, 20);