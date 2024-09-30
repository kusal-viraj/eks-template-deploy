----------hashila 2.10.11-----------

ALTER TABLE vp_payment_check 
ADD COLUMN check_date datetime NULL AFTER cancel_reason;