ALTER TABLE `common_chart_of_account`
ADD COLUMN `number` VARCHAR(100) NOT NULL AFTER
`account_detail_type`, CHANGE COLUMN `name` `name` VARCHAR(200) NULL COLLATE 'latin1_swedish_ci' AFTER `number`;