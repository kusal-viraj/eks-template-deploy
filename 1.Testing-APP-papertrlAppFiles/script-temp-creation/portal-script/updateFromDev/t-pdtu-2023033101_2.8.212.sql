
ALTER TABLE vp_payment_recipient_detail DROP FOREIGN KEY recipient_user_fk;

ALTER TABLE vp_payment_recipient_detail 
CHANGE COLUMN user_id user_name varchar(100) NULL DEFAULT NULL AFTER vendor_id;



ALTER TABLE vp_payment_recipient_detail 
ADD COLUMN preferred_payment_type int NULL AFTER user_name;

CREATE TABLE vp_payment_type_for_user  (
  id int NOT NULL AUTO_INCREMENT,
  payment_type_id int NOT NULL,
  user_name varchar(100) NOT NULL,
  PRIMARY KEY (id)
);
