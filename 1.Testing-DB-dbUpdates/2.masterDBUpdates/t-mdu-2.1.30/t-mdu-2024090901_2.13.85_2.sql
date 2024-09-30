--------sithum-2.13.85--------

CREATE TABLE payment_config_unattended (
  id int(11) NOT NULL AUTO_INCREMENT,
  tenant_id varchar(50) NOT NULL,
  status CHAR(1),
  config_id INT,
  PRIMARY KEY (`id`)
);