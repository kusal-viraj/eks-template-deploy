DROP TABLE IF EXISTS `vp_vendor_mst`;
CREATE TABLE IF NOT EXISTS `vp_vendor_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(25) DEFAULT NULL,
  `approved_by` varchar(50) DEFAULT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `cc_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) NOT NULL,
  `contact_person` varchar(150) NOT NULL,
  `date_approved` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `emp_id_no` varchar(20) DEFAULT NULL,
  `exempt_payee_code` varchar(40) DEFAULT NULL,
  `fatca_reporting_code` varchar(40) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `social_sec_no` varchar(15) DEFAULT NULL,
  `tax_class_otherdetail` varchar(300) DEFAULT NULL,
  `tax_classification` varchar(3) DEFAULT NULL,
  `tax_code` varchar(25) DEFAULT NULL,
  `vendor_code` varchar(50) NOT NULL,
  `w9_form_url` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `last_updated_on` datetime NOT NULL,
  `last_updated_by` varchar(50) NOT NULL,
  `sync_status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40000 ALTER TABLE `vp_vendor_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst` ENABLE KEYS */;
DROP TABLE IF EXISTS `vp_vendor_temp`;
CREATE TABLE IF NOT EXISTS `vp_vendor_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(150) DEFAULT NULL,
  `cc_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) NOT NULL,
  `contact_person` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(150) NOT NULL,
  `emp_id_no` varchar(20) DEFAULT NULL,
  `exempt_payee_code` varchar(40) DEFAULT NULL,
  `fatca_reporting_code` varchar(40) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `social_sec_no` varchar(15) DEFAULT NULL,
  `tax_class_otherdetail` varchar(300) DEFAULT NULL,
  `tax_classification` varchar(3) NOT NULL,
  `tax_code` varchar(25) DEFAULT NULL,
  `user_id` varchar(25) NOT NULL,
  `w9_form_url` varchar(200) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `remark` text DEFAULT NULL,
  `date_rejected` datetime DEFAULT NULL,
  `rejected_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

