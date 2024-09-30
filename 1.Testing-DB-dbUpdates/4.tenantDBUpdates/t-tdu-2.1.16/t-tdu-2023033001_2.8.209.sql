------------hashila 2.8.209------




ALTER TABLE vp_payment_recipient_detail 
ADD COLUMN preferred_payment_type int NULL AFTER user_name;

CREATE TABLE vp_payment_type_for_vendor  (
  id int NOT NULL AUTO_INCREMENT,
  payment_type_id int NOT NULL,
  vendor_id int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE vp_payment_type_for_user  (
  id int NOT NULL AUTO_INCREMENT,
  payment_type_id int NOT NULL,
  user_name varchar(100) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE vp_payment_check 
ADD COLUMN cancellable_date datetime NULL AFTER check_no,
ADD COLUMN scheduled_date datetime NULL AFTER cancellable_date,
ADD COLUMN scheduled_time varchar(5) NULL AFTER scheduled_date;

ALTER TABLE vp_payment_v_card 
ADD COLUMN cancellable_date datetime NULL AFTER delete_on,
ADD COLUMN scheduled_date datetime NULL AFTER cancellable_date,
ADD COLUMN scheduled_time varchar(5) NULL AFTER scheduled_date;


























