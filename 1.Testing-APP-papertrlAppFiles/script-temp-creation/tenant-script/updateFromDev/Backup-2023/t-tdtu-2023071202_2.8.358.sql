UPDATE common_grid_column_template SET header = 'Amount Spent', placeholder = 'Amount Spent' WHERE grid_id = 66 AND field = 'vcard.redeemedAmount';
UPDATE common_grid_column_template SET header = 'Card Limit', placeholder = 'Card Limit' WHERE grid_id = 66 AND field = 'vcard.amount';
UPDATE common_grid_column_template SET header = 'Remaining Balance', placeholder = 'Remaining Balance' WHERE grid_id = 66 AND field = 'vcard.balanceAmount';

UPDATE common_grid_column_user_wice SET header = 'Amount Spent', placeholder = 'Amount Spent' WHERE grid_id = 66 AND field = 'vcard.redeemedAmount';
UPDATE common_grid_column_user_wice SET header = 'Card Limit', placeholder = 'Card Limit' WHERE grid_id = 66 AND field = 'vcard.amount';
UPDATE common_grid_column_user_wice SET header = 'Remaining Balance', placeholder = 'Remaining Balance' WHERE grid_id = 66 AND field = 'vcard.balanceAmount';

