----------Amal------2.6.9---------

CREATE TABLE `support_ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int DEFAULT NULL,
  `feature_id` int NOT NULL,
  `tp_ticket_id` varchar(100) DEFAULT NULL,
  `type_id` int NOT NULL,
  `summary` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `assigned_to_user` varchar(200) DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `support_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `file_name` varchar(500) NOT NULL,
  `file_type` varchar(500) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `support_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `support_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `support_audit_trail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_name` varchar(200) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `tp_ticket_id` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (9, 'Technical support', 'A', 'fa fa-cogs', 'Need help installing, configuring, or troubleshooting? Select this to request assistance.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (10, 'Licensing and billing questions', 'A', 'fa fa-credit-card', 'Choose this if you have questions about licensing or billing.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (11, 'Product trial questions', 'A', 'fa fa-phone-square', 'Trying out our product and want more information? Select this and we\'ll be happy to answer your questions.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (12, 'Other questions', 'A', 'fa fa-question-circle-o', 'Don\'t see what you\'re looking for? Select this option and we\'ll help you out.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (14, 'Report a bug', 'A', 'fa fa-bug', 'Tell us the problems you\'re experiencing.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (15, 'Suggest a new feature', 'A', 'fa fa-lightbulb-o', 'Let us know your idea for a new feature.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `support_type` (`id`, `name`, `status`, `icon`, `description`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (16, 'Suggest improvement', 'A', 'fa fa-bolt', 'See a place where we can do better? We\'re all ears.', 'SYSTEM', '2022-05-04 00:00:00', NULL, NULL, NULL, NULL);


INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `tab`, `type`, `super_type`, `super_type_2`, `department`, `menu_order`, `display_icon`, `short_name`, `detail_text`, `status`, `portal_menu`, `individual_tenant_menu`, `vendor_community_menu`, `version`, `auth_code`, `slim_menu`, `hierachy`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1050, 'Support Ticket', 'Support Ticket', 'fa fa-life-ring', '/home/support-ticket', '', 'S', 1014, NULL, 'Admin', 15, 'fa fa-life-ring', 'Support Ticket', 'Support Ticket', 'A', 1, 1, 0, 'V2', 'SUPPORT_TICKET', 1, '1014', 'System', '2022-05-09 11:56:44', NULL, NULL, NULL, NULL);
INSERT INTO `umm_privilages` (`id`, `url`, `text`, `auth_code`, `created_by`, `created_on`) VALUES ('131', 'Support Ticket', 'Support Ticket', 'SUPPORT_TICKET', 'System', '2022-05-09 12:27:55');
INSERT INTO `umm_menu_privilage` (`menu_id`, `privilage_id`, `auth_code`, `created_by`, `created_on`) VALUES ('1050', '131', 'SUPPORT_TICKET', 'System', '2022-05-09 11:22:00');
INSERT INTO `umm_role_previlege` (`role_id`, `privilege_id`, `sub_account_id`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 487, NULL, 'System', '2022-05-06 12:31:55', NULL, NULL, NULL, NULL);


INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES (52, 'SUPPORT_TICKET');
INSERT INTO `common_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (52, 52, 0, 15, '210,210,210,210,210');


INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (29, 'Ticket Status');

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (51, 'O', 'Open');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (52, 'P', 'Pending');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (53, 'C', 'Closed');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (85, 29, 51);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (86, 29, 52);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (87, 29, 53);

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (521, 52, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', '', 1, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (522, 52, 'sup.ticketId', 'Ticket No.', 1, 1, 1, 1, 1, 'left', 'input', 'Ticket No.', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (523, 52, 'sup.summary', 'Summary', 1, 1, 1, 1, 1, 'left', 'input', 'Summary', 3, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (524, 52, 'sup.description', 'Description', 1, 1, 1, 1, 1, 'left', 'input', 'Description', 4, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (525, 52, 'sup.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 5, NULL, '');
INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (526, 52, 'sup.status', 'Status', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Status', 6, 29, '');





