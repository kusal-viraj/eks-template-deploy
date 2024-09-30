--loshitha  0.0.43----



ALTER TABLE papertrl_error_message
	CHANGE COLUMN usb_error_message checkeeper_error_message VARCHAR(300) NOT NULL;


INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (1, NULL, 'Missing required payer keys: address&rarrline1', 'payer Address Line 1 is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (2, NULL, 'Missing required payer keys: city', 'payer City is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (3, NULL, 'Missing required payer keys: zip', 'payer Zip Code is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (4, NULL, 'Missing required payer keys: state', 'payer State is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (5, NULL, 'Missing required payer keys: name', 'payer Name is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (6, NULL, 'Missing required payee keys: name', 'Payee Name is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (7, NULL, 'Missing required payee keys: address&rarrline1', 'Payee Address Line 1 is missing ', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (8, NULL, 'Missing required payee keys: city', 'Payee City is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (9, NULL, 'Missing required payee keys: zip', 'Payee Zip Code is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (10, NULL, 'Missing required payee keys: state', 'Payee State is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (11, NULL, 'Missing required check keys: check_number', 'Check Number is missing', 1);
INSERT INTO papertrl_error_message (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (12, NULL, 'Missing required check keys: Bank Routing/Account or Bank ID', 'Account Number or Bank Routing Number is missing', 1);
INSERT INTO `papertrl_error_message` (id, field_name, checkeeper_error_message, papertrl_message, type) VALUES (13, NULL, 'Invalid Signature', 'Invalid Signature', 2);
