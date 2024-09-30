UPDATE `umm_menu` SET `status`='A', `individual_tenant_menu`='1' WHERE  `id`=1025;

INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (5, 'AP Aging Summary By Vendor Report', NULL, 'A', 1);
INSERT INTO `common_report_type` (`id`, `name`, `short_name`, `status`, `report_category_id`) VALUES (6, 'AP Aging Summary By User Report', NULL, 'A', 1);

INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (15, 5, 2);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (16, 6, 2);
INSERT INTO `common_report_filter` (`id`, `report_type`, `filter_field`) VALUES (17, 6, 1);

ALTER TABLE `vp_bill`
ADD COLUMN `department_id`  int(11) NULL AFTER `submitted_by_vendor`;

 

ALTER TABLE `vp_bill` ADD CONSTRAINT `DEPT_ID_FK` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

 

ALTER TABLE `vp_bill_expense_cost_distribution`
ADD COLUMN `department_id`  int(11) NULL AFTER `bill_id`;

 

ALTER TABLE `vp_bill_expense_cost_distribution` ADD CONSTRAINT `DEPT_ID_FK_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

 

ALTER TABLE `vp_bill_item_cost_distribution`
ADD COLUMN `department_id`  int(11) NULL AFTER `item_name`;

 

ALTER TABLE `vp_bill_item_cost_distribution` ADD CONSTRAINT `DEPTID_FK` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

 

ALTER TABLE `hst_vp_bill`
ADD COLUMN `department_id`  int(11) NULL AFTER `submitted_by_vendor`;

 

ALTER TABLE `hst_vp_bill_expense_cost_distribution`
ADD COLUMN `department_id`  int(11) NULL AFTER `hst_recode_id`;

 

ALTER TABLE `hst_vp_bill_item_cost_distribution`
ADD COLUMN `department_id`  int(11) NULL AFTER `hst_recode_id`;

 

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('14', 'dept.id', 'Department', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Department', '23');

 

UPDATE `common_grid_state_template` SET `column_widths`='51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200' WHERE (`id`='14');

 

INSERT INTO `common_automation_field` (`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `second_value`, `max_length`) VALUES ('2', 'departmentName', 'Department', '0', '0', '1', 'text', '1', '100');

 

INSERT INTO `common_automation_field` (`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `second_value`, `max_length`) VALUES ('2', 'purchaseOrderDetails.departmentName', 'Item Line Department', '0', '0', '1', 'text', '1', '100');

 

INSERT INTO `common_automation_field` (`document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `second_value`, `max_length`) VALUES ('2', 'purchaseOrderAccountDetails.departmentName', 'Account Line Department', '0', '0', '1', 'text', '1', '100');