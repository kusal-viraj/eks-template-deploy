/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `common_automation_field`;
CREATE TABLE IF NOT EXISTS `common_automation_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` int(11) NOT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `field_name` varchar(200) NOT NULL,
  `condition_enable` tinyint(1) NOT NULL,
  `action_enable` tinyint(1) NOT NULL,
  `show_hide_enable` tinyint(1) NOT NULL,
  `data_type` varchar(50) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `drop_down_url` varchar(200) DEFAULT NULL,
  `second_value` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK` (`document_type`),
  KEY `FK_common_automation_field_common_drop_down` (`drop_down_id`),
  CONSTRAINT `DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_common_automation_field_common_drop_down` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `common_automation_field` DISABLE KEYS */;
INSERT INTO `common_automation_field` (`id`, `document_type`, `short_code`, `field_name`, `condition_enable`, `action_enable`, `show_hide_enable`, `data_type`, `drop_down_id`, `drop_down_url`, `second_value`) VALUES
	(1, 1, 'invoiceNo', 'Bill Number', 1, 1, 0, 'text', NULL, NULL, 0),
	(2, 1, 'invoiceAmount', 'Bill Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(3, 1, 'vendorId', 'Vendor', 1, 1, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0),
	(4, 1, 'templateId', 'Template', 1, 1, 0, 'int', NULL, NULL, 0),
	(5, 1, 'poId', 'PO Number', 1, 1, 1, 'text', NULL, NULL, 0),
	(6, 1, 'grnMstId', 'PO Receipt Number', 1, 1, 1, 'text', NULL, NULL, 0),
	(7, 1, 'invoiceDateFormat', 'Date Format', 0, 0, 0, 'int', NULL, '/common_service/sec_view_dateformats_v2', 0),
	(8, 1, 'invoiceDate', 'Bill Date', 1, 1, 0, 'date', NULL, NULL, 1),
	(9, 1, 'term', 'Payment Terms', 1, 1, 0, 'int', NULL, '/vendor_portal/sec_get_bill_terms_list_v2', 0),
	(10, 1, 'dueDate', 'Due Date', 1, 1, 0, 'date', NULL, NULL, 1),
	(11, 1, 'additionalNotes', 'Comment', 0, 0, 1, 'text', NULL, NULL, 0),
	(12, 1, 'itemId', 'Item Code', 0, 0, 0, 'int', NULL, '/common_service/sec_get_item_dropdown_list_v2', 0),
	(13, 1, 'description', 'Item Name', 0, 0, 0, 'text', NULL, NULL, 0),
	(14, 1, 'qty', 'Units', 0, 0, 0, 'int', NULL, NULL, 1),
	(15, 1, 'rate', 'Unit Price', 0, 0, 0, 'decimal', NULL, NULL, 1),
	(16, 1, 'tax', 'Tax Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(17, 3, 'grnNumber', 'PO Receipt Number', 1, 1, 0, 'text', NULL, NULL, 0),
	(18, 3, 'grnDate', 'PO Receipt Date', 1, 1, 0, 'date', NULL, NULL, 1),
	(19, 3, 'vendorId', 'Vendor', 1, 1, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0),
	(20, 3, 'poId', 'PO Number', 1, 1, 0, 'text', NULL, NULL, 0),
	(21, 3, 'poDate', 'PO Date', 1, 1, 0, 'date', NULL, NULL, 1),
	(22, 3, 'transporterName', 'Received By', 0, 0, 0, 'int', NULL, NULL, 0),
	(23, 3, 'itemNumber', 'Item Number', 0, 0, 1, 'text', NULL, NULL, 0),
	(24, 3, 'description', 'Item Name', 0, 0, 1, 'text', NULL, NULL, 0),
	(25, 3, 'uomId', 'UOM', 0, 0, 1, 'int', NULL, '/common_service/sec_get_uom_dropdown_list', 0),
	(26, 3, 'remainingQty', 'Remaining Qty', 0, 0, 1, 'int', NULL, NULL, 1),
	(27, 3, 'receivedQty', 'Received Qty', 0, 0, 1, 'int', NULL, NULL, 1),
	(28, 3, 'unitPrice', 'Unit Price', 0, 0, 1, 'decimal', NULL, NULL, 1),
	(29, 3, 'amount', 'Amount', 0, 0, 1, 'decimal', NULL, NULL, 1),
	(30, 3, 'totalAmount', 'Total Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(31, 3, 'note', 'Notes', 0, 0, 0, 'text', NULL, NULL, 0),
	(32, 2, 'poNumber', 'Po Number', 1, 1, 0, 'text', NULL, NULL, 0),
	(33, 2, 'createdOn', 'Submit Date', 1, 1, 1, 'date', NULL, NULL, 1),
	(34, 2, 'vendorId', 'Vendor', 1, 1, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0),
	(35, 2, 'projectCodeId', 'Project / Task', 1, 1, 1, 'int', NULL, '/common_service/sec_get_detailed_approval_codes_by_category', 0),
	(36, 2, 'deliveryDate', 'Date of Delivery ', 1, 1, 0, 'date', NULL, NULL, 1),
	(37, 2, 'pocPhone', 'Contact Number', 0, 1, 0, 'text', NULL, NULL, 0),
	(38, 2, 'pocName', 'Contact Person', 1, 1, 0, 'text', NULL, NULL, 0),
	(39, 2, 'notes', 'Notes', 0, 0, 1, 'text', NULL, NULL, 0),
	(40, 2, 'shippingAddress', 'Shipping Address', 0, 0, 0, 'text', NULL, NULL, 0),
	(41, 2, 'billingAddress', 'Billing Address', 0, 0, 0, 'text', NULL, NULL, 0),
	(42, 2, 'productId', 'Select Item', 0, 0, 0, 'int', NULL, '/common_service/sec_get_item_dropdown_list_v2', 0),
	(43, 2, 'description', 'Item Name', 0, 0, 0, 'text', NULL, NULL, 0),
	(44, 2, 'uomId', 'UOM', 0, 0, 0, 'int', NULL, '/common_service/sec_get_uom_dropdown_list', 0),
	(45, 2, 'qty', 'QTY', 0, 0, 0, 'int', NULL, NULL, 1),
	(46, 2, 'grossAmount', 'Price', 0, 0, 0, 'decimal', NULL, NULL, 1),
	(47, 2, 'discountAmount', 'Discount', 0, 0, 0, 'decimal', NULL, NULL, 1),
	(48, 2, 'amount', 'Amount', 0, 0, 0, 'decimal', NULL, NULL, 1),
	(49, 2, 'taxAmount', 'Tax amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(50, 2, 'discountAmount', 'Discount Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(51, 2, 'netAmount', 'Net Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(52, 4, 'reportName', 'Report Name', 0, 0, 1, 'text', NULL, NULL, 0),
	(53, 4, 'businessPurpose', 'Business Purpose', 0, 0, 1, 'text', NULL, NULL, 0),
	(54, 4, 'report', 'Receipt', 0, 0, 0, 'text', NULL, NULL, 0),
	(55, 4, 'createdOn', 'Date', 0, 0, 0, 'date', NULL, NULL, 1),
	(56, 4, 'merchant', 'Merchant', 0, 0, 0, 'text', NULL, NULL, 0),
	(57, 4, 'projectAccountCode', 'Project / Task', 0, 0, 0, 'int', NULL, '/common_service/sec_get_detailed_approval_codes_by_category', 0),
	(58, 4, 'expenseType', 'Expense Type', 0, 0, 0, 'int', NULL, '/vendor_portal/sec_get_account_dropdown_list', 0),
	(59, 4, 'totalAmount', 'Amount', 0, 0, 0, 'decimal', NULL, NULL, 1),
	(60, 4, 'amount', 'Net Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(61, 4, 'notes', 'Notes', 0, 0, 1, 'text', NULL, NULL, 0),
	(62, 4, 'discription', 'Description', 0, 0, 1, 'text', NULL, NULL, 0),
	(63, 5, 'vendor', 'Vendor', 1, 1, 0, 'int', NULL, '/vendor_portal/sec_local_vendor_dropdown_list_v2', 0),
	(64, 5, 'invoiceNo', 'Invoice Number', 1, 1, 0, 'text', NULL, NULL, 0),
	(65, 5, 'paymentType', 'Payment Method', 1, 1, 0, 'int', NULL, '/common_service/sec_view_payment_types', 0),
	(66, 5, 'paymentReferanceNo', 'Payment Reference', 1, 1, 0, 'text', NULL, NULL, 0),
	(67, 5, 'invoiceDate', 'Invoice Date', 1, 1, 0, 'date', NULL, NULL, 1),
	(68, 5, 'paymentDate', 'Payment Date', 1, 1, 0, 'date', NULL, NULL, 1),
	(69, 5, 'balanceToBePaid', 'Balance to be Paid', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(70, 5, 'amount', 'Payment Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(71, 5, 'discountAmount', 'Discount Amount', 1, 1, 0, 'decimal', NULL, NULL, 1),
	(72, 5, 'receipt', 'Receipt', 0, 0, 0, 'text', NULL, NULL, 0),
	(73, 2, 'poApprovalStatus', 'Status', 1, 1, 0, 'int', 12, NULL, 0),
	(74, 1, 'invoiceApprovalstatus', 'Status', 1, 1, 0, 'int', 12, NULL, 0);
/*!40000 ALTER TABLE `common_automation_field` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;