-----danuddara 0.0.24--------



UPDATE `papertrl_error_message` SET `field_name` = 'checkPayableDetails.recipientDetails.address.state', `usb_error_message` = 'State must be provided to successfully submit the request', `papertrl_message` = 'The recipient address state is required to successfully submit the request', `type` = 1 WHERE `id` = 38;
UPDATE `papertrl_error_message` SET `field_name` = 'checkPayableDetails.recipientDetails.address.state', `usb_error_message` = 'State must be correctly formatted to successfully submit the request', `papertrl_message` = 'The recipient address state format is incorrect to proceed with the request submission.', `type` = 1 WHERE `id` = 39;



