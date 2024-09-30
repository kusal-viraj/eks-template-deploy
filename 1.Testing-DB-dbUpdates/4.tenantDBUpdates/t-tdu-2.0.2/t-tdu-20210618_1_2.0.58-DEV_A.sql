ALTER TABLE `common_automation_field`
	ADD COLUMN `max_length` INT(11) NOT NULL AFTER `second_value`;
	
	
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=1;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=2;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=11;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=11;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=13;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=14;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=15;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=16;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=17;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=20;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=23;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=24;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=26;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=27;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=28;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=29;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=30;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=31;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=32;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=37;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=38;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=39;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=40;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=43;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=45;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=46;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=47;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=48;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=49;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=50;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=51;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=52;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=53;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=56;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=59;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=60;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=61;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=66;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=69;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=70;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=71;
UPDATE `common_automation_field` SET `max_length`='19' WHERE  `id`=81;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=82;
UPDATE `common_automation_field` SET `max_length`='50' WHERE  `id`=83;


UPDATE `common_grid_column_template` SET `search_type`='number' WHERE (`id`='141');

DELETE FROM `common_grid_column_user_wice`;
