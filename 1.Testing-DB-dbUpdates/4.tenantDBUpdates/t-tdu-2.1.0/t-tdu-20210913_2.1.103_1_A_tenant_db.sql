------------Indra-------2.1.103--------------------


INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (449, 40, 'recBill.noOfGeneration', 'No Of Bill Generated', 1, 1, 1, 1, 1, 'center', 'number', 'No Of Bill Generated', 4, NULL, '');

UPDATE `common_grid_column_template` SET `column_order`='5' WHERE  `id`=389;
UPDATE `common_grid_column_template` SET `column_order`='6' WHERE  `id`=390;
UPDATE `common_grid_column_template` SET `column_order`='7' WHERE  `id`=391;
UPDATE `common_grid_column_template` SET `column_order`='8' WHERE  `id`=392;
UPDATE `common_grid_column_template` SET `column_order`='9' WHERE  `id`=393;
UPDATE `common_grid_column_template` SET `align`='center' WHERE  `id`=393;
UPDATE `common_grid_column_template` SET `column_order`='10' WHERE  `id`=397;
UPDATE `common_grid_column_template` SET `column_order`='11' WHERE  `id`=398;

UPDATE `common_grid_state_template` SET `column_widths`='50,100,210,210,210,210,210,210,210,210,210,210,210,210' WHERE  `id`=40;

DELETE FROM common_grid_column_user_wice  WHERE grid_id=40;