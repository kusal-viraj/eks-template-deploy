------indra--madhusa---2.1.48---------

DROP TABLE IF EXISTS `umm_user_department`;
CREATE TABLE IF NOT EXISTS `umm_user_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `sub_account_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
