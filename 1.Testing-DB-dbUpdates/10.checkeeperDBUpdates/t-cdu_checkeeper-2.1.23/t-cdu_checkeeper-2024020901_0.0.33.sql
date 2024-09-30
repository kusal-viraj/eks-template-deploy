/*
 Navicat Premium Data Transfer

 Source Server         : connection
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3307
 Source Schema         : papertrl_connector_checkeeper

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 09/02/2024 12:00:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE `audit_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `transaction_id` int NULL DEFAULT NULL,
  `request` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `response` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_on` datetime(6) NOT NULL,
  `tp_txn_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_received` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of audit_log
-- ----------------------------

-- ----------------------------
-- Table structure for papertrl_error_message
-- ----------------------------
DROP TABLE IF EXISTS `papertrl_error_message`;
CREATE TABLE `papertrl_error_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usb_error_message` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `papertrl_message` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of papertrl_error_message
-- ----------------------------

-- ----------------------------
-- Table structure for payment_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `payment_bank_account`;
CREATE TABLE `payment_bank_account`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `routing_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bank_id` int NULL DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transit_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_nic_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_bank_account
-- ----------------------------

-- ----------------------------
-- Table structure for payment_client_data
-- ----------------------------
DROP TABLE IF EXISTS `payment_client_data`;
CREATE TABLE `payment_client_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `routing_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_client_data
-- ----------------------------

-- ----------------------------
-- Table structure for payment_configuration
-- ----------------------------
DROP TABLE IF EXISTS `payment_configuration`;
CREATE TABLE `payment_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_type_id` int NOT NULL,
  `field_caption` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `field_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `data_type` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `max_length` int NOT NULL,
  `attribute_name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for payment_customer_wise_config_value
-- ----------------------------
DROP TABLE IF EXISTS `payment_customer_wise_config_value`;
CREATE TABLE `payment_customer_wise_config_value`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_type_id` int NOT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `routing_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_account_token` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dcard_account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_customer_wise_config_value
-- ----------------------------

-- ----------------------------
-- Table structure for payment_provider
-- ----------------------------
DROP TABLE IF EXISTS `payment_provider`;
CREATE TABLE `payment_provider`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_image` mediumblob NULL,
  `osn` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `client_id` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  `client_secret` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_provider
-- ----------------------------
INSERT INTO `payment_provider` VALUES (3, 'Checkeeper', 'A', 'Checkeeper\'s online check printing software lets you print checks on your own check-stock or on totally blank white paper. Checkeeper and a printer is all you need to create professional business or personal checks.', NULL, NULL, 'UzEzqkyZR7sMJZp88ysatvvv', 'support', '2024-01-17 16:58:23', NULL, NULL, NULL, NULL, '!!%c*cr8!2ELgkPM#@qt25!MR&adg8hj');

-- ----------------------------
-- Table structure for payment_provider_credential
-- ----------------------------
DROP TABLE IF EXISTS `payment_provider_credential`;
CREATE TABLE `payment_provider_credential`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `secret` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `auth_url` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `access_token_expire_on` datetime(6) NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_provider_credential
-- ----------------------------

-- ----------------------------
-- Table structure for payment_provider_for_customer
-- ----------------------------
DROP TABLE IF EXISTS `payment_provider_for_customer`;
CREATE TABLE `payment_provider_for_customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tenant` int NOT NULL,
  `tenant_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `base_url` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tenant`(`tenant`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_provider_for_customer
-- ----------------------------

-- ----------------------------
-- Table structure for payment_recipient_detail
-- ----------------------------
DROP TABLE IF EXISTS `payment_recipient_detail`;
CREATE TABLE `payment_recipient_detail`  (
  `id` int NOT NULL,
  `record_id` int NOT NULL AUTO_INCREMENT,
  `recipient_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_name` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recipient_first_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recipient_last_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recipientToken` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vendor_id` int NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recipient_identification` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address_line_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address_line_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zipcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address_state` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `routing_number` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_recipient_detail
-- ----------------------------

-- ----------------------------
-- Table structure for payment_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `payment_request_detail`;
CREATE TABLE `payment_request_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address_line_1` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address_line_2` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `zipcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_request_detail
-- ----------------------------

-- ----------------------------
-- Table structure for payment_transaction
-- ----------------------------
DROP TABLE IF EXISTS `payment_transaction`;
CREATE TABLE `payment_transaction`  (
  `id` int NOT NULL,
  `record_id` int NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `precise_pay` tinyint(1) NULL DEFAULT NULL,
  `effect_until` date NULL DEFAULT NULL,
  `customer_id` varbinary(100) NULL DEFAULT NULL,
  `txn_ref` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txn_type` int NOT NULL,
  `txn_amount` decimal(19, 2) NULL DEFAULT NULL,
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `payment_date` datetime(0) NULL DEFAULT NULL,
  `correlation_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idempotency_key` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentials` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attempt` int NULL DEFAULT NULL,
  `tenant_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `osn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_up_amount` decimal(19, 2) NULL DEFAULT NULL,
  `expire_on` datetime(6) NULL DEFAULT NULL,
  `created_on` datetime(6) NULL DEFAULT NULL,
  `recipient_data_id` int NULL DEFAULT NULL,
  `client_config_id` int NULL DEFAULT NULL,
  `tp_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_account_id` int NULL DEFAULT NULL,
  `requester_data_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `fk_payment_transaction_bank_account`(`bank_account_id`) USING BTREE,
  CONSTRAINT `fk_payment_transaction_bank_account` FOREIGN KEY (`bank_account_id`) REFERENCES `payment_bank_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for payment_transaction_summary
-- ----------------------------
DROP TABLE IF EXISTS `payment_transaction_summary`;
CREATE TABLE `payment_transaction_summary`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `bill_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_date_str` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ref` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `txn_amount` decimal(11, 2) NOT NULL,
  `comment` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bill_amount` decimal(11, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_transaction_summary
-- ----------------------------

-- ----------------------------
-- Table structure for payment_type_for_provider
-- ----------------------------
DROP TABLE IF EXISTS `payment_type_for_provider`;
CREATE TABLE `payment_type_for_provider`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `short_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_type` int NOT NULL,
  `provider_credential_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_payment_type`(`payment_type`) USING BTREE,
  INDEX `fk_provider_credentials`(`provider_credential_id`) USING BTREE,
  CONSTRAINT `fk_provider_credentials` FOREIGN KEY (`provider_credential_id`) REFERENCES `payment_provider_credential` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_type_for_provider
-- ----------------------------
INSERT INTO `payment_type_for_provider` VALUES (1, 'A', 'Check', 2, NULL);

-- ----------------------------
-- Table structure for tenant_wise_transaction
-- ----------------------------
DROP TABLE IF EXISTS `tenant_wise_transaction`;
CREATE TABLE `tenant_wise_transaction`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `transaction_id` int NOT NULL,
  `tp_txn_id` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `correlation_id` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `credentials` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `payment_type` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_wise_transaction
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
