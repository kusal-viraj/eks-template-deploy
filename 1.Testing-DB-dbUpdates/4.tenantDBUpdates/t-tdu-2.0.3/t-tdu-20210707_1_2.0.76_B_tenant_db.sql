ALTER TABLE `vp_po_account_detail`
ADD COLUMN `account_number`  varchar(50) NULL AFTER `amount`,
ADD COLUMN `account_name`  varchar(300) NULL AFTER `account_number`;