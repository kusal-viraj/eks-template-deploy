---------------Hashila-------------2.1.130----------------------------

UPDATE `common_audit_trial_status` SET `name`='Approved by ' WHERE (`id`='24');
UPDATE `common_audit_trial_status` SET `name`='Rejected by' WHERE (`id`='25');
UPDATE `common_audit_trial_status` SET `name`='Deleted by' WHERE (`id`='26');
UPDATE `common_audit_trial_status` SET `name`='Cancelled by' WHERE (`id`='27');

 

INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES ('30', 'Batch processing started', '16', 'fa fa-cogs', 'bg-blue');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES ('31', 'Batch submitted to payment system', '17', 'fa fa-check-square-o', 'bg-blue');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES ('32', 'Batch failed by payment system', '18', 'fa fa-exclamation-triangle', 'bg-red');
INSERT INTO `common_audit_trial_status` (`id`, `name`, `sort_order`, `icon`, `color`) VALUES ('33', 'Batch completed by payment system', '20', 'fa fa-check-circle-o', 'bg-green');