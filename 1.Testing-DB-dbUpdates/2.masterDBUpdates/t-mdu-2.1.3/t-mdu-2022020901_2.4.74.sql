--------indra---2.4.74-----

DROP TABLE IF EXISTS `papertrl_customer_ocr_usage`;
CREATE TABLE IF NOT EXISTS `papertrl_customer_ocr_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(100) NOT NULL,
  `bill_id` int(15) NOT NULL,
  `date` date NOT NULL,
  `page_count` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
