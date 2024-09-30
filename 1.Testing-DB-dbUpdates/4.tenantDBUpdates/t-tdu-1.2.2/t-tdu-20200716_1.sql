ALTER TABLE `vp_expense_additional_field_attachments` DROP FOREIGN KEY `Fk_fieldId`;
ALTER TABLE `vp_expense_additional_field_attachments` ADD CONSTRAINT
`Fk_expense_mst` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `vp_purchase_order_additional_data`
ADD COLUMN `field_value_date` date NULL AFTER `field_value`;

ALTER TABLE `vp_grn_additional_data`
ADD COLUMN `field_value_date` date NULL AFTER `field_value`;

CREATE TABLE `vp_purchase_order_additional_field_attachments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_id` int(11) NOT NULL,
 `po_mst_id` int(11) NOT NULL,
 `attachment_url` varchar(200) NOT NULL,
 `file_name` varchar(200) DEFAULT NULL,
 `file_type` varchar(30) DEFAULT NULL,
 `status` char(1) NOT NULL,
 `deleted_by` varchar(50) DEFAULT NULL,
 `deleted_on` datetime DEFAULT NULL,
 `field_name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `Fk_po_mst` (`po_mst_id`),
 CONSTRAINT `Fk_po_mst` FOREIGN KEY (`po_mst_id`) REFERENCES
`vp_purchase_order_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `vp_grn_additional_field_attachments` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `field_id` int(11) NOT NULL,
 `grn_mst_id` int(11) NOT NULL,
 `attachment_url` varchar(200) NOT NULL,
 `file_name` varchar(200) DEFAULT NULL,
 `file_type` varchar(30) DEFAULT NULL,
 `status` char(1) NOT NULL,
 `deleted_by` varchar(50) DEFAULT NULL,
 `deleted_on` datetime DEFAULT NULL,
 `field_name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `Fk_grn_mst` (`grn_mst_id`),
 CONSTRAINT `Fk_grn_mst` FOREIGN KEY (`grn_mst_id`) REFERENCES `vp_grn_mst`
(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

