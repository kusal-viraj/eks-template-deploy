--------------------madusha------------------

ALTER TABLE `common_automation_field`
ADD COLUMN `show_hide_enable_default`  tinyint(1) NULL DEFAULT 0 AFTER `show_hide_enable`;

UPDATE common_automation_field SET show_hide_enable_default = show_hide_enable;

UPDATE `common_automation_field` SET `show_hide_enable`='1' WHERE (`id`='90');

UPDATE `common_automation_field` SET `show_hide_enable_default`='1' WHERE (`id`='73');
