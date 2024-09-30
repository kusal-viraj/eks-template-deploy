----------hashila-2.8.310---------



INSERT INTO vendor_menu(id, name, display_text, menu_style, url, tab, type, super_type, super_type_2, department, menu_order, display_icon, short_name, detail_text, status, portal_menu, individual_tenant_menu, vendor_community_menu, mobile_menu, version, auth_code, slim_menu, created_by, created_on, update_by, update_on, delete_by, delete_on, hierachy) VALUES (1024, 'Digital Card', 'Digital Card', 'pi pi-money-bill', 'digital-card', NULL, 'S', 1004, NULL, 'Admin', 0, 'pi pi-money-bill', 'Digital Card', 'Digital Card', 'A', 0, 0, 1, 0, 'V2', 'DIGITAL_CARD', 1, 'System', '2023-06-02 10:06:43', NULL, NULL, NULL, NULL, '1004');

INSERT INTO vendor_menu_privilage(id, menu_id, prililage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (224, 1024, 3, 'VENDOR_DIGITAL_CARD_DETAIL_VIEW', 'System', '2023-06-02 10:10:18', NULL, NULL, NULL, NULL);

INSERT INTO vendor_menu_privilage(id, menu_id, prililage_id, auth_code, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (225, 1024, 10, 'VENDOR_DIGITAL_CARD_VIEW_AUDIT_TRIAL', 'System', '2023-06-02 10:13:07', NULL, NULL, NULL, NULL);


INSERT INTO vendor_role_previlege(role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 1024, NULL, 'System', '2023-06-02 10:15:57', NULL, NULL, NULL, NULL);
INSERT INTO vendor_role_previlege(role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 224, NULL, 'System', '2023-06-02 10:16:29', NULL, NULL, NULL, NULL);
INSERT INTO vendor_role_previlege(role_id, privilege_id, sub_account_id, created_by, created_on, update_by, update_on, delete_by, delete_on) VALUES (1, 225, NULL, 'System', '2023-06-02 10:16:42', NULL, NULL, NULL, NULL);

UPDATE vendor_menu SET menu_order = 7 WHERE id = 1024;

INSERT INTO vendor_grid_template(id, grid_name) VALUES (28, 'VENDOR_DIGITAL_CARD_LIST');


INSERT INTO vendor_drop_down(id, drop_down_name) VALUES (32, 'VCard Status');
INSERT INTO vendor_drop_down(id, drop_down_name) VALUES (33, 'Card Type');

INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.balanceAmount', 'vcard.balanceAmount', 'Balance Amount', 1, 1, 0, 0, 1, 1, 0, NULL, 'right', 'numeric', 'Balance Amount', 9, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.nickName', 'vcard.nickName', 'Nick Name', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'input', 'Nick Name', 2, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.expireOn', 'vcard.expireOn', 'Expiration Date', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'date', 'Expiration Date', 6, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.createdOn', 'vcard.createdOn', 'Created Date', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'date', 'Created Date', 5, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.cardOwner', 'vcard.cardOwner', 'Card Owner', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'input', 'Card Owner', 3, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.amount', 'vcard.amount', 'Amount', 1, 1, 0, 0, 1, 1, 0, NULL, 'right', 'numeric', 'Amount', 7, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.documentNos', 'vcard.documentNos', 'Document No', 1, 0, 0, 0, 0, 0, 0, NULL, 'left', 'input', 'Document No', 4, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.status', 'vcard.status', 'Status', 1, 1, 0, 1, 1, 1, 0, NULL, 'left', 'dropdown', 'All', 10, 32, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'action', 'action', NULL, 1, 0, 0, 0, 0, 0, 1, 'right', 'left', 'actionButton', '', 12, NULL, 50, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.cardNumber', 'vcard.cardNumber', 'Card Number', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'input', 'Card Number', 1, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.redeemedAmount', 'vcard.redeemedAmount', 'Utilized Amount', 1, 1, 0, 0, 1, 1, 0, NULL, 'right', 'numeric', 'Utilized Amount', 8, NULL, 140, NULL);
INSERT INTO vendor_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, frozen_direction, align, search_type, placeholder, column_order, drop_down_id, column_width, drop_down_url_id) VALUES (28, 'vcard.effectiveUntil', 'vcard.effectiveUntil', 'Effective Until', 1, 1, 0, 0, 1, 1, 0, NULL, 'left', 'date', 'Effective Until', 11, NULL, 140, NULL);

INSERT INTO vendor_grid_state_template(grid_id, start_from, total_rows, column_widths) VALUES (28, 0, 25, '210,210,210,210,210,210,210,210,210,210,210,210,50');

INSERT INTO vendor_drop_down_value(id, value, label) VALUES (37, 'V', 'Virtual');
INSERT INTO vendor_drop_down_value(id, value, label) VALUES (38, 'D', 'Digital');
INSERT INTO vendor_drop_down_value(id, value, label) VALUES (39, 'C', 'Canceled');

INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (32, 1);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (32, 39);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (33, 37);
INSERT INTO vendor_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (33, 38);

ALTER TABLE vendor_payment_v_card 
ADD COLUMN temp_vendor_id int NULL AFTER po_id;


