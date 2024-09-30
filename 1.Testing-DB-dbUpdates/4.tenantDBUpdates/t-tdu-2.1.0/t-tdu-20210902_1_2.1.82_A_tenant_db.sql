
-- Dumping structure for table v2_prep_tenant_db.common_recurring_day
DROP TABLE IF EXISTS `common_recurring_day`;
CREATE TABLE IF NOT EXISTS `common_recurring_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(50) NOT NULL,
  `day_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_recurring_day: ~31 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_day` DISABLE KEYS */;
INSERT INTO `common_recurring_day` (`id`, `day_name`, `day_value`, `status`) VALUES
	(1, '1st', '1', 'A'),
	(2, '2st', '2', 'A'),
	(3, '3rd', '3', 'A'),
	(4, '4th', '4', 'A'),
	(5, '5th', '5', 'A'),
	(6, '6th', '6', 'A'),
	(7, '7th', '7', 'A'),
	(8, '8th', '8', 'A'),
	(9, '9th', '9', 'A'),
	(10, '10th', '10', 'A'),
	(11, '11th', '11', 'A'),
	(12, '12th', '12', 'A'),
	(13, '13th', '13', 'A'),
	(14, '14th', '14', 'A'),
	(15, '15th', '15', 'A'),
	(16, '16th', '16', 'A'),
	(17, '17th', '17', 'A'),
	(18, '18th', '18', 'A'),
	(19, '19th', '19', 'A'),
	(20, '20th', '20', 'A'),
	(21, '21st', '21', 'A'),
	(22, '22nd', '22', 'A'),
	(23, '23rd', '23', 'A'),
	(24, '24th', '24', 'A'),
	(25, '25th', '25', 'A'),
	(26, '26th', '26', 'A'),
	(27, '27th', '27', 'A'),
	(28, '28th', '28', 'A'),
	(29, '29th', '29', 'A'),
	(30, '30th', '30', 'A'),
	(31, '31st', '31', 'A');
/*!40000 ALTER TABLE `common_recurring_day` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_recurring_day_of_week
DROP TABLE IF EXISTS `common_recurring_day_of_week`;
CREATE TABLE IF NOT EXISTS `common_recurring_day_of_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_week_name` varchar(50) NOT NULL,
  `day_of_week_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_recurring_day_of_week: ~7 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_day_of_week` DISABLE KEYS */;
INSERT INTO `common_recurring_day_of_week` (`id`, `day_of_week_name`, `day_of_week_value`, `status`) VALUES
	(1, 'Monday', 'MON', 'A'),
	(2, 'Tuesday', 'TUE', 'A'),
	(3, 'Wednesday', 'WED', 'A'),
	(4, 'Thursday', 'THU', 'A'),
	(5, 'Friday', 'FRI', 'A'),
	(6, 'Saturday', 'SAT', 'A'),
	(7, 'Sunday', 'SUN', 'A');
/*!40000 ALTER TABLE `common_recurring_day_of_week` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_recurring_generation_frequent
DROP TABLE IF EXISTS `common_recurring_generation_frequent`;
CREATE TABLE IF NOT EXISTS `common_recurring_generation_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generation_frequent` varchar(50) NOT NULL,
  `generation_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_recurring_generation_frequent: ~6 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_generation_frequent` DISABLE KEYS */;
INSERT INTO `common_recurring_generation_frequent` (`id`, `generation_frequent`, `generation_frequent_value`, `status`) VALUES
	(1, 'Day', 'DAY', 'A'),
	(2, 'First', 'FIRST', 'A'),
	(3, 'Second', 'SECOND', 'A'),
	(4, 'Third', 'THIRD', 'A'),
	(5, 'Fourth', 'FOURTH', 'A'),
	(6, 'Last', 'LAST', 'A');
/*!40000 ALTER TABLE `common_recurring_generation_frequent` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_recurring_interval
DROP TABLE IF EXISTS `common_recurring_interval`;
CREATE TABLE IF NOT EXISTS `common_recurring_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interval_name` varchar(50) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_recurring_interval: ~4 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_interval` DISABLE KEYS */;
INSERT INTO `common_recurring_interval` (`id`, `interval_name`, `interval_value`, `status`) VALUES
	(1, 'Daily', 'DAILY', 'A'),
	(2, 'Weekly', 'WEEKLY', 'A'),
	(3, 'Monthly', 'MONTHLY', 'A'),
	(4, 'Yearly', 'YEARLY', 'A');
/*!40000 ALTER TABLE `common_recurring_interval` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_recurring_month
DROP TABLE IF EXISTS `common_recurring_month`;
CREATE TABLE IF NOT EXISTS `common_recurring_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(50) NOT NULL,
  `month_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_recurring_month: ~11 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_month` DISABLE KEYS */;
INSERT INTO `common_recurring_month` (`id`, `month_name`, `month_value`, `status`) VALUES
	(1, 'January ', 'JAN ', 'A'),
	(2, 'February', 'FEB', 'A'),
	(3, 'March', 'MAR', 'A'),
	(4, 'April', 'APR', 'A'),
	(5, 'May', 'MAY', 'A'),
	(6, 'June', 'JUN', 'A'),
	(7, 'July', 'JUL', 'A'),
	(8, 'August', 'AUG', 'A'),
	(9, 'September', 'SEP', 'A'),
	(10, 'October', 'OCT', 'A'),
	(11, 'November', 'NOV', 'A'),
	(12, 'December', 'DEC', 'A');
/*!40000 ALTER TABLE `common_recurring_month` ENABLE KEYS */;

-- Dumping structure for table v2_prep_tenant_db.common_recurring_occurrence_frequent
DROP TABLE IF EXISTS `common_recurring_occurrence_frequent`;
CREATE TABLE IF NOT EXISTS `common_recurring_occurrence_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occurrence_frequent` varchar(50) NOT NULL,
  `occurrence_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_tenant_db.common_recurring_occurrence_frequent: ~2 rows (approximately)
/*!40000 ALTER TABLE `common_recurring_occurrence_frequent` DISABLE KEYS */;
INSERT INTO `common_recurring_occurrence_frequent` (`id`, `occurrence_frequent`, `occurrence_frequent_value`, `status`) VALUES
	(1, 'By', 'BY', 'A'),
	(2, 'After', 'AFTER', 'A');
/*!40000 ALTER TABLE `common_recurring_occurrence_frequent` ENABLE KEYS */;


-- Dumping structure for table v2_prep_tenant_db.vp_recurring_bill_template_mst
DROP TABLE IF EXISTS `vp_recurring_bill_template_mst`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
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
  `vendor_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- Dumping structure for table v2_prep_tenant_db.vp_recurring_bill_attachment
DROP TABLE IF EXISTS `vp_recurring_bill_attachment`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vp_recurring_bill_attachment_fkid_1` (`template_mst_id`),
  CONSTRAINT `vp_recurring_bill_attachment_fkid_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



-- Dumping structure for table v2_prep_tenant_db.vp_recurring_bill_expense_cost_distribution
DROP TABLE IF EXISTS `vp_recurring_bill_expense_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `template_mst_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`) USING BTREE,
  KEY `PROJECT_ID_FK_3` (`project_id`) USING BTREE,
  KEY `DEPT_ID_FK_1` (`department_id`) USING BTREE,
  KEY `vp_recurring_bill_expense_cost_distribution_idfk_5` (`template_mst_id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_idfk_5` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- Dumping structure for table v2_prep_tenant_db.vp_recurring_bill_item_cost_distribution
DROP TABLE IF EXISTS `vp_recurring_bill_item_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_item_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `tax` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `template_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_item_cost_approval_code` (`project_id`),
  KEY `FK_vp_recurring_bill_item_cost_department` (`department_id`),
  KEY `FK_vp_recurring_bill_item_cost_item_mst` (`item_id`),
  KEY `FK_vp_recurring_bill_item_cost_template_mst` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_approval_code` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_department` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_item_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_template_mst` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



-- Dumping structure for table v2_prep_tenant_db.vp_recurring_template_ad_hoc_workflow_detail_config
DROP TABLE IF EXISTS `vp_recurring_template_ad_hoc_workflow_detail_config`;
CREATE TABLE IF NOT EXISTS `vp_recurring_template_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_recurring_template_ad_hoc_workflow_detail_config_idfk_1` (`template_mst_id`),
  CONSTRAINT `FK_recurring_template_ad_hoc_workflow_detail_config_idfk_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('40', 'RECURRING_BILL_TEMPLATE_LIST');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('40', 'checkbox', '', '1', '0', '0', '0', '0', 'center', 'checkbox', '1');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('40', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '2');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.templateName', 'Template Name', '1', '1', '1', '1', '1', 'left', 'input', 'Template Name', '3');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.intervalValue', 'Interval', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Interval', '4');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'vend.id', 'Vendor', '1', '1', '1', '1', '1', 'left', 'multiSelect', 'Vendor', '5');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'term.id', 'Term', '1', '1', '1', '1', '1', 'left', 'dropdown', 'Term', '6');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.billAmount', 'Amount', '1', '1', '1', '1', '1', 'right', 'numeric', 'Amount', '7');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.lastGenerationDate', 'Last Generation Date', '1', '1', '1', '1', '1', 'right', 'date', 'Last Generation Date', '8');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.recurringStartDate', 'Start Date', '1', '1', '1', '1', '1', 'center', 'date', 'Start Date', '9');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.recurringEndDate', 'End Date', '1', '1', '1', '1', '1', 'center', 'date', 'End Date', '10');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.createdByName', 'Created By', '1', '1', '1', '1', '1', 'left', 'input', 'Created By', '11');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('40', 'recBill.createdOn', 'Created Date', '1', '1', '1', '1', '1', 'center', 'date', 'Created Date', '12');

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES ('40', 'recBill.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Status', '13', '1', '');

INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('40', '40', '0', '15', '50,100,210,210,210,210,210,210,210,210,210,210,210');
