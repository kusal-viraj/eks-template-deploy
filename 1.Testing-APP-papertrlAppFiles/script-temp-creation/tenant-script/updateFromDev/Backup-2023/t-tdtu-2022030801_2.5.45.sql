UPDATE `common_automation_field` SET `field_name` = 'Net Amount' WHERE `document_type` = 4 AND `short_code` = 'totalAmount';

UPDATE `common_automation_field` SET `condition_enable` = 0, `action_enable` = 0 WHERE `document_type` = 4 AND `short_code` = 'departmentId';



