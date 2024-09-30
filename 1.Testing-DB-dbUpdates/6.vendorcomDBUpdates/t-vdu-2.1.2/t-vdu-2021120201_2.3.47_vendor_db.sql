----------------2.3.47------Madhusha--------------

CREATE TABLE `vendor_recurring_invoice_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `schedule_name` varchar(100) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `custom_Interval_value` varchar(50) DEFAULT NULL,
  `recurring_month` varchar(50) DEFAULT '',
  `recurring_day` varchar(50) DEFAULT '',
  `recurring_day_of_week` varchar(50) DEFAULT NULL,
  `generation_frequent_status` varchar(50) DEFAULT NULL,
  `generation_frequent` int(11) DEFAULT NULL,
  `recurring_start_date` date DEFAULT NULL,
  `recurring_end_date` date DEFAULT NULL,
  `occurrence_frequent_status` varchar(50) DEFAULT NULL,
  `occurrence_frequent` int(11) DEFAULT NULL,
  `last_generation_date` date DEFAULT NULL,
  `no_of_generation` int(11) NOT NULL DEFAULT 0,
  `save_as_approved` tinyint(1) NOT NULL DEFAULT 0,
  `tenant_id` varchar(30) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `term_name` varchar(50) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `prefixes` varchar(50) DEFAULT NULL,
  `suffixes` varchar(50) DEFAULT NULL,
  `separator_symbol_id` int(10) DEFAULT NULL,
  `running_no` int(10) DEFAULT NULL,
  `bill_no_pattern` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `vendor_recurring_invoice_template_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurring_invoice_template_mst_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(150) DEFAULT NULL,
  `qty` decimal(12,2) NOT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_invoice` (`recurring_invoice_template_mst_id`) USING BTREE,
  CONSTRAINT `BILL_CREATE_BILL_ID_FK_1` FOREIGN KEY (`recurring_invoice_template_mst_id`) REFERENCES `vendor_recurring_invoice_template_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE `common_vendor_separator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `separator` varchar(10) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_separator
-- ----------------------------
INSERT INTO `common_vendor_separator` VALUES ('1', '|', 'A');
INSERT INTO `common_vendor_separator` VALUES ('2', '#', 'A');
INSERT INTO `common_vendor_separator` VALUES ('3', '-', 'A');
INSERT INTO `common_vendor_separator` VALUES ('4', '/', 'A');
INSERT INTO `common_vendor_separator` VALUES ('5', '\\', 'A');


CREATE TABLE `common_vendor_recurring_custom_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_interval_name` varchar(50) NOT NULL,
  `custom_interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_custom_interval
-- ----------------------------
INSERT INTO `common_vendor_recurring_custom_interval` VALUES ('1', 'Day(s)', 'DAYS', 'A');
INSERT INTO `common_vendor_recurring_custom_interval` VALUES ('2', 'Week(s)', 'WEEKS', 'A');
INSERT INTO `common_vendor_recurring_custom_interval` VALUES ('3', 'Month(s)', 'MONTHS', 'A');
INSERT INTO `common_vendor_recurring_custom_interval` VALUES ('4', 'Years(s)', 'YEARS', 'A');


CREATE TABLE `common_vendor_recurring_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(50) NOT NULL,
  `day_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_day
-- ----------------------------
INSERT INTO `common_vendor_recurring_day` VALUES ('1', '1st', '1', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('2', '2nd', '2', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('3', '3rd', '3', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('4', '4th', '4', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('5', '5th', '5', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('6', '6th', '6', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('7', '7th', '7', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('8', '8th', '8', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('9', '9th', '9', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('10', '10th', '10', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('11', '11th', '11', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('12', '12th', '12', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('13', '13th', '13', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('14', '14th', '14', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('15', '15th', '15', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('16', '16th', '16', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('17', '17th', '17', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('18', '18th', '18', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('19', '19th', '19', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('20', '20th', '20', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('21', '21st', '21', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('22', '22nd', '22', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('23', '23rd', '23', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('24', '24th', '24', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('25', '25th', '25', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('26', '26th', '26', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('27', '27th', '27', 'A');
INSERT INTO `common_vendor_recurring_day` VALUES ('28', '28th', '28', 'A');


CREATE TABLE `common_vendor_recurring_day_of_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_week_name` varchar(50) NOT NULL,
  `day_of_week_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_day_of_week
-- ----------------------------
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('1', 'Monday', 'MON', 'A');
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('2', 'Tuesday', 'TUE', 'A');
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('3', 'Wednesday', 'WED', 'A');
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('4', 'Thursday', 'THU', 'A');
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('5', 'Friday', 'FRI', 'A');
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('6', 'Saturday', 'SAT', 'A');
INSERT INTO `common_vendor_recurring_day_of_week` VALUES ('7', 'Sunday', 'SUN', 'A');


CREATE TABLE `common_vendor_recurring_generation_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generation_frequent` varchar(50) NOT NULL,
  `generation_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_generation_frequent
-- ----------------------------
INSERT INTO `common_vendor_recurring_generation_frequent` VALUES ('1', 'Day', 'DAY', 'A');
INSERT INTO `common_vendor_recurring_generation_frequent` VALUES ('2', 'First', 'FIRST', 'A');
INSERT INTO `common_vendor_recurring_generation_frequent` VALUES ('3', 'Second', 'SECOND', 'A');
INSERT INTO `common_vendor_recurring_generation_frequent` VALUES ('4', 'Third', 'THIRD', 'A');
INSERT INTO `common_vendor_recurring_generation_frequent` VALUES ('5', 'Fourth', 'FOURTH', 'A');
INSERT INTO `common_vendor_recurring_generation_frequent` VALUES ('6', 'Last', 'LAST', 'A');


CREATE TABLE `common_vendor_recurring_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interval_name` varchar(50) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_interval
-- ----------------------------
INSERT INTO `common_vendor_recurring_interval` VALUES ('1', 'Daily', 'DAILY', 'A');
INSERT INTO `common_vendor_recurring_interval` VALUES ('2', 'Weekly', 'WEEKLY', 'A');
INSERT INTO `common_vendor_recurring_interval` VALUES ('3', 'Monthly', 'MONTHLY', 'A');
INSERT INTO `common_vendor_recurring_interval` VALUES ('4', 'Yearly', 'YEARLY', 'A');
INSERT INTO `common_vendor_recurring_interval` VALUES ('5', 'Custom', 'CUSTOM', 'A');


CREATE TABLE `common_vendor_recurring_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(50) NOT NULL,
  `month_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_month
-- ----------------------------
INSERT INTO `common_vendor_recurring_month` VALUES ('1', 'January ', 'JAN ', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('2', 'February', 'FEB', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('3', 'March', 'MAR', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('4', 'April', 'APR', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('5', 'May', 'MAY', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('6', 'June', 'JUN', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('7', 'July', 'JUL', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('8', 'August', 'AUG', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('9', 'September', 'SEP', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('10', 'October', 'OCT', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('11', 'November', 'NOV', 'A');
INSERT INTO `common_vendor_recurring_month` VALUES ('12', 'December', 'DEC', 'A');


CREATE TABLE `common_vendor_recurring_occurrence_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occurrence_frequent` varchar(50) NOT NULL,
  `occurrence_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of common_vendor_recurring_occurrence_frequent
-- ----------------------------
INSERT INTO `common_vendor_recurring_occurrence_frequent` VALUES ('1', 'Specific Date', 'SPEC_DATE', 'A');
INSERT INTO `common_vendor_recurring_occurrence_frequent` VALUES ('2', 'No. of occurrences', 'NO_OF_OCC', 'A');


CREATE TABLE `vendor_recurring_invoice_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `template_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vendor_recurring_invoice_additional_data_FKID1` (`template_mst_id`),
  CONSTRAINT `FK_vendor_recurring_invoice_additional_data_FKID1` FOREIGN KEY (`template_mst_id`) REFERENCES `vendor_recurring_invoice_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `vendor_recurring_invoice_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `template_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vendor_recurring_invoice_additional_field_attachment_FKID1` (`template_mst_id`),
  CONSTRAINT `FK_vendor_recurring_invoice_additional_field_attachment_FKID1` FOREIGN KEY (`template_mst_id`) REFERENCES `vendor_recurring_invoice_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `vendor_recurring_template_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vendor_recurring_ad_hoc_workflow_detail_config_idfk_1` (`template_mst_id`),
  CONSTRAINT `FK_vendor_recurring_ad_hoc_workflow_detail_config_idfk_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vendor_recurring_invoice_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `vendor_recurring_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vendor_recurring_bill_attachment_fkid_1` (`template_mst_id`),
  CONSTRAINT `vendor_recurring_bill_attachment_fkid_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vendor_recurring_invoice_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `vendor_grid_template` (`id`, `grid_name`) VALUES ('26', 'VENDOR_RECURRING_INVOICE_TEMPLATE');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('26', 'checkbox', '1', '0', '0', '0', '0', 'center', 'checkbox', '1');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('26', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '2');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.scheduleName', 'Schedule Name', '1', '1', '1', '1', '1', 'left', 'input', 'Schedule Name', '3');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.noOfGeneration', 'No. of Invoices Generated', '1', '1', '1', '1', '1', 'centers', 'number', 'No. of Invoice Generated', '4');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.intervalValue', 'Interval', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Interval', '5');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.tenantId', 'Customer', '1', '1', '1', '1', '1', 'left', 'multiSelect', 'Customer', '6');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'term.id', 'Term', '1', '1', '1', '1', '1', 'left', 'input', 'Term', '7');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.billAmount', 'Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Amount', '8');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.lastGenerationDate', 'Last Generated Date', '1', '1', '1', '1', '1', 'center', 'date', 'Last Generated Date', '9');

INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('26', 'recInv.createdOn', 'Created Date', '1', '1', '1', '1', '1', 'center', 'date', 'Created Date', '10');


INSERT INTO `vendor_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('26', 'recInv.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Status', '11', '1', '');


INSERT INTO `vendor_grid_state_template` (`grid_id`, `total_rows`, `column_widths`) VALUES ('26', '15', '50,100,210,210,210,210,210,210,210,210,210');


INSERT INTO `vendor_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `created_by`, `created_on`, `hierachy`) VALUES ('1022', 'Recurring Invoices', 'Recurring Invoices', 'fa fa-retweet', 'invoices', '4', 'S', '1008', 'Admin', '2', 'fa fa-retweet', 'Recurring Invoices', 'Recurring Invoices', 'A', '0', '1', 'V2', 'RECURRING_INVOICES', '0', 'System', '2021-12-02 16:42:51', '1008');


INSERT INTO `vendor_menu_privilage` (`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1021', '1', 'RECURRING_INVOICES_CREATE', 'System', '2021-12-02 16:53:09', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_menu_privilage` (`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1021', '4', 'RECURRING_INVOICES_EDIT', 'System', '2021-12-02 16:53:14', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_menu_privilage` (`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1021', '14', 'RECURRING_INVOICES_ACTIVATE', 'System', '2021-12-02 16:53:15', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_menu_privilage` (`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1021', '13', 'RECURRING_INVOICES_INACTIVATE', 'System', '2021-12-02 16:53:16', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_menu_privilage` (`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1021', '5', 'RECURRING_INVOICES_DELETE', 'System', '2021-12-02 16:53:17', NULL, NULL, NULL, NULL);

INSERT INTO `vendor_menu_privilage` (`menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ('1021', '3', 'RECURRING_INVOICES_DETAIL_VIEW', 'System', '2021-12-02 16:53:18', NULL, NULL, NULL, NULL);
