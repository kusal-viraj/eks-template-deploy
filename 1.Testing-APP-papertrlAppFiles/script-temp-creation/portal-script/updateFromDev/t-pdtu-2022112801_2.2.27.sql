-----this-tag-shoud-be-change-as-tr-2.2.36-dr-2.2.30-------


CREATE TABLE IF NOT EXISTS `vp_bill_csv_export_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(50) NOT NULL,
  `format_code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `vp_bill_csv_export_format` (`id`, `format_name`, `format_code`, `active`) VALUES
	(1, 'Default', 'DEFAULT', 1),
	(2, 'Business Central', 'BC', 0),
	(3, 'Blackbaud', 'BB', 0);
