CREATE TABLE IF NOT EXISTS common_bulk_column_filter_template (
id int(11) NOT NULL AUTO_INCREMENT,
document_type varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
);
 
INSERT INTO common_bulk_column_filter_template (id,document_type) VALUES
	(1, 'payment');
 
 
CREATE TABLE IF NOT EXISTS common_bulk_column_template (
  id int(11) NOT NULL AUTO_INCREMENT,
  column_name varchar(100) NOT NULL DEFAULT '0',
  field varchar(100) NOT NULL DEFAULT '0',
  document_type_id int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  KEY FK_common_bulk_column_template (document_type_id),
  CONSTRAINT FK_common_bulk_column_template FOREIGN KEY (document_type_id) REFERENCES common_bulk_column_filter_template (id)
);
 
INSERT INTO common_bulk_column_template (id, column_name, field, document_type_id) VALUES
	(1, 'Document No.', 'documentNo', 1),
	(2, 'Payee', 'payee', 1),
	(3, 'Reference No.', 'referenceNo', 1),
	(4, 'Payment Type', 'paymentType', 1),
	(5, 'Funding Account', 'fundingAccount', 1),
	(7, 'Transaction Amount', 'transactionAmount', 1),
	(8, 'Payment Date', 'paymentDate', 1),
	(9, 'Error description', 'errorDescriptions', 1);