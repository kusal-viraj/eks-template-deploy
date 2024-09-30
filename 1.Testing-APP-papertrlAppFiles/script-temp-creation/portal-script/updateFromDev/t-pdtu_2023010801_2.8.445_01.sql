---chandima 2.8.455----



CREATE TABLE common_department_address (
	id INT(11) NOT NULL,
	address_line_1 VARCHAR(300) NULL DEFAULT NULL,
	address_line_2 VARCHAR(300) NULL DEFAULT NULL,
	type VARCHAR(5) NULL DEFAULT NULL,
	country VARCHAR(200) NULL DEFAULT NULL,
	city VARCHAR(200) NULL DEFAULT NULL,
	zipcode VARCHAR(200) NULL DEFAULT NULL,
	address_state VARCHAR(30) NULL DEFAULT NULL,
	department_id INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK__common_department FOREIGN KEY (department_id) REFERENCES common_department (id)
)
COLLATE='latin1_swedish_ci'
;



ALTER TABLE common_department
	ADD COLUMN contact_person VARCHAR(50) NULL DEFAULT '' AFTER status;



ALTER TABLE common_department
	ADD COLUMN use_for_po_creation TINYINT(1) NOT NULL AFTER created_username;


ALTER TABLE common_department_address
	CHANGE COLUMN id id INT(11) NOT NULL AUTO_INCREMENT FIRST;