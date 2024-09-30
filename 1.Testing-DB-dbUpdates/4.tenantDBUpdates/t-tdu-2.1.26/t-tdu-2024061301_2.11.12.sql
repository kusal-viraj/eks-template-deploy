--------------2.11.12 -sithum-----------------------


DELETE FROM common_grid_column_user_wice WHERE grid_id=73;
UPDATE common_grid_column_template SET filter_show = 1, can_hide = 1 WHERE grid_id = 73 AND field = 'pPaymentReq.txnAmount';