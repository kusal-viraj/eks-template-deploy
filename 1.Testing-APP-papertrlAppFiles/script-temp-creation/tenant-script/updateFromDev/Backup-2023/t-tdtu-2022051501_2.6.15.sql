ALTER TABLE `support_ticket` ADD COLUMN `issue_key` VARCHAR(100) NULL DEFAULT NULL AFTER `delete_on`;

UPDATE `common_grid_column_template` SET `field`='sup.custTicketId' WHERE  `id`=522;

UPDATE `common_drop_down_value` SET `value`='Waiting for Support', `label`='Waiting for Support' WHERE  `id`=51;
UPDATE `common_drop_down_value` SET `value`='Canceled', `label`='Canceled' WHERE  `id`=52;
UPDATE `common_drop_down_value` SET `value`='Closed' WHERE  `id`=53;

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('54', 'Done', 'Done');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('55', 'Escalated', 'Escalated');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('56', 'In Progress', 'In Progress');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('57', 'Open', 'Open');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('58', 'Pending ', 'Pending ');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('59', 'Reopened', 'Reopened');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('60', 'Resolved', 'Resolved');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('61', 'Waiting for Customer', 'Waiting for Customer');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('62', 'Work in Progress', 'Work in Progress');


INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('88', '29', '54');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('89', '29', '55');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('90', '29', '56');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('91', '29', '57');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('92', '29', '58');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('93', '29', '59');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('94', '29', '60');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('95', '29', '61');
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('96', '29', '62');