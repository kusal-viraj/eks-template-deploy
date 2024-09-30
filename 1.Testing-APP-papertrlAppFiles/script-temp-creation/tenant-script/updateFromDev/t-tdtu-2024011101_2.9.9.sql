ALTER TABLE common_department
	ADD COLUMN exist_shipping_address TINYINT(1) NOT NULL AFTER use_for_po_creation;



ALTER TABLE common_department
	CHANGE COLUMN contact_person contact_person VARCHAR(100) NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER status;