UPDATE common_grid_state_template SET column_widths='50,210,210,210,210,210,210,210,210' WHERE  grid_id=73;

DELETE FROM common_grid_column_user_wice WHERE grid_id=73;

UPDATE common_grid_column_template SET filter_show=1 WHERE grid_id=73 AND 'field'= "pPaymentReq.txnAmount";

