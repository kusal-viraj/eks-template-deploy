UPDATE vp_po_receipt_mst mst 
INNER JOIN umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;


testing-app10000
testing-app10001
testing-app10007
testing-app10009
testing-app10013
testing-app10017
testing-app10018
testing-app10020
testing-app10021
testing-app10022
testing-app10027