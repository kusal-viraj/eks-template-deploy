CREATE TABLE IF NOT EXISTS vp_payment_mail_option (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(20) DEFAULT NULL,
  value char(1) DEFAULT NULL,
  status char(1) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO vp_payment_mail_option (id, name, value, status) VALUES
	(1, 'First Class (F)', 'F', 'A'),
	(2, 'Priority (P)', 'P', 'A'),
	(3, 'Next Day (N)', 'N', 'A');


ALTER TABLE vp_payment_recipient_detail
	ADD COLUMN check_to_be_mail TINYINT(1) NULL DEFAULT NULL AFTER payee_token,
	ADD COLUMN mailOption TINYINT(1) NULL DEFAULT NULL AFTER check_to_be_mail;

