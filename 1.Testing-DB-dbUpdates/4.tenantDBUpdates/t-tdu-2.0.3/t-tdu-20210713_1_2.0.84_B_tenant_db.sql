UPDATE `common_automation_field` SET `short_code`='ItemGrossAmount', `field_name`='Item Gross Amount' WHERE (`id`='81');

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `second_value`, `max_length`) VALUES ('89', '2', 'accountGrossAmount', 'Account Gross Amount', '0', '0', '1', 'decimal', '1', '19');

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES ('90', '2', 'purchaseOrderAccountDetails.accountNumber', 'Account Number', '0', '0', '0', 'text', NULL, NULL, '1', '50');

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `second_value`, `max_length`) VALUES ('91', '2', 'purchaseOrderAccountDetails.accountName', 'Account Name', '0', '0', '1', 'text', '1', '300');

UPDATE `common_automation_field` SET `field_name`='Item Line Amount' WHERE (`id`='48'); 

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `second_value`, `max_length`) VALUES ('92', '2', 'purchaseOrderAccountDetails.amount', 'Account Line Amount', '0', '0', '1', 'decimal', '1', '19');

