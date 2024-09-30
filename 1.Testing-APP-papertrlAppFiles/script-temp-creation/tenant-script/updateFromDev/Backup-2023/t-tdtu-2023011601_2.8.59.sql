ALTER TABLE `vp_vendor_mst`
	ADD COLUMN `term` INT(11) NULL DEFAULT NULL AFTER `confidential`,
	ADD CONSTRAINT `FK_vp_vendor_mst_vp_bill_term` FOREIGN KEY (`term`) REFERENCES `vp_bill_term` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE `vp_bill_term`
	ADD COLUMN `visibility_status` CHAR(1) NOT NULL DEFAULT '0' AFTER `from_entry`,
	ADD COLUMN `term_type` CHAR(1) NOT NULL AFTER `visibility_status`;
	
UPDATE vp_bill_term term SET term.visibility_status='V' WHERE term.visibility_status=0;

UPDATE vp_bill_term term SET term.term_type='D' WHERE term.id <=10;
UPDATE vp_bill_term term SET term.term_type='C' WHERE term.id >10;

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `mobile_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1058, 'Vendor Groups', 'Vendor Groups', 'fa fa-users', '/home/vendor', '5', 'S', 1004, NULL, 'Admin', 5, 'fa fa-users', 'Vendor Groups', 'Vendor Groups', 'A', 0, 1, 0, 0, 'V2', 'VENDOR_GROUPS', 0, '1004,1015', 'System', '2023-01-15 13:34:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (521, 1058, 1, 'VENDOR_GROUP_CREATE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (522, 1058, 4, 'VENDOR_GROUP_EDIT', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (523, 1058, 5, 'VENDOR_GROUP_DELETE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (524, 1058, 13, 'VENDOR_GROUP_INACTIVATE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (525, 1058, 14, 'VENDOR_GROUP_ACTIVATE', 'System', '2023-01-15 13:36:00', NULL, NULL, NULL, NULL);


INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 1058, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 521, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 522, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 523, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 524, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 525, NULL, 'admin', '2023-01-15 13:44:00', NULL, NULL, NULL, NULL);


DROP TABLE IF EXISTS `vp_vendor_group`;
CREATE TABLE IF NOT EXISTS `vp_vendor_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `vp_vendor_wise_group`;
CREATE TABLE IF NOT EXISTS `vp_vendor_wise_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_group_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_vendor_group` (`vendor_group_id`),
  KEY `FK__vp_vendor_mst` (`vendor_id`),
  CONSTRAINT `FK__common_vendor_group` FOREIGN KEY (`vendor_group_id`) REFERENCES `vp_vendor_group` (`id`),
  CONSTRAINT `FK__vp_vendor_mst` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (64, 'VENDOR_GROUP_LIST');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (64, 'checkbox', NULL, 1, 0, 0, 0, 0, 0, 1, 'left', 'center', 'checkbox', '', 1, NULL, 50, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (64, 'action', NULL, 1, 0, 0, 0, 0, 0, 1, 'right', 'center', 'actionButton', '', 60, NULL, 50, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (64, 'vgroup.name', 'Vendor Group Name', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Vendor Group Name', 3, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (64, 'vgroup.createdByName', 'Created By', 1, 1, 1, 1, 1, 1, 0, NULL, 'left', 'input', 'Created By', 4, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (64, 'vgroup.createdOn', 'Created Date', 1, 1, 1, 1, 1, 1, 0, NULL, 'center', 'date', 'Created Date', 5, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (64, 'vgroup.status', 'Status', 1, 1, 1, 1, 1, 1, 0, NULL, 'center', 'dropdown', 'All', 6, 1, 150, NULL);


