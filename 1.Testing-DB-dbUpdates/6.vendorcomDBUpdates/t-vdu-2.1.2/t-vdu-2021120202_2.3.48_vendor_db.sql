---------2.3.48------madhusha-----------

UPDATE `vendor_menu_privilage` SET `id`='209', `menu_id`='1022', `prililage_id`='1', `auth_code`='RECURRING_INVOICES_CREATE', `created_by`='System', `created_on`='2021-12-02 18:50:33', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='209');


UPDATE `vendor_menu_privilage` SET `id`='210', `menu_id`='1022', `prililage_id`='4', `auth_code`='RECURRING_INVOICES_EDIT', `created_by`='System', `created_on`='2021-12-02 18:50:36', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='210');


UPDATE `vendor_menu_privilage` SET `id`='211', `menu_id`='1022', `prililage_id`='14', `auth_code`='RECURRING_INVOICES_ACTIVATE', `created_by`='System', `created_on`='2021-12-02 18:50:39', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='211');


UPDATE `vendor_menu_privilage` SET `id`='212', `menu_id`='1022', `prililage_id`='13', `auth_code`='RECURRING_INVOICES_INACTIVATE', `created_by`='System', `created_on`='2021-12-02 18:50:43', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='212');


UPDATE `vendor_menu_privilage` SET `id`='213', `menu_id`='1022', `prililage_id`='5', `auth_code`='RECURRING_INVOICES_DELETE', `created_by`='System', `created_on`='2021-12-02 18:50:46', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='213');


UPDATE `vendor_menu_privilage` SET `id`='214', `menu_id`='1022', `prililage_id`='3', `auth_code`='RECURRING_INVOICES_DETAIL_VIEW', `created_by`='System', `created_on`='2021-12-02 18:50:50', `update_by`=NULL, `update_on`=NULL, `delete_by`=NULL, `delete_on`=NULL WHERE (`id`='214');


CREATE TABLE `vendor_recurring_invoice_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vendor_rec_bill_att` (`template_mst_id`),
  CONSTRAINT `vendor_rec_bill_att` FOREIGN KEY (`template_mst_id`) REFERENCES `vendor_recurring_invoice_template_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

