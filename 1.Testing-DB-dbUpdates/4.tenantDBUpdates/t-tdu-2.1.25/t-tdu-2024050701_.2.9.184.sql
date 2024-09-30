
CREATE TABLE IF NOT EXISTS bank_account_signature_attachment (
  id int(11) NOT NULL AUTO_INCREMENT,
  bankMstId int(11) DEFAULT NULL,
  signature_Path varchar(255) DEFAULT NULL,
  attachment_Name varchar(255) DEFAULT NULL,
  file_Type varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);
