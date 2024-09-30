----2.9.107--Chandima----

ALTER TABLE vp_payment_recipient_detail
	CHANGE COLUMN mailOption mail_option TINYINT(1) NULL DEFAULT NULL;

UPDATE vp_payment_recipient_detail SET mail_option ='1' WHERE  mail_option IS null ;
