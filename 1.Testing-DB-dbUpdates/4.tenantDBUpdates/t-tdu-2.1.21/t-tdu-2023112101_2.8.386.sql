------hashila 2.8.386---



ALTER TABLE common_additional_field_option ADD COLUMN status VARCHAR(50) NULL DEFAULT NULL AFTER code;

UPDATE common_additional_field_option SET status = 'A';

UPDATE common_automation_document_type_event SET automation_rule_event='0' WHERE  id=38;
UPDATE common_automation_document_type_event SET automation_rule_event='0' WHERE  id=39;

INSERT INTO common_audit_trial_status(id, name, sort_order, icon, color) VALUES (71, 'Inserted additional approver by', 18, 'fa fa-angle-double-right', 'bg-blue');

