--------Madhusha-----------2.2.58---------------

UPDATE vp_customer_vendor_relation relation 
INNER JOIN papertrl_vendor_community.vendor_customer_relation ON papertrl_vendor_community.vendor_customer_relation.id=relation.request_id 
SET relation.`status`='D' 
WHERE papertrl_vendor_community.vendor_customer_relation.`status`='D';