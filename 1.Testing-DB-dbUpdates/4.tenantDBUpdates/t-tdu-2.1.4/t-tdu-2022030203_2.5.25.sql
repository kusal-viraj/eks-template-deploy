---------Madhusha-----2.5.25-----------

DELETE FROM `common_grid_column_template` WHERE `id` = 491;

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (27, 12);

UPDATE `common_grid_column_template` SET `drop_down_id` = 27 WHERE `id` = 115;

ALTER TABLE `vp_po_mst` 
DROP COLUMN `po_status`;

UPDATE vp_po_mst po SET po.status='C'
WHERE po.status='A' AND po.remaining_celing<=0 AND (po.remaining_price_variance=0 OR po.remaining_price_variance IS NULL);

UPDATE vp_po_mst po SET po.status='P'
WHERE po.status<>'A' AND (po.remaining_celing > 0 OR po.remaining_price_variance > 0);

UPDATE vp_po_receipt_mst por 
INNER JOIN vp_po_mst po ON po.id=por.po_id 
SET por.status='C' 
WHERE po.status='C';