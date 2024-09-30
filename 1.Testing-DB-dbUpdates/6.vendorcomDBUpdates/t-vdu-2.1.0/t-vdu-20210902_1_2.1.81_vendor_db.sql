----------Amal-----2.1.81-------------

--Vendor-DB--

ALTER TABLE `vendor_temp` 
ADD COLUMN `is_diverse_supplier` CHAR(2) NULL AFTER `payment_type_id`;

ALTER TABLE `vendor_mst` 
ADD COLUMN `is_diverse_supplier` CHAR(2) NULL AFTER `payment_type_id`;

CREATE TABLE `vendor_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `classification_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `vendor_mst_id` int(11) DEFAULT NULL,
  `vendor_temp_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

CREATE TABLE `vendor_classification_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_classification_relation_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `vendor_mst_id` int(11) DEFAULT NULL,
  `vendor_temp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=latin1;
