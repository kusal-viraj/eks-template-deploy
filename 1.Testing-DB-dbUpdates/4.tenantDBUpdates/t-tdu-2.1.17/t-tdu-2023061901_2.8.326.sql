----------hashila 2.8.326------

ALTER TABLE vp_payment_v_card 
ADD COLUMN account_id int NULL AFTER po_id,
ADD COLUMN project_id int NULL AFTER account_id;