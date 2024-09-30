DROP TABLE IF EXISTS `common_system_sync_property`;
CREATE TABLE IF NOT EXISTS `common_system_sync_property` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `system_id` int(11) NOT NULL,
 `service_property_id` int(11) NOT NULL,
 `syncable` tinyint(1) NOT NULL DEFAULT 0,
 `created_on` date NOT NULL,
 `created_by` varchar(50) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vp_vendor_sync_mst`;
CREATE TABLE IF NOT EXISTS `vp_vendor_sync_mst` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `vendor_mst_id` int(11) NOT NULL,
 `system_id` int(11) NOT NULL,
 `recode_status` char(2) NOT NULL,
 `sync_date_time` datetime DEFAULT NULL,
 `sync_status` char(1) NOT NULL,
 `attempts` int(2) DEFAULT 0,
 `executed_by` varchar(50) DEFAULT NULL,
 `executed_on` date DEFAULT NULL,
 `insert_by` varchar(50) NOT NULL,
 `insert_on` date NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_vp_vendor_sync_mst_vp_vendor_mst` (`vendor_mst_id`),
 CONSTRAINT `FK_vp_vendor_sync_mst_vp_vendor_mst` FOREIGN KEY (`vendor_mst_id`) REFERENCES `vp_vendor_mst`
(`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vp_vendor_invoice_sync_mst`;
CREATE TABLE IF NOT EXISTS `vp_vendor_invoice_sync_mst` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `invoice_mst_id` int(11) NOT NULL,
 `system_id` int(11) NOT NULL,
 `recode_status` char(2) NOT NULL,
 `sync_date_time` datetime DEFAULT NULL,
 `sync_status` char(1) NOT NULL,
 `attempts` int(2) DEFAULT 0,
 `executed_by` varchar(50) DEFAULT NULL,
 `executed_on` date DEFAULT NULL,
 `insert_by` varchar(50) NOT NULL,
 `insert_on` date NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK__vp_vendor_invoice` (`invoice_mst_id`),
 CONSTRAINT `FK__vp_vendor_invoice` FOREIGN KEY (`invoice_mst_id`) REFERENCES `vp_vendor_invoice` (`id`)
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vp_invoice_payment_sync_mst`;
CREATE TABLE IF NOT EXISTS `vp_invoice_payment_sync_mst` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `payment_mst_id` int(11) NOT NULL,
 `system_id` int(11) NOT NULL,
 `recode_status` char(2) NOT NULL,
 `sync_date_time` datetime DEFAULT NULL,
 `sync_status` char(1) NOT NULL,
 `attempts` int(2) DEFAULT 0,
 `executed_by` varchar(50) DEFAULT NULL,
 `executed_on` date DEFAULT NULL,
 `insert_by` varchar(50) NOT NULL,
 `insert_on` date NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_vp_invoice_payment_sync_mst_vp_invoice_payment` (`payment_mst_id`),
 CONSTRAINT `FK_vp_invoice_payment_sync_mst_vp_invoice_payment` FOREIGN KEY (`payment_mst_id`) REFERENCES
`vp_invoice_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;