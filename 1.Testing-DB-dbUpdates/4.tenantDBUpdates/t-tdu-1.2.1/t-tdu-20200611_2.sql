DROP TABLE IF EXISTS `common_additional_field`;
CREATE TABLE IF NOT EXISTS `common_additional_field` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`field_name` varchar(80) NOT NULL,
`max_length` int(5) NOT NULL,
`display_order` int(5) NOT NULL,
`module_id` int(11) NOT NULL,
`status` char(1) NOT NULL DEFAULT 'A',
`deleted_by` varchar(50) DEFAULT NULL,
`deleted_on` date DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

