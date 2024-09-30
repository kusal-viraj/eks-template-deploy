-------Madhusha----2.5.24--------

UPDATE vp_po_mst po SET po.po_status='C'
WHERE po.status='A' AND po.remaining_celing<=0 AND (po.remaining_price_variance=0 OR po.remaining_price_variance IS NULL);

UPDATE vp_po_mst po SET po.po_status='A'
WHERE po.status='A' AND (po.remaining_celing > 0 OR po.remaining_price_variance > 0);

UPDATE vp_po_mst po SET po.po_status='P'
WHERE po.status<>'A' AND (po.remaining_celing > 0 OR po.remaining_price_variance > 0);

UPDATE vp_po_receipt_mst por 
INNER JOIN vp_po_mst po ON po.id=por.po_id 
SET por.status='C' 
WHERE po.po_status='C';