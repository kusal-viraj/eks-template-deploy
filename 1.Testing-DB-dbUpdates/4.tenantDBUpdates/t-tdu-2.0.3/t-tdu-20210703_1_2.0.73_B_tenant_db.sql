
ALTER TABLE `common_account_number` 
ADD COLUMN `is_purchase_account` CHAR(2) NULL DEFAULT 'Q' AFTER `created_by`;

INSERT INTO `common_drop_down` (`id`, `drop_down_name`) VALUES (22, 'Is PO Account Status');

INSERT INTO `common_grid_column_template` (`id`, `grid_id`, `field`, `header`, `column_show`, `is_sortable`, `is_re_orderable`, `is_re_sizable`, `can_hide`, `align`, `search_type`, `placeholder`, `column_order`, `drop_down_id`, `drop_down_url`) VALUES (298, 4, 'acc.isPurchaseAccount', 'Purchasing Account', 1, 1, 1, 1, 1, 'center', 'dropdown', 'Purchasing Account', 8, 22, '');
UPDATE `common_grid_state_template` SET `column_widths` = '50,102,257,257,257,257,257,257,257' WHERE (`id` = '4');

UPDATE `common_grid_column_template` SET `column_order` = '9' WHERE (`id` = '30');
UPDATE `common_grid_column_template` SET `drop_down_id` = '22' WHERE (`id` = '298');

INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (37, 'Z', 'YES');
INSERT INTO `common_drop_down_value` (`id`, `value`, `label`) VALUES (38, 'Q', 'NO');

INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (65, 22, 37);
INSERT INTO `common_drop_down_connection` (`id`, `drop_down_id`, `drop_down_value_id`) VALUES (66, 22, 38);

CREATE TABLE `vp_po_account_detail` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`account_id`  int(11) NULL ,
`project_id`  int(11) NULL ,
`purchase_order_mst_id`  int(11) NULL ,
`amount`  decimal(19,2) NULL ,
PRIMARY KEY (`id`),
CONSTRAINT `FK_vp_po_account_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_vp_po_account_approval_code` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_vp_po_account_po_mst` FOREIGN KEY (`purchase_order_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `common_automation_document_section` (`id`, `name`, `status`) VALUES ('9', 'Account Details Section', 'A');
INSERT INTO `common_automation_document_section_relation` (`id`, `document_id`, `section_id`) VALUES ('16', '2', '9');

ALTER TABLE `vp_po_mst`
ADD COLUMN `item_gross_amount`  decimal(19,2) NULL AFTER `delete_on`,
ADD COLUMN `account_gross_amount`  decimal(19,2) NULL AFTER `item_gross_amount`;
ALTER TABLE `vp_po_mst`
MODIFY COLUMN `account_gross_amount`  decimal(19,2) NULL DEFAULT NULL AFTER `shipping_address`,
MODIFY COLUMN `item_gross_amount`  decimal(19,2) NULL DEFAULT NULL AFTER `account_gross_amount`;

UPDATE vp_po_mst mst SET mst.item_gross_amount=mst.gross_amount, mst.account_gross_amount=0 WHERE mst.item_gross_amount IS NULL;
