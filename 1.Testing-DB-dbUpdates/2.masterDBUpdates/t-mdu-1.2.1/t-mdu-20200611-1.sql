DROP TABLE IF EXISTS `papertrl_system_module`;
CREATE TABLE IF NOT EXISTS `papertrl_system_module` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`status` char(1) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `papertrl_system_module` (`id`, `name`, `status`) VALUES
(1, 'PO Module', 'A'),
(2, 'Expense Module', 'A'),
(3, 'Invoice Module', 'A'),
(4, 'GRN Module', 'A');