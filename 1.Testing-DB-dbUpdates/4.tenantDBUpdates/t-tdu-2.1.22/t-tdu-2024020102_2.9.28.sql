--sithum 2.9.28--


ALTER TABLE common_inbox_attachment
	ADD COLUMN is_valid TINYINT NULL DEFAULT NULL AFTER upload_status;