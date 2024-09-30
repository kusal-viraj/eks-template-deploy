--------Indra--------2.3.42---------

DROP TABLE IF EXISTS `papertrl_inbox_config`;
CREATE TABLE IF NOT EXISTS `papertrl_inbox_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(200) NOT NULL,
  `port` int(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `tenant_id` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
