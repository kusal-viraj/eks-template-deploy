ALTER TABLE `vp_po_mst`
ADD COLUMN `vendor_approved_date`  datetime NULL AFTER `item_gross_amount`;


INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (7, 'Purchase Orders By Department Report', NULL, 'A', 1);
INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (8, 'Purchase Order Outstanding Report', NULL, 'A', 1);
 

INSERT INTO `common_report_filter_field` (`id`, `field_name`) VALUES (12, 'CREATED_DATE');
INSERT INTO `common_report_filter_field` (`id`, `field_name`) VALUES (13, 'REQUESTOR');
INSERT INTO `common_report_filter_field` (`id`, `field_name`) VALUES (14, 'DEPARTMENT');
 

INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (18, 7, 2);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (19, 7, 12);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (20, 7, 1);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (21, 7, 13);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (22, 7, 14);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (23, 8, 2);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (24, 8, 12);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (25, 8, 1);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (26, 8, 13);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (27, 8, 14);
	