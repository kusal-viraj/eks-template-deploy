
ALTER TABLE `vp_bill_payment`
DROP COLUMN `payment_type`;

ALTER TABLE `vp_bill_payment`
ADD COLUMN `payment_type_id`  int(11) NOT NULL AFTER `payment_date`;

UPDATE vp_bill_payment AS bp 
INNER JOIN papertrl_mst_db.payment_type AS pt ON pt.`name`=bp.payment_type_description
SET bp.payment_type_id = pt.id, bp.payment_type_description = pt.`name` 
WHERE bp.payment_type_description=pt.`name`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction`
MODIFY COLUMN `batch_id`  int(11) NULL AFTER `tp_txn_id`;

ALTER TABLE `vp_payment_batch_bill_wise_transaction`
ADD COLUMN `offline_payment_id`  int(11) NULL AFTER `batch_id`;

ALTER TABLE `vp_bill_payment`
ADD COLUMN `vendor_id`  int(11) NULL AFTER `bill_no`;

UPDATE vp_bill_payment AS vp 
INNER JOIN vp_bill AS vb ON vp.bill_no=vb.bill_no
SET vp.vendor_id = vb.vendor_id
WHERE vp.bill_no=vb.bill_no;

INSERT INTO vp_payment_batch_bill_wise_transaction (txn_ref,bill_id,bill_no,txn_type,txn_type_name,txn_amount,txn_discount,payment_date,`status`,offline_payment_id,vendor_id,payment_status)
SELECT vp.payment_referance_no,vp.bill_id,vp.bill_no,vp.payment_type_id,vp.payment_type_description,vp.amount,vp.discount_amount,vp.payment_date,vp.`status`,vp.id,vp.vendor_id,
IF(vp.`status` LIKE '%V%', 'C','S')
FROM vp_bill_payment vp
INNER JOIN vp_vendor_mst ven ON ven.id=vp.vendor_id;