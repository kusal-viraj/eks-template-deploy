
DROP TABLE IF EXISTS `common_automation_event_config`;
CREATE TABLE IF NOT EXISTS `common_automation_event_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_automation_mst` (`automation_id`),
  KEY `FK_common_automation_event` (`event_id`),
  CONSTRAINT `FK_common_automation_event` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`),
  CONSTRAINT `FK_common_automation_mst` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

INSERT INTO common_automation_event_config (automation_id,event_id) 
SELECT mst.id,mst.document_event FROM common_automation_mst mst GROUP BY mst.id;

ALTER TABLE `common_automation_mst`
	DROP FOREIGN KEY `FK_common_automation_mst_common_automation_event`;
	
ALTER TABLE `common_automation_mst`
	DROP INDEX `FK_common_automation_mst_common_automation_event`;
	
ALTER TABLE `common_automation_mst`
	DROP COLUMN `document_event`;
	
UPDATE `common_grid_column_template` SET `field`='documentEvent.eventId' WHERE  `id`=101;

UPDATE common_grid_column_user_wice gw SET gw.field='documentEvent.eventId' WHERE gw.field='automation.documentEvent';

INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (96, 1, 'eventExecutedUser', 'Event Executed User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (97, 2, 'eventExecutedUser', 'Event Executed User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (98, 3, 'eventExecutedUser', 'Event Executed User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (99, 4, 'eventExecutedUser', 'Event Executed User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `show_hide_enable_default`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`, `max_length`) VALUES (100, 5, 'eventExecutedUser', 'Event Executed User', 1, 1, 0, 0, 'int', NULL, '/user_management/sec_get_userlist_dropdown', 0, 0);

INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (403, 96, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (404, 97, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (405, 98, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (406, 99, 1);
INSERT INTO `common_automation_field_condition` (`id`, `field_id`, `condition_id`) VALUES (407, 100, 1);

INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`) VALUES (94, 5, 1, 1);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`) VALUES (95, 1, 3, 1);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`) VALUES (96, 2, 3, 1);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`) VALUES (97, 4, 3, 1);
INSERT INTO `common_automation_document_action_config` (`id`, `document_type_id`, `event_id`, `action_id`) VALUES (98, 5, 3, 1);

