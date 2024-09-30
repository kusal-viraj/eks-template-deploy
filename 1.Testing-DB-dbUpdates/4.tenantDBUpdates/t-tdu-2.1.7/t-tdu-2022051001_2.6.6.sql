---------Madhusha--------2.6.6--------

ALTER TABLE `vp_po_detail` 
ADD COLUMN `credit_remaining_qty` decimal(12, 2) NULL DEFAULT NULL AFTER `remaining_qty`;

UPDATE vp_po_detail SET vp_po_detail.credit_remaining_qty=vp_po_detail.qty;

ALTER TABLE `hst_vp_po_detail` 
ADD COLUMN `credit_remaining_qty` decimal(12, 2) NULL DEFAULT NULL AFTER `remaining_qty`;

UPDATE `common_audit_trial_status` SET `name` = 'Credit note removed by' WHERE `id` = 40;

ALTER TABLE `vp_credit_note_item_details` 
ADD COLUMN `po_detail_id` int NULL AFTER `product_id`;