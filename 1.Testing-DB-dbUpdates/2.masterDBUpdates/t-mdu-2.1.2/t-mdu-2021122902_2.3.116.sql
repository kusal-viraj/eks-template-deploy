-------Amal-----2.3.116----------

CREATE TABLE `papertrl_feature` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT '',
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `papertrl_feature_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `tenant_id` varchar(200) NOT NULL,
  `enable_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_papertrl_feature_config_papertrl_feature` (`feature_id`),
  CONSTRAINT `FK_papertrl_feature_config_papertrl_feature` FOREIGN KEY (`feature_id`) REFERENCES `papertrl_feature` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `papertrl_feature` (`id`, `name`, `status`) VALUES (1, 'Approval stamp on the table', 'A');



