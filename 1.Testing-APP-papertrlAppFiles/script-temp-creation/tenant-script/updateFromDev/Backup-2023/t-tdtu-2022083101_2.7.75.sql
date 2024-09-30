ALTER TABLE `vp_po_receipt_detail` 
MODIFY COLUMN `received_qty` decimal(12, 2) NULL DEFAULT 0 AFTER `product_id`,
MODIFY COLUMN `amount` decimal(19, 2) NULL DEFAULT 0 AFTER `remaining_qty`,
MODIFY COLUMN `unit_price` decimal(19, 2) NULL AFTER `uom`;

INSERT INTO `common_drop_down_connection`(`drop_down_id`, `drop_down_value_id`) VALUES (17, 66);

ALTER TABLE `vp_po_receipt_mst` 
MODIFY COLUMN `receipt_date` date NULL AFTER `po_date`;

INSERT INTO `common_document_drawer_name`(`id`, `drawer_name`) VALUES (4, 'PO_RECEIPT_DRAFT_LIST_MODAL');