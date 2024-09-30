----sithum 2.8.379---



DELETE FROM papertrl_feature_config WHERE  feature_id=5;
DELETE FROM papertrl_feature WHERE  id=5;
UPDATE papertrl_feature SET name= "Memorize account by merchant"  WHERE  id=6;
UPDATE papertrl_feature SET name= "Restrict document visibility" WHERE  id=7;

UPDATE papertrl_feature SET description='This feature allows you to print an approval stamp on the bill report when the bill has been approved. This stamp includes important details about the approval, such as the approver\'name, approval date, account code, and project code.' WHERE  id=1;

UPDATE papertrl_feature SET description='This feature allows you to control which users can view or access transactional documents. When this feature is enabled, only specific users meeting certain criteria will be able to view or access these documents. This includes users with the "Override Approval" privilege in their role, assigned approvers of the document, the user who created the document, and users assigned to the project of the document.' WHERE  id=7;


