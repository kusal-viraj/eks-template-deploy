
ALTER TABLE `vp_payment_recipient_detail` 
ADD COLUMN `payee_token` varchar(250) NULL AFTER `status`;

