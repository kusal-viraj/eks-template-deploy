UPDATE vp_bill bill INNER JOIN vp_vendor_mst ven ON bill.vendor_id=ven.id
SET bill.submitted_by_vendor=ven.community_id IS NOT NULL
WHERE bill.submitted_by_vendor=FALSE;