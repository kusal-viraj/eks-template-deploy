/*
Navicat MySQL Data Transfer

Source Server         : MARIA_DB_LOCAL
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : v2_prep_tenant_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-16 17:36:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for umm_menu
-- ----------------------------
DROP TABLE IF EXISTS `umm_menu`;
CREATE TABLE `umm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_text` varchar(600) NOT NULL DEFAULT '',
  `menu_style` varchar(100) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `tab` varchar(100) DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `super_type` int(11) DEFAULT NULL,
  `super_type_2` int(11) DEFAULT NULL,
  `department` varchar(50) NOT NULL DEFAULT '',
  `menu_order` int(3) DEFAULT NULL,
  `display_icon` varchar(100) DEFAULT NULL,
  `short_name` varchar(50) NOT NULL,
  `detail_text` varchar(600) NOT NULL,
  `status` char(1) NOT NULL,
  `portal_menu` tinyint(4) NOT NULL DEFAULT 0,
  `individual_tenant_menu` tinyint(1) NOT NULL,
  `vendor_community_menu` tinyint(1) NOT NULL,
  `version` varchar(10) NOT NULL,
  `auth_code` varchar(50) NOT NULL,
  `slim_menu` tinyint(1) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_menu
-- ----------------------------
INSERT INTO `umm_menu` VALUES ('1', 'Admin', 'Admin', 'fa fa-key', '/home/admin', null, 'S', '15', null, 'Admin', '0', 'fa fa-key', 'Admin', 'Admin', 'A', '1', '1', '1', 'V2', 'ADMIN', '1', 'System', '2021-03-16 17:21:00', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('2', 'Dashboard', 'Dashboard', 'fa fa-th-large', '/home/dashboard', null, 'S', '15', null, 'Admin', '0', 'fa fa-th-large', 'Dashboard', 'Dashboard', 'A', '1', '1', '1', 'V2', 'DASHBOARD', '1', 'System', '2021-03-16 17:21:00', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('3', 'Settings', 'Settings', 'fa fa-cog', '/home/settings', null, 'S', '15', null, 'Admin', '0', 'fa fa-cog', 'Settings', 'Settings', 'A', '1', '1', '0', 'V2', 'SETTINGS', '1', 'System', '2021-03-16 17:21:00', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('4', 'Automation', 'Automation', 'fa fa-tasks', '/home/automation', null, 'S', '15', null, 'Admin', '0', 'fa fa-tasks', 'Automations', 'Automations', 'A', '1', '1', '0', 'V2', 'AUTOMATION', '1', 'System', '2021-03-16 17:21:00', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('5', 'Vendors', 'Vendors', 'fa fa-user', '/home/vendor', null, 'S', '16', null, 'Admin', '0', 'fa fa-user', 'Vendors', 'Vendors', 'A', '0', '1', '0', 'V2', 'VENDORS', '1', 'System', '2021-03-16 17:21:14', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('6', 'Bills', 'Bills', 'fa fa-file-text-o', '/home/vendor', null, 'S', '16', null, 'Admin', '0', 'fa fa-file-text-o', 'Bills', 'Bills', 'A', '0', '1', '0', 'V2', 'BILL_MANAGEMENT', '0', 'System', '2021-03-16 17:21:14', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('7', 'Purchase Orders', 'Purchase Orders', 'fa fa-money', '/home/purchase-order', null, 'S', '16', null, 'Admin', '0', 'fa fa-money', 'PO', 'PO', 'A', '0', '1', '1', 'V2', 'PO', '0', 'System', '2021-03-16 17:21:14', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('8', 'Expenses', 'Expenses', 'fa fa-credit-card', '/home/expense', null, 'S', '16', null, 'Admin', '0', 'fa fa-credit-card', 'Expenses', 'Expenses', 'A', '0', '1', '0', 'V2', 'EXPENSES', '1', 'System', '2021-03-16 17:21:14', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('9', 'Items', 'Items', 'fa fa-cube', '/home/item', null, 'S', '15', null, 'Admin', '0', 'fa fa-cube', 'Items', 'Items', 'A', '0', '1', '1', 'V2', 'ITEMS', '1', 'System', '2021-03-16 17:21:54', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('10', 'Accounts', 'Accounts', 'fa fa-industry', '/home/account', null, 'S', '15', null, 'Admin', '0', 'fa fa-industry', 'Accounts', 'Accounts', 'A', '0', '1', '0', 'V2', 'ACCOUNTS', '1', 'System', '2021-03-16 17:21:54', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('11', 'Project Codes', 'Project Codes', 'fa fa-code', '/home/project-code', null, 'S', '17', null, 'Admin', '0', 'fa fa-code', 'Project Codes', 'Project Codes', 'A', '0', '1', '0', 'V2', 'PROJECT_CODES', '1', 'System', '2021-03-16 17:23:37', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('12', 'Users', 'Users', 'fa fa-user', '/home/admin', '0', 'S', '1', null, 'Admin', '0', 'fa fa-user', 'Users', 'Users', 'A', '1', '1', '1', 'V2', 'USERS', '0', 'System', '2021-03-16 17:22:11', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('13', 'Roles', 'Roles', 'fa fa-lock', '/home/admin', '1', 'S', '1', null, 'Admin', '0', 'fa fa-lock', 'Roles', 'Roles', 'A', '1', '1', '1', 'V2', 'ROLES', '0', 'System', '2021-03-16 17:22:11', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('14', 'Approval Groups', 'Approval Groups', 'fa fa-users', '/home/admin', '2', 'S', '1', null, 'Admin', '0', 'fa fa-users', 'Approval Groups', 'Approval Groups', 'A', '1', '1', '1', 'V2', 'APPROVAL_GROUPS', '0', 'System', '2021-03-16 17:22:11', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('15', 'Company', 'Company', 'fa fa-home', '', null, 'M', null, null, 'Admin', '0', 'fa fa-home', 'Company', 'Company', 'A', '1', '1', '0', 'V2', 'CPMPANY', '0', 'System', '2021-03-14 16:38:27', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('16', 'Payable', 'Payable', 'fa fa-industry', '', null, 'M', null, null, 'Admin', '0', 'fa fa-industry', 'Payable', 'Payable', 'A', '1', '1', '0', 'V2', 'PAYABLE', '0', 'System', '2021-03-14 16:38:27', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('17', 'Receivable', 'Receivable', 'fa fa-cube', '', null, 'M', null, null, 'Admin', '0', 'fa fa-industry', 'Receivable', 'Receivable', 'A', '1', '1', '0', 'V2', 'RECEIVABLE', '0', 'System', '2021-03-14 16:38:27', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('18', 'Company Profile', 'Company Profile', 'fa fa-building', '/home/settings', '0', 'S', '3', null, 'Admin', '0', 'fa fa-building', 'Company Profile', 'Company Profile', 'A', '1', '1', '1', 'V2', 'COMPANY_PROFILE', '0', 'System', '2021-03-16 17:22:30', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('19', 'Additional Fields', 'Additional Fields', 'fa fa-pencil-square-o', '/home/settings', '1', 'S', '3', null, 'Admin', '0', 'fa fa-pencil-square-o', 'Additional Fields', 'Additional Fields', 'A', '1', '1', '1', 'V2', 'ADDITIONAL_FIELDS', '0', 'System', '2021-03-16 17:22:30', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('20', 'Bills', 'Bills', 'fa fa-file-text-o', '/home/bills', '0', 'S', '6', null, 'Admin', '0', 'fa fa-file-text-o', 'Bills', 'Bills', 'A', '1', '1', '1', 'V2', 'BILL', '1', 'System', '2021-03-16 17:22:43', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('21', 'Bill Payments', 'Bill Payments', 'fa fa-list-alt', '/home/bills', '1', 'S', '6', null, 'Admin', '0', 'fa fa-list-alt', 'Bill Payments', 'Bill Payments', 'A', '1', '1', '1', 'V2', 'BILL_PAYMENT', '0', 'System', '2021-03-16 17:22:43', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('22', 'Purchase Orders', 'Purchase Orders', 'fa fa-money', '/home/purchase-order', '0', 'S', '7', null, 'Admin', '0', 'fa fa-money', 'Purchase Orders', 'Purchase Orders', 'A', '1', '1', '1', 'V2', 'PURCHASE_ORDER', '1', 'System', '2021-03-16 17:22:59', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('23', 'PO Receipts', 'PO Receipts', 'fa fa-usd', '/home/purchase-order', '1', 'S', '7', null, 'Admin', '0', 'fa fa-usd', 'PO Receipts', 'PO Receipts', 'A', '1', '1', '1', 'V2', 'PO_RECEIPT', '0', 'System', '2021-03-16 17:22:59', null, null, null, null);
INSERT INTO `umm_menu` VALUES ('24', 'Sub Accounts', 'Sub Accounts', 'fa fa-users', '/home/sub-accounts', null, 'S', '1', null, 'Admin', '0', 'fa fa-users', 'Sub Accounts', 'Sub Accounts', 'A', '1', '0', '0', 'V2', 'SUB_ACCOUNT', '0', 'System', '2021-03-16 17:23:01', null, null, null, null);

-- ----------------------------
-- Table structure for umm_menu_privilage
-- ----------------------------
DROP TABLE IF EXISTS `umm_menu_privilage`;
CREATE TABLE `umm_menu_privilage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `prililage_id` int(11) NOT NULL,
  `auth_code` varchar(75) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `privilage_id` (`prililage_id`) USING BTREE,
  CONSTRAINT `umm_menu_privilage_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `umm_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `umm_menu_privilage_ibfk_2` FOREIGN KEY (`prililage_id`) REFERENCES `umm_privilages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_menu_privilage
-- ----------------------------
INSERT INTO `umm_menu_privilage` VALUES ('1', '12', '1', 'USERS_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('2', '12', '5', 'USERS_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('3', '12', '13', 'USERS_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('4', '12', '14', 'USERS_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('5', '12', '4', 'USERS_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('6', '12', '3', 'USERS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('7', '12', '55', 'USERS_UNLOCK', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('8', '12', '8', 'USERS_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('9', '13', '1', 'ROLES_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('10', '13', '5', 'ROLES_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('11', '13', '13', 'ROLES_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('12', '13', '14', 'ROLES_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('13', '13', '3', 'ROLES_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('14', '13', '4', 'ROLES_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('15', '14', '1', 'APPROVAL_GROUPS_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('16', '14', '4', 'APPROVAL_GROUPS_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('17', '14', '5', 'APPROVAL_GROUPS_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('18', '14', '13', 'APPROVAL_GROUPS_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('19', '14', '14', 'APPROVAL_GROUPS_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('20', '14', '8', 'APPROVAL_GROUPS_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('21', '18', '4', 'COMPANY_PROFILE_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('22', '18', '37', 'COMPANY_PROFILE_CHANGE_PACKAGE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('23', '18', '56', 'COMPANY_PROFILE_CONVERT_TO_PORTAL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('24', '19', '1', 'ADDITIONAL_FIELDS_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('25', '19', '4', 'ADDITIONAL_FIELDS_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('26', '19', '5', 'ADDITIONAL_FIELDS_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('27', '19', '13', 'ADDITIONAL_FIELDS_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('28', '19', '14', 'ADDITIONAL_FIELDS_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('29', '4', '1', 'AUTOMATION_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('30', '4', '4', 'AUTOMATION_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('31', '4', '5', 'AUTOMATION_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('32', '4', '13', 'AUTOMATION_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('33', '4', '14', 'AUTOMATION_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('34', '4', '3', 'AUTOMATION_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('35', '9', '1', 'ITEMS_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('36', '9', '8', 'ITEMS_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('37', '9', '4', 'ITEMS_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('38', '9', '5', 'ITEMS_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('39', '9', '13', 'ITEMS_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('40', '9', '14', 'ITEMS_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('41', '9', '3', 'ITEMS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('42', '10', '1', 'ACCOUNTS_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('43', '10', '8', 'ACCOUNTS_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('44', '10', '4', 'ACCOUNTS_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('45', '10', '5', 'ACCOUNTS_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('46', '10', '13', 'ACCOUNTS_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('47', '10', '14', 'ACCOUNTS_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('48', '10', '3', 'ACCOUNTS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('49', '24', '1', 'SUB_ACCOUNT_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('50', '24', '4', 'SUB_ACCOUNT_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('51', '24', '5', 'SUB_ACCOUNT_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('52', '24', '13', 'SUB_ACCOUNT_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('53', '24', '14', 'SUB_ACCOUNT_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('54', '24', '3', 'SUB_ACCOUNT_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('55', '5', '1', 'VENDORS_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('56', '5', '57', 'VENDORS_SEND_VENDOR_INVITATION', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('57', '5', '8', 'VENDORS_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('58', '5', '58', 'VENDORS_MANAGE_VENDOR_REQUEST', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('59', '5', '4', 'VENDORS_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('60', '5', '3', 'VENDORS_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('61', '20', '1', 'BILL_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('62', '20', '59', 'BILL_PROCESS', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('63', '20', '4', 'BILL_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('64', '20', '6', 'BILL_APPROVE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('65', '20', '7', 'BILL_REJECT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('66', '20', '60', 'BILL_QUICK_APPROVE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('67', '20', '38', 'BILL_SKIP_APPROVAL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('68', '20', '3', 'BILL_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('69', '20', '10', 'BILL_VIEW_AUDIT_TRAIL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('70', '20', '61', 'BILL_DOWNLOAD_BILL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('71', '20', '62', 'BILL_APPLY_PAYMENT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('72', '20', '63', 'BILL_VIEW_PAYMENTS', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('73', '20', '5', 'BILL_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('74', '20', '47', 'BILL_CSV_EXPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('75', '21', '1', 'BILL_PAYMENT_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('76', '21', '8', 'BILL_PAYMENT_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('77', '21', '64', 'BILL_PAYMENT_CHANGE_BILL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('78', '21', '27', 'BILL_PAYMENT_MARK_AS_MAILED', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('79', '21', '28', 'BILL_PAYMENT_REVOKE_PAYMENT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('80', '21', '3', 'BILL_PAYMENT_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('81', '21', '65', 'BILL_PAYMENT_VIEW_BILLS', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('82', '21', '47', 'BILL_PAYMENT_CSV_EXPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('83', '21', '39', 'BILL_PAYMENT_DOWNLOAD_RECEIPT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('84', '22', '1', 'PURCHASE_ORDER_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('85', '22', '4', 'PURCHASE_ORDER_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('86', '22', '3', 'PURCHASE_ORDER_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('87', '22', '5', 'PURCHASE_ORDER_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('88', '22', '6', 'PURCHASE_ORDER_APPROVE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('89', '22', '7', 'PURCHASE_ORDER_REJECT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('90', '22', '10', 'PURCHASE_ORDER_VIEW_AUDIT_TRAIL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('91', '22', '47', 'PURCHASE_ORDER_CSV_EXPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('92', '22', '66', 'PURCHASE_ORDER_DOWNLOAD_REPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('93', '22', '60', 'PURCHASE_ORDER_QUICK_APPROVE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('94', '23', '1', 'PO_RECEIPT_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('95', '23', '4', 'PO_RECEIPT_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('96', '23', '3', 'PO_RECEIPT_DETAIL_VIEW', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('97', '23', '5', 'PO_RECEIPT_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('98', '23', '67', 'PO_RECEIPT_ATTACH_TO_A_BILL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('99', '23', '41', 'PO_RECEIPT_CLOSE_PO_RECEIPT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('100', '23', '47', 'PO_RECEIPT_CSV_EXPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('101', '23', '66', 'PO_RECEIPT_DOWNLOAD_REPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('102', '8', '1', 'EXPENSES_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('103', '8', '4', 'EXPENSES_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('104', '8', '5', 'EXPENSES_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('105', '8', '6', 'EXPENSES_APPROVE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('106', '8', '7', 'EXPENSES_REJECT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('107', '8', '10', 'EXPENSES_VIEW_AUDIT_TRAIL', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('108', '8', '66', 'EXPENSES_DOWNLOAD_REPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('109', '8', '68', 'EXPENSES_VIEW_REPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('110', '8', '47', 'EXPENSES_CSV_EXPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('111', '8', '60', 'EXPENSES_QUICK_APPROVE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('112', '11', '1', 'PROJECT_CODES_CREATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('113', '11', '4', 'PROJECT_CODES_EDIT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('114', '11', '5', 'PROJECT_CODES_DELETE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('115', '11', '13', 'PROJECT_CODES_INACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('116', '11', '14', 'PROJECT_CODES_ACTIVATE', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('117', '11', '8', 'PROJECT_CODES_UPLOAD', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('118', '11', '47', 'PROJECT_CODES_CSV_EXPORT', 'System', '2021-03-14 16:37:55', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('119', '20', '40', 'BILL_OVERRIDE_APPROVAL', 'System', '2021-03-16 17:16:59', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('120', '22', '40', 'PURCHASE_ORDER_OVERRIDE_APPROVAL', 'System', '2021-03-16 17:17:02', null, null, null, null);
INSERT INTO `umm_menu_privilage` VALUES ('121', '8', '40', 'EXPENSES_OVERRIDE_APPROVAL', 'System', '2021-03-16 17:17:05', null, null, null, null);

-- ----------------------------
-- Table structure for umm_role_previlege
-- ----------------------------
DROP TABLE IF EXISTS `umm_role_previlege`;
CREATE TABLE `umm_role_previlege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `sub_account_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id_for_role` (`privilege_id`) USING BTREE,
  KEY `menu_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `umm_role_previlege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umm_role_previlege
-- ----------------------------
INSERT INTO `umm_role_previlege` VALUES ('1', '6', '1', null, 'admin', '2021-03-14 16:39:34', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('2', '6', '2', null, 'admin', '2021-03-14 16:39:34', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('3', '6', '3', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('4', '6', '4', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('5', '6', '5', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('6', '6', '6', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('7', '6', '7', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('8', '6', '8', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('9', '6', '9', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('10', '6', '10', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('11', '6', '11', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('12', '6', '12', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('13', '6', '13', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('14', '6', '14', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('15', '6', '15', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('16', '6', '16', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('17', '6', '17', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('18', '6', '18', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('19', '6', '19', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('20', '6', '20', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('21', '6', '21', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('22', '6', '22', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('23', '6', '23', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('24', '6', '24', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('25', '6', '25', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('26', '6', '26', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('27', '6', '27', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('28', '6', '28', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('29', '6', '29', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('30', '6', '30', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('31', '6', '31', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('32', '6', '32', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('33', '6', '33', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('34', '6', '34', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('35', '6', '35', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('36', '6', '36', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('37', '6', '37', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('38', '6', '38', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('39', '6', '39', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('40', '6', '40', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('41', '6', '41', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('42', '6', '42', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('43', '6', '43', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('44', '6', '44', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('45', '6', '45', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('46', '6', '46', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('47', '6', '47', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('48', '6', '48', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('49', '6', '49', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('50', '6', '50', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('51', '6', '51', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('52', '6', '52', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('53', '6', '53', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('54', '6', '54', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('55', '6', '55', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('56', '6', '56', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('57', '6', '57', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('58', '6', '58', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('59', '6', '59', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('60', '6', '60', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('61', '6', '61', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('62', '6', '62', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('63', '6', '63', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('64', '6', '64', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('65', '6', '65', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('66', '6', '66', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('67', '6', '67', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('68', '6', '68', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('69', '6', '69', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('70', '6', '70', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('71', '6', '71', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('72', '6', '72', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('73', '6', '73', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('74', '6', '74', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('75', '6', '75', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('76', '6', '76', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('77', '6', '77', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('78', '6', '78', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('79', '6', '79', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('80', '6', '80', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('81', '6', '81', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('82', '6', '82', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('83', '6', '83', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('84', '6', '84', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('85', '6', '85', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('86', '6', '86', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('87', '6', '87', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('88', '6', '88', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('89', '6', '89', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('90', '6', '90', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('91', '6', '91', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('92', '6', '92', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('93', '6', '93', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('94', '6', '94', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('95', '6', '95', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('96', '6', '96', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('97', '6', '97', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('98', '6', '98', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('99', '6', '99', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('100', '6', '100', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('101', '6', '101', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('102', '6', '102', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('103', '6', '103', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('104', '6', '104', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('105', '6', '105', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('106', '6', '106', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('107', '6', '107', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('108', '6', '108', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('109', '6', '109', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('110', '6', '110', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('111', '6', '111', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('112', '6', '112', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('113', '6', '113', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('114', '6', '114', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('115', '6', '115', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('116', '6', '116', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('117', '6', '117', null, 'admin', '2021-03-14 16:45:18', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('118', '6', '118', null, 'admin', '2021-03-14 16:51:29', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('119', '6', '119', null, 'admin', '2021-03-16 17:17:42', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('120', '6', '120', null, 'admin', '2021-03-16 17:17:53', null, null, null, null);
INSERT INTO `umm_role_previlege` VALUES ('121', '6', '121', null, 'admin', '2021-03-16 17:18:05', null, null, null, null);
