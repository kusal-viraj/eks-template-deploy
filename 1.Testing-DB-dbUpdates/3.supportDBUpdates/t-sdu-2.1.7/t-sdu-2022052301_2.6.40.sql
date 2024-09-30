---------Amal-----2.6.40--------

CREATE TABLE `support_ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int DEFAULT NULL,
  `feature_id` int DEFAULT NULL,
  `tp_ticket_id` varchar(100) DEFAULT NULL,
  `type_id` int NOT NULL,
  `summary` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `assigned_to_user` varchar(200) DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `issue_key` varchar(100) DEFAULT NULL,
  `other_feature_note` varchar(400) DEFAULT NULL,
  `customer_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;


CREATE TABLE `support_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `support_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 'Bills', 'A', 'System ', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 'Purchase Orders', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (4, 'Payments', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (5, 'Chart of Accounts', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (6, 'Expenses', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (7, 'Items', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (8, 'Projects', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (9, 'Vendors', 'A', 'System', '2022-05-04 09:48:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_feature` (`id`, `name`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (11, 'Other', 'A', 'System', '2022-05-12 17:39:27', NULL, NULL, NULL, NULL);

INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (9, 'Technical support', 'A', 'fa fa-cogs', 'Need help installing, configuring, or troubleshooting? Select this to request assistance.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (10, 'Licensing and billing questions', 'A', 'fa fa-credit-card', 'Choose this if you have questions about licensing or billing.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (11, 'Product trial questions', 'A', 'fa fa-phone-square', 'Trying out our product and want more information? Select this and we\'ll be happy to answer your questions.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (12, 'Other questions', 'A', 'fa fa-question-circle-o', 'Don\'t see what you\'re looking for? Select this option and we\'ll help you out.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (14, 'Report a bug', 'A', 'fa fa-bug', 'Tell us the problems you\'re experiencing.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (15, 'Suggest a new feature', 'A', 'fa fa-lightbulb-o', 'Let us know your idea for a new feature.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (16, 'Suggest improvement', 'A', 'fa fa-bolt', 'See a place where we can do better? We\'re all ears.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
