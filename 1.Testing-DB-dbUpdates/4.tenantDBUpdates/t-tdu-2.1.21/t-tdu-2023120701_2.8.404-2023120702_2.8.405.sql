-----dasindu 2.8.404---


ALTER TABLE `common_notification_email_template`
	DROP FOREIGN KEY `FK_notification_subscription_event`;
	
ALTER TABLE `common_notification_email_template`
CHANGE COLUMN `event_id` `event_id` INT(15) NULL AFTER `template_data`,
DROP INDEX `FK_notification_subscription_event`;

INSERT INTO `common_notification_email_template` (`id`,`template_name`, `subject`, `template_data`, `event_id`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (44,'USER_ACCOUNT_LOCKED', 'Account Locked', '<table style=\"background:#F4F6F9 ; \" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tr>\r\n        <td colspan=\"3\" style=\"height: 70px;\">\r\n            &nbsp;\r\n        </td>\r\n    </tr>\r\n    <tr>\r\n        <td>&nbsp;</td>\r\n        <td width=\"650\"\r\n            style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; border: 1px solid rgba(57, 57, 57, 0.2); \">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" bgcolor=\"#fff\"\r\n                style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                <tr>\r\n                    <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                    <td style=\"width: 40px;\" width=\"40px\">\r\n                    </td>\r\n                    <td style=\"text-align: center;\">\r\n                        <img width=\"163\" src=\"
https://papertrl.com/wp-content/uploads/2019/09/logo.png\"
/>\r\n                    </td>\r\n                    <td style=\"width: 40px;\" width=\"40px\">\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold;\">Customer Name</span>,</td>\r\n                    <td width=\"40\"><tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n</td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>Your account has been locked due to too many incorrect login attempts.</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>Your account will unlock automatically in <span id=\"ACCOUNT_UNLOCK_DURATION\">Duration</span> minutes.<td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>If you didn\'t try to login, or suspect that someone else is attempting to access your account, please reset your password.<br/><br/></td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n               \r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>Thank You!</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td><img height=\"38\" src=\"\r\n
https://papertrl.com/wp-content/uploads/2019/09/logo.png\"
/></td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be read\r\n                        or responded to. We\'re\r\n                        happy to help you with any questions or concerns you may have. Please contact us directly via\r\n                        <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    </td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td width=\"40\"></td>\r\n                    <td>&nbsp;</td>\r\n                    <td width=\"40\"></td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n        <td>&nbsp;</td>\r\n    </tr>\r\n    <tr>\r\n        <td colspan=\"3\" align=\"center\">\r\n            <br /><br />\r\n            <table width=\"250\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tr>\r\n                    <td width=\"25\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img src=\"\r\n
https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"
width=\"25\"></a>\r\n                    </td>\r\n                    <td width=\"25\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img src=\"\r\n
https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/youtube.png\"
width=\"25\"></a>\r\n                    </td>\r\n                    <td width=\"25\" align=\"center\"><a href=\"\r\n
https://www.facebook.com/PaperTrl\"
target=\"_blank\"><img src=\"\r\n
https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"
width=\"25\"></a>\r\n                    </td>\r\n                    <td width=\"25\" align=\"center\"><a href=\"\r\n
https://www.linkedin.com/company/papertrl\"
target=\"_blank\"><img src=\"\r\n
https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"
width=\"25\"></a>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td></td>\r\n                </tr>\r\n            </table>\r\n            <br />\r\n            <table width=\"650\" style=\"font-size: 12px; color: #555;\">\r\n                <tr>\r\n                    <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                </tr>\r\n                <tr>\r\n                    <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                </tr>\r\n                <tr>\r\n                    <td align=\"center\">&nbsp;</td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>', NULL, 'A', 'admin', '2023-12-01', NULL, NULL, NULL, NULL);





-----sithunm 2.8.405---

DELETE  FROM vp_vendor_mst_additional_data WHERE field_value IS NULL;