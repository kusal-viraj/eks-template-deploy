---madushaa-2.8.266-----


ALTER TABLE `vp_payment_v_card_audit_trial` 
ADD COLUMN `cancel_reason` varchar(200) NULL AFTER `merchant_id`;