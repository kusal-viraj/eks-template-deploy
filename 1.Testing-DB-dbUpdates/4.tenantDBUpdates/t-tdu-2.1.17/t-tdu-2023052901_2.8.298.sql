---2.8.298----hashila----


INSERT INTO common_drop_down(id, drop_down_name) VALUES (37, 'Card Type');

INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, align, search_type, placeholder, column_order, drop_down_id, column_width) VALUES (66, 'vcard.cardType', 'vcard.cardType', 'Card Type', 1, 1, 0, 0, 1, 1, 0, 'left', 'dropdown', 'Card Type', 2, 37, 140);

INSERT INTO common_drop_down_value(id, value, label) VALUES (72, 'V', 'Virtual');
INSERT INTO common_drop_down_value(id, value, label) VALUES (73, 'D', 'Digital');

INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (37, 72);
INSERT INTO common_drop_down_connection(drop_down_id, drop_down_value_id) VALUES (37, 73);

update vp_payment_v_card card set card.card_type = 'V' WHERE card.card_type is null;

INSERT INTO common_grid_column_template(grid_id, field, sortable_field, header, column_show, is_sortable, is_re_orderable, is_re_sizable, can_hide, filter_show, is_frozen, align, search_type, placeholder, column_order, column_width) VALUES (66, 'vcard.effectiveUntil', 'vcard.effectiveUntil', 'Effective Until', 1, 1, 0, 0, 1, 1, 0, 'left', 'date', 'Effective Until', 13, 140);

UPDATE common_grid_state_template SET column_widths = '50,50,210,210,210,210,210,210,210,210,210,210' WHERE id = 66;

UPDATE common_grid_column_template SET column_order = 11  WHERE grid_id = 66 AND field = 'vcard.balanceAmount';
UPDATE common_grid_column_template SET column_order = 3  WHERE grid_id = 66 AND field = 'vcard.nickName';
UPDATE common_grid_column_template SET column_order = 8  WHERE grid_id = 66 AND field = 'vcard.expireOn';
UPDATE common_grid_column_template SET column_order = 7  WHERE grid_id = 66 AND field = 'vcard.createdOn';
UPDATE common_grid_column_template SET column_order = 5  WHERE grid_id = 66 AND field = 'vcard.cardOwner';
UPDATE common_grid_column_template SET column_order = 9 WHERE grid_id = 66 AND field = 'vcard.amount';
UPDATE common_grid_column_template SET column_order = 6  WHERE grid_id = 66 AND field = 'vcard.documentNos';
UPDATE common_grid_column_template SET column_order = 12 WHERE grid_id = 66 AND field = 'vcard.status';
UPDATE common_grid_column_template SET column_order = 14 WHERE grid_id = 66 AND field = 'action';
UPDATE common_grid_column_template SET column_order = 3  WHERE grid_id = 66 AND field = 'vcard.cardNumber';
UPDATE common_grid_column_template SET column_order = 10  WHERE grid_id = 66 AND field = 'vcard.redeemedAmount';
UPDATE common_grid_column_template SET column_order = 2  WHERE grid_id = 66 AND field = 'vcard.cardType';
UPDATE common_grid_column_template SET column_order = 13  WHERE grid_id = 66 AND field = 'vcard.effectiveUntil';

DELETE FROM common_grid_column_user_wice WHERE grid_id = 66;






