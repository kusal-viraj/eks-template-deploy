--danuddara---0.0.8----


ALTER TABLE `payment_configuration` 
ADD COLUMN `attribute_name` varchar(80) NOT NULL AFTER `max_length`;


UPDATE `payment_configuration` SET `payment_type_id` = 1, `field_caption` = 'Company ID', `field_name` = 'companyId', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '[a-zA-Z0-9\\s]*', `max_length` = 10, `attribute_name` = 'transaction.requestorDetails.companyID' WHERE `id` = 1;
UPDATE `payment_configuration` SET `payment_type_id` = 2, `field_caption` = 'Account Number', `field_name` = 'accountNumber', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '^[0-9]*$', `max_length` = 17, `attribute_name` = 'checkPayableDetails.requestorDetails.accountNumber' WHERE `id` = 2;
UPDATE `payment_configuration` SET `payment_type_id` = 2, `field_caption` = 'Routing Number', `field_name` = 'routingNumber', `sort_order` = 2, `status` = 'A', `required` = 1, `data_type` = '^[0-9]*$', `max_length` = 9, `attribute_name` = 'checkPayableDetails.requestorDetails.routingNumber' WHERE `id` = 3;
UPDATE `payment_configuration` SET `payment_type_id` = 3, `field_caption` = 'Account ID', `field_name` = 'accountId', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '^[0-9]*$', `max_length` = 12, `attribute_name` = 'paymentAccountID' WHERE `id` = 4;

