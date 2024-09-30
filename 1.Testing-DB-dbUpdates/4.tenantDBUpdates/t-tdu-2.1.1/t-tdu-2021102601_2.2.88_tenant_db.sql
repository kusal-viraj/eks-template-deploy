---------------Hashila------2.2.88-------

UPDATE vp_payment_batch_bill_wise_transaction  tr SET  tr.txn_type_name='Virtual Card' WHERE tr.txn_type_name='VCard';
UPDATE vp_bill_payment pay SET  pay.payment_type_description='Virtual Card' WHERE pay.payment_type_description='VCard';

UPDATE vp_bill_payment AS bp 
INNER JOIN papertrl_mst_db.payment_type AS pt ON pt.`name`=bp.payment_type_description
SET bp.payment_type_id = pt.id, bp.payment_type_description = pt.`name` 
WHERE bp.payment_type_description=pt.`name`;

UPDATE vp_payment_batch_bill_wise_transaction AS tr 
INNER JOIN papertrl_mst_db.payment_type AS pt ON pt.`name`=tr.txn_type_name
SET tr.txn_type = pt.id, tr.txn_type_name = pt.`name` 
WHERE tr.txn_type_name=pt.`name`;