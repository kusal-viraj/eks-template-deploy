--kavindu 2.9.59--

UPDATE umm_menu SET menu_style='fa-solid fa-users-rays', display_icon='fa-solid fa-users-rays' WHERE  id=1040;

ALTER TABLE `vp_bill_capturing_audit_trial`
	CHANGE COLUMN `failed_reason` `failed_reason` LONGTEXT NULL COLLATE 'latin1_swedish_ci' AFTER `attachment_id`;