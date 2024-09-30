--hashila 2.9.93--



UPDATE common_grid_column_template SET field = 'pPaymentReq.fundingAccount', sortable_field = 'pPaymentReq.fundingAccount', header = 'Funding Account', placeholder = 'Funding Account' WHERE grid_id = 73 AND field = 'pPaymentReq.paymentChannel';


ALTER TABLE vp_payment_v_card 
ADD COLUMN funding_Account_id int NULL AFTER provider_id;