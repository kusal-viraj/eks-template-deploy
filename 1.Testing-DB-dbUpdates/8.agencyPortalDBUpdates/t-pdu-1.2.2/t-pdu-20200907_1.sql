UPDATE`umm_menu` SET `url`='/home/admin/employee-management' WHERE `id`=48;
UPDATE `umm_menu` SET `url`='/home/ven-invoice/approval-code-management' WHERE `id`=47;

DELETE FROM `umm_menu` WHERE `id`=7;

UPDATE `umm_menu` SET `display_icon`='fa fa-code' WHERE `id`=47;
UPDATE `umm_menu` SET `display_icon`='fa fa-users' WHERE `id`=48;
UPDATE `umm_menu` SET `display_icon`='icon-settings icons' WHERE `id`=46;
UPDATE `umm_menu` SET `display_icon`='fa fa-cubes' WHERE `id`=50;