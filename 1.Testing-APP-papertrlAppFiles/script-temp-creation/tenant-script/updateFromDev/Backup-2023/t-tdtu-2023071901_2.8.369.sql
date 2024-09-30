CREATE TABLE vp_credit_note_account_details (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    credit_note_id INT,
    account_id INT(11) NULL DEFAULT NULL,
    description TEXT DEFAULT NULL,
    amount DECIMAL(19,2) DEFAULT NULL,
    po_account_detail_id INT(11) NULL DEFAULT NULL,
    FOREIGN KEY (account_id) REFERENCES common_account_number(id)
);


ALTER TABLE vp_credit_note ADD COLUMN export_status CHAR(1) DEFAULT 'N' NULL;

INSERT INTO common_grid_column_template (grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, align, search_type, placeholder, column_order, drop_down_id, column_width) VALUES ('49', 'creditNote.exportStatus', 'creditNote.exportStatus', 'Export Status', '1', '1', '0', '1', '1', '1', '0', 'left', 'dropdown', 'Export Status', '16', '14', '150');

INSERT INTO common_automation_document_section_relation ( document_id, section_id) VALUES (8, 9);

ALTER TABLE vp_po_account_detail ADD COLUMN credit_note_balance DECIMAL(19,2) NULL DEFAULT NULL;

ALTER TABLE hst_vp_po_account_detail ADD COLUMN credit_note_balance DECIMAL(19,2) NULL DEFAULT NULL;