

CREATE TABLE IF NOT EXISTS vp_bank_payment_type_hst (
  id int(11) NOT NULL AUTO_INCREMENT,
  payment_type_id int(11) NOT NULL,
  bank_account_id int(11) DEFAULT NULL,
    is_default Boolean,
payment_channel_id INT(20) DEFAULT NULL,
      created_on datetime,
    created_by VARCHAR(255),
    delete_on datetime,
    delete_by VARCHAR(255),
     update_on datetime,
    update_by VARCHAR(255),
  PRIMARY KEY (id)
);




CREATE TABLE IF NOT EXISTS vp_payment_bank_account_hst (
  id int(11) NOT NULL AUTO_INCREMENT,
  bank_id int(11) DEFAULT NULL,
  account_no varchar(255) DEFAULT NULL,
  account_nic_name varchar(255) DEFAULT NULL,
  company_name varchar(255) DEFAULT NULL,
  status char(1) DEFAULT NULL,
  file_url varchar(255) DEFAULT NULL,
  company_id varchar(255) DEFAULT NULL,
  bank_routing_no varchar(255) DEFAULT NULL,
  transit_no varchar(255) DEFAULT NULL,
  check_sequence_number varchar(255) DEFAULT NULL,
  default_funding_account tinyint(1) DEFAULT NULL,
  encoded_account_no varchar(255) DEFAULT NULL,
  encoded_bank_routing_no varchar(255) DEFAULT NULL,
  virtual_card_acc_id varchar(255) DEFAULT NULL,
  digital_card_acc_id varchar(255) DEFAULT NULL,
  account_type varchar(50) DEFAULT NULL,
  next_export_time date DEFAULT NULL,
  next_file_id varchar(50) DEFAULT NULL,
  export_file_path varchar(50) DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  created_by varchar(255) DEFAULT NULL,
  delete_on datetime DEFAULT NULL,
  delete_by varchar(255) DEFAULT NULL,
  update_on datetime DEFAULT NULL,
  update_by varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

