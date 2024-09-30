----------loshitha 2.8.299------




ALTER TABLE vp_bill
	ADD COLUMN account_period_month INT(11) NULL DEFAULT NULL AFTER customer_invoice_id,
	ADD COLUMN account_period_year INT(11) NULL DEFAULT NULL AFTER account_period_month;


ALTER TABLE hst_vp_bill
	ADD COLUMN account_period_month INT(11) NULL DEFAULT NULL AFTER customer_invoice_id,
	ADD COLUMN account_period_year INT(11) NULL DEFAULT NULL AFTER account_period_month;


INSERT INTO common_grid_column_template (grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (14, 'bill.accountPeriodMonth', 'bill.accountPeriodMonth', 'Period – month', 1, 1, 0, 1, 1, 1, 0, NULL, 'left', 'dropdown', 'Period – month', 27, NULL, 150, NULL);


INSERT INTO common_grid_column_template (grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (14, 'bill.accountPeriodYear', 'bill.accountPeriodYear', 'Period – year', 1, 1, 0, 1, 1, 1, 0, NULL, 'left', 'dropdown', 'Period – month', 28, NULL, 150, NULL);


INSERT INTO common_drop_down_url (id, name, url) VALUES (39, 'Numbers of months', '/common_service/sec_view_numbers_of_months');
INSERT INTO common_drop_down_url (id, name, url) VALUES (40, 'Numbers of years', '/common_service/sec_view_numbers_of_years');


INSERT INTO common_document_field (id, field_name) VALUES (3, 'Period – Month');
INSERT INTO common_document_field (id, field_name) VALUES (4, 'Period - Year');


INSERT INTO common_document_required_field_config (id, field_id, enable) VALUES (3, 3, 0);
INSERT INTO common_document_required_field_config (id, field_id, enable) VALUES (4, 4, 0);

INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (6, 1, 3, 0);
INSERT INTO common_document_field_config (id, document_id, field_id, enable) VALUES (7, 1, 4, 0);

INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (1, 6, 'accountPeriodMonth', 0);
INSERT INTO common_document_field_section_config (section_id, field_config, field_code, enable) VALUES (1, 7, 'accountPeriodYear', 0);


INSERT INTO common_document_field_validation_message (id, field_id, error_message) VALUES (3, 3, 'Accounting Period – Month cannot be empty');
INSERT INTO common_document_field_validation_message (id, field_id, error_message) VALUES (4, 4, 'Accounting Period – Year cannot be empty');

























