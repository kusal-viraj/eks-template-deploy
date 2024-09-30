-------Indra------2.1.74--------------

ALTER TABLE `vp_bill_audit_trail`
	ADD COLUMN `automation_name` VARCHAR(200) NULL DEFAULT NULL AFTER `undo_action`;
	
ALTER TABLE `vp_po_audit_trail`
	ADD COLUMN `automation_name` VARCHAR(200) NULL DEFAULT NULL AFTER `puchase_order_id`;
	
ALTER TABLE `vp_expense_audit_trail`
	ADD COLUMN `automation_name` VARCHAR(200) NULL DEFAULT NULL AFTER `expense_id`;
	

DROP TABLE IF EXISTS `vp_bill_audit_trail_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_bill_audit_trail_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_trail_id` int(11) NOT NULL,
  `cost_type` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `project_code` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `qty` decimal(19,2) DEFAULT 0.00,
  `cost` decimal(19,2) DEFAULT 0.00,
  `amount` decimal(19,2) NOT NULL DEFAULT 0.00,
  `changed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
