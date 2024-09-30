------Danuddar--2.8.312-----


UPDATE `common_audit_trial_status` SET `name` = 'Save as approved by', `sort_order` = 15, `icon` = 'pi pi-save', `color` = 'bg-blue' WHERE `id` = 23;
UPDATE `common_audit_trial_status` SET `name` = 'Transaction submitted to payment provider', `sort_order` = 17, `icon` = 'fa fa-paper-plane', `color` = 'bg-blue' WHERE `id` = 45;
UPDATE `common_audit_trial_status` SET `name` = 'Transaction completed by payment provider', `sort_order` = 20, `icon` = 'fa fa-check', `color` = 'bg-green' WHERE `id` = 47;
