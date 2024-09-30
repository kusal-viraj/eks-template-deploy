---danuddara 0.0.40---


UPDATE `papertrl_error_message` SET `type` = 1 WHERE `id` = 19;
INSERT INTO `papertrl_error_message`(`id`, `field_name`, `usb_error_message`, `papertrl_message`, `type`) VALUES (124, 'effectiveStart', 'Date must be today\'s date or up to the effective until date.', 'The date must be either today or before the effective until date.', 1);
