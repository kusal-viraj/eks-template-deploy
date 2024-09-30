---sithum 2.9.10---


ALTER TABLE common_inbox_attachment
	CHANGE COLUMN attachment_url attachment_url VARCHAR(1000) NULL DEFAULT NULL AFTER id,
	CHANGE COLUMN file_name file_name VARCHAR(1000) NULL DEFAULT NULL AFTER attachment_url;

ALTER TABLE common_department_address
	CHANGE COLUMN address_state address_state VARCHAR(200) NULL DEFAULT NULL AFTER zipcode;