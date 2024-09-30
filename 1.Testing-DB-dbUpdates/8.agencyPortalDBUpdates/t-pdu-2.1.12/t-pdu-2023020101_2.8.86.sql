---2.8.86----hashila------

ALTER TABLE `vp_payment_recipient_detail` 
ADD COLUMN `company_name` varchar(300) NULL AFTER `recipient_type`;
