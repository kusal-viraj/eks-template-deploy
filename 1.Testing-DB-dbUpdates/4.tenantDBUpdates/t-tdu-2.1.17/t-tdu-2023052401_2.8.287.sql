---hashila--2.8.287------


ALTER TABLE vp_payment_v_card 
MODIFY COLUMN cancel_reason varchar(255) NULL DEFAULT NULL AFTER card_number;

