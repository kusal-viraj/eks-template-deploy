--hashila 2.9.93--


ALTER TABLE vendor_payment_v_card 
ADD COLUMN provider_id int NULL AFTER community_vendor_id,
ADD COLUMN funding_Account_id int NULL AFTER provider_id;