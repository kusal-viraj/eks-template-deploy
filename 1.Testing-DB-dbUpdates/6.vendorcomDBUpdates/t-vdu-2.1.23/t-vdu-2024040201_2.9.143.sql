--hashiala 2.9.143---


ALTER TABLE vendor_payment_v_card 
CHANGE COLUMN funding_Account_id funding_account_id int NULL DEFAULT NULL AFTER provider_id;