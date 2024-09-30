

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE vp_credit_card_statement_detail;
TRUNCATE TABLE vp_receipt_mst;
TRUNCATE TABLE vp_credit_card_statement;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE `vp_credit_card_statement_detail` 
MODIFY COLUMN `transaction_date` datetime(0) NULL DEFAULT NULL AFTER `statement_id`,
MODIFY COLUMN `posting_date` datetime(0) NULL DEFAULT NULL AFTER `transaction_date`;

UPDATE `common_grid_column_template` SET `is_sortable` = 0, `search_type` = '' WHERE `grid_id` = 55 AND `field` = 'transaction.account';
UPDATE `common_grid_column_template` SET `is_sortable` = 0, `search_type` = '' WHERE `grid_id` = 55 AND `field` = 'transaction.projectCode';

UPDATE `common_grid_column_template` SET `is_sortable` = 0, `search_type` = '' WHERE `grid_id` = 54 AND `field` = 'transaction.account';
UPDATE `common_grid_column_template` SET `is_sortable` = 0, `search_type` = '' WHERE `grid_id` = 54 AND `field` = 'transaction.projectCode';

