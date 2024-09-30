INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `mobile_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1060, 'Invoices', 'Invoices', 'fa fa-file', '/home/invoices', '0', 'S', 1016, NULL, 'Admin', 8, 'fa fa-file', 'Invoices', 'Invoices', 'A', 0, 1, 0, 0, 'V2', 'INVOICES', 0, '1016', 'System', '2023-04-18 12:42:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (143, 'Mark As Paid', 'Mark As Paid', 'MARK_AS_PAID', 'Sytem', '2023-04-18 12:56:42', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (144, 'Mark As Unpaid', 'Mark As Unpaid', 'MARK_AS_UNPAID', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (145, 'Import Invoice', 'Import Invoice', 'IMPORT_INVOICE', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (536, 1060, 1, 'CREATE_INVOICE', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (537, 1060, 4, 'EDIT_INVOICE', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (538, 1060, 3, 'VIEW_INVOICE_DETAIL_VIEW', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (539, 1060, 5, 'DELETE_INVOICE', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (540, 1060, 10, 'VIEW_INVOICE_AUDIT_TRAIL', 'System', '2023-04-18 13:17:08', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (541, 1060, 39, 'DOWNLOAD_INVOICE_RECEPIT', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (542, 1060, 47, 'EXPORT_INVOICE_CSV', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (543, 1060, 143, 'MARK_AS_INVOICE_PAID', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (544, 1060, 144, 'MARK_AS_INVOICE_UNPAID', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (545, 1060, 145, 'IMPORT_INVOICE', 'System', '2023-04-18 12:45:00', NULL, NULL, NULL, NULL);

INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 1060, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 536, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 537, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 538, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 539, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 540, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 541, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 542, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 543, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 544, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 545, NULL, 'admin', '2023-04-18 13:43:37', NULL, NULL, NULL, NULL);

INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (36, 'Invoice Payment Status');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (126, 36, 34);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (127, 36, 17);

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (67, 'CUSTOMER_INVOICE_LIST');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'checkbox', 'checkbox', NULL, 1, 0, 0, 0, 0, 0, 1, 'center', 'center', 'checkbox', '', 1, NULL, 50, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.invoiceNumber', 'cinvoice.invoiceNumber', 'Invoice Number', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'input', 'Invoice No.', 2, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.customerName', 'cinvoice.customerName', 'Customer Name', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'input', 'Customer Name', 3, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.invoiceAmount', 'cinvoice.invoiceAmount', 'Invoice Amount', 1, 1, 0, 0, 1, 1, 0, NULL, 'right', 'numeric', 'Invoice Amount', 4, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.invoiceDate', 'cinvoice.invoiceDate', 'Invoice Date', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'date', 'Invoice Date', 5, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.paymentStatus', 'cinvoice.paymentStatus', 'Payment Status', 1, 1, 0, 1, 1, 1, 0, NULL, 'center', 'dropdown', 'Payment Status', 7, 36, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.exportStatus', 'cinvoice.exportStatus', 'Export Status', 1, 1, 0, 1, 1, 1, 0, NULL, 'center', 'dropdown', 'Payment Status', 8, 14, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.createdByName', 'cinvoice.createdByName', 'Created By', 1, 1, 0, 1, 1, 1, 0, NULL, 'left', 'input', 'Created By', 9, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'cinvoice.createdOn', 'cinvoice.createdOn', 'Created Date', 1, 1, 0, 1, 1, 1, 0, NULL, 'center', 'date', 'Created Date', 10, NULL, 150, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `sortable_field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `filter_show`, `is_frozen`, `frozen_direction`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `column_width`, `drop_down_url_id`) VALUES (67, 'action', 'action', NULL, 1, 0, 0, 0, 0, 0, 1, 'center', 'center', 'actionButton', '', 11, NULL, 50, NULL);

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (67, 67, 0, 11, '50,210,210,210,210,210,210,210,210,210');

CREATE TABLE IF NOT EXISTS `vp_customer_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) NOT NULL DEFAULT '0',
  `invoice_date` date NOT NULL,
  `invoice_amount` decimal(19,2) NOT NULL DEFAULT 0.00,
  `customer_name` varchar(150) NOT NULL,
  `additional_note` varchar(500) DEFAULT '',
  `export_status` char(1) NOT NULL,
  `payment_status` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_by_name` varchar(200) NOT NULL DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `vp_customer_invoice_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_invoice_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vp_customer_invoice_attachment_vp_customer_invoice` (`customer_invoice_id`),
  CONSTRAINT `FK_vp_customer_invoice_attachment_vp_customer_invoice` FOREIGN KEY (`customer_invoice_id`) REFERENCES `vp_customer_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `vp_customer_invoice_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `header` varchar(200) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT '',
  `customer_invoice_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vp_customer_invoice_audit_trail_vp_customer_invoice` (`customer_invoice_id`),
  KEY `FK_vp_customer_invoice_audit_trail_common_audit_trial_status` (`status_id`),
  CONSTRAINT `FK_vp_customer_invoice_audit_trail_common_audit_trial_status` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`),
  CONSTRAINT `FK_vp_customer_invoice_audit_trail_vp_customer_invoice` FOREIGN KEY (`customer_invoice_id`) REFERENCES `vp_customer_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `vp_customer_invoice_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `vp_customer_invoice_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_1_customer_invoice_import_mst` (`import_mst_id`),
  CONSTRAINT `FK_1_customer_invoice_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_customer_invoice_import_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (58, 'Edited by', 22, 'fa fa-pencil', 'bg-blue');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (59, 'Marked as paid', 23, 'fa fa-money-check-alt', 'bg-blue');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES (60, 'Marked as unpaid', 24, 'fa fa-undo', 'bg-blue');

ALTER TABLE `vp_bill`
	ADD COLUMN `pay_when_customer_pay` TINYINT(1) NULL DEFAULT NULL AFTER `project_code_id`,
	ADD COLUMN `customer_invoice_id` INT(11) NULL DEFAULT NULL AFTER `pay_when_customer_pay`;
	
ALTER TABLE `vp_bill`
	ADD CONSTRAINT `CUSTOMER_INVOICE_FK_1` FOREIGN KEY (`customer_invoice_id`) REFERENCES `vp_customer_invoice` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;
	
ALTER TABLE `hst_vp_bill`
	ADD COLUMN `pay_when_customer_pay` TINYINT(1) NULL DEFAULT NULL AFTER `project_code_id`,
	ADD COLUMN `customer_invoice_id` INT(11) NULL DEFAULT NULL AFTER `pay_when_customer_pay`;
	
ALTER TABLE `hst_vp_bill`
	ADD CONSTRAINT `HST_CUSTOMER_INVOICE_FK_1` FOREIGN KEY (`customer_invoice_id`) REFERENCES `vp_customer_invoice` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT;	