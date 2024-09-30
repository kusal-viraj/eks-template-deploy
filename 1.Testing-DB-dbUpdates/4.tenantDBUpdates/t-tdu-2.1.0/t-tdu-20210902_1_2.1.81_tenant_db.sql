-----------Amal---2.1.81------------

--Tenant-DB-

ALTER TABLE `vp_vendor_mst`
ADD COLUMN `is_diverse_supplier` CHAR(2) NULL AFTER `delete_by`;

CREATE TABLE `vp_vendor_classification` (
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

CREATE TABLE `vp_vendor_classification_attachment` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;



