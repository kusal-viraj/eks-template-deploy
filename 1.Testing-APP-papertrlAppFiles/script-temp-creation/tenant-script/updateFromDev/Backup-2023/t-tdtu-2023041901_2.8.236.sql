ALTER TABLE common_document_ad_hoc_workflow_detail_config ADD COLUMN action_date DATETIME NULL DEFAULT NULL AFTER action_user;

ALTER TABLE hst_vp_expense_workflow_detail_config ADD COLUMN action_date DATETIME NULL DEFAULT NULL AFTER action_user;
