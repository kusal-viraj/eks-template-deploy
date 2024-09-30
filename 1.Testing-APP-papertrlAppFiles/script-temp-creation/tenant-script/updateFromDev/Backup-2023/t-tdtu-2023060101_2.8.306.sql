ALTER TABLE vp_payment_v_card 
ADD COLUMN wallet_configured char(1) NOT NULL AFTER sync_status;

