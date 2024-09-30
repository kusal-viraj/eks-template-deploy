--2.8.320--hasila---


ALTER TABLE vp_payment_v_card_audit_trial 
MODIFY COLUMN balance_amount decimal(19, 2) NULL DEFAULT NULL AFTER transaction_ref_no,
MODIFY COLUMN amount decimal(19, 2) NULL DEFAULT NULL AFTER balance_amount,
ADD COLUMN top_up_amount decimal(19, 2) NULL AFTER cancel_reason,
ADD COLUMN effective_until datetime(0) NULL AFTER top_up_amount,
ADD COLUMN nick_name varchar(200) NULL AFTER effective_until,
ADD COLUMN redeemed_amount decimal(19, 2) NULL AFTER nick_name;

UPDATE common_grid_column_template SET column_width = 390 WHERE grid_id = 62 AND field = 'txn.reason';
UPDATE common_grid_column_user_wice SET column_width = 390 WHERE grid_id = 62 AND field = 'txn.reason';