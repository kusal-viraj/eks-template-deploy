---------Niron-----2.3.5------------

UPDATE `common_grid_column_template` SET `id`='48', `grid_id`='3', `field`='email.subject', `header`='Email Subject', `column_show`='1', `is_sortable`='1', `is_re_orderable`='1', `is_re_sizable`='1', `can_hide`='1', `align`='left', `search_type`='input', `placeholder`='Email Subject', `column_order`='3', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='48');

UPDATE `common_grid_column_template` SET `id`='49', `grid_id`='3', `field`='email.toAddress', `header`='Email Address', `column_show`='1', `is_sortable`='1', `is_re_orderable`='1', `is_re_sizable`='1', `can_hide`='1', `align`='left', `search_type`='input', `placeholder`='Email Address', `column_order`='4', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='49');

UPDATE `common_grid_column_template` SET `id`='47', `grid_id`='3', `field`='tenantId', `header`='Company Name', `column_show`='1', `is_sortable`='1', `is_re_orderable`='1', `is_re_sizable`='1', `can_hide`='1', `align`='left', `search_type`='dropdown', `placeholder`='Company Name', `column_order`='2', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='47');

INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES ('3', 'Email Status');

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES ('4', 'Y', 'Sent');
INSERT INTO `common_drop_down_value` (`value`, `label`) VALUES ('N', 'Not-Sent');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (7, 3, 4);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (8, 3, 5);

UPDATE `common_grid_column_template` SET `drop_down_id`='3' WHERE  `id`=53;

UPDATE `common_grid_column_template` SET `id`='52', `grid_id`='3', `field`='email.createdOn', `header`='Date', `column_show`='1', `is_sortable`='1', `is_re_orderable`='1', `is_re_sizable`='1', `can_hide`='1', `align`='center', `search_type`='date', `placeholder`='Date', `column_order`='7', `drop_down_id`=NULL, `drop_down_url`='' WHERE (`id`='52');

