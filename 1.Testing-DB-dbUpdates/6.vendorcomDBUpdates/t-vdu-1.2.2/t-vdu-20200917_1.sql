CREATE TABLE `vp_customer_request` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `customer_name` varchar(50) DEFAULT NULL,
 `tenant_id` varchar(50) NOT NULL,
 `vendor_name` varchar(50) DEFAULT NULL,
 `vendor_email` varchar(50) DEFAULT NULL,
 `vendor_id` int(11) NOT NULL,
 `request_by` varchar(50) NOT NULL,
 `request_on` datetime DEFAULT NULL,
 `last_updated_by` varchar(50) DEFAULT NULL,
 `last_updated_on` varchar(255) DEFAULT NULL,
 `status` char(1) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`, `url`, `type`,
`super_type`, `department`, `date_created`, `created_user`, `menu_order`, `display_icon`,
`short_name`, `detail_text`, `status`) VALUES ('45', 'Customer Request', 'Customer Request',
'card text-white bg-info', '/home/admin/customer-request', 'S', '2', 'Admin', '2020-09-17 13:11:54',
'System', '303', 'fa fa-send', 'Customer', 'Request', 'A');