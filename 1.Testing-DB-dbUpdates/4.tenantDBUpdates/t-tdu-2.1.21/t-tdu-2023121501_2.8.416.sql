-------lositha 2.8.416---


UPDATE vp_payment_transaction
SET document_id = bill_id
WHERE document_id IS NULL AND bill_id IS NOT NULL;