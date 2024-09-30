----------Dhanuddara----------2.2.27_01------------

ALTER TABLE `common_integration_service_status` 
ADD COLUMN `tp_company_id` varchar(300) NULL DEFAULT NULL AFTER `system_id`;

CREATE TABLE `common_integration_company_approval_code`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code_id` int NOT NULL,
  `tp_company_id` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tp_company_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime(0) NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_PROJECTCODE`(`project_code_id`) USING BTREE,
  CONSTRAINT `FK_PROJECTCODE` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

INSERT INTO `common_grid_column_template`(`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ( 10, 'company.tpCompanyId', 'Company', 1, 0, 0, 1, 1, 'left', 'multiSelect', 'Company', 9, NULL, '');
UPDATE `common_grid_state_template` SET `column_widths` = '50,100,305,305,305,305,305,305,305' WHERE `id` = 10;

UPDATE `common_grid_column_template` SET `grid_id` = 10, `field` = 'appCode.createdOn', `header` = 'Created Date', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'date', `placeholder` = 'Create Date', `column_order` = 10, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 80;
UPDATE `common_grid_column_template` SET `grid_id` = 10, `field` = 'appCode.createdUsername', `header` = 'Created By', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'left', `search_type` = 'input', `placeholder` = 'Created By', `column_order` = 11, `drop_down_id` = NULL, `drop_down_url` = '' WHERE `id` = 81;
UPDATE `common_grid_column_template` SET `grid_id` = 10, `field` = 'appCode.status', `header` = 'Status', `column_show` = 1, `is_sortable` = 1, `is_re_orderable` = 1, `is_re_sizable` = 1, `can_hide` = 1, `align` = 'center', `search_type` = 'dropdown', `placeholder` = 'All', `column_order` = 12, `drop_down_id` = 1, `drop_down_url` = '' WHERE `id` = 82;

-------------Dhanuddara----------2.2.27----------------

ALTER TABLE `common_integration_id_connection` 
ADD COLUMN `tp_company_id` varchar(300) NULL AFTER `edit_sequence`;

ALTER TABLE `common_object_sync_mst` 
ADD COLUMN `tp_company_id` varchar(300) NULL AFTER `attempts`;

---------------Dhanuddara----------2.2.27-----

ALTER TABLE `common_integration_failed_record` 
MODIFY COLUMN `system_short_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `papertrl_id`;

----------------Dhanuddara--------2.2.27----------------

INSERT INTO `common_integration_service_group`(`id`, `name`, `visibility`, `sort_order`) VALUES (15, 'Additional Fields', 1, 15);


INSERT INTO `common_integration_service`(`id`, `name`, `status`, `service_type`, `service_group_id`) VALUES (28, 'Push additional fields to', 'A', 1, 15);
INSERT INTO `common_integration_service`(`id`, `name`, `status`, `service_type`, `service_group_id`) VALUES (29, 'Pull additional fields from', 'A', 2, 15);

INSERT INTO `common_integration_system_service`( `system_id`, `service_id`) VALUES ( 4, 28);
INSERT INTO `common_integration_system_service`(`system_id`, `service_id`) VALUES ( 4, 29);

ALTER TABLE `common_additional_field` 
ADD COLUMN `code` varchar(100) NULL AFTER `data_source_id`;

ALTER TABLE `common_additional_field_option` 
ADD COLUMN `code` varchar(100) NULL AFTER `data_source_id`;

ALTER TABLE `common_additional_field` 
MODIFY COLUMN `module_id` int NULL AFTER `id`;

--------Dhanuddara----------2.2.27----------------

ALTER TABLE `common_integration_incomplete_record` 
ADD COLUMN `tp_company_id` varchar(300) NULL AFTER `attempt`;


