ALTER TABLE vp_payment_transaction 
ADD COLUMN time_zone varchar(256) NULL AFTER scheduled_time;