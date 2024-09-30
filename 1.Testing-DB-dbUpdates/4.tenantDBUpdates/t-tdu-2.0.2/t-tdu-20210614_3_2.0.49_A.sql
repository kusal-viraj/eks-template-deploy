ALTER TABLE `common_automation_workflow_config`
	DROP FOREIGN KEY `APPROVAL_GROUP_FK_4`;
ALTER TABLE `common_automation_workflow_config`
	DROP INDEX `APPROVAL_GROUP_FK_4`;
ALTER TABLE `common_document_ad_hoc_workflow_detail_config`
	DROP FOREIGN KEY `APPROVAL_GROUP_FK_3`;
ALTER TABLE `common_document_ad_hoc_workflow_detail_config`
	DROP INDEX `APPROVAL_GROUP_FK_3`;
	
ALTER TABLE `vp_bill`
	DROP FOREIGN KEY `APPROVAL_GROUP_FK_1`;
ALTER TABLE `vp_bill`
	DROP INDEX `APPROVAL_GROUP_FK_1`;
	
	
ALTER TABLE `vp_po_mst`
	DROP FOREIGN KEY `APPROVAL_GROUP_FK_2`;
ALTER TABLE `vp_po_mst`
	DROP INDEX `APPROVAL_GROUP_FK_2`;