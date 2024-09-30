----Danuddara 0.0.25------


UPDATE `payment_configuration` SET `payment_type_id` = 1, `field_caption` = 'Company ID', `field_name` = 'companyId', `sort_order` = 1, `status` = 'A', `required` = 1, `data_type` = '[a-zA-Z0-9]*', `max_length` = 10, `attribute_name` = 'transaction.requestorDetails.companyID' WHERE `id` = 1;
