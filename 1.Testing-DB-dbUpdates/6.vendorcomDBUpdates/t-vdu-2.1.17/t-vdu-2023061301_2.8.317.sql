-------hashila 2.8.317--------



CREATE TABLE vendor_sms_type  (
  id int NOT NULL AUTO_INCREMENT,
  value varchar(50) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE vendor_sms_mst  (
  id int NOT NULL AUTO_INCREMENT,
  message text NOT NULL,
  phone_number varchar(100) NOT NULL,
  status char(1) NOT NULL,
  attempts int NULL DEFAULT 0,
  type_id int NULL DEFAULT 0,
  created_by varchar(100) NOT NULL DEFAULT '',
  created_on datetime(0) NOT NULL,
  update_by varchar(100) NULL DEFAULT NULL,
  update_on datetime(0) NULL DEFAULT NULL,
  delete_by varchar(100) NULL DEFAULT NULL,
  delete_on datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX FK_vendor_sms_mst_vendorn_sms_type(type_id),
  CONSTRAINT FK_vendor_sms_mst_vendor_sms_type FOREIGN KEY (type_id) REFERENCES vendor_sms_type (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE vendor_one_time_password  (
  id int NOT NULL AUTO_INCREMENT,
  created_on datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  expire_in datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  one_time_password varchar(50) NOT NULL,
  created_for varchar(50) NOT NULL,
  phone_number varchar(50) NOT NULL,
  status char(1) NOT NULL,
  PRIMARY KEY (id)
);
