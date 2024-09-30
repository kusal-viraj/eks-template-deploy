------Danuddara-2.8.262-------



UPDATE `common_audit_trial_status` SET `name` = 'Transaction submitted to payment provider', `sort_order` = 17, `icon` = 'fa fa-check-square-o', `color` = 'bg-blue' WHERE `id` = 45;
UPDATE `common_audit_trial_status` SET `name` = 'Transaction failed by payment provider', `sort_order` = 18, `icon` = 'fa fa-exclamation-triangle', `color` = 'bg-red' WHERE `id` = 46;
UPDATE `common_audit_trial_status` SET `name` = 'Transaction completed by payment provider', `sort_order` = 20, `icon` = 'fa fa-check-circle-o', `color` = 'bg-green' WHERE `id` = 47;

INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (54, 'Transaction cancellation completed', 6, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (55, 'Transaction cancellation rejected', 7, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (56, 'Card cancellation completed', 8, 'fa-fa-check', 'bg-blue');
INSERT INTO `common_audit_trial_status`(`id`, `name`, `sort_order`, `icon`, `color`) VALUES (57, 'Card cancellation rejected', 9, 'fa-fa-check', 'bg-blue');
