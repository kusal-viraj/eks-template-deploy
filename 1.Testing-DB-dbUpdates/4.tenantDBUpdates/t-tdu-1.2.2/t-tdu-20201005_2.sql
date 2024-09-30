ALTER TABLE `common_chart_of_account`
	ALTER `account_detail_type` DROP DEFAULT;
ALTER TABLE `common_chart_of_account`
	CHANGE COLUMN `account_detail_type` `account_detail_type` INT(11) NULL AFTER `account_type`;
ALTER TABLE `common_chart_of_account`
	DROP FOREIGN KEY `FK_ACCOUNT_DETAIL_TYPE`;
ALTER TABLE `common_chart_of_account`
	DROP INDEX `FK_ACCOUNT_DETAIL_TYPE`;