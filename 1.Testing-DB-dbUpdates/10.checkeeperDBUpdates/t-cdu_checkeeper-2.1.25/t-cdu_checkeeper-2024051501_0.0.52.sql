----------0.052-loshitha---------- 

ALTER TABLE payment_recipient_detail
ADD COLUMN payee_token VARCHAR(255),
ADD COLUMN check_to_be_mail TINYINT(1);
