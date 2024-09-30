-----------Madhusha--------2.2.51---------

UPDATE papertrl_vendor_community.vendor_customer_relation 
INNER JOIN papertrl_mst_db.papertrl_master_tenant ON papertrl_mst_db.papertrl_master_tenant.tenant_id=papertrl_vendor_community.vendor_customer_relation.tenant_id 
SET papertrl_vendor_community.vendor_customer_relation.customer_name=papertrl_mst_db.papertrl_master_tenant.owner_name;


ALTER TABLE `vendor_po_mst`
MODIFY COLUMN `project_code`  varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '' AFTER `uuid`;