---loshitha---2.8.140----

UPDATE vendor_grid_column_template SET can_hide = 0 WHERE field IN ('txn.approvalStatus','txn.txnDate') AND grid_id = 24;