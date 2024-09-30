-----2.11.8--Chandima----

ALTER TABLE common_automation_document_type
	ADD COLUMN additional_field_enable TINYINT(1) NOT NULL;

UPDATE common_automation_document_type SET additional_field_enable='0';
	
UPDATE common_automation_document_type SET additional_field_enable=1 WHERE  id=1;
UPDATE common_automation_document_type SET additional_field_enable=1 WHERE  id=2;
UPDATE common_automation_document_type SET additional_field_enable=1 WHERE  id=3;
UPDATE common_automation_document_type SET additional_field_enable=1 WHERE  id=4;
UPDATE common_automation_document_type SET additional_field_enable=1 WHERE  id=6;
UPDATE common_automation_document_type SET additional_field_enable=1 WHERE  id=8;

DELETE FROM common_grid_column_user_wice WHERE grid_id=73;

UPDATE common_grid_column_template SET can_hide=1 WHERE grid_id=73 AND 'field'= "pPaymentReq.txnAmount";
