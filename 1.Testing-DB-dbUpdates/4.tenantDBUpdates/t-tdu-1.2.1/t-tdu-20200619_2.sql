ALTER TABLE vp_expense_mst AUTO_INCREMENT=10000;

ALTER TABLE `vp_expense_attachments`
ADD COLUMN `description` varchar(200) NOT NULL AFTER `deleted_on`;