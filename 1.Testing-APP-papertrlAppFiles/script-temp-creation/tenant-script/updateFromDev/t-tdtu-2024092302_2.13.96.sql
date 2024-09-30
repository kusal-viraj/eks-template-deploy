ALTER TABLE vp_payment_unattended_transaction
ADD COLUMN created_by  varchar(100) NULL AFTER status,
ADD COLUMN update_by  varchar(100) NULL AFTER created_by,
ADD COLUMN created_on  datetime NULL AFTER update_by,
ADD COLUMN update_on  datetime NULL AFTER created_on;