-----danuddara -0.0.4--




/*
 Navicat Premium Data Transfer

 Source Server         : connection
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3307
 Source Schema         : papertrl_usb_connector

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 29/03/2023 12:15:12
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
  `transaction_id` int NOT NULL,
  `request` varchar(5000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `response` varchar(5000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit_log
-- ----------------------------

-- ----------------------------
-- Table structure for common_email_mst
-- ----------------------------
DROP TABLE IF EXISTS `common_email_mst`;
CREATE TABLE `common_email_mst`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `to_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cc_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attempts` int NULL DEFAULT 0,
  `tenant_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `created_on` datetime(0) NOT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_email_mst
-- ----------------------------

-- ----------------------------
-- Table structure for common_notification_email_template
-- ----------------------------
DROP TABLE IF EXISTS `common_notification_email_template`;
CREATE TABLE `common_notification_email_template`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `template_data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `event_id` int NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` date NULL DEFAULT NULL,
  `delete_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_notification_subscription_event`(`event_id`) USING BTREE,
  CONSTRAINT `FK_notification_subscription_event` FOREIGN KEY (`event_id`) REFERENCES `common_notification_subscription_event` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_notification_email_template
-- ----------------------------
INSERT INTO `common_notification_email_template` VALUES (39, 'PAYMENT_REDEMPTION', 'Payment Redemption', '<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of recipient</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td>A payment has been initiated in your favor and is ready to be redeemed. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td><span style=\"font-weight: bold\">Payment Number :</span><span id=\"PAYMENT_REF\">Payment reference</span></td></tr>\r\n            <tr><td><span style=\"font-weight: bold\">Payer :</span><span id=\"PAYER\">Supplier Name</span></td></tr>\r\n            <tr><td><span style=\"font-weight: bold\">Credential Information :</span><span id=\"CREDENTIALS\">Credentials</span></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n	    <tr><td>Keep this information confidential and do not share it with anyone.</td></tr>\r\n	    <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', NULL, 'A', 'admin', '2023-02-09', NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_configuration
-- ----------------------------
INSERT INTO `payment_configuration` VALUES (1, 1, 'Company ID', 'companyId', 1, 'A', 1, '[a-zA-Z0-9\\s]*', 10);
INSERT INTO `payment_configuration` VALUES (2, 2, 'Account Number', 'accountNumber', 1, 'A', 1, '^[0-9]*$', 17);
INSERT INTO `payment_configuration` VALUES (3, 2, 'Routing Number', 'routingNumber', 2, 'A', 1, '^[0-9]*$', 9);
INSERT INTO `payment_configuration` VALUES (4, 3, 'Account ID', 'accountId', 1, 'A', 1, '^[0-9]*$', 12);

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
  `account_id` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

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
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_provider
-- ----------------------------
INSERT INTO `payment_provider` VALUES (2, 'US Bank', 'A', 'We spend our time building the world’s best B2B integrated payments platform.\r\n\nIt securely automates and optimizes all your payments so you can spend your time building the best version of your company.', NULL, 'CAAS05', 'support', '2023-01-18 18:33:09', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_provider_credential
-- ----------------------------
INSERT INTO `payment_provider_credential` VALUES (1, 'kqSRdvZ9YGGhRy9hvF6UCAk0sTtzA9Bl', 'pamoSBWq3X3utOzY', 'https://alpha-apip2.usbank.com/auth/oauth2/v1/token', '4096y9v2oAMIve8Fus53YttyV2T5', '2023-03-28 19:31:03.000000', 'A');
INSERT INTO `payment_provider_credential` VALUES (2, '6qzNWp6ERHjGA9y60Gv0S10G895R8Xvf', 'VKPUseJGG1DjAqQz', 'https://sandbox.usbank.com/auth/oauth2/v1/token', 'lYIbGjrTU7GmryvPMSuDTPvjuk2Z', '2023-03-28 19:31:06.000000', 'A');

-- ----------------------------
-- Table structure for payment_provider_for_customer
-- ----------------------------
DROP TABLE IF EXISTS `payment_provider_for_customer`;
CREATE TABLE `payment_provider_for_customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tenant` int NOT NULL,
  `tenant_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `days_for_cancel` int NULL DEFAULT NULL,
  `hours_for_cancel` int NULL DEFAULT NULL,
  `minutes_for_cancel` int NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tenant`(`tenant`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_provider_for_customer
-- ----------------------------
INSERT INTO `payment_provider_for_customer` VALUES (2, '747747474747', 2, 'papertrl_v2', NULL, NULL, NULL, 'A', 'support', '2021-10-26 22:17:52', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for payment_transaction
-- ----------------------------
DROP TABLE IF EXISTS `payment_transaction`;
CREATE TABLE `payment_transaction`  (
  `id` int NOT NULL,
  `record_id` int NOT NULL AUTO_INCREMENT,
  `tp_txn_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch_id` int NULL DEFAULT NULL,
  `batch_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_online` tinyint(1) NULL DEFAULT NULL,
  `document_type` int NULL DEFAULT NULL,
  `document_id` int NULL DEFAULT NULL,
  `document_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offline_payment_id` int NULL DEFAULT NULL,
  `vendor_id` int NULL DEFAULT NULL,
  `employee_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payee_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_id` int NULL DEFAULT NULL,
  `bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `txn_ref` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txn_type` int NOT NULL,
  `txn_type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txn_amount` decimal(19, 2) NULL DEFAULT NULL,
  `txn_discount` decimal(19, 2) NULL DEFAULT NULL,
  `txn_date` datetime(0) NULL DEFAULT NULL,
  `payment_date` datetime(0) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bank_account_id` int NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `created_by_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_on` datetime(0) NULL DEFAULT NULL,
  `approval_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approval_group_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approval_group` int NULL DEFAULT NULL,
  `approval_user_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workflow_id` int NULL DEFAULT NULL,
  `workflow_level` int NULL DEFAULT NULL,
  `no_of_levels` int NULL DEFAULT NULL,
  `approved_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancelled_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancelled_on` datetime(0) NULL DEFAULT NULL,
  `cancellable_date` datetime(0) NULL DEFAULT NULL,
  `export_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `automation_id` int NULL DEFAULT NULL,
  `automation_rule_id` int NULL DEFAULT NULL,
  `scheduled_date` datetime(0) NULL DEFAULT NULL,
  `scheduled_time` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `TXN_VENDOR_ID_FK1`(`vendor_id`) USING BTREE,
  INDEX `TXN_BATCH_ID_FK1`(`batch_id`) USING BTREE,
  INDEX `TXN_BILL_ID_FK1`(`bill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_transaction
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_type_for_provider
-- ----------------------------
INSERT INTO `payment_type_for_provider` VALUES (4, 'A', 'ACH', 1, 2);
INSERT INTO `payment_type_for_provider` VALUES (5, 'A', 'Check', 2, 2);
INSERT INTO `payment_type_for_provider` VALUES (6, 'A', 'VCard', 3, 1);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_wise_transaction
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
