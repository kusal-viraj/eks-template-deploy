----danuddara-0.0.22------


UPDATE `papertrl_error_message` SET `field_name` = 'supplier.name', `usb_error_message` = 'One of the attributes does not conform to schema definition', `papertrl_message` = 'The recipient name format is incorrect. ', `type` = 1 WHERE `id` = 1;
UPDATE `papertrl_error_message` SET `field_name` = 'supplier.email', `usb_error_message` = 'Acceptable Email Address format is test@domain.extension and multiple Email addresses must be separated by semi-colon', `papertrl_message` = 'Recipient email should follow the format \"test@domain.extension\" and multiple addresses must be separated by a semi-colon (;).', `type` = 1 WHERE `id` = 2;
UPDATE `papertrl_error_message` SET `field_name` = 'supplier.email', `usb_error_message` = 'One of the attributes does not conform to schema definition', `papertrl_message` = 'Supplier email format is incorrect. Please check and update accordingly.', `type` = 1 WHERE `id` = 3;

-----0.0.25-----



UPDATE `papertrl_error_message` SET `field_name` = 'checkPayableDetails.recipientDetails.address.state', `usb_error_message` = 'State must be provided to successfully submit the request', `papertrl_message` = 'The ‘State’ of the recipients address is required to successfully submit the request', `type` = 1 WHERE `id` = 38;

----0.0.26-hashila---


UPDATE payment_configuration SET field_caption = 'Bank Identification Number / Routing Number' WHERE id = 3;

-----danuddara 0.0.27---



INSERT INTO `papertrl_error_message`(`id`, `field_name`, `usb_error_message`, `papertrl_message`, `type`) VALUES (121, 'supplier.credentials', 'Control is enabled for supplier validation, field is required in request or in the Supplier ID record', 'Credential information is missing. Please verify the vendor\'s postal code.', 1);



