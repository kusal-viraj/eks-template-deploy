----Madusha------
----2020-11-06_01---

INSERT INTO `common_product_type` (`id`, `name`, `description`, `status`, `icon`) VALUES
('4', 'Other', 'Use for miscellaneous labor, material, or part charges, such as delivery charges, setup fees, and service charges.', 'A', 'fa fa-ellipsis-h');

UPDATE `umm_menu` SET `id`='45', `name`='Purchase Order Received',
`display_text`='Purchase Order Received', `menu_style`='card text-white bg-info',
`url`='/home/po-received/management/po-received', `type`='S', `super_type`='5',
`super_type_2`=NULL, `department`='Admin', `date_created`='2020-11-05 18:42:40',
`created_user`='System', `menu_order`='215', `display_icon`='fa fa-file-text-o',
`short_name`='Purchase Order', `detail_text`='Received', `status`='A', `portal_menu`='0'
WHERE (`id`='45');

