DROP TABLE IF EXISTS `vp_expense_additional_data`;
CREATE TABLE IF NOT EXISTS `vp_expense_additional_data` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_value` varchar(200) DEFAULT NULL,
`field_id` int(15) NOT NULL,
`field_name` varchar(50) DEFAULT NULL,
`expense_mst_id` int(15) NOT NULL,
PRIMARY KEY (`id`),
KEY `FK__vp_expense_mst` (`expense_mst_id`),
CONSTRAINT `FK__vp_expense_mst` FOREIGN KEY (`expense_mst_id`) REFERENCES
`vp_expense_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;