-----hashila 2.8.283---------


ALTER TABLE vp_payment_v_card 
ADD COLUMN card_type char(1) NULL AFTER tp_id,
ADD COLUMN created_for char(1) NULL AFTER cancel_reason,
ADD COLUMN contact_number varchar(20) NULL AFTER created_for,
ADD COLUMN first_name varchar(100) NULL AFTER contact_number,
ADD COLUMN last_name varchar(100) NULL AFTER first_name,
ADD COLUMN po_id int NULL AFTER last_name;

ALTER TABLE vp_payment_v_card 
CHANGE COLUMN created_for payee_type char(1) NULL DEFAULT NULL AFTER cancel_reason;

ALTER TABLE vp_payment_v_card 
MODIFY COLUMN card_owner varchar(210) NULL DEFAULT NULL AFTER nick_name;

