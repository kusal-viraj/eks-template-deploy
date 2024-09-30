ALTER TABLE vp_payment_v_card 
ADD COLUMN precise_pay tinyint NOT NULL AFTER effective_until,
ADD COLUMN ref_no varchar(16) NULL AFTER precise_pay;