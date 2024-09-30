----sithum 2.9.6--



ALTER TABLE common_inbox_attachment
	ADD COLUMN upload_status CHAR(50) NULL DEFAULT NULL AFTER original_attachment_id;

ALTER TABLE common_inbox_email
	ADD COLUMN isupload TINYINT NULL DEFAULT NULL AFTER delete_on;

ALTER TABLE common_inbox_attachment
	CHANGE COLUMN email_id email_id INT(11) NULL AFTER segregated_status;