---hashila 2.8.51---


INSERT INTO papertrl_feature (id, name, status) VALUES (7, 'Restrict Document Visibility', 'A');

INSERT INTO papertrl_feature_config (feature_id, tenant_id, enable_status)
SELECT 7, tenant_id, 0
FROM papertrl_master_tenant
WHERE status = 'A' 
AND tenant_id NOT LIKE '%-portal' 
AND tenant_id NOT LIKE '%-support' 
AND tenant_id NOT LIKE '%-vendors';


---sithum 2.8.67---



ALTER TABLE `papertrl_feature` 
ADD COLUMN `description` varchar(400) NULL AFTER `name`;

UPDATE papertrl_feature SET description="Enabling the Stamp on Bills feature will automatically print an approval stamp on the last page of a bill when it has been approved. The stamp will display essential approval details, including the approver\s name and the approval date." WHERE  id=1;

UPDATE papertrl_feature SET description="When you enable access to confidential documents, users will gain the ability to access documents associated with vendors designated as confidential within the system." WHERE  id=2;


UPDATE papertrl_feature SET description="When you enable this feature, the users will be able to add custom terms, created by the them by selecting the \"Other\" option from the payment term dropdown, to a default payment term for future use." WHERE  id=3;


UPDATE papertrl_feature SET description="Enabling this feature will allow users to link an account number with the latest entered description. Upon activation, if the same description is entered in the expense cost distribution table in the future, the associated account number will be automatically populated." WHERE  id=4;


UPDATE papertrl_feature SET description="Enabling this feature will allow users to link an item number with the latest entered description. Upon activation, if the same description together with the vendor is entered in the item cost distribution table in the future, the associated item number will be automatically populated." WHERE  id=5;


UPDATE papertrl_feature SET description="Enabling this feature will allow users to link an account number with the latest entered merchant. Upon activation, if the same description is entered in the line item table of expense reports and credit card statement in the future, the associated account number will be automatically populated." WHERE  id=6;


UPDATE papertrl_feature SET description="When this feature is enabled, only users who meet certain criteria will be able to view or access transactional documents. Eligible users include those with the \"Override Approval Privilege,\" direct document approvers, members of assigned approval groups, document creators, and users included in the assigned project." WHERE  id=7;



---sithum2.8.79---




UPDATE papertrl_feature SET name="Show approval stamp on bill reports" WHERE  id=1;

UPDATE papertrl_feature SET description = "Enabling the 'Show approval stamp on bill reports ' feature will automatically print an approval stamp on the last page of a bill when it has been approved. The stamp will display essential approval details, including the approver's name and the approval date." WHERE  id=1;

----sithum 2.8.104---


ALTER TABLE papertrl_feature
	CHANGE COLUMN description description VARCHAR(500) NULL DEFAULT NULL  AFTER name;


UPDATE papertrl_feature SET name='Show approval stamp on bill reports ', description='This feature allows you to print an approval stamp on the bill report when the bill has been approved. This stamp includes important details about the approval, such as the approver name, approval date, account code, and project code.' WHERE  id=1;

UPDATE papertrl_feature SET name='Enable confidentiality controls ', description='This feature permits you to flag a vendor as “confidential”. Only users who have permissions to view confidential documents will see documents associated with this vendor.' WHERE  id=2;


UPDATE papertrl_feature SET name='Create custom payment terms ', description='This feature enables you to create custom terms. When processing bills if “Other" is chosen from the payment term dropdown list, you will have the ability to create a custom payment term.' WHERE  id=3;


UPDATE papertrl_feature SET name='Memorize account by description ', description='When processing a bill, this feature enables you to associate an account number with the latest entered description. Once linked, the next time the same description is entered in the expense cost distribution table, the associated account number will automatically populate.' WHERE  id=4;


UPDATE  papertrl_feature SET name='Memorize account by merchant ', description='When processing an expense transaction, this feature enables you to associate an account number with the latest entered merchant in the expenses and credit card statement module. Once linked, the next time the same merchant is entered in the line-item table, the associated account number will automatically populate.' WHERE  id=5;

UPDATE papertrl_feature SET description='This feature allows you to control which users can view or access transactional documents. When this feature is enabled, only specific users meeting certain criteria will be able to view or access these documents. This includes users with the "Override Approval" privilege in their role, assigned approvers of the document, the user who created the document, and users assigned to the project of the document.' WHERE  id=6;


------indra 2.8.110----

ALTER TABLE `papertrl_master_tenant`
	CHANGE COLUMN `db_host` `db_host` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci' AFTER `user_auth_type`;



