CREATE TABLE `common_delegate_user_actions` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(150) NOT NULL COLLATE 'latin1_swedish_ci',
	`status` CHAR(1) NOT NULL DEFAULT 'A' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`id`) USING BTREE
);

INSERT INTO `common_delegate_user_actions` (`id`, `name`, `status`) VALUES (1, 'Expense Creation', 'A');
INSERT INTO `common_delegate_user_actions` (`id`, `name`, `status`) VALUES (2, 'Process Credit Card Statements', 'A');
INSERT INTO `common_delegate_user_actions` (`id`, `name`, `status`) VALUES (3, 'Approval Permission - PO, Bill & Payments', 'A');

CREATE TABLE `common_delegate_user_action_wise_menus` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`action_id` INT(11) NOT NULL,
	`menu_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK1_MENU_ID` (`menu_id`) USING BTREE,
	CONSTRAINT `FK1_MENU_ID` FOREIGN KEY (`menu_id`) REFERENCES `umm_menu` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (1, 1015);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (1, 1007);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (1, 1051);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (1, 1057);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (2, 1054);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (2, 1057);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (2, 1048);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1006);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1021);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1005);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1019);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1029);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1064);
INSERT INTO `common_delegate_user_action_wise_menus` (`action_id`, `menu_id`) VALUES (3, 1015);


CREATE TABLE `common_delegate_user_action_wise_privileges` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`action_id` INT(11) NOT NULL,
	`privilege_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK1_ACTION_ID` (`action_id`) USING BTREE,
	INDEX `FK2_PRIVILAGE_ID` (`privilege_id`) USING BTREE,
	CONSTRAINT `FK1_ACTION_ID` FOREIGN KEY (`action_id`) REFERENCES `common_delegate_user_actions` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_PRIVILAGE_ID` FOREIGN KEY (`privilege_id`) REFERENCES `umm_menu_privilage` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);


INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 102);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 103);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 104);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 107);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 108);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 109);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 110);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 342);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 383);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 464);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 510);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 511);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 512);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (1, 558);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 497);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 498);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 499);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 510);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 511);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 512);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 552);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 554);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (2, 558);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 64);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 65);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 66);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 67);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 69);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 88);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 89);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 90);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 93);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 119);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 120);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 340);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 382);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 402);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 403);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 409);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 425);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 468);
INSERT INTO `common_delegate_user_action_wise_privileges` (`action_id`, `privilege_id`) VALUES (3, 528);

CREATE TABLE `delegate_user_account_switch_logs` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`delegate_user_id` INT(11) NOT NULL,
	`delegate_owner_id` INT(11) NOT NULL,
	`switch_to_delegate_profile` CHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`return_to_original_profile` CHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`switched_date_time` DATETIME NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK1_DELEGATE_USER_ID` (`delegate_user_id`) USING BTREE,
	INDEX `FK2_DELEGATE_TO` (`delegate_owner_id`) USING BTREE,
	CONSTRAINT `FK1_DELEGATE_USER_ID` FOREIGN KEY (`delegate_user_id`) REFERENCES `umm_user_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_DELEGATE_TO` FOREIGN KEY (`delegate_owner_id`) REFERENCES `umm_user_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE `delegate_user_owner_relation` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`owner_id` INT(11) NOT NULL,
	`delegate_user_id` INT(11) NOT NULL,
	`receive_email` TINYINT(1) NOT NULL DEFAULT '0',
	`switched` TINYINT(1) NOT NULL DEFAULT '0',
	`status` CHAR(1) NOT NULL DEFAULT 'A' COLLATE 'latin1_swedish_ci',
	`period_start_date` DATE NULL DEFAULT NULL,
	`period_end_date` DATE NULL DEFAULT NULL,
	`created_by` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci',
	`created_on` DATETIME NOT NULL,
	`update_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`update_on` DATETIME NULL DEFAULT NULL,
	`delete_by` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`delete_on` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK1_OWNER_ID` (`owner_id`) USING BTREE,
	INDEX `FK2_DELEGATE_USER_ID` (`delegate_user_id`) USING BTREE,
	CONSTRAINT `FK1_OWNER_ID` FOREIGN KEY (`owner_id`) REFERENCES `umm_user_mst` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_DELEGATE_USER_ID` FOREIGN KEY (`delegate_user_id`) REFERENCES `umm_user_mst` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE `delegate_user_wise_actions` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`delegate_relation_id` INT(11) NOT NULL,
	`action_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK1_DELEGATE_RELATION_ID` (`delegate_relation_id`) USING BTREE,
	INDEX `FK2_ACTION_ID` (`action_id`) USING BTREE,
	CONSTRAINT `FK1_DELEGATE_RELATION_ID` FOREIGN KEY (`delegate_relation_id`) REFERENCES `delegate_user_owner_relation` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK2_ACTION_ID` FOREIGN KEY (`action_id`) REFERENCES `common_delegate_user_actions` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO `common_notification_email_template` (`id`, `template_name`, `subject`, `template_data`, `event_id`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (46, 'DELEGATE_USER_CREATED_EMAIL_TEMPLATE', 'You\'ve Been Added as a Delegate of DELE_OWNER', '<html>\r\n\r\n<head>\r\n    <meta charset="UTF-8">\r\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n    <table  width="100%" border="0" cellpadding="0" cellspacing="0">\r\n        <tr>\r\n            <td colspan="3" style="height: 70px;">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width="650" style="box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; ">\r\n                <table border="0" cellpadding="0" cellspacing="0" width="100%"\r\n                    style="background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;">\r\n                    <tr>\r\n                        <td colspan="3" style="background: #26464a; height: 5px;"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan="3" height="30">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style="width: 40px;" width="40px">\r\n\r\n                        </td>\r\n                        <td style="text-align: center;">\r\n                            <img width="163" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png" />\r\n                        </td>\r\n                        <td style="width: 40px;" width="40px">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan="3" height="40">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>Dear <span id="EMAIL_SEND_TO" style="font-weight: bold;">(Receiver Name)</span>,</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>\r\n						<span id="DELE_OWNER" style="font-weight: bold;"> (Delegate Owner Name) </span> has added you as a delegate. You have been given the following permissions:\r\n						</td> \r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width="40"></td>\r\n                        <td>\r\n						<span id="PERMISSION_LIST"> (permissions list) </span>\r\n						</td> \r\n                        <td width="40"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n					 <tr>\r\n                        <td width="40"></td>\r\n                        <td>Please be aware that the above granted privileges are limited to the owner\'s current permissions.</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n					 <tr>\r\n                        <td width="40"></td>\r\n                        <td>Log in to PaperTrl, navigate to the profile section and switch the account to access the system as the designated delegate user.</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style="height: 40px;">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td><img height="38" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png" /></td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td style=" font-size: 12px;">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style="font-weight: bold;">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width="40"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width="40"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan="3" align="center">\r\n                <br /><br />\r\n                <table  align="center" border="0" cellpadding="0" cellspacing="0">\r\n                    <tr>\r\n                        <td width="75" align="center"><a href="javascript:void(0)" target="_blank"><img\r\n                                    src="https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png"\r\n                                    width="25"></a>\r\n                        </td>\r\n                        \r\n                        <td width="75" align="center"><a href="https://www.facebook.com/PaperTrl" target="_blank"><img\r\n                                    src="https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png"\r\n                                    width="25"></a>\r\n                        </td>\r\n                        <td width="75" align="center"><a href="https://www.linkedin.com/company/papertrl"\r\n                                target="_blank"><img\r\n                                    src="https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png"\r\n                                    width="25"></a>\r\n                        </td>\r\n\r\n                    </tr>\r\n                    <tr>\r\n                        <td>&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <table width="100%" style="font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;">\r\n                    <tr>\r\n                        <td align="center">Copyright Ãƒâ€šÃ‚Â© 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align="center">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>\r\n', 36, 'A', 'admin', '2024-05-20', NULL, NULL, NULL, NULL);
