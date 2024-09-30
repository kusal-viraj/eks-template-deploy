-----------chandima 2.12.2-----------------


CREATE TABLE IF NOT EXISTS vp_payment_provider_logo (
  id int(11) NOT NULL AUTO_INCREMENT,
  provider_id int(11) DEFAULT NULL,
  logo_path varchar(255) DEFAULT NULL,
  attachment_name varchar(255) DEFAULT NULL,
  file_type varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);
