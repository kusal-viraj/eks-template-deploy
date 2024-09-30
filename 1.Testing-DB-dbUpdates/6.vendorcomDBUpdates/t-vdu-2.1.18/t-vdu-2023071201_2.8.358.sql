--hasila--2.8.358-----


UPDATE vendor_grid_column_template SET header = 'Amount Spent', placeholder = 'Amount Spent' WHERE grid_id = 28 AND field = 'vcard.redeemedAmount';
UPDATE vendor_grid_column_template SET header = 'Card Limit', placeholder = 'Card Limit' WHERE grid_id = 28 AND field = 'vcard.amount';
UPDATE vendor_grid_column_template SET header = 'Remaining Balance', placeholder = 'Remaining Balance' WHERE grid_id = 28 AND field = 'vcard.balanceAmount';
UPDATE vendor_grid_column_template SET header = 'Valid Thru', placeholder = 'Valid Thru' WHERE grid_id = 28 AND field = 'vcard.effectiveUntil';

UPDATE vendor_grid_column_user_wice SET header = 'Amount Spent', placeholder = 'Amount Spent' WHERE grid_id = 28 AND field = 'vcard.redeemedAmount';
UPDATE vendor_grid_column_user_wice SET header = 'Card Limit', placeholder = 'Card Limit' WHERE grid_id = 28 AND field = 'vcard.amount';
UPDATE vendor_grid_column_user_wice SET header = 'Remaining Balance', placeholder = 'Remaining Balance' WHERE grid_id = 28 AND field = 'vcard.balanceAmount';
UPDATE vendor_grid_column_user_wice SET header = 'Valid Thru', placeholder = 'Valid Thru' WHERE grid_id = 28 AND field = 'vcard.effectiveUntil';
