CREATE TABLE  `vp_vendor_mst_additional_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int(11) NOT NULL,
  `field_value` varchar(1000) DEFAULT NULL,
  `field_id` int(15) unsigned NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_type_id` int(11) unsigned DEFAULT NULL,
  `section_id` int(11) unsigned NOT NULL,
  `display_order` int(11) unsigned NOT NULL,
  `detail_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

CREATE TABLE  `vp_vendor_mst_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `vendor_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `detail_Id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

