ALTER TABLE common_inbox_attachment
	CHANGE COLUMN attachment_url attachment_url VARCHAR(1000) NULL DEFAULT NULL AFTER uuid,
	CHANGE COLUMN file_name file_name VARCHAR(1000) NULL DEFAULT NULL AFTER attachment_url;