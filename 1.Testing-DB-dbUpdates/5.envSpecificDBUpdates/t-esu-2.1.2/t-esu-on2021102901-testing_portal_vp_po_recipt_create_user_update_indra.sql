UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10002_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10002
testing-app10008
testing-app10019
testing-app10029
-------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10004_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10004

-------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst
INNER JOIN papertrl_testing_app10005_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10005
testing-app10010
testing-app10023
testing-app10028

-------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10011_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10011
testing-app10014

------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10015_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10015

------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10015_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10025

------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10030_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10030
testing-app10032

-------------------------------------------------------------------------------------

UPDATE vp_po_receipt_mst mst 
INNER JOIN papertrl_testing_app10033_portal.umm_user_mst umm ON umm.user_name=mst.created_by
SET mst.created_by_name=umm.name
WHERE mst.created_by_name='' OR mst.created_by_name IS NULL;

testing-app10033

-------------------------------------------------------------------------------------


