---hashila--2.8.214----


CREATE TABLE vendor_payment_recipient_detail  (
  id int NOT NULL AUTO_INCREMENT,
  recipient_type varchar(100) NULL DEFAULT NULL,
  company_name varchar(300) NULL DEFAULT NULL,
  account_type varchar(100) NULL DEFAULT NULL,
  account_number varchar(100) NULL DEFAULT NULL,
  account_routing_number varchar(100) NULL DEFAULT NULL,
  vendor_id int NULL DEFAULT NULL,
  preferred_payment_type int NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE vendor_payment_recipient_detail 
ADD COLUMN status char(1) NOT NULL AFTER preferred_payment_type;

UPDATE vendor_payment_recipient_detail SET status = 'A';

CREATE TABLE vendor_payment_type  (
  id int NOT NULL AUTO_INCREMENT,
  payment_type_id int NOT NULL,
  vendor_id int NOT NULL,
  PRIMARY KEY (id)
);

