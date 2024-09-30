ALTER TABLE vp_payment_check
    ADD COLUMN retry_attempts INT DEFAULT 0;

ALTER TABLE vp_payment_v_card
    ADD COLUMN retry_attempts INT DEFAULT 0;

ALTER TABLE vp_payment_transaction
    ADD COLUMN retry_attempts INT DEFAULT 0;