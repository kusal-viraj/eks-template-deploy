---------------kavindu-2.13.24------------

DELETE FROM `ad_hoc_workflow_detail_for_audit_trail` WHERE `id`<>0;

ALTER TABLE `ad_hoc_workflow_detail_for_audit_trail` ADD COLUMN `document_type` INT(11) NOT NULL AFTER `status_id`;