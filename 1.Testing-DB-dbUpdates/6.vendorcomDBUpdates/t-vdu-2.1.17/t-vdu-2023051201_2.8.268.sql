---hashila--2.8.268-----


ALTER TABLE `vendor_payment_recipient_detail` 
ADD COLUMN `payee_token` varchar(250) NULL AFTER `status`;
