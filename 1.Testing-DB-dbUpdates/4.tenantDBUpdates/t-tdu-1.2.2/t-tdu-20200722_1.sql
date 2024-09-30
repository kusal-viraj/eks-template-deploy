CREATE TABLE `vp_payment_additional_data` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_value` varchar(200) DEFAULT NULL,
 `field_value_date` date DEFAULT NULL,
 `field_id` int(15) NOT NULL,
 `field_name` varchar(50) DEFAULT NULL,
 `payment_mst_id` int(15) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK__vp_payment_mst` (`payment_mst_id`),
 CONSTRAINT `FK__vp_payment_mst` FOREIGN KEY (`payment_mst_id`) REFERENCES
`vp_invoice_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `vp_payment_additional_field_attachments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_id` int(11) NOT NULL,
 `payment_mst_id` int(11) NOT NULL,
 `attachment_url` varchar(200) NOT NULL,
 `file_name` varchar(200) DEFAULT NULL,
 `file_type` varchar(30) DEFAULT NULL,
 `status` char(1) NOT NULL,
 `deleted_by` varchar(50) DEFAULT NULL,
 `deleted_on` datetime DEFAULT NULL,
 `field_name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_payment_mst` (`payment_mst_id`),
 CONSTRAINT `FK_payment_mst` FOREIGN KEY (`payment_mst_id`) REFERENCES
`vp_invoice_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`, `data_created`, `user_inserted`) VALUES ('193', '21', '3', '2020-07-22 18:06:26', 'System');

CREATE TABLE `vp_vendor_invoice_additional_data` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_value` varchar(200) DEFAULT NULL,
 `field_value_date` date DEFAULT NULL,
 `field_id` int(15) NOT NULL,
 `field_name` varchar(50) DEFAULT NULL,
 `invoice_mst_id` int(15) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK__vp_invoice_mst` (`invoice_mst_id`),
 CONSTRAINT `FK__vp_invoice_mst` FOREIGN KEY (`invoice_mst_id`) REFERENCES
`vp_vendor_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `vp_vendor_invoice_additional_field_attachments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_id` int(11) NOT NULL,
 `invoice_mst_id` int(11) NOT NULL,
 `attachment_url` varchar(200) NOT NULL,
 `file_name` varchar(200) DEFAULT NULL,
 `file_type` varchar(30) DEFAULT NULL,
 `status` char(1) NOT NULL,
 `deleted_by` varchar(50) DEFAULT NULL,
 `deleted_on` datetime DEFAULT NULL,
 `field_name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_inv_mst` (`invoice_mst_id`),
 CONSTRAINT `FK_inv_mst` FOREIGN KEY (`invoice_mst_id`) REFERENCES
`vp_vendor_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


