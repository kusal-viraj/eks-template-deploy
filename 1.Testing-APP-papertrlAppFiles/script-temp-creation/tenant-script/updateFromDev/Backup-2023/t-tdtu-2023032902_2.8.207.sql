CREATE TABLE common_document_field (
	id INT(11) NOT NULL AUTO_INCREMENT,
	field_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE common_document_required_field_config (
	id INT(11) NOT NULL AUTO_INCREMENT,
	field_id INT(11) NOT NULL,
	enable TINYINT(1) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (field_id) REFERENCES common_document_field (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE common_document_field_config (
	id INT(11) NOT NULL AUTO_INCREMENT,
	document_id INT(11) NOT NULL,
	field_id INT(11) NOT NULL,
	enable TINYINT(1) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (field_id) REFERENCES common_document_field (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (document_id) REFERENCES common_automation_document_type (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE common_document_field_section_config (
	id INT(11) NOT NULL AUTO_INCREMENT,
	section_id INT(11) NOT NULL,
	field_config INT(11) NOT NULL,
	field_code VARCHAR(255) NOT NULL,
	enable TINYINT(1) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (field_config) REFERENCES common_document_field_config (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (section_id) REFERENCES common_automation_document_section (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE common_document_field_validation_message (
	id INT(11) NOT NULL AUTO_INCREMENT,
	field_id INT(11) NOT NULL,
	error_message VARCHAR(500)NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (field_id) REFERENCES common_document_field (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);


INSERT INTO common_document_field (id, field_name) VALUES (1, 'Project Code/Task');
INSERT INTO common_document_field (id, field_name) VALUES (2, 'Department');

INSERT INTO common_document_required_field_config (id, field_id, enable) VALUES (1, 1, false);
INSERT INTO common_document_required_field_config (id, field_id, enable) VALUES (2, 2, false);

INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (1, 1, 1, false);
INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (2, 1, 2, false);
INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (3, 2, 1, false);
INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (4, 2, 2, false);
INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (5, 4, 1, false);


INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (1, 1, 'projectCodeId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (3, 1, 'projectId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (4, 1, 'projectId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (1, 2, 'departmentId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (3, 2, 'departmentId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (4, 2, 'departmentId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (1, 3, 'projectCodeId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (2, 4, 'departmentId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (9, 4, 'departmentId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (1, 4, 'departmentId', false);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (2, 5, 'projectCodeId', false);


INSERT INTO common_document_field_validation_message (field_id, error_message) VALUES (1, 'Project code cannot be empty');
INSERT INTO common_document_field_validation_message (field_id, error_message) VALUES (2, 'Department cannot be empty');