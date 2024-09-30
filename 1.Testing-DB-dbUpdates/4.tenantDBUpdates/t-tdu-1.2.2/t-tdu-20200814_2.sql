ALTER TABLE `vp_vendor_invoice` ADD COLUMN `tenant_id` varchar(100) NULL AFTER `export_status`;

CREATE TABLE `vp_vendor_reference` (
`id` int(11) NOT NULL AUTO_INCREMENT, `vendor_id` int(11) DEFAULT NULL, `name` varchar(150) DEFAULT NULL, `vendor_code` varchar(150) DEFAULT NULL, PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;