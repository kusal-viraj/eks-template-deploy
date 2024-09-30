ALTER TABLE vp_credit_note_item_details
	ADD COLUMN account_id INT(11) NULL DEFAULT NULL AFTER po_detail_id;