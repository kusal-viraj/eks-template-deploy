ALTER TABLE `vp_bill`
	ADD COLUMN `ocr_running_status` CHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `inbox_attachment_id`,
	ADD COLUMN `ocr_running_date` DATE NULL DEFAULT NULL AFTER `ocr_running_status`;
	

ALTER TABLE `hst_vp_bill`
	ADD COLUMN `ocr_running_status` CHAR(1) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `inbox_attachment_id`,
	ADD COLUMN `ocr_running_date` DATE NULL DEFAULT NULL AFTER `ocr_running_status`;
	
ALTER TABLE `vp_bill_expense_cost_distribution`
	CHANGE COLUMN `account_id` `account_id` INT(11) NULL AFTER `id`,
	CHANGE COLUMN `amount` `amount` DECIMAL(19,2) NULL AFTER `description`;
	
ALTER TABLE `vp_bill_item_cost_distribution`
	CHANGE COLUMN `qty` `qty` DECIMAL(12,2) NULL DEFAULT '0.00' AFTER `description`,
	CHANGE COLUMN `rate` `rate` DECIMAL(19,2) NULL AFTER `qty`,
	CHANGE COLUMN `amount` `amount` DECIMAL(19,2) NULL AFTER `rate`;

ALTER TABLE `hst_vp_bill_expense_cost_distribution`
	CHANGE COLUMN `account_id` `account_id` INT(11) NULL AFTER `id`,
	CHANGE COLUMN `amount` `amount` DECIMAL(19,2) NULL AFTER `description`;
	
ALTER TABLE `hst_vp_bill_item_cost_distribution`
	CHANGE COLUMN `qty` `qty` DECIMAL(12,2) NULL DEFAULT '0.00' AFTER `description`,
	CHANGE COLUMN `rate` `rate` DECIMAL(19,2) NULL AFTER `qty`,
	CHANGE COLUMN `amount` `amount` DECIMAL(19,2) NULL AFTER `rate`;


DROP TABLE IF EXISTS `vp_bill_capturing_audit_trial`;
CREATE TABLE IF NOT EXISTS `vp_bill_capturing_audit_trial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_status` char(1) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `failed_reason` varchar(500) DEFAULT NULL,
  `response_data` longtext DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `requested_on` date NOT NULL,
  `requested_by` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_bill` (`bill_id`),
  CONSTRAINT `FK__vp_bill` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

	