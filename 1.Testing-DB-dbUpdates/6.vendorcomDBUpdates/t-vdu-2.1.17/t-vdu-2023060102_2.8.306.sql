
ALTER TABLE vendor_payment_v_card 
ADD COLUMN wallet_configured char(1) NOT NULL AFTER sync_status;

UPDATE vendor_payment_v_card SET wallet_configured = 'N';