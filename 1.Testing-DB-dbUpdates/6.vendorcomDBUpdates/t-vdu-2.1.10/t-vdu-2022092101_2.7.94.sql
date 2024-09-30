-------------Madhusha-------2.7.94----------------

UPDATE `vendor_drop_down_value` SET `value` = 'T', `label` = 'Draft' WHERE `id` = 32;

UPDATE vendor_credit_note note SET note.`status`='T' WHERE note.status='S';