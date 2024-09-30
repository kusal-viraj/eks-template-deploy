UPDATE `payment_provider` SET `name` = 'US Bank', `status` = 'A', `description` = 'We spend our time building the world’s best B2B integrated payments platform.\r\n\nIt securely automates and optimizes all your payments so you can spend your time building the best version of your company.', `logo_image` = NULL, `osn` = 'CPPT44', `created_by` = 'support', `created_on` = '2023-01-18 18:33:09', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 2;

INSERT INTO `payment_provider_credential`(`id`, `provider_id`, `client_id`, `secret`, `auth_url`, `access_token`, `access_token_expire_on`) VALUES (1, 2, 'kqSRdvZ9YGGhRy9hvF6UCAk0sTtzA9Bl', 'pamoSBWq3X3utOzY', 'https://alpha-apip2.usbank.com/auth/oauth2/v1/token', NULL, NULL);
INSERT INTO `payment_provider_credential`(`id`, `provider_id`, `client_id`, `secret`, `auth_url`, `access_token`, `access_token_expire_on`) VALUES (2, 2, '6qzNWp6ERHjGA9y60Gv0S10G895R8Xvf', 'VKPUseJGG1DjAqQz', 'https://sandbox.usbank.com/auth/oauth2/v1/token', 'wir3cSbuHptKFYuF0XBcLGjrOLhP', '2023-01-26 17:11:10.000000');


INSERT INTO `payment_type_for_provider`( `status`, `payment_type`, `payment_provider`, `short_code`, `provider_credential_id`) VALUES ( 'A', 1, 2, 'ACH', 2);
INSERT INTO `payment_type_for_provider`( `status`, `payment_type`, `payment_provider`, `short_code`, `provider_credential_id`) VALUES ( 'A', 2, 2, 'Check', 2);
INSERT INTO `payment_type_for_provider`( `status`, `payment_type`, `payment_provider`, `short_code`, `provider_credential_id`) VALUES ( 'A', 3, 2, 'VCard', 1);


INSERT INTO `payment_provider_for_customer`( `company_id`, `status`, `api_user`, `api_user_password`, `api_key`, `default_provider`, `payment_provider`, `tenant`, `tenant_id`, `days_for_cancel`, `hours_for_cancel`, `minutes_for_cancel`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES ( NULL, 'A', NULL, NULL, NULL, 1, 2, 10001, 'testing-app10001', NULL, NULL, NULL, 'support', '2021-10-26 22:17:52', NULL, NULL, NULL, NULL);
