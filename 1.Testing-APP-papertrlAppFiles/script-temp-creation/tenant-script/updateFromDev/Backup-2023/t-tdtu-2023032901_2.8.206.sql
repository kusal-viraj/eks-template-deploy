ALTER TABLE vp_payment_batch_bill_wise_transaction
  RENAME TO vp_payment_transaction;
  
CREATE TABLE vp_payment_check  (
  id int NOT NULL,
  tp_id varchar(20) NULL,
  amount decimal(19, 2) NOT NULL,
  vendor_id int NULL,
  user_id int NULL,
  status char NOT NULL,
  sync_status char NOT NULL,
  created_by varchar(100) NOT NULL,
  created_on datetime NOT NULL,
  created_by_name varchar(200) NULL,
  update_by varchar(100) NULL,
  update_on datetime NULL,
  delete_by varchar(100) NULL,
  delete_on datetime NULL,
  PRIMARY KEY (id)
);  
 
   
CREATE TABLE vp_payment_v_card  (
  id int NOT NULL,
  tp_id varchar(20) NULL,
  amount decimal(19, 2) NOT NULL,
  top_up_amount decimal(19, 2) NOT NULL,
  vendor_id int NULL,
  user_id int NULL,
  status char NOT NULL,
  sync_status char NOT NULL,
  created_by varchar(100) NOT NULL,
  created_on datetime NOT NULL,
  created_by_name varchar(200) NULL,
  update_by varchar(100) NULL,
  update_on datetime NULL,
  delete_by varchar(100) NULL,
  delete_on datetime NULL,
  PRIMARY KEY (id)
);  
  
ALTER TABLE vp_payment_v_card 
ADD COLUMN nick_name varchar(200) NULL AFTER tp_id;


ALTER TABLE vp_payment_transaction 
ADD COLUMN check_id int NULL AFTER bank_account_id,
ADD COLUMN v_card_id int NULL AFTER check_id;

ALTER TABLE vp_payment_v_card	
ADD COLUMN balance_amount decimal(19, 2) NULL AFTER amount;

ALTER TABLE vp_payment_v_card 
ADD COLUMN card_owner varchar(200) NULL AFTER nick_name,
ADD COLUMN expire_on datetime(0) NULL AFTER sync_status;

ALTER TABLE vp_payment_transaction 
ADD COLUMN sync_status char(1) NULL AFTER payment_status;

ALTER TABLE vp_payment_check 
CHANGE COLUMN user_id user_name varchar(100) NULL DEFAULT NULL AFTER vendor_id,
ADD COLUMN payee varchar(255) NULL AFTER amount;

ALTER TABLE vp_payment_v_card 
CHANGE COLUMN user_id user_name varchar(100) NULL DEFAULT NULL AFTER vendor_id;

ALTER TABLE vp_payment_check 
MODIFY COLUMN tp_id varchar(50) NULL DEFAULT NULL AFTER id,
ADD COLUMN check_no varchar(50) NULL AFTER delete_on;

ALTER TABLE vp_payment_check 
ADD COLUMN batch_id int NULL AFTER tp_id;

ALTER TABLE vp_payment_v_card 
ADD COLUMN batch_id int NULL AFTER tp_id;

ALTER TABLE vp_payment_check 
MODIFY COLUMN id int NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE vp_payment_v_card 
MODIFY COLUMN id int NOT NULL AUTO_INCREMENT FIRST;

CREATE TABLE vp_transaction_status  (
  id int NOT NULL AUTO_INCREMENT,
  status char(1) NOT NULL,
  description varchar(250) NULL,
  PRIMARY KEY (id)
);

ALTER TABLE vp_payment_recipient_detail DROP FOREIGN KEY recipient_user_fk;

ALTER TABLE vp_payment_recipient_detail 
CHANGE COLUMN user_id user_name varchar(100) NULL DEFAULT NULL AFTER vendor_id;



