INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('1', '9', '2');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('1', '9', '3');

UPDATE `common_automation_document_action_config` SET `event_id`='6' WHERE  `id`=66;
UPDATE `common_automation_document_action_config` SET `event_id`='6' WHERE  `id`=67;
UPDATE `common_automation_document_action_config` SET `event_id`='6' WHERE  `id`=68;

UPDATE `common_automation_document_type_event` SET `event_id`='2' WHERE  `id`=28;

DELETE FROM `common_automation_document_type_event` WHERE  `id`=23;

DELETE FROM `common_automation_document_type_event` WHERE  `id`=30;

INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('3', '2', '2');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('3', '2', '3');
INSERT INTO `common_automation_document_action_config` (`document_type_id`, `event_id`, `action_id`) VALUES ('3', '2', '6');


UPDATE `common_notification_email_template` SET `id`='21', `template_name`='VENDOR_REQUEST_FOR_APPROVAL', `subject`='A vendor request received for your approval', `template_data`='<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold;\">Dear <span id=\"APPROVER_NAME\">Approver Name</span>,</td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td><span id=\"INVITED_BY\" style=\"font-weight: bold;\"> Vendor Business Name </span> vendor likes to add you as their customer in PaperTrl.</td>\r\n            </tr>\r\n            <tr>\r\n                <td>To view this request and for further actions please visit <a id=\"URL\" href=\"\">PaperTrl.com</a> <span id=\"ACCOUNT_NAME\"></span> ( <b>Vendor Requests</b> tab under <b>Vendors</b> )</td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    For any further clarifications, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr style=\"margin-top: 65px;\">\r\n                <td>\r\n                    <span style=\"font-weight: bold;\">\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        Thank You,\r\n                    </span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td><img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 8pt; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10pt; font-family: \'Helvetica\', sans-serif; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n', `event_id`='19', `status`='A', `created_by`='admin', `created_on`='2021-06-23', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='21');
