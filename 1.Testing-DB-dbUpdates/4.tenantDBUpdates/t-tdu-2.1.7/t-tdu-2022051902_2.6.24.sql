--------2.6.24---Amal-----------

ALTER TABLE `support_ticket` ADD COLUMN `other_feature_note` VARCHAR(400) NULL DEFAULT NULL AFTER `issue_key`;
