----------loshitha 2.8.281-------



INSERT INTO papertrl_feature (id, name, status) VALUES (4, 'Memorize Account by Description', 'A');
INSERT INTO papertrl_feature (id, name, status) VALUES (5, 'Memorize Item by Description', 'A');
INSERT INTO papertrl_feature (id, name, status) VALUES (6, 'Memorize Account by Merchant', 'A');


INSERT INTO papertrl_feature_config (feature_id, tenant_id, enable_status)
SELECT 4, tenant_id, 0
FROM papertrl_master_tenant
WHERE status = 'A' 
AND tenant_id NOT LIKE '%-portal' 
AND tenant_id NOT LIKE '%-support' 
AND tenant_id NOT LIKE '%-vendors';
	
INSERT INTO papertrl_feature_config (feature_id, tenant_id, enable_status)
SELECT 5, tenant_id, 0
FROM papertrl_master_tenant
WHERE status = 'A' 
AND tenant_id NOT LIKE '%-portal' 
AND tenant_id NOT LIKE '%-support' 
AND tenant_id NOT LIKE '%-vendors';

INSERT INTO papertrl_feature_config (feature_id, tenant_id, enable_status)
SELECT 6, tenant_id, 0
FROM papertrl_master_tenant
WHERE status = 'A' 
AND tenant_id NOT LIKE '%-portal' 
AND tenant_id NOT LIKE '%-support' 
AND tenant_id NOT LIKE '%-vendors';