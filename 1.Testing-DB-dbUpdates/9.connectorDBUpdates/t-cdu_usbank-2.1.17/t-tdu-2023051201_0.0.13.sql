ALTER TABLE `payment_customer_wise_config_value` 
ADD COLUMN `payment_account_token` varchar(100) NULL AFTER `created_by`;

UPDATE `payment_configuration` SET `payment_type_id` = 2, `field_caption` = 'Account Number', `field_name` = 'accountNumber', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '^[0-9*]+$', `max_length` = 17, `attribute_name` = 'checkPayableDetails.requestorDetails.accountNumber' WHERE `id` = 2;
UPDATE `payment_configuration` SET `payment_type_id` = 2, `field_caption` = 'Routing Number', `field_name` = 'routingNumber', `sort_order` = 2, `status` = 'A', `required` = 1, `data_type` = '^[0-9*]+$', `max_length` = 9, `attribute_name` = 'checkPayableDetails.requestorDetails.routingNumber' WHERE `id` = 3;
UPDATE `payment_configuration` SET `payment_type_id` = 3, `field_caption` = 'Account ID', `field_name` = 'accountId', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '^[0-9*]+$', `max_length` = 12, `attribute_name` = 'paymentAccountID' WHERE `id` = 4;

INSERT INTO `payment_provider_credential`(`id`, `client_id`, `secret`, `auth_url`, `access_token`, `access_token_expire_on`, `status`) VALUES (3, '1WrAmJmY5QK70cEWsg5pNTuGKJa2PvdY', 'dHFOyvs14IGX9Frn', 'https://alpha-apip2.usbank.com/auth/oauth2/v1/token', '7C48BmSRVWJO1TG5pwfqSukBxKOB', '2023-05-12 13:21:20.000000', 'A');
INSERT INTO `payment_type_for_provider`(`id`, `status`, `short_code`, `payment_type`, `provider_credential_id`) VALUES (7, 'A', 'PToken', 9, 3);
