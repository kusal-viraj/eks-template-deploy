--------Hashila----------2.1.115--------------

ALTER TABLE `payment_type_for_provider`
ADD COLUMN `short_code`  varchar(10) NULL AFTER `payment_provider`;