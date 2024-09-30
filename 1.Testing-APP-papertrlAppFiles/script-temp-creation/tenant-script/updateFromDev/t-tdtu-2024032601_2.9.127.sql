INSERT INTO common_automation_document_type(id, document_type, short_code, status, show_hide_enable, automation_enable, automation_rule_enable, notification_enable, payment_enable, attach_to_enable) VALUES (12, 'Payment Request', 'PAYMENT_REQUEST', 'A', 0, 0, 0, 0, 1, 0);

ALTER TABLE vp_payment_request_mst 
ADD COLUMN txn_id int NULL AFTER status;