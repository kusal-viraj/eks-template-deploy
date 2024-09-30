DROP TABLE IF EXISTS `vp_invoice_payment_distribution`;
CREATE TABLE `vp_invoice_payment_distribution` (
 `id` int(11) NOT NULL,
 `un_tag_referance` int(11) NOT NULL,
 `invoice_referance` int(11) NOT NULL,
 `distribute_amount` decimal(19,2) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `vp_invoice_payment_untagged`;
CREATE TABLE `vp_invoice_payment_untagged` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`payment_referance_no` varchar(30) NOT NULL,
`payment_type` char(1) DEFAULT '',
`payment_type_description` varchar(200) DEFAULT '',
`payment_date` datetime NOT NULL,
`vendor_id` int(11) NOT NULL,
`amount` decimal(19,2) NOT NULL,
`remaining_balance` decimal(19,2) DEFAULT NULL,
`status` char(1) DEFAULT '',
`sync_date` datetime NOT NULL,
`sync_user` varchar(50) NOT NULL,
`ap_account_ref` int(11) DEFAULT NULL,
`bank_account_ref` int(11) DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `FK_AP_ACCOUNT` (`ap_account_ref`),
KEY `FK_BANK_ACCOUNT_REF` (`bank_account_ref`),
CONSTRAINT `vp_invoice_payment_untagged_ibfk_1` FOREIGN KEY
(`ap_account_ref`) REFERENCES `common_chart_of_account` (`id`),
CONSTRAINT `vp_invoice_payment_untagged_ibfk_2` FOREIGN KEY
(`bank_account_ref`) REFERENCES `common_chart_of_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;