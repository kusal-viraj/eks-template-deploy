
/* tenant_db*/

/* Po number configuration table*/

CREATE TABLE `vp_po_number_config`  (			
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,			
`approval_group_id` int(10) NOT NULL,			
`approval_group_name` varchar(255) NULL,			
`prefixes` varchar(50) NULL,			
`suffixes` varchar(50) NULL,			
`separator_symbol_id` varchar(50) NULL,			
`running_no` int(10) UNSIGNED NULL,			
`is_override` boolean,			
`po_no_pattern` varchar(255) NULL,			
`status` char(5) NULL,			
`created_by` varchar(100) NULL,			
`created_on` datetime NULL,			
`update_by` varchar(100) NULL,			
`update_on` datetime NULL,			
`delete_by` varchar(100) NULL,			
`delete_on` datetime NULL,			
PRIMARY KEY (`id`)			
);	


/* Po number separator table*/

CREATE TABLE `common_separator`  (			
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,			
`separator` varchar(10) NULL,			
`status` char(1) NULL,			
PRIMARY KEY (`id`)			
);			

/* INSERTING Po number separator symbols*/

INSERT INTO `common_separator` (`id`, `separator`, `status`) VALUES ('1', '|', 'A');
INSERT INTO `common_separator` (`id`, `separator`, `status`) VALUES ('2', '#', 'A');
INSERT INTO `common_separator` (`id`, `separator`, `status`) VALUES ('3', '-', 'A');
INSERT INTO `common_separator` (`id`, `separator`, `status`) VALUES ('4', '/', 'A');
INSERT INTO `common_separator` (`id`, `separator`, `status`) VALUES ('5', '\\', 'A');


/* Inserting into common grid template table*/

INSERT INTO `common_grid_template` (`id`, `grid_name`) VALUES ('27', 'PO_NUMBER_CONFIGURATION_LIST');


/* Inserting into Common_grid_column_template*/

INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`, `drop_down_id`) VALUES (27, 'action', 'Action', 1, 0, 0, 0, 0, 'center', 'actionButton', 1, NULL);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'ap.id', 'Approval Group', 1, 1, 1, 1, 1, 'left', 'dropdown', 'Appproval Group', 2, NULL, '');
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (27, 'poc.poNoPattern', 'PO Number Pattern', 1, 1, 1, 1, 1, 'left', 'input', 'PO Number Pattern', 3);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES (27, 'poc.createdBy', 'Created By', 1, 1, 1, 1, 1, 'left', 'input', 'Created By', 4);
INSERT INTO `common_grid_column_template` (`grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (27, 'poc.createdOn', 'Created On', 1, 1, 1, 1, 1, 'left', 'input', 'Created On', 5, NULL, '');


/* Inserting into Common_grid_state_template*/

INSERT INTO `common_grid_state_template` (`grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES (27, 0, 10, '100,210,210,210,210');

INSERT INTO `common_automation_document_type` (`document_type`, `short_code`, `status`) VALUES ('Vendor', 'VENDOR', 'A');

INSERT INTO `common_automation_document_section_relation` (`document_id`, `section_id`) VALUES ('7', '1');


