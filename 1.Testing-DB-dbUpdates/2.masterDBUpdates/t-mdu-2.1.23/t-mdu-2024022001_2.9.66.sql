---kavindu 2,9,66---



DROP TABLE IF EXISTS `common_tenant_menu`;
CREATE TABLE IF NOT EXISTS `common_tenant_menu` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `menu_id` INT(11) NOT NULL,
 `name` VARCHAR(50) NOT NULL DEFAULT '',
 PRIMARY KEY (`id`)
);

INSERT INTO `common_tenant_menu` (`id`, `menu_id`, `name`) VALUES
	(1, 1000, 'Dashboard'),
	(2, 1001, 'Admin'),
	(3, 1002, 'Settings'),
	(4, 1003, 'Automation'),
	(5, 1004, 'Vendors'),
	(6, 1005, 'Bills'),
	(7, 1006, 'Purchase Orders'),
	(8, 1007, 'Expenses'),
	(9, 1008, 'Items'),
	(10, 1009, 'Accounts'),
	(11, 1010, 'Project'),
	(12, 1011, 'Users'),
	(13, 1012, 'Roles'),
	(14, 1013, 'Approval Groups'),
	(15, 1014, 'Common'),
	(16, 1015, 'Payable'),
	(17, 1016, 'Receivable'),
	(18, 1017, 'Company Profile'),
	(19, 1018, 'Fields Configuration'),
	(20, 1019, 'Bills'),
	(21, 1020, 'Offline Payments'),
	(22, 1021, 'Purchase Orders'),
	(23, 1022, 'PO Receipts'),
	(24, 1024, 'Sync Dashboard'),
	(25, 1025, 'Reports'),
	(26, 1027, 'PO Number Configuration'),
	(27, 1028, 'Online Payments'),
	(28, 1029, 'Payments'),
	(29, 1030, 'Bill Templates'),
	(30, 1031, 'Recurring Bills'),
	(31, 1032, 'Approved Bills'),
	(32, 1033, 'Batch Payments'),
	(33, 1034, 'Vendor Payments'),
	(34, 1035, 'Vendors'),
	(35, 1037, 'Send An Invitation'),
	(36, 1038, 'Import Vendors'),
	(37, 1039, 'Vendor Request'),
	(38, 1040, 'Community Vendors'),
	(39, 1041, 'Departments'),
	(40, 1042, 'Inbox'),
	(41, 1043, 'Show And Hide Fields'),
	(42, 1044, 'Feature Settings'),
	(43, 1045, 'PO Price Variance Configuration'),
	(44, 1046, 'General Settings'),
	(45, 1048, 'Credit Card Statements'),
	(46, 1049, 'Credit Notes'),
	(47, 1050, 'Support Ticket'),
	(48, 1051, 'Expenses'),
	(49, 1052, 'Credit Cards'),
	(50, 1053, 'Transactions'),
	(51, 1054, 'Process Transactons'),
	(52, 1055, 'Submitted Transactions'),
	(53, 1056, 'Approved Transactions'),
	(54, 1057, 'Receipt'),
	(55, 1058, 'Vendor Groups'),
	(56, 1059, 'Virtual/ Digital Cards'),
	(57, 1060, 'Invoices'),
	(58, 1061, 'Reminders'),
	(59, 1062, 'Funding Accounts'),
	(60, 1063, 'Payments'),
	(61, 1064, 'Online Payments'),
	(62, 1065, 'Offline Payments'),
	(63, 1066, 'Integrate Payments');
	
DROP TABLE IF EXISTS `papertrl_package`;
CREATE TABLE IF NOT EXISTS `papertrl_package` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `package_name` VARCHAR(100) NOT NULL,
 `description` VARCHAR(500) DEFAULT NULL,
 `package_cost` DECIMAL(10,2) NOT NULL,
 `status` CHAR(1) NOT NULL,
 `created_by` VARCHAR(100) NOT NULL DEFAULT '',
 `created_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ON
UPDATE CURRENT_TIMESTAMP(),
 `update_by` VARCHAR(100) DEFAULT NULL,
 `update_on` DATETIME DEFAULT NULL,
 `delete_by` VARCHAR(100) DEFAULT NULL,
 `delete_on` DATETIME DEFAULT NULL, PRIMARY KEY (`id`)
);

INSERT INTO `papertrl_package` (`id`, `package_name`, `description`, `package_cost`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES 
(1, 'Pro', 'All Features', 0.00, 'A', 'admin', '2024-02-12 16:05:33', NULL, NULL, NULL, NULL);

DROP TABLE IF EXISTS `papertrl_package_config`;
CREATE TABLE IF NOT EXISTS `papertrl_package_config` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `package_id` INT(11) NOT NULL DEFAULT 0,
 `menu_id` INT(11) NOT NULL DEFAULT 0, PRIMARY KEY (`id`), KEY `FK_package_id` (`package_id`), KEY `FK_papertrl_package_config_common_tenant_menu` (`menu_id`), CONSTRAINT `FK_package_id` FOREIGN KEY (`package_id`) REFERENCES `papertrl_package` (`id`), CONSTRAINT `FK_papertrl_package_config_common_tenant_menu` FOREIGN KEY (`menu_id`) REFERENCES `common_tenant_menu` (`id`)
);

INSERT INTO `papertrl_package_config` (`package_id`, `menu_id`) VALUES 
	(1, 1),
	(1, 2),(1, 3),(1, 4),(1, 5),(1, 6),(1, 7),(1, 8),(1, 9),(1, 10),(1, 11),(1, 12),(1, 13),(1, 14),(1, 15),(1, 16),(1, 17),(1, 18),(1, 19),(1, 20),(1, 21),(1, 22),(1, 23),(1, 24),(1, 25),(1, 26),(1, 27),(1, 28),(1, 29),(1, 30),
	(1, 31),(1, 32),(1, 33),(1, 34),(1, 35),(1, 36),(1, 37),(1, 38),(1, 39),(1, 40),(1, 41),(1, 42),(1, 43),(1, 44),(1, 45),(1, 46),(1, 47),(1, 48),(1, 49),(1, 50),(1, 51),(1, 52),(1, 53),(1, 54),(1, 55),(1, 56),(1, 57),(1, 58),
	(1, 59),(1, 60),(1, 61),(1, 62),(1, 63);


UPDATE `papertrl_master_tenant` SET `package_id`=1 WHERE `id`<>0;
UPDATE `papertrl_master_tenant` SET `package_id`=NULL WHERE `tenant_id`='support';
UPDATE `papertrl_master_tenant` SET `package_id`=NULL WHERE `tenant_id` LIKE '%-portal';
UPDATE `papertrl_master_tenant` SET `package_id`=NULL WHERE `tenant_id` LIKE '%-vendors';