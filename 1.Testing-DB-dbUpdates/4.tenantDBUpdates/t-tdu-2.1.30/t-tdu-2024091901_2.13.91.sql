--------kavindu-2.13.91-----------

DROP TABLE IF EXISTS `vendor_bill_defaults`;
CREATE TABLE IF NOT EXISTS `vendor_bill_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `term` int(11) DEFAULT NULL,
  `account_details_available` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK1_VENDOR_ID` (`vendor_id`),
  CONSTRAINT `FK_VENDOR_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS `vendor_bill_defaults_account_details`;
CREATE TABLE IF NOT EXISTS `vendor_bill_defaults_account_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `line_number` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_ACCOUNT_ID` (`account_id`),
  CONSTRAINT `FK1_ACCOUNT_ID` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO vendor_bill_defaults (vendor_id, term, account_details_available)
SELECT v.id, v.term, 0 FROM vp_vendor_mst v WHERE v.term IS NOT NULL;

ALTER TABLE `vp_vendor_mst`
DROP COLUMN `term`,
DROP INDEX `FK_vp_vendor_mst_vp_bill_term`,
DROP FOREIGN KEY `FK_vp_vendor_mst_vp_bill_term`;
