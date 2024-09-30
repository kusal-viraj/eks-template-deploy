ALTER TABLE `vp_payment_v_card` 
ADD COLUMN `cancel_reason` varchar(200) NULL AFTER `card_number`;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-solid fa-credit-card' WHERE `id` = 49;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-regular fa-pen-to-square' WHERE `id` = 51;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-solid fa-arrows-up-to-line' WHERE `id` = 50;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-solid fa-hand-holding-dollar' WHERE `id` = 52;

UPDATE `common_audit_trial_status` SET `icon` = 'pi pi-exclamation-triangle' WHERE `id` = 53;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-circle-check' WHERE `id` = 54;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-ban' WHERE `id` = 55;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-circle-check' WHERE `id` = 56;

UPDATE `common_audit_trial_status` SET `icon` = 'fa-ban' WHERE `id` = 57;