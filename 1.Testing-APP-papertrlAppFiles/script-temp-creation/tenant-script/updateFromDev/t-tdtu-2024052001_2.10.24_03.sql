---loshitha 2.10.24---



ALTER TABLE vp_payment_bank_account
CHANGE COLUMN next_export_time nacha_ach_next_export_time DATETIME;
 
ALTER TABLE vp_payment_bank_account
ADD COLUMN positive_pay_next_export_time DATETIME;
