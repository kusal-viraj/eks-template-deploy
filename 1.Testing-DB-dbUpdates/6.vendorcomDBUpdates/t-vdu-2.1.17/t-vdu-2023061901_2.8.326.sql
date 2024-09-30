------hashila 2.8.326----


ALTER TABLE vendor_payment_v_card 
ADD COLUMN account_id int NULL AFTER v_card_id,
ADD COLUMN project_id int NULL AFTER account_id;