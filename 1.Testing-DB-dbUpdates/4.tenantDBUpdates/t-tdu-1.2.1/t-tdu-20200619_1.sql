DROP TABLE IF EXISTS `ar_opportunity_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_opportunity_additional_data` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_value` varchar(200) DEFAULT NULL,
`field_id` int(15) NOT NULL,
`field_name` varchar(50) NOT NULL,
`opportunity_mst_id` int(15) NOT NULL,
PRIMARY KEY (`id`),
KEY `FK__ar_opportunity` (`opportunity_mst_id`),
CONSTRAINT `FK__ar_opportunity` FOREIGN KEY (`opportunity_mst_id`) REFERENCES `ar_opportunity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ar_project_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_project_additional_data` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_value` varchar(200) DEFAULT NULL,
`field_id` int(15) NOT NULL,
`field_name` varchar(50) NOT NULL,
`project_mst_id` int(15) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ar_proposal_additional_data`;
CREATE TABLE IF NOT EXISTS `ar_proposal_additional_data` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_value` varchar(200) DEFAULT NULL,
`field_id` int(15) NOT NULL,
`field_name` varchar(50) NOT NULL,
`proposal_mst_id` int(15) NOT NULL,
PRIMARY KEY (`id`),
KEY `FK__ar_proposal` (`proposal_mst_id`),
CONSTRAINT `FK__ar_proposal` FOREIGN KEY (`proposal_mst_id`) REFERENCES `ar_proposal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vp_purchase_order_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_purchase_order_additional_data` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_value` varchar(200) DEFAULT NULL,
`field_id` int(15) NOT NULL,
`field_name` varchar(50) NOT NULL,
`po_mst_id` int(15) NOT NULL,
PRIMARY KEY (`id`),
KEY `FK__vp_purchase_order_mst` (`po_mst_id`),
CONSTRAINT `FK__vp_purchase_order_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_purchase_order_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vp_grn_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_grn_additional_data` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_value` varchar(200) DEFAULT NULL,
`field_id` int(15) NOT NULL,
`field_name` varchar(50) NOT NULL,
`grn_mst_id` int(15) NOT NULL,
PRIMARY KEY (`id`),
KEY `FK_vp_grn_additional_data_vp_grn_mst` (`grn_mst_id`),
CONSTRAINT `FK_vp_grn_additional_data_vp_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_grn_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `common_additional_field`
ADD COLUMN `required` TINYINT(1) NOT NULL DEFAULT 0 AFTER `status`;