CREATE TABLE IF NOT EXISTS credit_note_csv_export_format (
  id int(11) NOT NULL AUTO_INCREMENT,
  format_name varchar(50) NOT NULL,
  format_code varchar(50) NOT NULL,
  active tinyint(1) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO credit_note_csv_export_format (id, format_name, format_code, active) VALUES (1, 'Default', 'DEFAULT', 1);
INSERT INTO credit_note_csv_export_format (id, format_name, format_code, active) VALUES (2, 'SAGE', 'SAGE', 0);


INSERT INTO common_grid_column_template (grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (49, 'checkbox', 'checkbox', '', 1, 0, 0, 0, 0, 0, 1, 'left', 'center', 'checkbox', '', 1, NULL, 50, NULL);


INSERT INTO umm_menu_privilage (id, menu_id, privilage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (529, 1049, 47, 'CREDIT_NOTE_CSV_EXPORT', 'System', '2023-03-08 10:50:00', NULL, NULL, NULL, NULL);

INSERT INTO umm_role_previlege (role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 529, NULL, 'System', '2023-03-08 10:50:00', NULL, NULL, NULL, NULL);