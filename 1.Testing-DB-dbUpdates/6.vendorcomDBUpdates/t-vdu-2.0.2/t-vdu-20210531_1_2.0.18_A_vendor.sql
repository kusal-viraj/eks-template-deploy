-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_email_template
DROP TABLE IF EXISTS `vendor_notification_email_template`;
CREATE TABLE IF NOT EXISTS `vendor_notification_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(150) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `template_data` text NOT NULL,
  `event_id` int(15) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(50) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notification_subscription_event` (`event_id`),
  CONSTRAINT `FK_notification_subscription_event` FOREIGN KEY (`event_id`) REFERENCES `vendor_notification_subscription_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_vendor_db.vendor_notification_email_template: ~3 rows (approximately)
/*!40000 ALTER TABLE `vendor_notification_email_template` DISABLE KEYS */;
INSERT INTO `vendor_notification_email_template` (`id`, `template_name`, `subject`, `template_data`, `event_id`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES
	(1, 'INVOICE_APPROVED', 'Invoice (INVOICE-NO) has approved ', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Invoice <span id="INVOICE_NUMBER" > Invoice Number </span> has been approved by <span id="APPROVER_NAME" > Assigned approver </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 3, 'A', 'admin', '2021-05-31', NULL, NULL, NULL, NULL),
	(2, 'INVOICE_REJECTED', 'Invoice (INVOICE-NO) has rejected', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Invoice <span id="INVOICE_NUMBER" > Invoice Number </span> has been rejected by <span id="APPROVER_NAME" > Assigned approver </span> due to <span style="color:red" id="REASON"> Reject Reason </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 4, 'A', 'admin', '2021-05-31', NULL, NULL, NULL, NULL),
	(3, 'PO_SUBMITTED_TO_VENDOR_APPROVAL', 'Purchase Order (PO-NO) has submitted for your approval', '<html>\r\n    <head>\r\n        <meta charset="UTF-8">\r\n        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    </head>\r\n    <body>\r\n        <table style="color: #207580;">\r\n            <tr>\r\n                <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of the vendor</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-left: 250px">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id="PO_NUMBER" > Purchase Order Number </span> has been submitted by <span id="SUBMITTED_BY" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id="URL" href="">PaperTrl</a> <span id="ACCOUNT_NAME"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold"><a href="mailto:support@papertrl.com">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style="margin-top: 65px">\r\n                <td>\r\n                    <span style="font-weight: bold"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>\r\n                    <p class="MsoNormal"><span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style="font-size:8.0pt;color:#014708"></span></p>\r\n                    <p><span style="font-size:18.0pt;font-family:Webdings;color:green">P</span><span style="color:black">\r\n                        </span><span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>', 1, 'A', 'admin', '2021-05-28', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vendor_notification_email_template` ENABLE KEYS */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_subscription_event
DROP TABLE IF EXISTS `vendor_notification_subscription_event`;
CREATE TABLE IF NOT EXISTS `vendor_notification_subscription_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(150) NOT NULL,
  `enable_notification` tinyint(1) NOT NULL DEFAULT 0,
  `enable_email` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(1) NOT NULL,
  `subscription_type_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_notification_subscription_type` (`subscription_type_id`),
  CONSTRAINT `FK_common_notification_subscription_type` FOREIGN KEY (`subscription_type_id`) REFERENCES `vendor_notification_subscription_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_vendor_db.vendor_notification_subscription_event: ~4 rows (approximately)
/*!40000 ALTER TABLE `vendor_notification_subscription_event` DISABLE KEYS */;
INSERT INTO `vendor_notification_subscription_event` (`id`, `event`, `enable_notification`, `enable_email`, `status`, `subscription_type_id`) VALUES
	(1, 'When a purchase order submitted for your approval', 1, 1, 'A', 2),
	(2, 'When a payment received', 1, 1, 'A', 5),
	(3, 'When your submitted Invoice has been Approved', 1, 1, 'A', 1),
	(4, 'When your submitted Invoice has been Rejected', 1, 1, 'A', 1);
/*!40000 ALTER TABLE `vendor_notification_subscription_event` ENABLE KEYS */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_subscription_privilege
DROP TABLE IF EXISTS `vendor_notification_subscription_privilege`;
CREATE TABLE IF NOT EXISTS `vendor_notification_subscription_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_event_id` int(15) NOT NULL,
  `menu_privilege` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_privilege_common_notification_subscription_event` (`subscription_event_id`),
  KEY `FK_privilege_umm_menu_privilage` (`menu_privilege`),
  CONSTRAINT `FK_privilege_common_notification_subscription_event` FOREIGN KEY (`subscription_event_id`) REFERENCES `vendor_notification_subscription_event` (`id`),
  CONSTRAINT `FK_privilege_vendor_menu_privilage` FOREIGN KEY (`menu_privilege`) REFERENCES `vendor_menu_privilage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_vendor_db.vendor_notification_subscription_privilege: ~8 rows (approximately)
/*!40000 ALTER TABLE `vendor_notification_subscription_privilege` DISABLE KEYS */;
INSERT INTO `vendor_notification_subscription_privilege` (`id`, `subscription_event_id`, `menu_privilege`) VALUES
	(1, 1, 160),
	(2, 1, 161),
	(3, 1, 166),
	(4, 1, 170),
	(5, 2, 174),
	(6, 2, 175),
	(7, 3, 174),
	(8, 4, 174);
/*!40000 ALTER TABLE `vendor_notification_subscription_privilege` ENABLE KEYS */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_subscription_type
DROP TABLE IF EXISTS `vendor_notification_subscription_type`;
CREATE TABLE IF NOT EXISTS `vendor_notification_subscription_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table v2_prep_vendor_db.vendor_notification_subscription_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `vendor_notification_subscription_type` DISABLE KEYS */;
INSERT INTO `vendor_notification_subscription_type` (`id`, `name`, `status`) VALUES
	(1, 'Invoice', 'A'),
	(2, 'Purchase Order', 'A'),
	(3, 'Purchase Order Receipt', 'A'),
	(4, 'Expense', 'A'),
	(5, 'Payment', 'A'),
	(6, 'Vendor', 'A');
/*!40000 ALTER TABLE `vendor_notification_subscription_type` ENABLE KEYS */;

-- Dumping structure for table v2_prep_vendor_db.vendor_notification_subscription_user_wise
DROP TABLE IF EXISTS `vendor_notification_subscription_user_wise`;
CREATE TABLE IF NOT EXISTS `vendor_notification_subscription_user_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `enable_notification` tinyint(4) NOT NULL DEFAULT 0,
  `enable_email` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=LATIN1;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;



UPDATE `vendor_menu` SET `name` = 'Payments', `display_text` = 'Payments', `menu_style` = 'fa fa-list-alt', `url` = 'invoices', `tab` = '1', `type` = 'S', `super_type` = 1008, `super_type_2` = NULL, `department` = 'Admin', `menu_order` = 0, `display_icon` = 'fa fa-list-alt', `short_name` = 'Payments', `detail_text` = 'Payments', `status` = 'A', `portal_menu` = 1, `individual_tenant_menu` = 1, `vendor_community_menu` = 1, `version` = 'V2', `auth_code` = 'PAYMENT', `slim_menu` = 0, `created_by` = 'System', `created_on` = '2021-04-15 18:30:16', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL, `hierachy` = '1008' WHERE `id` = 1010;


UPDATE `vendor_privilages` SET `url` = 'Unlock', `text` = 'Unlock', `auth_code` = 'UNLOCK', `created_on` = '2021-03-31 14:00:18', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 41;
UPDATE `vendor_privilages` SET `url` = 'Add Note', `text` = 'Add Note', `auth_code` = 'ADD_NOTE', `created_on` = '2021-05-31 08:43:51', `created_by` = 'System', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 45;


INSERT INTO `vendor_menu_privilage`( `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1002, 13, 'USERS_INACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`( `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1002, 14, 'USERS_ACTIVATE', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`( `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1002, 41, 'USERS_UNLOCK', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`( `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1007, 45, 'PO_UNLOCK', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`( `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1009, 45, 'INVOICE_UNLOCK', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL);
INSERT INTO `vendor_menu_privilage`( `menu_id`, `prililage_id`, `auth_code`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( 1010, 45, 'PAYMENT_UNLOCK', 'System', '2021-03-14 16:37:55', NULL, NULL, NULL, NULL);
