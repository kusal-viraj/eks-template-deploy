
---------hashila-------2.8.21----------

UPDATE vp_payment_batch_bill_wise_transaction trx INNER JOIN vp_payment_batch batch on batch.id = trx.batch_id SET trx.batch_no = batch.tp_batch_id;
