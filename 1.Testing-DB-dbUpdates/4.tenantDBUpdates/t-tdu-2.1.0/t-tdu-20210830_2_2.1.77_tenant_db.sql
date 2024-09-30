/*
Navicat MySQL Data Transfer

Source Server         : MARIA_DB_LOCAL
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : v2_prep_tenant_db_3

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-08-30 23:05:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vp_payment_batch
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_batch`;
CREATE TABLE `vp_payment_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(100) DEFAULT NULL,
  `tp_batch_id` varchar(12) NOT NULL,
  `no_of_vendor` int(6) DEFAULT NULL,
  `no_of_bills` int(6) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `cancellable_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `api_status` char(1) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `api_message` varchar(500) DEFAULT NULL,
  `processed_date` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `approval_user` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `approval_group_name` varchar(75) CHARACTER SET latin1 DEFAULT '',
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `cancelled_by` varchar(100) DEFAULT NULL,
  `cancelled_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PAYMENT_STATUS_FK_1` (`status`),
  CONSTRAINT `PAYMENT_STATUS_FK_1` FOREIGN KEY (`status`) REFERENCES `vp_payment_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vp_payment_batch_audit_trail
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_batch_audit_trail`;
CREATE TABLE `vp_payment_batch_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `automation_name` varchar(300) DEFAULT NULL,
  `payment_batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frky1_po_id` (`payment_batch_id`),
  KEY `frky2_status_id` (`status_id`),
  CONSTRAINT `VP_PAYMENT_AUDIT_TRAIL_BATCH_ID_FK1` FOREIGN KEY (`payment_batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_payment_batch_audit_trail_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vp_payment_batch_bill_wise_transaction
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_batch_bill_wise_transaction`;
CREATE TABLE `vp_payment_batch_bill_wise_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_txn_id` varchar(12) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_no` varchar(50) NOT NULL DEFAULT '',
  `txn_ref` varchar(50) DEFAULT NULL,
  `txn_type` int(11) NOT NULL,
  `txn_type_name` varchar(100) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `reason` text DEFAULT NULL,
  `comment` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `TXN_VENDOR_ID_FK1` (`vendor_id`),
  KEY `TXN_BATCH_ID_FK1` (`batch_id`),
  KEY `TXN_BILL_ID_FK1` (`bill_id`),
  CONSTRAINT `TXN_BATCH_ID_FK1` FOREIGN KEY (`batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `TXN_BILL_ID_FK1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `TXN_VENDOR_ID_FK1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vp_payment_bill_wise_cache
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_bill_wise_cache`;
CREATE TABLE `vp_payment_bill_wise_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_cache_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `txn_type` int(11) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `bill_no` varchar(50) NOT NULL DEFAULT '',
  `txn_ref` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_CACHE_BILL_ID_FK_1` (`bill_id`),
  KEY `BILL_PAYMENT_CACHE_VENDOR_CACHE_ID_FK1` (`vendor_cache_id`),
  CONSTRAINT `BILL_PAYMENT_CACHE_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `BILL_PAYMENT_CACHE_VENDOR_CACHE_ID_FK1` FOREIGN KEY (`vendor_cache_id`) REFERENCES `vp_payment_vendor_wise_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vp_payment_status
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_status`;
CREATE TABLE `vp_payment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_code` char(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vp_payment_vendor_wise_cache
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_vendor_wise_cache`;
CREATE TABLE `vp_payment_vendor_wise_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(150) DEFAULT NULL,
  `no_of_bills` int(5) DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` (`vendor_id`),
  CONSTRAINT `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vp_payment_vendor_wise_transaction
-- ----------------------------
DROP TABLE IF EXISTS `vp_payment_vendor_wise_transaction`;
CREATE TABLE `vp_payment_vendor_wise_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(150) DEFAULT NULL,
  `no_of_bills` int(5) DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` (`vendor_id`),
  KEY `vp_payment_vendor_wise_trasaction_batch_id_fk_1` (`batch_id`),
  CONSTRAINT `vp_payment_vendor_wise_transaction_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_payment_vendor_wise_trasaction_batch_id_fk_1` FOREIGN KEY (`batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
