--------Amal------2.3.23------

ALTER TABLE `vendor_invoice_template_mst` 
ADD COLUMN `bill_term` INT(11) NULL DEFAULT NULL AFTER `delete_on`,
ADD COLUMN `status` CHAR(1) NOT NULL DEFAULT 'A' AFTER `bill_term`,
ADD COLUMN `po_no` VARCHAR(100) NULL DEFAULT NULL AFTER `status`,
ADD COLUMN `bill_amount` DECIMAL(10,2) NULL DEFAULT 0.00 AFTER `po_no`,
ADD COLUMN `bill_date_str` VARCHAR(100) NULL DEFAULT NULL AFTER `bill_amount`,
ADD COLUMN `bill_no` VARCHAR(100) NULL DEFAULT NULL AFTER `bill_date_str`,
ADD COLUMN `attachment_id` INT(11) NULL DEFAULT NULL AFTER `bill_no`;

ALTER TABLE `vendor_invoice_template_mst` 
CHANGE COLUMN `invoice_date_format` `bill_date_format` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `invoice_id` `bill_id` INT(11) NOT NULL ;

ALTER TABLE `vendor_invoice_template_mst` 
CHANGE COLUMN `bill_term` `bill_term` INT(11) NULL DEFAULT NULL AFTER `bill_id`;

ALTER TABLE `vendor_invoice_template_mst` 
CHANGE COLUMN `bill_date_format` `bill_date_format` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `bill_id` `bill_id` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `vendor_invoice_attachment` 
ADD COLUMN `attachment_url` VARCHAR(300) NOT NULL AFTER `file_type`,
ADD COLUMN `status` CHAR(1) NULL DEFAULT 'A' AFTER `attachment_url`,
ADD COLUMN `delete_by` VARCHAR(100) NULL DEFAULT '' AFTER `status`,
ADD COLUMN `delete_on` DATETIME NULL DEFAULT NULL AFTER `delete_by`;

ALTER TABLE `vendor_invoice_attachment` 
DROP COLUMN `invoice_data`;

ALTER TABLE `vendor_invoice_attachment` 
CHANGE COLUMN `invoice_id` `bill_id` INT(11) NOT NULL ;

ALTER TABLE `vendor_invoice_attachment` 
CHANGE COLUMN `bill_id` `bill_id` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `status` `status` CHAR(1) NOT NULL DEFAULT 'A' ;

INSERT INTO `vendor_grid_template` (`id`, `grid_name`) VALUES ('25', 'VENDOR_INVOICE_TEMPLATE');

INSERT INTO `vendor_drop_down` (`id`, `drop_down_name`) VALUES ('25', 'Vendor Template Status');
INSERT INTO `vendor_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('75', '25', '1');
INSERT INTO `vendor_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES ('76', '25', '2');

INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('288', '25', 'checkbox', '1', '0', '0', '0', '0', 'center', 'checkbox', '1');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `column_order`) VALUES ('289', '25', 'action', 'Action', '1', '0', '0', '0', '0', 'center', 'actionButton', '2');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('290', '25', 'temp.templateName', 'Template Name ', '1', '1', '1', '1', '1', 'center', 'input', 'Template Name', '3');

INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`) VALUES ('291', '25', 'temp.status', 'Status', '1', '1', '1', '1', '1', 'center', 'dropdown', 'Status', '4', '25');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`) VALUES ('292', '25', 'temp.createdBy', 'Created By', '1', '1', '1', '1', '1', 'center', 'input', 'Created By', '5');
INSERT INTO `vendor_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (293, 25, 'temp.createdOn', 'Created Date', 1, 1, 1, 1, 1, 'center', 'date', 'Created Date', 6, NULL, '');

INSERT INTO `vendor_grid_state_template` (`id`, `grid_id`, `start_from`, `total_rows`, `column_widths`) VALUES ('28', '25', '0', '10', '50,100,210,210,210,210');

ALTER TABLE `vendor_invoice_template_mst`
ADD COLUMN `discount_percentage` DECIMAL(5,2) NULL DEFAULT NULL AFTER `bill_term`,
ADD COLUMN `discount_days_due` INT(3) NULL DEFAULT NULL AFTER `discount_percentage`,
ADD COLUMN `net_days_due` INT(3) NULL DEFAULT NULL AFTER `discount_days_due`,
CHANGE COLUMN `created_by` `created_by` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci' AFTER `net_days_due`;

ALTER TABLE `vendor_invoice_term`
ADD COLUMN `in_months` INT(4) NULL DEFAULT NULL AFTER `term`,
ADD COLUMN `on_month` INT(4) NULL DEFAULT NULL AFTER `in_months`,
ADD COLUMN `on_day` INT(4) NULL DEFAULT NULL AFTER `on_month`,
ADD COLUMN `end_of_month` TINYINT(1) NULL DEFAULT '0' AFTER `discount_days_due`,
ADD COLUMN `from_entry` TINYINT(1) NULL DEFAULT '0' AFTER `end_of_month`;

UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '1');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '2');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '3');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '4');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '5');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '6');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '8');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '7');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '9');
UPDATE `vendor_invoice_term` SET `created_on` = '2021-11-16 04:00:00' WHERE (`id` = '10');