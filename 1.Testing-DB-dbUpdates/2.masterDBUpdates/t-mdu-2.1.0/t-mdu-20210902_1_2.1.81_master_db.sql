------------Amal-----2.1.81------------

-- Master-DB--

CREATE TABLE `vendor_classification_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classification_code` varchar(150) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (1, 'Minority Business Enterprise (MBE)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (2, 'Women Business Enterprise (WBE)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (3, 'Disabled Owned Business Enterprise (DOBE)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (4, 'Lesbian, Gay, Bisexual, Transgender Business Enterprise (LGBTBE)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (5, 'Small Disadvantaged Business (SDB)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (6, 'Historically Underutilized Business Zone Small Business (HUBZONE)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (7, 'Veteran Business Enterprise (VBE)', 'A', '', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (8, 'Service-Disabled Veteran Business Enterprise (S-DVBE)', 'A', ' ', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (9, 'Woman-Owned Small Business (WOSB)', 'A', ' ', NULL, NULL, NULL);
INSERT INTO `vendor_classification_codes` (`id`, `classification_code`, `status`, `created_by`, `created_on`, `update_by`, `update_on`) VALUES (10, 'Small Business (SB)', 'A', ' ', NULL, NULL, NULL);

