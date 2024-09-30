---hashila 2.9.55---


ALTER TABLE vp_payment_check 
ADD COLUMN provider_id int NULL AFTER batch_id;

ALTER TABLE vp_payment_v_card 
ADD COLUMN provider_id int NULL AFTER batch_id;