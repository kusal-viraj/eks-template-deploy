
ALTER TABLE `common_account_type`
ADD COLUMN `short_name_underscore`  varchar(200) NULL AFTER `short_name_no_space`;

SET FOREIGN_KEY_CHECKS = 0;
 
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (1, 'Accounts receivable (A/R)', 'Accounts receivable', 'AccountsReceivable', 'ACCOUNTS_RECEIVABLE');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (2, 'Other Current Assets', 'Other Current Asset', 'OtherCurrentAsset', 'OTHER_CURRENT_ASSET');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (3, 'Bank', 'Bank', 'Bank', 'BANK');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (4, 'Fixed Assets', 'Fixed Asset', 'FixedAsset', 'FIXED_ASSET');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (5, 'Other Assets', 'Other Asset', 'OtherAsset', 'OTHER_ASSET');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (6, 'Accounts payable (A/P)', 'Accounts payable', 'AccountsPayable', 'ACCOUNTS_PAYABLE');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (7, 'Credit Card', 'Credit Card', 'CreditCard', 'CREDIT_CARD');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (8, 'Other Current Liabilities', 'Other Current Liability', 'OtherCurrentLiability', 'OTHER_CURRENT_LIABILITY');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (9, 'Long Term Liabilities', 'Long Term Liability', 'LongTermLiability', 'LONG_TERM_LIABILITY');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (10, 'Equity', 'Equity', 'Equity', 'EQUITY');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (11, 'Income', 'Income', 'Income', 'INCOME');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (12, 'Other Income', 'Other Income', 'OtherIncome', 'OTHER_INCOME');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (13, 'Cost of Goods Sold', 'Cost of Goods Sold', 'CostOfGoodsSold', 'COST_OF_GOODSSOLD');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (14, 'Expenses', 'Expense', 'Expense', 'EXPENSE');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (15, 'Other Expense', 'Other Expense', 'OtherExpense', 'OTHER_EXPENSE');
REPLACE INTO `common_account_type` (`id`, `name`, `short_name`, `short_name_no_space`, `short_name_underscore`) VALUES (16, 'Non Posting', 'Non Posting', 'NonPosting', 'NON_POSTING');


CREATE TABLE `common_object_sync_date_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(50) NOT NULL,
  `system_id` int(11) NOT NULL,
  `sync_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `common_integration_error`;
CREATE TABLE `common_integration_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(200) DEFAULT NULL,
  `error_message` text,
  `error_detail` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

