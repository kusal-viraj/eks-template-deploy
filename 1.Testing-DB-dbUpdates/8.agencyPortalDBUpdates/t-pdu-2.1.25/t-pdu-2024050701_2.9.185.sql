------------------------2.9.185 dasindu------------

ALTER TABLE `umm_user_mst`
	ADD COLUMN `avs_validated` TINYINT(1) NOT NULL DEFAULT '0' AFTER `jira_account_id`;