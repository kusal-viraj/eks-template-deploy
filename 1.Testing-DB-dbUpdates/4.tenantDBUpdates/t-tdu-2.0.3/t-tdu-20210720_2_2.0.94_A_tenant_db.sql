ALTER TABLE `vp_bill_attachment`
	CHANGE COLUMN `attachment_url` `attachment_url` VARCHAR(300) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `file_type`;