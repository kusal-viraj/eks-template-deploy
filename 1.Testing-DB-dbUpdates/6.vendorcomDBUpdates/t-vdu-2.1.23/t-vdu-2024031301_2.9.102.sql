---2.9.102--Chandima---

ALTER TABLE vendor_payment_recipient_detail
	CHANGE COLUMN mailOption mail_option TINYINT(1) NULL DEFAULT NULL;
