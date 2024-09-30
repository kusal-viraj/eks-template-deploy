CREATE TABLE `vp_po_receipt_account_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `account_detail_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `is_select_account` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_po_receipt_mst_id` (`receipt_mst_id`),
  KEY `FK_po_receipt_account_detail` (`account_detail_id`),
  KEY `FK_po_receipt_account_id` (`account_id`),
  CONSTRAINT `FK_po_receipt_account_detail` FOREIGN KEY (`account_detail_id`) REFERENCES `vp_po_account_detail` (`id`),
  CONSTRAINT `FK_po_receipt_account_id` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_po_receipt_mst_id` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES ('17', '3', '9');