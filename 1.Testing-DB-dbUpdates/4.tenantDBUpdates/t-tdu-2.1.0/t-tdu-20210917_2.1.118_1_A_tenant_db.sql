------------Indra--------2.1.118------------

DROP TABLE IF EXISTS `vp_recurring_bill_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(200) DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `template_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_additional_data_FKID1` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_additional_data_FKID1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `vp_recurring_bill_additional_field_attachment`;
CREATE TABLE IF NOT EXISTS `vp_recurring_bill_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `template_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_additional_field_attachment_FKID1` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_additional_field_attachment_FKID1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
