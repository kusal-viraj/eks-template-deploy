---hashila 2.9.192----



ALTER TABLE vp_payment_check 
ADD COLUMN cancel_reason varchar(255) NULL AFTER time_zone;