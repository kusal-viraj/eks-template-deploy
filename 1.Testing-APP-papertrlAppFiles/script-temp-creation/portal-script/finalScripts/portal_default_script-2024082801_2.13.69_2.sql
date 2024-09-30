-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Linux (x86_64)
--
-- Host: 10.11.31.61    Database: papertrl_depl_testing_portal_script
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `common_approval_group`
--

DROP TABLE IF EXISTS `common_approval_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_group`
--

LOCK TABLES `common_approval_group` WRITE;
/*!40000 ALTER TABLE `common_approval_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_approval_group_import_issue`
--

DROP TABLE IF EXISTS `common_approval_group_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_group_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_group_import_issue`
--

LOCK TABLES `common_approval_group_import_issue` WRITE;
/*!40000 ALTER TABLE `common_approval_group_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_approval_group_import_mst`
--

DROP TABLE IF EXISTS `common_approval_group_import_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_group_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_group_import_mst`
--

LOCK TABLES `common_approval_group_import_mst` WRITE;
/*!40000 ALTER TABLE `common_approval_group_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_group_import_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_field`
--

DROP TABLE IF EXISTS `common_automation_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_field` (
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
  `max_length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK` (`document_type`),
  KEY `FK_common_automation_field_common_drop_down` (`drop_down_id`),
  CONSTRAINT `DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_common_automation_field_common_drop_down` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_field`
--

LOCK TABLES `common_automation_field` WRITE;
/*!40000 ALTER TABLE `common_automation_field` DISABLE KEYS */;
INSERT INTO `common_automation_field` VALUES (1,1,'billNo','Bill Number',1,1,0,'text',NULL,NULL,0,0),(2,1,'billAmount','Bill Amount',1,1,0,'decimal',NULL,NULL,1,0),(3,1,'vendorId','Vendor',1,1,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0),(4,1,'templateId','Template',1,1,0,'int',NULL,NULL,0,0),(5,1,'poId','PO Number',1,1,1,'text',NULL,NULL,0,0),(6,1,'receiptId','PO Receipt Number',1,1,1,'text',NULL,NULL,0,0),(7,1,'billDateFormat','Date Format',0,0,0,'int',NULL,'/common_service/sec_view_dateformats_v2',0,0),(8,1,'billDate','Bill Date',1,1,0,'date',NULL,NULL,1,0),(9,1,'term','Payment Terms',1,1,0,'int',NULL,'/vendor_portal/sec_get_bill_terms_list_v2',0,0),(10,1,'dueDate','Due Date',1,1,0,'date',NULL,NULL,1,0),(11,1,'additionalNotes','Comment',0,0,1,'text',NULL,NULL,0,0),(12,1,'productId','Item Code',0,0,0,'int',NULL,'/common_service/sec_get_item_dropdown_list_v2',0,0),(13,1,'description','Item Name',0,0,0,'text',NULL,NULL,0,0),(14,1,'qty','Units',0,0,0,'int',NULL,NULL,1,0),(15,1,'unitPrice','Unit Price',0,0,0,'decimal',NULL,NULL,1,0),(16,1,'tax','Tax Amount / Tax Percentage',0,0,1,'decimal',NULL,NULL,1,0),(17,3,'grnNumber','PO Receipt Number',1,1,0,'text',NULL,NULL,0,0),(18,3,'grnDate','PO Receipt Date',1,1,0,'date',NULL,NULL,1,0),(19,3,'vendorId','Vendor',1,1,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0),(20,3,'poId','PO Number',1,1,0,'text',NULL,NULL,0,0),(21,3,'poDate','PO Date',1,1,0,'date',NULL,NULL,1,0),(22,3,'transporterName','Received By',0,0,0,'int',NULL,NULL,0,0),(23,3,'itemNumber','Item Number',0,0,1,'text',NULL,NULL,0,0),(24,3,'description','Item Name',0,0,1,'text',NULL,NULL,0,0),(25,3,'uomId','UOM',0,0,1,'int',NULL,'/common_service/sec_get_uom_dropdown_list',0,0),(26,3,'remainingQty','Remaining Qty',0,0,1,'int',NULL,NULL,1,0),(27,3,'receivedQty','Received Qty',0,0,1,'int',NULL,NULL,1,0),(28,3,'unitPrice','Unit Price',0,0,1,'decimal',NULL,NULL,1,0),(29,3,'amount','Amount',0,0,1,'decimal',NULL,NULL,1,0),(30,3,'totalAmount','Total Amount',1,1,0,'decimal',NULL,NULL,1,0),(31,3,'note','Notes',0,0,0,'text',NULL,NULL,0,0),(32,2,'poNumber','Po Number',1,1,0,'text',NULL,NULL,0,0),(33,2,'createdOn','Submit Date',1,1,1,'date',NULL,NULL,1,0),(34,2,'vendorId','Vendor',1,1,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0),(35,2,'projectCodeId','Project / Task',1,1,1,'int',NULL,'/common_service/sec_get_detailed_approval_codes_by_category',0,0),(36,2,'deliveryDate','Date of Delivery ',1,1,0,'date',NULL,NULL,1,0),(37,2,'pocPhone','Contact Number',0,1,0,'text',NULL,NULL,0,0),(38,2,'pocName','Contact Person',1,1,0,'text',NULL,NULL,0,0),(39,2,'notes','Notes',0,0,1,'text',NULL,NULL,0,0),(40,2,'shippingAddress','Shipping Address',0,0,0,'text',NULL,NULL,0,0),(41,2,'billingAddress','Billing Address',0,0,0,'text',NULL,NULL,0,0),(42,2,'productId','Select Item',0,0,0,'int',NULL,'/common_service/sec_get_item_dropdown_list_v2',0,0),(43,2,'description','Item Name',0,0,0,'text',NULL,NULL,0,0),(44,2,'uomId','UOM',0,0,0,'int',NULL,'/common_service/sec_get_uom_dropdown_list',0,0),(45,2,'qty','QTY',0,0,0,'int',NULL,NULL,1,0),(46,2,'grossAmount','Price',0,0,0,'decimal',NULL,NULL,1,0),(47,2,'discountAmount','Discount',0,0,0,'decimal',NULL,NULL,1,0),(48,2,'amount','Amount',0,0,0,'decimal',NULL,NULL,1,0),(49,2,'taxAmount','Tax Amount / Tax Percentage',1,1,0,'decimal',NULL,NULL,1,0),(50,2,'discountAmount','Discount Amount',1,1,0,'decimal',NULL,NULL,1,0),(51,2,'netAmount','Net Amount',1,1,0,'decimal',NULL,NULL,1,0),(52,4,'reportName','Report Name',0,0,1,'text',NULL,NULL,0,0),(53,4,'businessPurpose','Business Purpose',0,0,1,'text',NULL,NULL,0,0),(54,4,'report','Receipt',0,0,0,'text',NULL,NULL,0,0),(55,4,'createdOn','Date',0,0,0,'date',NULL,NULL,1,0),(56,4,'merchant','Merchant',0,0,0,'text',NULL,NULL,0,0),(57,4,'projectAccountCode','Project / Task',0,0,0,'int',NULL,'/common_service/sec_get_detailed_approval_codes_by_category',0,0),(58,4,'expenseType','Expense Type',0,0,0,'int',NULL,'/vendor_portal/sec_get_account_dropdown_list',0,0),(59,4,'totalAmount','Amount',0,0,0,'decimal',NULL,NULL,1,0),(60,4,'amount','Net Amount',1,1,0,'decimal',NULL,NULL,1,0),(61,4,'notes','Notes',0,0,1,'text',NULL,NULL,0,0),(62,4,'discription','Description',0,0,1,'text',NULL,NULL,0,0),(63,5,'vendor','Vendor',1,1,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0),(64,5,'invoiceNo','Invoice Number',1,1,0,'text',NULL,NULL,0,0),(65,5,'paymentType','Payment Method',1,1,0,'int',NULL,'/common_service/sec_view_payment_types',0,0),(66,5,'paymentReferanceNo','Payment Reference',1,1,0,'text',NULL,NULL,0,0),(67,5,'invoiceDate','Invoice Date',1,1,0,'date',NULL,NULL,1,0),(68,5,'paymentDate','Payment Date',1,1,0,'date',NULL,NULL,1,0),(69,5,'balanceToBePaid','Balance to be Paid',1,1,0,'decimal',NULL,NULL,1,0),(70,5,'amount','Payment Amount',1,1,0,'decimal',NULL,NULL,1,0),(71,5,'discountAmount','Discount Amount',1,1,0,'decimal',NULL,NULL,1,0),(72,5,'receipt','Receipt',0,0,0,'text',NULL,NULL,0,0),(73,2,'poApprovalStatus','Status',1,1,0,'int',12,NULL,0,0),(74,1,'status','Status',1,1,0,'int',12,NULL,0,0);
/*!40000 ALTER TABLE `common_automation_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_delegate_user_action_wise_menus`
--

DROP TABLE IF EXISTS `common_delegate_user_action_wise_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_delegate_user_action_wise_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_MENU_ID` (`menu_id`) USING BTREE,
  CONSTRAINT `FK1_MENU_ID` FOREIGN KEY (`menu_id`) REFERENCES `umm_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_delegate_user_action_wise_menus`
--

LOCK TABLES `common_delegate_user_action_wise_menus` WRITE;
/*!40000 ALTER TABLE `common_delegate_user_action_wise_menus` DISABLE KEYS */;
INSERT INTO `common_delegate_user_action_wise_menus` VALUES (1,1,1015),(2,1,1007),(3,1,1051),(4,1,1057),(5,2,1054),(6,2,1057),(7,2,1048),(8,2,1007),(9,2,1015),(10,3,1006),(11,3,1021),(12,3,1005),(13,3,1019),(14,3,1029),(15,3,1064),(16,3,1015);
/*!40000 ALTER TABLE `common_delegate_user_action_wise_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_delegate_user_action_wise_privileges`
--

DROP TABLE IF EXISTS `common_delegate_user_action_wise_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_delegate_user_action_wise_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_ACTION_ID` (`action_id`) USING BTREE,
  KEY `FK2_PRIVILAGE_ID` (`privilege_id`) USING BTREE,
  CONSTRAINT `FK1_ACTION_ID` FOREIGN KEY (`action_id`) REFERENCES `common_delegate_user_actions` (`id`),
  CONSTRAINT `FK2_PRIVILAGE_ID` FOREIGN KEY (`privilege_id`) REFERENCES `umm_menu_privilage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_delegate_user_action_wise_privileges`
--

LOCK TABLES `common_delegate_user_action_wise_privileges` WRITE;
/*!40000 ALTER TABLE `common_delegate_user_action_wise_privileges` DISABLE KEYS */;
INSERT INTO `common_delegate_user_action_wise_privileges` VALUES (1,1,102),(2,1,103),(3,1,104),(4,1,107),(5,1,108),(6,1,109),(7,1,110),(8,1,342),(9,1,383),(10,1,464),(11,1,510),(12,1,511),(13,1,512),(14,1,558),(15,2,497),(16,2,498),(17,2,499),(18,2,510),(19,2,511),(20,2,512),(21,2,552),(22,2,554),(23,2,558),(24,3,64),(25,3,65),(26,3,66),(27,3,67),(28,3,69),(29,3,88),(30,3,89),(31,3,90),(32,3,93),(33,3,119),(34,3,120),(35,3,340),(36,3,382),(37,3,402),(38,3,403),(39,3,409),(40,3,425),(41,3,468),(42,3,528);
/*!40000 ALTER TABLE `common_delegate_user_action_wise_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_delegate_user_actions`
--

DROP TABLE IF EXISTS `common_delegate_user_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_delegate_user_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_delegate_user_actions`
--

LOCK TABLES `common_delegate_user_actions` WRITE;
/*!40000 ALTER TABLE `common_delegate_user_actions` DISABLE KEYS */;
INSERT INTO `common_delegate_user_actions` VALUES (1,'Expense Creation','A'),(2,'Process Credit Card Statements','A'),(3,'Approval Permission - PO, Bill & Payments','A');
/*!40000 ALTER TABLE `common_delegate_user_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_drop_down`
--

DROP TABLE IF EXISTS `common_drop_down`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_drop_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down`
--

LOCK TABLES `common_drop_down` WRITE;
/*!40000 ALTER TABLE `common_drop_down` DISABLE KEYS */;
INSERT INTO `common_drop_down` VALUES (1,'Active Inactive Status Drop Down'),(3,'User Status'),(6,'Item Taxability'),(8,'Bill Payment Status'),(10,'Additional Field Required Status'),(11,'Additional Field Active Status'),(12,'Internal Approval Status'),(13,'Vendor Approval Status'),(14,'Export Status'),(15,'Approval Status'),(16,'Payment Status'),(17,'PO Receipt Status'),(18,'Vendor Invitation Status'),(19,'Object Type');
/*!40000 ALTER TABLE `common_drop_down` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_drop_down_connection`
--

DROP TABLE IF EXISTS `common_drop_down_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_drop_down_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_id` int(11) NOT NULL,
  `drop_down_value_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DROP_DOWN_ID` (`drop_down_id`),
  KEY `FK_DROP_DOWN_VALUE_ID` (`drop_down_value_id`),
  CONSTRAINT `FK_DROP_DOWN_ID` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `FK_DROP_DOWN_VALUE_ID` FOREIGN KEY (`drop_down_value_id`) REFERENCES `common_drop_down_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down_connection`
--

LOCK TABLES `common_drop_down_connection` WRITE;
/*!40000 ALTER TABLE `common_drop_down_connection` DISABLE KEYS */;
INSERT INTO `common_drop_down_connection` VALUES (1,1,1),(2,1,2),(5,3,3),(10,6,4),(11,6,5),(14,8,1),(15,8,6),(16,8,7),(17,8,8),(21,10,9),(22,10,10),(23,11,1),(24,11,2),(25,13,13),(26,13,14),(27,13,12),(28,12,13),(29,12,12),(30,12,11),(31,12,15),(32,3,1),(33,3,2),(34,14,15),(35,14,16),(38,15,11),(39,15,12),(40,16,7),(41,16,17),(42,16,18),(43,13,16),(44,17,1),(45,17,21),(46,18,11),(47,18,13),(48,19,22),(49,19,23),(50,19,24),(51,19,25),(52,19,26),(53,19,27),(54,19,28),(55,19,29),(56,19,30);
/*!40000 ALTER TABLE `common_drop_down_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_drop_down_url`
--

DROP TABLE IF EXISTS `common_drop_down_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_drop_down_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down_url`
--

LOCK TABLES `common_drop_down_url` WRITE;
/*!40000 ALTER TABLE `common_drop_down_url` DISABLE KEYS */;
INSERT INTO `common_drop_down_url` VALUES (1,'Role','/role_management/sec_view_role_dropdown_v2?userId=0&isSearch=true'),(2,'Approval Group List','/user_management/sec_view_approval_group_list_v2?userId=0&isSearch=true');
/*!40000 ALTER TABLE `common_drop_down_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_drop_down_value`
--

DROP TABLE IF EXISTS `common_drop_down_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_drop_down_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down_value`
--

LOCK TABLES `common_drop_down_value` WRITE;
/*!40000 ALTER TABLE `common_drop_down_value` DISABLE KEYS */;
INSERT INTO `common_drop_down_value` VALUES (1,'A','Active'),(2,'I','Inactive'),(3,'L','Locked'),(4,'TRUE','Taxable'),(5,'FALSE','Non Taxable'),(6,'V','Void'),(7,'PAID','Paid'),(8,'M','Mailed'),(9,'Y','Required'),(10,'N','Optional'),(11,'A','Approved'),(12,'R','Rejected'),(13,'P','Pending'),(14,'NA','Not-Assigned'),(15,'E','Exported'),(16,'N','Not Exported'),(17,'N','Not Paid'),(18,'H','Partially Paid'),(19,'DP','Deletion Pending'),(20,'U','Under Discussion'),(21,'C','Closed'),(22,'OBJECT_TYPE_ACCOUNT','Accounts'),(23,'OBJECT_TYPE_ITEM','Items'),(24,'OBJECT_TYPE_PROJECT','Project Codes'),(25,'OBJECT_TYPE_BILL_PAYMENT','Bill Payment'),(26,'OBJECT_TYPE_VENDOR','Vendor'),(27,'OBJECT_TYPE_PO','Purchase Order'),(28,'OBJECT_TYPE_PO_RECEIPT','Purchase Order Receipt'),(29,'OBJECT_TYPE_BILL','Bill'),(30,'OBJECT_TYPE_EXPENSE','Expense');
/*!40000 ALTER TABLE `common_drop_down_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_email_attachment`
--

DROP TABLE IF EXISTS `common_email_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_email_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_url` text NOT NULL,
  `attachment_name` varchar(100) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EMAIL_ID_FK1` (`email_id`) USING BTREE,
  CONSTRAINT `common_email_attachment_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `common_email_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_email_attachment`
--

LOCK TABLES `common_email_attachment` WRITE;
/*!40000 ALTER TABLE `common_email_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_email_mst`
--

DROP TABLE IF EXISTS `common_email_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_email_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `to_address` varchar(100) NOT NULL,
  `cc_address` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_email_mst`
--

LOCK TABLES `common_email_mst` WRITE;
/*!40000 ALTER TABLE `common_email_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_email_tmp`
--

DROP TABLE IF EXISTS `common_email_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_email_tmp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `to_address` varchar(100) NOT NULL,
  `cc_address` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `invoice_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_email_tmp`
--

LOCK TABLES `common_email_tmp` WRITE;
/*!40000 ALTER TABLE `common_email_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_email_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_grid_column_template`
--

DROP TABLE IF EXISTS `common_grid_column_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_grid_column_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL,
  `sortable_field` varchar(50) NOT NULL,
  `header` varchar(50) DEFAULT NULL,
  `column_show` tinyint(1) DEFAULT NULL,
  `is_sortable` tinyint(1) DEFAULT NULL,
  `is_re_orderable` tinyint(1) DEFAULT NULL,
  `is_re_sizable` tinyint(1) DEFAULT NULL,
  `can_hide` tinyint(1) DEFAULT NULL,
  `filter_show` tinyint(1) DEFAULT NULL,
  `is_frozen` tinyint(1) DEFAULT NULL,
  `frozen_direction` varchar(50) DEFAULT NULL,
  `align` varchar(50) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  `placeholder` varchar(100) DEFAULT '',
  `column_order` int(3) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `column_width` int(11) DEFAULT NULL,
  `drop_down_url_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  KEY `DROP_DOWN_ID_FK_1` (`drop_down_id`),
  KEY `DROPDOWN_URL_FK` (`drop_down_url_id`),
  CONSTRAINT `DROPDOWN_URL_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `common_drop_down_url` (`id`),
  CONSTRAINT `DROP_DOWN_ID_FK_1` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `TABLE_FK_2` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_column_template`
--

LOCK TABLES `common_grid_column_template` WRITE;
/*!40000 ALTER TABLE `common_grid_column_template` DISABLE KEYS */;
INSERT INTO `common_grid_column_template` VALUES (8,3,'checkbox','checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(9,3,'action','action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(10,3,'apgr.id','apgr.id','Approval Group ID',1,1,1,1,1,1,0,NULL,'left','number','Approval Group ID',3,NULL,150,NULL),(11,3,'apgr.name','apgr.name','Approval Group Name',1,1,1,1,1,1,0,NULL,'left','input','Approval Group Name',4,NULL,150,NULL),(12,3,'usm.name','usm.name','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',5,NULL,150,NULL),(13,3,'apgr.createdOn','apgr.createdOn','Create Date',1,1,1,1,1,1,0,NULL,'center','date','Create Date',6,NULL,150,NULL),(14,3,'apgr.status','apgr.status','Status',1,1,1,1,1,1,0,NULL,'left','dropdown','All',7,1,150,NULL),(15,2,'checkbox','checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(16,2,'action','action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(17,2,'usm.email','usm.email','Email Address',1,1,1,1,1,1,0,NULL,'left','input','Email Address',3,NULL,150,NULL),(18,2,'usm.name','usm.name','Name',1,1,1,1,1,1,0,NULL,'left','input','Name',4,NULL,150,NULL),(19,2,'usm.nicPassportNo','usm.nicPassportNo','Employee No',1,1,1,1,1,1,0,NULL,'left','input','Employee No',5,NULL,150,NULL),(20,2,'approvalGroup.approvalGroupId','approvalGroup.approvalGroupId','Approval Groups',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Groups',6,NULL,150,2),(21,2,'rolem.id','rolem.id','Role',1,0,1,1,1,1,0,NULL,'left','multiSelect','Role',7,NULL,150,1),(22,2,'usm.status','usm.status','Status',1,1,1,1,1,1,0,NULL,'left','dropdown','All',8,3,150,NULL),(41,6,'action','action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(42,6,'tenant.tenantId','tenant.tenantId','Tenant ID',1,1,1,1,1,1,0,NULL,'left','input','Tenant ID',3,NULL,150,NULL),(43,6,'tenant.ownerName','tenant.ownerName','Company Name',1,1,1,1,1,1,0,NULL,'left','input','Company Name',4,NULL,150,NULL),(44,6,'tenant.ownerEmail','tenant.ownerEmail','Email Address',1,1,1,1,1,1,0,NULL,'left','input','Email Address',5,NULL,150,NULL),(45,6,'tenant.status','tenant.status','Status',1,1,1,1,1,1,0,NULL,'left','dropdown','All',6,1,150,NULL),(90,1,'checkbox','checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(91,1,'action','action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(92,1,'rolem.id','rolem.id','Role ID',1,1,1,1,1,1,0,NULL,'left','number','Role ID',3,NULL,150,NULL),(93,1,'rolem.name','rolem.name','Role Name',1,1,1,1,1,1,0,NULL,'left','input','Role Name',4,NULL,150,NULL),(94,1,'rolem.createdBy','rolem.createdBy','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',5,NULL,150,NULL),(95,1,'rolem.createdOn','rolem.createdOn','Create Date',1,1,1,1,1,1,0,NULL,'left','date','Create Date',6,NULL,150,NULL),(96,1,'rolem.status','rolem.status','Status',1,1,1,1,1,1,0,NULL,'left','dropdown','All',7,1,150,NULL),(199,7,'pBill.subAccount','pBill.subAccount','Sub Account',1,0,1,1,0,0,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(201,7,'pBill.pendingBills','pBill.pendingBills','Pending',1,0,1,1,0,0,0,NULL,'center',' ','Applicable Discount',19,NULL,150,NULL),(202,7,'pBill.approvedBills','pBill.approvedBills','Approved',1,0,1,1,0,0,0,NULL,'center',' ','Applicable Discount',19,NULL,150,NULL),(203,7,'pBill.rejectedBills','pBill.rejectedBills','Rejected',1,0,1,1,0,0,0,NULL,'center',' ','Applicable Discount',19,NULL,150,NULL),(204,7,'pBill.totalPayable','pBill.totalPayable','Total Payable',1,0,1,1,0,0,0,NULL,'right',' ','Total Payable',19,NULL,150,NULL),(205,8,'pdBill.subAccount','pdBill.subAccount','Sub Account',1,0,1,1,0,0,0,NULL,'left','multiSelect','Sub Account',3,NULL,150,NULL),(206,8,'pdBill.totalPaymenetCount','pdBill.totalPaymenetCount','Total Payment<br>Count',0,0,1,1,0,0,0,NULL,'center',' ','Total Payment Count',19,NULL,150,NULL),(207,8,'pdBill.activePayment','pdBill.activePayment','Active',1,0,1,1,0,0,0,NULL,'center',' ','Active Payments',19,NULL,150,NULL),(208,8,'pdBill.voidedPayment','pdBill.voidedPayment','Void',1,0,1,1,0,0,0,NULL,'center',' ','Void Payments',19,NULL,150,NULL),(209,8,'pdBill.totalAmountOfActivePayment','pdBill.totalAmountOfActivePayment','Total Paid',1,0,1,1,0,0,0,NULL,'right',' ','Total Amount Of Active Payments',19,NULL,150,NULL),(210,11,'pPO.subAccount','pPO.subAccount','Sub Account',1,0,1,1,0,0,0,NULL,'left','multiSelect','Sub Account',3,NULL,150,NULL),(211,11,'pPO.submittedPo','pPO.submittedPo','Pending',1,0,1,1,0,0,0,NULL,'center',' ','Pending Purchase Orders',19,NULL,150,NULL),(212,11,'pPO.approvedPo','pPO.approvedPo','Approved',1,0,1,1,0,0,0,NULL,'center',' ','Approved Purchase Orders',19,NULL,150,NULL),(213,11,'pPO.rejectedPo','pPO.rejectedPo','Rejected',1,0,1,1,0,0,0,NULL,'center',' ','Rejected Purchase Orders',19,NULL,150,NULL),(214,11,'pPO.totalPayable','pPO.totalPayable','Total Payable',1,0,1,1,0,0,0,NULL,'right',' ','Total Payable',19,NULL,150,NULL),(215,31,'pEx.subAccount','pEx.subAccount','Sub Account',1,0,1,1,0,0,0,NULL,'left','multiSelect','Sub Account',3,NULL,150,NULL),(217,31,'pEx.approvedEr','pEx.approvedEr','Approved',1,0,1,1,0,0,0,NULL,'center',' ','Approved Expense Reports',19,NULL,150,NULL),(218,31,'pEx.rejectedEr','pEx.rejectedEr','Rejected',1,0,1,1,0,0,0,NULL,'center',' ','Rejected Expense Reports',19,NULL,150,NULL),(219,31,'pEx.totalPayable','pEx.totalPayable','Total Payable',1,1,1,1,0,0,0,NULL,'right',' ','Total Payable',19,NULL,150,NULL),(221,31,'pEx.submittedEr','pEx.submittedEr','Pending',1,0,1,1,0,0,0,NULL,'center',' ','Pending Expense Reports',19,NULL,150,NULL),(482,47,'vendor.id','vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','dropdown','Vendor',1,NULL,150,NULL),(483,47,'bill.billNo','bill.billNo','Bill Number',1,1,1,1,1,1,0,NULL,'left','input','Bill No.',2,NULL,150,NULL),(484,47,'bill.billDate','bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',3,NULL,150,NULL),(485,47,'exp.amount','exp.amount','Allocated Amount',1,0,1,1,1,1,0,NULL,'right','','Allocated Amount',4,NULL,150,NULL),(486,2,'usm.createdOn','usm.createdOn','Create Date',1,1,1,1,1,1,0,NULL,'center','date','Create Date',9,NULL,150,NULL);
/*!40000 ALTER TABLE `common_grid_column_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_grid_column_user_wice`
--

DROP TABLE IF EXISTS `common_grid_column_user_wice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_grid_column_user_wice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `grid_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL,
  `sortable_field` varchar(50) NOT NULL,
  `header` varchar(50) DEFAULT NULL,
  `column_show` tinyint(1) DEFAULT NULL,
  `is_sortable` tinyint(1) DEFAULT NULL,
  `is_re_orderable` tinyint(1) DEFAULT NULL,
  `is_re_sizable` tinyint(1) DEFAULT NULL,
  `can_hide` tinyint(1) DEFAULT NULL,
  `filter_show` tinyint(1) DEFAULT NULL,
  `is_frozen` tinyint(1) DEFAULT NULL,
  `frozen_direction` varchar(50) DEFAULT NULL,
  `align` varchar(50) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  `placeholder` varchar(100) DEFAULT NULL,
  `column_order` int(3) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `column_width` int(11) DEFAULT NULL,
  `drop_down_url_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_2` (`grid_id`),
  KEY `DROP_DOWN_ID_FK_2` (`drop_down_id`),
  KEY `DROPDOWN_URL_USER_WISE_FK` (`drop_down_url_id`),
  CONSTRAINT `DROPDOWN_URL_USER_WISE_FK` FOREIGN KEY (`drop_down_url_id`) REFERENCES `common_drop_down_url` (`id`),
  CONSTRAINT `DROP_DOWN_ID_FK_2` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`),
  CONSTRAINT `common_grid_column_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_column_user_wice`
--

LOCK TABLES `common_grid_column_user_wice` WRITE;
/*!40000 ALTER TABLE `common_grid_column_user_wice` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_grid_column_user_wice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_grid_filter_template`
--

DROP TABLE IF EXISTS `common_grid_filter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_grid_filter_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `field` varchar(50) NOT NULL,
  `header` varchar(50) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TABLE_FK_1` (`grid_id`),
  KEY `TABLE_FK_DROPD_DOWN` (`drop_down_id`),
  CONSTRAINT `TABLE_FK_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`),
  CONSTRAINT `TABLE_FK_DROPD_DOWN` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_filter_template`
--

LOCK TABLES `common_grid_filter_template` WRITE;
/*!40000 ALTER TABLE `common_grid_filter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_grid_filter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_grid_state_template`
--

DROP TABLE IF EXISTS `common_grid_state_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_grid_state_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_id` int(11) NOT NULL,
  `start_from` int(8) DEFAULT 0,
  `total_rows` int(8) DEFAULT 10,
  `column_widths` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_TABLE_ID` (`grid_id`),
  CONSTRAINT `FK1_TABLE_ID` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_state_template`
--

LOCK TABLES `common_grid_state_template` WRITE;
/*!40000 ALTER TABLE `common_grid_state_template` DISABLE KEYS */;
INSERT INTO `common_grid_state_template` VALUES (1,1,0,25,'50,100,307,307,307,307,50'),(2,3,0,25,'50,300,306,306,306,307,50'),(3,2,0,25,'50,250,200,250,250,250,250,250,50'),(6,6,0,25,'100,100,100,100,50'),(21,7,0,10,'120,85,95,90,90,140'),(22,11,0,10,'120,95,95,95,85'),(23,31,0,10,'120,95,95,95,95'),(24,8,0,10,'120,95,100,90,95'),(47,47,0,15,'210,210,210,210');
/*!40000 ALTER TABLE `common_grid_state_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_grid_state_user_wice`
--

DROP TABLE IF EXISTS `common_grid_state_user_wice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_grid_state_user_wice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `grid_id` int(11) NOT NULL,
  `start_from` int(8) DEFAULT 0,
  `total_rows` int(8) DEFAULT 10,
  `column_widths` varchar(200) DEFAULT NULL,
  `table_width` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_TABLE_ID` (`grid_id`),
  CONSTRAINT `common_grid_state_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_state_user_wice`
--

LOCK TABLES `common_grid_state_user_wice` WRITE;
/*!40000 ALTER TABLE `common_grid_state_user_wice` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_grid_state_user_wice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_grid_template`
--

DROP TABLE IF EXISTS `common_grid_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_grid_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_name` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_template`
--

LOCK TABLES `common_grid_template` WRITE;
/*!40000 ALTER TABLE `common_grid_template` DISABLE KEYS */;
INSERT INTO `common_grid_template` VALUES (1,'ROLE_LIST'),(2,'USER_LIST'),(3,'APPROVAL_GROUP_LIST'),(6,'SUB_ACCOUNT_LIST'),(7,'PORTAL_DASHBOARD_BILL_TABLE'),(8,'PORTAL_DASHBOARD_BILL_PAYMENT_TABLE'),(11,'GRID_PORTAL_PURCHASE_ORDER_DASHBOARD'),(31,'GRID_PORTAL_EXPENSE_DASHBOARD'),(47,'PROJECT_CODE_BILLS');
/*!40000 ALTER TABLE `common_grid_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_message`
--

DROP TABLE IF EXISTS `common_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `from_user_name` varchar(100) NOT NULL,
  `from_name` varchar(200) NOT NULL,
  `to_user_name` varchar(100) NOT NULL,
  `to_name` varchar(200) NOT NULL,
  `date_time` datetime NOT NULL,
  `status` char(1) NOT NULL,
  `device_name` varchar(300) DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_message`
--

LOCK TABLES `common_message` WRITE;
/*!40000 ALTER TABLE `common_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_email_template`
--

DROP TABLE IF EXISTS `common_notification_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(150) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `template_data` text NOT NULL,
  `event_id` int(15) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(50) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_email_template`
--

LOCK TABLES `common_notification_email_template` WRITE;
/*!40000 ALTER TABLE `common_notification_email_template` DISABLE KEYS */;
INSERT INTO `common_notification_email_template` VALUES (1,'BILL_SUBMITTED_TO_DIRECT_APPROVER','Bill (BILL-NO) has been submitted for your approval','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n\r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td> Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of assigned user) </span>,</td>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                           Bill Number <span id=\"BILL_NUMBER\" style=\"font-weight: bold\"> (Bill Number) </span> for <span id=\"VENDOR_NAME\" style=\"font-weight: bold\" > (Vendor Name) </span> \r\n						   has been submitted by <span id=\"SUBMITTED_BY\" style=\"font-weight: bold\" > (Created User) </span> for your approval. \r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Please log in to <a id=\"URL\" href=\"\"  style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the invoice.</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',1,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(2,'BILL_APPROVED','Bill (BILL-NO) approved ','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n        \r\n\r\n        <table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of uploader) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Bill <span id=\"BILL_NUMBER\" style=\"font-weight: bold\" > (Bill Number) </span> has been approved \r\n							by <span id=\"APPROVER_NAME\" style=\"font-weight: bold\"> (Assigned approver) </span>.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                       \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n    \r\n                        </tr>\r\n                        <tr>\r\n                            <td>&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n    \r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',2,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(3,'BILL_REJECTED','Bill (BILL-NO) rejected','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body {\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n\r\n\r\n    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of uploader) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Bill <span id=\"BILL_NUMBER\" style=\"font-weight: bold\" > (Bill Number) </span> has been rejected \r\n						by <span id=\"APPROVER_NAME\" style=\"font-weight: bold\"> (Assigned approver) </span> due to <span style=\"color:red\" id=\"REASON\"> (Reject Reason) </span>. \r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                    </tr>\r\n                    <tr>\r\n                        <td>&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',3,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(4,'EXPENSE_SUBMITTED_TO_DIRECT_APPROVER','Expense report (EXPENSE-NAME) has been submitted for your approval ','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n       \r\n\r\n        <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\"  style=\"font-weight: bold\"> (Name of assigned approver) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                              Expense Report <span id=\"REPORT_NAME\" style=\"font-weight: bold\"> (Expense name) </span> has been submitted \r\n							  by <span id=\"SUBMITTED_BY\"  style=\"font-weight: bold\" > (Name of the submitted person) </span> for your approval. \r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Please log in to <a id=\"URL\" href=\"\" style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the expense report.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                           \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td></td>\r\n                        </tr>\r\n                    </table>\r\n                    <br />\r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',7,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(5,'EXPENSE_APPROVED','Expense Report (EXPENSE-NAME) has been approved ','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n   \r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of submitted person) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                           Your submitted Expense Report has been approved by <span id=\"APPROVER_NAME\" style=\"font-weight: bold\" > (Assigned approver) </span>.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',8,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(6,'EXPENSE_REJECTED','Expense Report  (EXPENSE-NAME) has been rejected','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n   \r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\"  style=\"font-weight: bold\"> (name of submitted person) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Expense Report <span id=\"REPORT_NAME\" style=\"font-weight: bold\"> (expense name) </span> has been rejected by <span id=\"APPROVER_NAME\"  style=\"font-weight: bold\" > (Assigned approver) </span> due \r\n						to <span id=\"REASON\"  style=\"color : red\"> (Reject Reason) </span>.</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',9,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(7,'PO_SUBMITTED_TO_DIRECT_APPROVER','Purchase order (PO-NO) has been  submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n        \r\n\r\n\r\n\r\n        <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of assigned approver) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                               Purchase Order <span id=\"PO_NUMBER\" style=\"font-weight: bold\"> (Purchase Order Number) </span> has \r\n							   been submitted by <span id=\"SUBMITTED_BY\" style=\"font-weight: bold\"> (Name of Submitted Person) </span> for your approval.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Please log in to <a id=\"URL\" href=\"\" style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Purchase Order.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td></td>\r\n                        </tr>\r\n                    </table>\r\n                    <br />\r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',4,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(8,'PO_APPROVED','Purchase Order (PO-NO) has been approved ','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n\r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td> Dear <span id=\"EMAIL_SEND_TO\"  style=\"font-weight: bold\"> (name of submitted person) </span>,</td>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                            Purchase Order <span id=\"PO_NUMBER\"  style=\"font-weight: bold\" > (Purchase Order Number) </span> has been approved by \r\n							<span id=\"APPROVER_NAME\"  style=\"font-weight: bold\" > (Assigned approver) </span>.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    \r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',5,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(9,'PO_REJECTED','Purchase Order (PO-NO) has been rejected','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n   \r\n\r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of submitted person) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                           Purchase Order <span id=\"PO_NUMBER\" style=\"font-weight: bold\"> (Purchase Order Number) </span> \r\n						   has been rejected by <span id=\"APPROVER_NAME\" style=\"font-weight: bold\" > (Assigned approver) </span> \r\n						   due to <span id=\"REASON\" style=\"color:red\"> (Reject Reason) </span>.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',6,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(10,'RECEIVED_PAYMENT','Payment Received for Bill (BILL-NO)','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n        \r\n\r\n        <table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (Name of Vendor) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                                You have received <span id=\"RECEIVED_AMOUNT\" style=\"font-weight: bold\"> (Received Amount) </span> \r\n								for <span id=\"BILL_NUMBER\" style=\"font-weight: bold\"> (Bill Number) </span> \r\n								from <span id=\"CUSTOMER_NAME\" style=\"font-weight: bold\"> (Customer Name) </span>.\r\n							</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n    \r\n                        </tr>\r\n                        <tr>\r\n                            <td>&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n    \r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',10,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(11,'BILL_SUBMITTED_TO_APPROVAL_GROUP','Bill (BILL-NO) has been  submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n        \r\n\r\n\r\n        <table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of assigned user) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                               Invoice <span id=\"BILL_NUMBER\" style=\"font-weight: bold\"> (Invoice Number) </span> has been submitted \r\n							   by <span id=\"VENDOR_NAME\" style=\"font-weight: bold\"> (Vendor Name) </span> for approval \r\n							   by <span id=\"APPROVAL_GROUP\" style=\"font-weight: bold\"> (Approval Group name) </span> approval group.\r\n							</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Please log in to <a id=\"URL\" href=\"\"  style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the invoice.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n    \r\n                        </tr>\r\n                        <tr>\r\n                            <td>&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n    \r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright   2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',13,'A','admin','2021-05-26',NULL,NULL,NULL,NULL),(12,'BILL_ASSIGNEE_LIST_EMPTY','No users found in the approval group to approve ','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body {\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n\r\n\r\n    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (User’s name) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                           Bill <span id=\"BILL_NUMBER\" style=\"font-weight: bold\"> (001255) </span> has been submitted by <span id=\"CREATED_BY\" style=\"font-weight: bold\"> (creator) </span> for approval \r\n						   by <span id=\"APPROVAL_GROUP\" style=\"font-weight: bold\"> (Approval Group name) </span> approval \r\n						   group, but no users have been assigned to this approval group.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    \r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                    </tr>\r\n                    <tr>\r\n                        <td>&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',14,'A','admin','2021-05-26',NULL,NULL,NULL,NULL),(13,'PO_SUBMITTED_TO_APPROVAL_GROUP','Purchase Order (PO-NO) has been submitted for approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n        \r\n\r\n        <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\"  style=\"font-weight: bold\"> (name of assigned approver) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                                Purchase Order <span id=\"PO_NUMBER\"  style=\"font-weight: bold\"> (Purchase Order Number) </span> has been \r\n								submitted by <span id=\"SUBMITTED_BY\" style=\"font-weight: bold\"> (Name of Submitted Person ) </span>  for approval \r\n								by <span id=\"APPROVAL_GROUP\" style=\"font-weight: bold\"> (Approval Group name) </span> approval group.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                                Please log in to <a id=\"URL\" href=\"\" style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Purchase Order.\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td></td>\r\n                        </tr>\r\n                    </table>\r\n                    <br />\r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright   2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',15,'A','admin','2021-05-28',NULL,NULL,NULL,NULL),(14,'PO_ASSIGNEE_LIST_EMPTY','No users found in the approval group to approve','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n\r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                       <td> Dear <span id=\"EMAIL_SEND_TO\"  style=\"font-weight: bold\"> User\'s Name </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                           Purchase Order <span id=\"PO_NUMBER\" style=\"font-weight: bold\"> (Purchase Order Number) </span> has been submitted by\r\n						   <span id=\"CREATED_BY\" style=\"font-weight: bold\"> (creator) </span>  for approval by \r\n						   <span id=\"APPROVAL_GROUP\" style=\"font-weight: bold\"> (Approval Group name) </span> approval group, \r\n						   but no users have been assigned to this approval group.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    \r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',16,'A','admin','2021-05-28',NULL,NULL,NULL,NULL),(15,'PO_SUBMITTED_TO_VENDOR_APPROVAL','Purchase Order (PO-NO) has been submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n        <style>\r\n            .mobile>tbody>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 650px;\r\n            }\r\n    \r\n            body{\r\n                background: #f4f6f9;\r\n            }\r\n    \r\n    \r\n            @media only screen and (max-width: 767px) {\r\n                .mobile>tr>td:nth-child(1) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(2) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 90%;\r\n                }\r\n    \r\n                .mobile>tr>td:nth-child(3) {\r\n                    /* Add your mobile-specific styles here */\r\n                    width: 0;\r\n                }\r\n            }\r\n        </style>\r\n    </head>\r\n    <body>\r\n       \r\n\r\n        <table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n            <tr>\r\n                <td colspan=\"3\" style=\"height: 70px;\">\r\n                    &nbsp;\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>&nbsp;</td>\r\n                <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                        style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                        <tr>\r\n                            <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                            <td style=\"text-align: center;\">\r\n                                <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                            </td>\r\n                            <td style=\"width: 40px;\" width=\"40px\">\r\n    \r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (name of the vendor) </span>,</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>\r\n                                Purchase Order <span id=\"PO_NUMBER\" style=\"font-weight: bold\" > (Purchase Order Number) </span> has been submitted \r\n								by <span id=\"SUBMITTED_BY\" style=\"font-weight: bold\" > (Name of Submitted Person) </span> \r\n								from <span id=\"CUSTOMER_NAME\" style=\"font-weight: bold\"> (Customer Company Name) </span> for your approval.\r\n							</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Please log in to <a id=\"URL\" href=\"\" style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Purchase Order.</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        \r\n                        \r\n                        <tr>\r\n                            <td style=\"height: 40px;\">\r\n                                &nbsp;\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>Thank You!</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                                read or responded to. We\'re\r\n                                happy to help you with any questions or concerns you may have. Please contact us directly\r\n                                via\r\n                                <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                            </td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td width=\"40\"></td>\r\n                            <td>&nbsp;</td>\r\n                            <td width=\"40\"></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n            </tr>\r\n            <tr>\r\n                <td colspan=\"3\" align=\"center\">\r\n                    <br /><br />\r\n                    <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                            <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            \r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n                            <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                    target=\"_blank\"><img\r\n                                        src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                        width=\"25\"></a>\r\n                            </td>\r\n    \r\n                        </tr>\r\n                        <tr>\r\n                            <td>&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n    \r\n                    <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                        <tr>\r\n                            <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align=\"center\">&nbsp;</td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',16,'A','admin','2021-05-28',NULL,NULL,NULL,NULL),(16,'EXPENSE_SUBMITTED_TO_APPROVAL_GROUP','Expense Report (EXPENSE-NAME) has been submitted for approval','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body {\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n\r\n\r\n    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold;\"> (Name of assigned approver) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                          Expense Report <span id=\"REPORT_NAME\" style=\"font-weight: bold;\"> (Expense Name) </span> has been submitted \r\n						  by <span id=\"SUBMITTED_BY\" style=\"font-weight: bold;\"> (Name of the submitted person) </span> for approval \r\n						  by <span id=\"APPROVAL_GROUP\" style=\"font-weight: bold;\"> (Approval Group name) </span> approval group. \r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Please log in to <a id=\"URL\" href=\"\" style=\"color: #2ba5d7\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the\r\n                            expense report.</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    \r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                    </tr>\r\n                    <tr>\r\n                        <td>&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',17,'A','admin','2021-05-29',NULL,NULL,NULL,NULL),(17,'EXPENSE_ASSIGNEE_LIST_EMPTY','No users found in the approval group to approve','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n   \r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold\"> (User’s Name) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n                           Expense Report <span id=\"REPORT_NAME\" style=\"font-weight: bold\"> (Expense name) </span> has been submitted \r\n						   by <span id=\"CREATED_BY\"  style=\"font-weight: bold\"> (creator) </span> for approval \r\n						   by <span id=\"APPROVAL_GROUP\"  style=\"font-weight: bold\"> (Approval Group name) </span> approval \r\n						   group, but no users have been assigned to this approval group.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',18,'A','admin','2021-05-29',NULL,NULL,NULL,NULL),(44,'USER_ACCOUNT_LOCKED','Account Locked','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n\r\n    <table style=\"background:#F4F6F9;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow:0 0 11px 0 rgba(57, 57, 57, 0.2);  color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"\r\nhttps://papertrl.com/wp-content/uploads/2019/09/logo.png\"\r\n/>\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td> Dear <span id=\"EMAIL_SEND_TO\"  style=\"font-weight: bold\" > (Customer Name) </span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n							Your account has been locked due to too many incorrect login attempts.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					 <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n							Your account will be automatically unlocked in <span id=\"ACCOUNT_UNLOCK_DURATION\" style=\"font-weight: bold\"> (Duration) </span> minutes.\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n							Please <a id=\"PASSWORD_RESET_URL\" href=\"\" style=\"color: #2ba5d7\"> click here </a> to reset your password if you did not attempt to login or suspect someone else is attempting to access your account.\r\n						</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"\r\nhttps://papertrl.com/wp-content/uploads/2019/09/logo.png\"\r\n/></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"\r\nhttps://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                       \r\n                        <td width=\"75\" align=\"center\"><a href=\"\r\nhttps://www.facebook.com/PaperTrl\"\r\ntarget=\"_blank\"><img\r\n                                    src=\"\r\nhttps://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"\r\nhttps://www.linkedin.com/company/papertrl\"\r\n\r\n                                target=\"_blank\"><img\r\n                                    src=\"\r\nhttps://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td></td>\r\n                    </tr>\r\n                </table>\r\n                <br />\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>',NULL,'A','admin','2023-12-01',NULL,NULL,NULL,NULL),(46,'DELEGATE_USER_CREATED_EMAIL_TEMPLATE','You\'ve Been Added as a Delegate of DELE_OWNER','<html>\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <style>\r\n        .mobile>tbody>tr>td:nth-child(2) {\r\n            /* Add your mobile-specific styles here */\r\n            width: 650px;\r\n        }\r\n\r\n        body{\r\n            background: #f4f6f9;\r\n        }\r\n\r\n\r\n        @media only screen and (max-width: 767px) {\r\n            .mobile>tr>td:nth-child(1) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(2) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 90%;\r\n            }\r\n\r\n            .mobile>tr>td:nth-child(3) {\r\n                /* Add your mobile-specific styles here */\r\n                width: 0;\r\n            }\r\n        }\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    \r\n    <table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n            <td colspan=\"3\" style=\"height: 70px;\">\r\n                &nbsp;\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td width=\"650\" style=\"box-shadow: 0 0 11px 0 rgba(57, 57, 57, 0.2); color: #555555; \">\r\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\r\n                    style=\"background: #fff; font-family: Arial, Helvetica, sans-serif; color: #555; font-size: 14px;\">\r\n                    <tr>\r\n                        <td colspan=\"3\" style=\"background: #26464a; height: 5px;\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"30\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                        <td style=\"text-align: center;\">\r\n                            <img width=\"163\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                        </td>\r\n                        <td style=\"width: 40px;\" width=\"40px\">\r\n\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan=\"3\" height=\"40\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Dear <span id=\"EMAIL_SEND_TO\" style=\"font-weight: bold;\">(Receiver Name)</span>,</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n						<span id=\"DELE_OWNER\" style=\"font-weight: bold;\"> (Delegate Owner Name) </span> has added you as a delegate. You have been given the following permissions:\r\n						</td> \r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>\r\n						<span id=\"PERMISSION_LIST\"> (permissions list) </span>\r\n						</td> \r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					 <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Please be aware that the above granted privileges are limited to the owner\'s current permissions.</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					<tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n					 <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Log in to PaperTrl, navigate to the profile section and switch the account to access the system as the designated delegate user.</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height: 40px;\">\r\n                            &nbsp;\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>Thank You!</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td><img height=\"38\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td style=\" font-size: 12px;\">This is an automated email. Replies to this message will not be\r\n                            read or responded to. We\'re\r\n                            happy to help you with any questions or concerns you may have. Please contact us directly\r\n                            via\r\n                            <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                        </td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"40\"></td>\r\n                        <td>&nbsp;</td>\r\n                        <td width=\"40\"></td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\">\r\n                <br /><br />\r\n                <table  align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                    <tr>\r\n                        <td width=\"75\" align=\"center\"><a href=\"javascript:void(0)\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/twitter.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        \r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.facebook.com/PaperTrl\" target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/facebook.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n                        <td width=\"75\" align=\"center\"><a href=\"https://www.linkedin.com/company/papertrl\"\r\n                                target=\"_blank\"><img\r\n                                    src=\"https://papertrl-hosting-s3-public.s3.us-east-2.amazonaws.com/PaperTrl-EmailIcons/linkedin.png\"\r\n                                    width=\"25\"></a>\r\n                        </td>\r\n\r\n                    </tr>\r\n                    <tr>\r\n                        <td>&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <table width=\"100%\" style=\"font-size: 12px; color: #555; font-family: Arial, Helvetica, sans-serif;\">\r\n                    <tr>\r\n                        <td align=\"center\">Copyright © 2023 PaperTrl. All Rights Reserved.</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">200 E. Campus View Blvd. Suite 200, Columbus, OH 43235</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td align=\"center\">&nbsp;</td>\r\n                    </tr>\r\n                </table>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n\r\n</html>\r\n',36,'A','admin','2024-05-20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `common_notification_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_system_endpoint`
--

DROP TABLE IF EXISTS `common_system_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_system_endpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_index` (`url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_system_endpoint`
--

LOCK TABLES `common_system_endpoint` WRITE;
/*!40000 ALTER TABLE `common_system_endpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_system_endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_system_task`
--

DROP TABLE IF EXISTS `common_system_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_system_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT '',
  `created_on` date DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  `tab` tinyint(2) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_system_task`
--

LOCK TABLES `common_system_task` WRITE;
/*!40000 ALTER TABLE `common_system_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_system_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_user_log`
--

DROP TABLE IF EXISTS `common_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpoint_id` int(11) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `status_code` varchar(15) NOT NULL,
  `additional_message` varchar(256) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `tenant_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_user_log`
--

LOCK TABLES `common_user_log` WRITE;
/*!40000 ALTER TABLE `common_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_note_csv_export_format`
--

DROP TABLE IF EXISTS `credit_note_csv_export_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_note_csv_export_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(50) NOT NULL,
  `format_code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_note_csv_export_format`
--

LOCK TABLES `credit_note_csv_export_format` WRITE;
/*!40000 ALTER TABLE `credit_note_csv_export_format` DISABLE KEYS */;
INSERT INTO `credit_note_csv_export_format` VALUES (1,'Default','DEFAULT',1),(2,'SAGE','SAGE',0);
/*!40000 ALTER TABLE `credit_note_csv_export_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegate_user_account_switch_logs`
--

DROP TABLE IF EXISTS `delegate_user_account_switch_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegate_user_account_switch_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delegate_user_id` int(11) NOT NULL,
  `delegate_owner_id` int(11) NOT NULL,
  `switch_to_delegate_profile` char(1) NOT NULL,
  `return_to_original_profile` char(1) NOT NULL,
  `switched_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_DELEGATE_USER_ID` (`delegate_user_id`) USING BTREE,
  KEY `FK2_DELEGATE_TO` (`delegate_owner_id`) USING BTREE,
  CONSTRAINT `FK1_DELEGATE_USER_ID` FOREIGN KEY (`delegate_user_id`) REFERENCES `umm_user_mst` (`id`),
  CONSTRAINT `FK2_DELEGATE_TO` FOREIGN KEY (`delegate_owner_id`) REFERENCES `umm_user_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegate_user_account_switch_logs`
--

LOCK TABLES `delegate_user_account_switch_logs` WRITE;
/*!40000 ALTER TABLE `delegate_user_account_switch_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delegate_user_account_switch_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegate_user_owner_relation`
--

DROP TABLE IF EXISTS `delegate_user_owner_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegate_user_owner_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `delegate_user_id` int(11) NOT NULL,
  `receive_email` tinyint(1) NOT NULL DEFAULT 0,
  `switched` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(1) NOT NULL DEFAULT 'A',
  `period_start_date` date DEFAULT NULL,
  `period_end_date` date DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_OWNER_ID` (`owner_id`) USING BTREE,
  KEY `FK2_DELEGATE_USER_ID` (`delegate_user_id`) USING BTREE,
  CONSTRAINT `FK1_OWNER_ID` FOREIGN KEY (`owner_id`) REFERENCES `umm_user_mst` (`id`),
  CONSTRAINT `FK2_DELEGATE_USER_ID` FOREIGN KEY (`delegate_user_id`) REFERENCES `umm_user_mst` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegate_user_owner_relation`
--

LOCK TABLES `delegate_user_owner_relation` WRITE;
/*!40000 ALTER TABLE `delegate_user_owner_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `delegate_user_owner_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegate_user_wise_actions`
--

DROP TABLE IF EXISTS `delegate_user_wise_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegate_user_wise_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delegate_relation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_DELEGATE_RELATION_ID` (`delegate_relation_id`) USING BTREE,
  KEY `FK2_ACTION_ID` (`action_id`) USING BTREE,
  CONSTRAINT `FK1_DELEGATE_RELATION_ID` FOREIGN KEY (`delegate_relation_id`) REFERENCES `delegate_user_owner_relation` (`id`),
  CONSTRAINT `FK2_ACTION_ID` FOREIGN KEY (`action_id`) REFERENCES `common_delegate_user_actions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegate_user_wise_actions`
--

LOCK TABLES `delegate_user_wise_actions` WRITE;
/*!40000 ALTER TABLE `delegate_user_wise_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `delegate_user_wise_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_sub_account`
--

DROP TABLE IF EXISTS `portal_sub_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_sub_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `owner_name` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  `created_on` date NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `update_on` date DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_sub_account`
--

LOCK TABLES `portal_sub_account` WRITE;
/*!40000 ALTER TABLE `portal_sub_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_sub_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_sub_account_role_privilage`
--

DROP TABLE IF EXISTS `portal_sub_account_role_privilage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_sub_account_role_privilage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_sub_account_role_privilage`
--

LOCK TABLES `portal_sub_account_role_privilage` WRITE;
/*!40000 ALTER TABLE `portal_sub_account_role_privilage` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_sub_account_role_privilage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_menu`
--

DROP TABLE IF EXISTS `umm_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_text` varchar(600) NOT NULL DEFAULT '',
  `menu_style` varchar(100) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `tab` varchar(100) DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `super_type` int(11) DEFAULT NULL,
  `super_type_2` int(11) DEFAULT NULL,
  `department` varchar(50) NOT NULL DEFAULT '',
  `menu_order` int(3) DEFAULT NULL,
  `display_icon` varchar(100) DEFAULT NULL,
  `short_name` varchar(50) NOT NULL,
  `detail_text` varchar(600) NOT NULL,
  `status` char(1) NOT NULL,
  `portal_menu` tinyint(4) NOT NULL DEFAULT 0,
  `individual_tenant_menu` tinyint(1) NOT NULL,
  `vendor_community_menu` tinyint(1) NOT NULL,
  `mobile_menu` tinyint(1) NOT NULL,
  `version` varchar(10) NOT NULL,
  `auth_code` varchar(50) NOT NULL,
  `slim_menu` tinyint(1) NOT NULL,
  `hierachy` varchar(20) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1065 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_menu`
--

LOCK TABLES `umm_menu` WRITE;
/*!40000 ALTER TABLE `umm_menu` DISABLE KEYS */;
INSERT INTO `umm_menu` VALUES (999,'Dashboard','Dashboard','fa fa-th-large','/home/portal-dashboard',NULL,'S',1014,NULL,'Admin',1,'fa fa-th-large','Dashboard','Dashboard','A',1,0,1,0,'V2','DASHBOARD',1,'1014','System','2021-04-29 14:38:28',NULL,NULL,NULL,NULL),(1000,'Dashboard','Dashboard','fa fa-th-large','/home/dashboard',NULL,'S',1014,NULL,'Admin',1,'fa fa-th-large','Dashboard','Dashboard','A',0,1,1,1,'V2','DASHBOARD',1,'1014','System','2022-06-15 15:02:04',NULL,NULL,NULL,NULL),(1001,'Admin','Admin','fa fa-key','/home/admin',NULL,'S',1014,NULL,'Admin',11,'fa fa-key','Admin','Admin','A',1,0,1,0,'V2','ADMIN',1,'1014','System','2021-04-29 18:02:53',NULL,NULL,NULL,NULL),(1002,'Settings','Settings','fa fa-cog','/home/settings',NULL,'S',1014,NULL,'Admin',16,'fa fa-cog','Settings','Settings','A',1,1,0,0,'V2','SETTINGS',1,'1014','System','2022-06-17 14:32:46',NULL,NULL,NULL,NULL),(1003,'Automation','Automation','fa fa-tasks','/home/automation',NULL,'S',1014,NULL,'Admin',10,'fa fa-tasks','Automations','Automations','A',0,1,0,0,'V2','AUTOMATION',1,'1014','System','2021-04-20 18:41:45',NULL,NULL,NULL,NULL),(1004,'Vendors','Vendors','pi pi-users','/home/vendor',NULL,'S',1015,NULL,'Admin',8,'pi pi-users','Vendors','Vendors','A',0,1,0,0,'V2','VENDORS',1,'1015','System','2021-05-14 15:44:51',NULL,NULL,NULL,NULL),(1005,'Bills','Bills','fa fa-file-text','/home/bills',NULL,'S',1015,NULL,'Admin',3,'fa fa-file-text','Bills','Bills','A',0,1,0,1,'V2','BILL_MANAGEMENT',1,'1015','System','2022-06-22 17:00:15',NULL,NULL,NULL,NULL),(1006,'Purchase Orders','PO','fa fa-cart-arrow-down','/home/purchase-order',NULL,'S',1015,NULL,'Admin',2,'fa fa-cart-arrow-down','PO','PO','A',0,1,1,1,'V2','PO',1,'1015','System','2024-03-05 07:41:09',NULL,NULL,NULL,NULL),(1007,'Expenses','Expenses','fa fa-usd','/home/expense',NULL,'S',1015,NULL,'Admin',5,'fa fa-usd','Expenses','Expenses','A',0,1,0,1,'V2','EXPENSES',1,'1015','System','2022-06-15 15:02:04',NULL,NULL,NULL,NULL),(1008,'Items','Items','fa fa-cube','/home/item',NULL,'S',1014,NULL,'Admin',6,'fa fa-cube','Items','Items','A',0,1,1,0,'V2','ITEMS',1,'1014','System','2021-04-13 14:16:55',NULL,NULL,NULL,NULL),(1009,'Accounts','Accounts','fa fa-industry','/home/account',NULL,'S',1014,NULL,'Admin',5,'fa fa-industry','Accounts','Accounts','A',0,1,0,0,'V2','ACCOUNTS',1,'1014','System','2021-04-13 14:17:06',NULL,NULL,NULL,NULL),(1010,'Project','Projects','fa fa-code','/home/project-code',NULL,'S',1016,NULL,'Admin',7,'fa fa-code','Project Codes','Project Codes','A',0,1,0,0,'V2','PROJECT_CODES',1,'1016','System','2022-02-28 12:20:23',NULL,NULL,NULL,NULL),(1011,'Users','Users','fa fa-user','/home/admin','0','S',1001,NULL,'Admin',11,'fa fa-user','Users','Users','A',1,0,1,0,'V2','USERS',0,'1001,1014','System','2021-05-01 23:24:32',NULL,NULL,NULL,NULL),(1012,'Roles','Roles','fa fa-lock','/home/admin','1','S',1001,NULL,'Admin',11,'fa fa-lock','Roles','Roles','A',1,0,1,0,'V2','ROLES',0,'1001,1014','System','2021-05-01 23:24:32',NULL,NULL,NULL,NULL),(1013,'Approval Groups','Approval Groups','fa fa-users','/home/admin','2','S',1001,NULL,'Admin',11,'fa fa-users','Approval Groups','Approval Groups','A',1,0,1,0,'V2','APPROVAL_GROUPS',0,'1001,1014','System','2021-05-01 23:24:32',NULL,NULL,NULL,NULL),(1014,'Common','Common','fa fa-home','',NULL,'M',NULL,NULL,'Admin',13,'fa fa-home','Company','Company','A',1,1,0,0,'V2','CPMPANY',0,NULL,'System','2021-04-13 14:18:58',NULL,NULL,NULL,NULL),(1015,'Payable','Payable','fa fa-industry','',NULL,'M',NULL,NULL,'Admin',13,'fa fa-industry','Payable','Payable','A',0,1,0,0,'V2','PAYABLE',0,NULL,'System','2021-04-20 18:41:54',NULL,NULL,NULL,NULL),(1016,'Receivable','Receivable','fa fa-cube','',NULL,'M',NULL,NULL,'Admin',13,'fa fa-industry','Receivable','Receivable','A',0,1,0,0,'V2','RECEIVABLE',0,NULL,'System','2021-04-20 18:41:58',NULL,NULL,NULL,NULL),(1017,'Company Profile','Company Profile','fa fa-building','/home/settings','0','S',1002,NULL,'Admin',3,'fa fa-building','Company Profile','Company Profile','A',1,1,1,0,'V2','COMPANY_PROFILE',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1018,'Fields Configuration','Fields Configuration','pi pi-book','/home/settings','3','S',1002,NULL,'Admin',6,'pi pi-book','Additional Fields','Additional Fields','A',0,1,1,0,'V2','ADDITIONAL_FIELDS',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1019,'Bills','Bills','fa fa-file-text','/home/bills','0','S',1005,NULL,'Admin',3,'fa fa-file-text','Bills','Bills','A',0,1,1,1,'V2','BILL',0,'1005,1015','System','2022-06-22 13:35:14',NULL,NULL,NULL,NULL),(1020,'Offline Payments','Offline Payments','fa fa-list-alt','/home/payments','3','S',1029,NULL,'Admin',4,'fa fa-list-alt','Offline Payments','Offline Payments','I',0,1,0,0,'V2','PAYMENT_OFFLINE_PAYMENT',0,'1029','System','2024-02-27 06:49:18',NULL,NULL,NULL,NULL),(1021,'Purchase Orders','PO','fa fa-cart-arrow-down','/home/purchase-order','0','S',1006,NULL,'Admin',2,'fa fa-cart-arrow-down','Purchase Orders','Purchase Orders','A',0,1,1,1,'V2','PURCHASE_ORDER',0,'1006,1015','System','2024-03-05 07:41:09',NULL,NULL,NULL,NULL),(1022,'PO Receipts','PO Receipts','fa fa-usd','/home/purchase-order','1','S',1006,NULL,'Admin',2,'fa fa-usd','PO Receipts','PO Receipts','A',0,1,1,0,'V2','PO_RECEIPT',0,'1006,1015','System','2021-04-20 18:42:12',NULL,NULL,NULL,NULL),(1024,'Sync Dashboard','Sync Dashboard','fa fa-exchange','/home/sync-dashboard',NULL,'S',1014,NULL,'Admin',9,'fa fa-exchange','Sync Dashboard','Sync Dashboard','A',0,1,1,0,'V2','SYNC_DASHBORD',1,'1014','System','2021-04-20 18:42:13',NULL,NULL,NULL,NULL),(1025,'Reports','Reports','fa fa-pie-chart','/home/report',NULL,'S',1014,NULL,'Admin',14,'fa fa-pie-chart','Reports','Reports','A',0,1,1,0,'V2','REPORTS',1,'1014','System','2021-07-14 18:51:01',NULL,NULL,NULL,NULL),(1026,'Sub Accounts','Sub Accounts','fa fa-sitemap','/home/sub-accounts',NULL,'S',1014,NULL,'Admin',13,'fa fa-sitemap','Sub Accounts','Sub Accounts','A',1,0,1,0,'V2','SUB_ACCOUNTS',1,'1014','System','2021-06-14 19:25:36',NULL,NULL,NULL,NULL),(1027,'PO Number Configuration','PO Number Configuration','fa fa-cart-arrow-down','/home/settings','0','S',1002,NULL,'Admin',13,'fa fa-cart-arrow-down','PO Number Configuration','PO Number Configuration','A',0,0,0,0,'V2','PO_NUMBER_CONFIGURATION',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1028,'Online Payments','Online Payments','fa fa-usd','/home/settings','4','S',1002,NULL,'Admin',7,'fa fa-usd','Payment Configuration','Payment Configuration','A',0,1,0,0,'V2','PAYMENT_CONFIGURATION',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1029,'Payments','Payments','fa fa-credit-card','/home/payments','0','S',1015,NULL,'Admin',4,'fa fa-credit-card','Payments','Payments','A',0,1,1,0,'V2','PAYMENT',1,'1015','System','2024-02-27 06:49:18',NULL,NULL,NULL,NULL),(1030,'Bill Templates','Bill Templates','fa-regular fa-file-image','/home/bills','1','S',1005,NULL,'Admin',4,'fa-regular fa-file-image','Bill Templates','Bill Templates','A',0,1,0,0,'V2','BILL_TEMPLATES',0,'1005,1015','admin','2023-09-18 07:44:52',NULL,NULL,NULL,NULL),(1031,'Recurring Bills','Recurring Bills','fa fa-retweet','/home/bills','2','S',1005,NULL,'Admin',5,'fa fa-retweet','Recurring Bills','Recurring Bills','A',0,1,0,0,'V2','RECURRING_BILLS',0,'1005,1015','admin','2022-03-24 12:38:04',NULL,NULL,NULL,NULL),(1032,'Approved Bills','Approved Bills','fa fa-check-square-o','/home/payments','0','S',1029,NULL,'Admin',1,'fa fa-check-square-o','Approved Bills','Approved Bills','I',0,1,0,0,'V2','PAYMENT_APPROVED_BILLS',0,'1029','System','2024-02-27 06:49:18',NULL,NULL,NULL,NULL),(1033,'Batch Payments','Batch Payments','fa fa-sitemap','/home/payments','1','S',1029,NULL,'Admin',2,'fa fa-sitemap','Batch Payments','Batch Payments','I',0,1,0,0,'V2','PAYMENT_BATCH',0,'1029','System','2024-02-27 06:49:18',NULL,NULL,NULL,NULL),(1034,'Vendor Payments','Vendor Payments','fa fa-handshake-o','/home/payments','2','S',1029,NULL,'Admin',3,'fa fa-handshake-o','Vendor Payments','Vendor Payments','I',0,1,0,0,'V2','PAYMENT_VENDOR',0,'1029','System','2024-02-27 06:49:18',NULL,NULL,NULL,NULL),(1035,'Vendors','Vendors','pi pi-users','/home/vendor','0','S',1004,NULL,'Admin',0,'pi pi-users','Vendors','Vendors','A',0,1,0,0,'V2','VENDORS_SUB',0,'1004,1015','System','2024-03-19 06:49:08',NULL,NULL,NULL,NULL),(1037,'Send An Invitation','Send An Invitation','fa fa-envelope-open','/home/vendor','1','S',1004,NULL,'Admin',1,'fa fa-envelope-open','Send An Invitation','Send An Invitation','A',0,1,0,0,'V2','SEND_AN_INVITATION',0,'1004,1015','System','2022-03-24 12:38:04',NULL,NULL,NULL,NULL),(1038,'Import Vendors','Import Vendors','fa fa-sign-in','/home/vendor','2','S',1004,NULL,'Admin',2,'fa fa-sign-in','Import Vendors','Import Vendors','A',0,1,0,0,'V2','IMPORT_VENDORS',0,'1004,1015','System','2022-03-24 12:38:04',NULL,NULL,NULL,NULL),(1039,'Vendor Request','Vendor Request','fa fa-paper-plane','/home/vendor','3','S',1004,NULL,'Admin',3,'fa fa-paper-plane','Vendor Request','Vendor Request','A',0,1,0,0,'V2','VENDOR_REQUEST',0,'1004,1015','System','2022-03-24 12:38:04',NULL,NULL,NULL,NULL),(1040,'Community Vendors','Community Vendors','fa fa-users','/home/vendor','5','S',1004,NULL,'Admin',5,'fa fa-users','Community Vendors','Community Vendors','A',0,1,0,0,'V2','COMMUNITY_VENDORS',0,'1004,1015','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1041,'Departments','Departments','fa fa-sitemap','/home/settings','1','S',1002,NULL,'Admin',4,'fa fa-sitemap','Departments','Departments','A',0,1,0,0,'V2','DEPARTMENTS',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1042,'Inbox','Inbox','fa fa-inbox','/home/inbox','0','S',1014,NULL,'Admin',2,'fa fa-inbox','Inbox','Inbox','A',0,1,0,0,'V2','INBOX',1,'1014','System','2021-11-01 17:27:21',NULL,NULL,NULL,NULL),(1043,'Show And Hide Fields','Show And Hide Fields','fa fa-align-left','/home/settings','3','S',1002,NULL,'Admin',14,'fa fa-align-left','Show And Hide Fields','Show And Hide Fields','A',0,0,0,0,'V2','SHOW_HIDE_FIELDS',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1044,'Feature Settings','Feature Settings','fa fa-cogs','/home/settings','5','S',1002,NULL,'Admin',8,'fa fa-users','Manage Features','Manage Features','A',0,1,0,0,'V2','MANAGE_FEATURES',0,'1002','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1045,'PO Price Variance Configuration','PO Price Variance Configuration','pi pi-money-bill','/home/settings','0','S',1002,NULL,'Admin',13,'pi pi-money-bill','PO Price Variance Configuration','PO Price Variance Configuration','A',0,0,0,0,'V2','PO_PRICE_VARIANCE_CONFIGURATION',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1046,'General Settings','General Settings','fa fa-cogs','/home/settings','2','S',1002,NULL,'Admin',5,'fa fa-cogs','Configurations','Configurations','A',0,1,0,0,'V2','CONFIGURATIONS',0,'1002,1014','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1048,'Credit Card Statements','Credit Card Statements','pi pi-credit-card','/home/expense','1','S',1007,NULL,'Admin',1,'pi pi-credit-card','Credit Card Statements','Credit Card Statements','A',0,1,0,0,'V2','CREDIT_CARD_STATEMENTS',0,'1015,1007','admin','2022-06-10 04:05:57',NULL,NULL,NULL,NULL),(1049,'Credit Notes','Credit Notes','fa fa-list-alt','/home/bills','3','S',1005,NULL,'Admin',6,'fa fa-list-alt','Credit Notes','Credit Notes','A',0,1,0,0,'V2','CREDIT_NOTE',0,'1005,1015','System','2022-04-28 11:47:51',NULL,NULL,NULL,NULL),(1050,'Support Ticket','Support Tickets','fa-solid fa-headset','/home/support-ticket','','S',1014,NULL,'Admin',15,'fa-solid fa-headset','Support Ticket','Support Ticket','I',1,1,0,0,'V2','SUPPORT_TICKET',1,'1014','System','2022-11-28 12:08:17',NULL,NULL,NULL,NULL),(1051,'Expenses','Expenses','fa fa-usd','/home/expense','0','S',1007,NULL,'Admin',0,'fa fa-usd','Expenses','Expenses','A',0,1,0,1,'V2','EXPENSES',0,'1015,1007','System','2022-06-15 15:02:04',NULL,NULL,NULL,NULL),(1052,'Credit Cards','Credit Cards','pi pi-credit-card','/home/expense','1000','S',1048,NULL,'Admin',0,'pi pi-credit-card','Credit Cards','Credit Cards','A',0,1,0,0,'V2','CREDIT_CARD',0,'1015,1007,1048','System','2023-11-20 11:07:05',NULL,NULL,NULL,NULL),(1053,'Transactions','Transactions','pi pi-upload','/home/expense','1001','S',1048,NULL,'Admin',1,'pi pi-upload','Transactions','Transactions','A',0,1,0,0,'V2','CREDIT_CARD_UPLOAD_TRANSACTIONS',0,'1015,1007,1048','System','2023-11-20 11:07:05',NULL,NULL,NULL,NULL),(1054,'Process Transactons','Process Transactons','fa-solid fa-share-from-square','/home/expense','1002','S',1048,NULL,'Admin',2,'fa-solid fa-share-from-square','Process Transactons','Process Transactons','A',0,1,0,0,'V2','CREDIT_CARD_PROCESS_TRANSACTIONS',0,'1015,1007,1048','System','2023-09-18 07:44:52',NULL,NULL,NULL,NULL),(1055,'Submitted Transactions','Submitted Transactions','pi pi-envelope','/home/expense','1003','S',1048,NULL,'Admin',3,'pi pi-envelope','Submitted Transactions','Submitted Transactions','A',0,1,0,0,'V2','CREDIT_CARD_SUBMITTED_TRANSACTIONS',0,'1015,1007,1048','System','2022-06-10 11:09:14',NULL,NULL,NULL,NULL),(1056,'Approved Transactions','Approved Transactions','pi pi-check-square','/home/expense','1004','S',1048,NULL,'Admin',4,'pi pi-check-square','Approved Transactions','Approved Transactions','A',0,1,0,0,'V2','CREDIT_CARD_APPROVED_TRANSACTIONS',0,'1015,1007,1048','System','2022-06-10 11:09:14',NULL,NULL,NULL,NULL),(1057,'Receipt','Receipt','pi pi-book','/home/expense','2','S',1007,NULL,'Admin',2,'pi pi-book','Receipt','Receipt','A',0,1,0,0,'V2','CREDIT_CARD_RECEIPT',0,'1015,1007','System','2022-06-09 18:07:57',NULL,NULL,NULL,NULL),(1058,'Vendor Groups','Vendor Groups','fa fa-users','/home/vendor','4','S',1004,NULL,'Admin',4,'fa fa-users','Vendor Groups','Vendor Groups','A',0,1,0,0,'V2','VENDOR_GROUPS',0,'1004,1015','System','2023-11-16 06:48:51',NULL,NULL,NULL,NULL),(1059,'Virtual/ Digital Cards','Virtual/ Digital Cards','pi pi-money-bill','/home/expense','3','S',1007,NULL,'Admin',3,'pi pi-money-bill','Virtual/ Digital Cards','Virtual/ Digital Cards','A',0,1,0,0,'V2','V_CARDS',0,'1015,1007','System','2023-06-09 10:01:00',NULL,NULL,NULL,NULL),(1060,'Invoices','Invoices','fa fa-file','/home/invoices','0','S',1016,NULL,'Admin',8,'fa fa-file','Invoices','Invoices','A',0,1,0,0,'V2','INVOICES',1,'1016','System','2023-05-17 08:03:16',NULL,NULL,NULL,NULL),(1061,'Reminders','Reminders','fa fa-cogs','/home/settings','7','S',1002,NULL,'Admin',8,'fa fa-bell','Reminders','Reminders','A',0,1,0,0,'V2','REMINDERS',0,'1002,1014','System','2023-10-26 08:34:32',NULL,NULL,NULL,NULL),(1062,'Funding Accounts','Funding Accounts','fa fa-building-columns','/home/settings','6','S',1002,NULL,'Admin',8,'fa fa-users','Funding Accounts','Funding Accounts','A',0,1,0,0,'V2','FUNDING_ACCOUNT',0,'1002,1014','System','2024-02-12 08:32:33',NULL,NULL,NULL,NULL),(1063,'Integrated Payables','Integrated Payables','fa fa-credit-card','/home/payments','0','S',1029,NULL,'Admin',5,'fa fa-credit-card','Integrated Payables','Integrated Payables','A',0,1,0,0,'V2','INTEGRATED_PAYABLES',0,'1029','System','2024-04-03 13:55:39',NULL,NULL,NULL,NULL),(1064,'Payments','Payments','fa fa-credit-card','/home/payments','0','S',1029,NULL,'Admin',4,'fa fa-credit-card','Payments','Payments','A',0,1,0,0,'V2','PAYMENT',0,'1029','System','2024-04-03 13:58:13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `umm_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_menu_privilage`
--

DROP TABLE IF EXISTS `umm_menu_privilage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_menu_privilage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `privilage_id` int(11) NOT NULL,
  `auth_code` varchar(75) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `privilage_id` (`privilage_id`) USING BTREE,
  CONSTRAINT `umm_menu_privilage_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `umm_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `umm_menu_privilage_ibfk_2` FOREIGN KEY (`privilage_id`) REFERENCES `umm_privilages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_menu_privilage`
--

LOCK TABLES `umm_menu_privilage` WRITE;
/*!40000 ALTER TABLE `umm_menu_privilage` DISABLE KEYS */;
INSERT INTO `umm_menu_privilage` VALUES (1,1011,1,'USERS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(3,1011,13,'USERS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(4,1011,14,'USERS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(5,1011,4,'USERS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(6,1011,3,'USERS_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(7,1011,55,'USERS_UNLOCK','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(8,1011,8,'USERS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(9,1012,1,'ROLES_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(10,1012,5,'ROLES_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(11,1012,13,'ROLES_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(12,1012,14,'ROLES_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(13,1012,3,'ROLES_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(14,1012,4,'ROLES_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(15,1013,1,'APPROVAL_GROUPS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(16,1013,4,'APPROVAL_GROUPS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(17,1013,5,'APPROVAL_GROUPS_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(18,1013,13,'APPROVAL_GROUPS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(19,1013,14,'APPROVAL_GROUPS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(20,1013,8,'APPROVAL_GROUPS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(21,1017,4,'COMPANY_PROFILE_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(23,1017,56,'COMPANY_PROFILE_CONVERT_TO_PORTAL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(24,1018,1,'ADDITIONAL_FIELDS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(25,1018,4,'ADDITIONAL_FIELDS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(27,1018,13,'ADDITIONAL_FIELDS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(28,1018,14,'ADDITIONAL_FIELDS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(29,1003,1,'AUTOMATION_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(30,1003,4,'AUTOMATION_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(31,1003,5,'AUTOMATION_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(32,1003,13,'AUTOMATION_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(33,1003,14,'AUTOMATION_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(34,1003,3,'AUTOMATION_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(35,1008,1,'ITEMS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(36,1008,8,'ITEMS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(37,1008,4,'ITEMS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(38,1008,5,'ITEMS_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(39,1008,13,'ITEMS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(40,1008,14,'ITEMS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(41,1008,3,'ITEMS_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(42,1009,1,'ACCOUNTS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(43,1009,8,'ACCOUNTS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(44,1009,4,'ACCOUNTS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(45,1009,5,'ACCOUNTS_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(46,1009,13,'ACCOUNTS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(47,1009,14,'ACCOUNTS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(48,1009,3,'ACCOUNTS_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(55,1035,1,'VENDORS_CREATE','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(56,1037,57,'VENDORS_SEND_VENDOR_INVITATION','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(57,1038,8,'VENDORS_UPLOAD','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(58,1039,58,'VENDORS_APPROVE_VENDOR_REQUEST','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(59,1035,4,'VENDORS_EDIT','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(60,1035,3,'VENDORS_DETAIL_VIEW','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(61,1019,1,'BILL_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(62,1019,59,'BILL_PROCESS','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(63,1019,4,'BILL_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(64,1019,6,'BILL_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(65,1019,7,'BILL_REJECT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(66,1019,60,'BILL_QUICK_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(67,1019,38,'BILL_SKIP_APPROVAL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(68,1019,3,'BILL_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(69,1019,10,'BILL_VIEW_AUDIT_TRAIL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(70,1019,61,'BILL_DOWNLOAD_BILL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(71,1019,62,'BILL_APPLY_PAYMENT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(72,1019,63,'BILL_VIEW_PAYMENTS','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(73,1019,5,'BILL_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(74,1019,47,'BILL_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(75,1064,1,'PAYMENT_CREATE','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(76,1064,8,'PAYMENT_UPLOAD','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(77,1064,64,'PAYMENT_CHANGE_DOCUMENT','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(78,1064,27,'PAYMENT_MARK_AS_MAILED','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(79,1064,28,'PAYMENT_REVOKE_PAYMENT','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(80,1064,3,'PAYMENT_DETAIL_VIEW','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(81,1020,65,'PAYMENT_DETAIL_VIEW','System','2023-01-20 12:57:22',NULL,NULL,NULL,NULL),(82,1064,47,'PAYMENT_CSV_EXPORT','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(83,1020,39,'PAYMENT_DOWNLOAD_RECEIPT','System','2023-01-16 08:09:22',NULL,NULL,NULL,NULL),(84,1021,1,'PURCHASE_ORDER_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(85,1021,4,'PURCHASE_ORDER_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(86,1021,3,'PURCHASE_ORDER_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(87,1021,5,'PURCHASE_ORDER_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(88,1021,6,'PURCHASE_ORDER_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(89,1021,7,'PURCHASE_ORDER_REJECT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(90,1021,10,'PURCHASE_ORDER_VIEW_AUDIT_TRAIL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(91,1021,47,'PURCHASE_ORDER_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(92,1021,66,'PURCHASE_ORDER_DOWNLOAD_REPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(93,1021,60,'PURCHASE_ORDER_QUICK_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(94,1022,1,'PO_RECEIPT_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(95,1022,4,'PO_RECEIPT_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(96,1022,3,'PO_RECEIPT_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(97,1022,5,'PO_RECEIPT_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(99,1022,41,'PO_RECEIPT_CLOSE_PO_RECEIPT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(100,1022,47,'PO_RECEIPT_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(101,1022,66,'PO_RECEIPT_DOWNLOAD_REPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(102,1051,1,'EXPENSES_CREATE','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(103,1051,4,'EXPENSES_EDIT','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(104,1051,5,'EXPENSES_DELETE','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(105,1051,6,'EXPENSES_APPROVE','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(106,1051,7,'EXPENSES_REJECT','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(107,1051,10,'EXPENSES_VIEW_AUDIT_TRAIL','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(108,1051,66,'EXPENSES_DOWNLOAD_REPORT','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(109,1051,68,'EXPENSES_VIEW_REPORT','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(110,1051,47,'EXPENSES_CSV_EXPORT','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(111,1051,60,'EXPENSES_QUICK_APPROVE','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(112,1010,1,'PROJECT_CODES_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(113,1010,4,'PROJECT_CODES_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(114,1010,5,'PROJECT_CODES_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(115,1010,13,'PROJECT_CODES_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(116,1010,14,'PROJECT_CODES_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(117,1010,8,'PROJECT_CODES_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(119,1019,40,'BILL_OVERRIDE_APPROVAL','System','2021-03-16 17:16:59',NULL,NULL,NULL,NULL),(120,1021,40,'PURCHASE_ORDER_OVERRIDE_APPROVAL','System','2021-03-16 17:17:02',NULL,NULL,NULL,NULL),(121,1051,40,'EXPENSES_OVERRIDE_APPROVAL','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(339,1019,17,'BILL_UNDO_ACTION','System','2021-03-31 16:11:30',NULL,NULL,NULL,NULL),(340,1021,16,'PURCHASE_ORDER_CHANGE_ASSIGNEE','System','2021-03-31 16:14:05',NULL,NULL,NULL,NULL),(342,1051,16,'EXPENSES_CHANGE_ASSIGNEE','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(344,1051,38,'EXPENSES_SKIP_APPROVAL','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(350,1022,42,'PO_RECEIPT_GENERATE_AN_INVOICE','System','2021-04-01 13:56:41',NULL,NULL,NULL,NULL),(351,1021,42,'PURCHASE_ORDER_CREATE_BILL','System','2021-04-01 14:01:35',NULL,NULL,NULL,NULL),(353,1024,3,'SYNC_DASHBORD_DETAIL_VIEW','System','2021-04-06 07:01:01',NULL,NULL,NULL,NULL),(354,1000,71,'DASHBOARD_SHOW_VENDOR_REQUEST_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(355,1000,72,'DASHBOARD_SHOW_PENDING_AND_REJECTED_BILLS_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(356,1000,73,'DASHBOARD_SHOW_PENDING_AND_REJECTED_PO_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(357,1000,74,'DASHBOARD_SHOW_PENDING_AND_REJECTED_EXPENSE_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(358,1000,75,'DASHBOARD_SHOW_MONTHLY_TRANSACTION_SUMMARY_CHART','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(359,1000,76,'DASHBOARD_SHOW_MONTHLY_BILLS_AND_PAYMENT_SUMMARY_CHART','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(360,1019,77,'BILL_SAVE_AS_APPROVED','System','2021-04-20 12:26:34',NULL,NULL,NULL,NULL),(361,1021,77,'PURCHASE_ORDER_SAVE_AS_APPROVED','System','2021-04-20 12:27:19',NULL,NULL,NULL,NULL),(362,1051,77,'EXPENSE_SAVE_AS_APPROVED','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(363,1025,68,'VIEW_REPORT_SHOW_REPORTS','System','2021-05-11 14:14:23',NULL,NULL,NULL,NULL),(364,1026,1,'SUB_ACCOUNTS_CREATE','System','2021-04-20 19:43:17',NULL,NULL,NULL,NULL),(365,1026,14,'SUB_ACCOUNTS_ACTIVATE','System','2021-04-20 19:43:17',NULL,NULL,NULL,NULL),(366,1026,13,'SUB_ACCOUNTS_INACTIVATE','System','2021-04-20 19:43:17',NULL,NULL,NULL,NULL),(367,1026,4,'SUB_ACCOUNTS_EDIT','System','2021-04-20 19:43:17',NULL,NULL,NULL,NULL),(368,1026,3,'SUB_ACCOUNTS_DETAIL_VIEW','System','2024-01-30 18:11:08',NULL,NULL,NULL,NULL),(369,999,80,'DASHBOARD_SHOW_SUB_ACCOUNTS_BILL_SUMMARY','System','2021-06-24 23:50:57',NULL,NULL,NULL,NULL),(370,999,81,'DASHBOARD_SHOW_SUB_ACCOUNTS_BILL_PAYMENT_SUMMARY','System','2021-06-24 23:51:32',NULL,NULL,NULL,NULL),(371,999,82,'DASHBOARD_SHOW_SUB_ACCOUNTS_PURCHASE_ORDERS_SUMMARY','System','2021-06-24 23:52:13',NULL,NULL,NULL,NULL),(372,999,83,'DASHBOARD_SHOW_SUB_ACCOUNTS_EXPENSE_REPORTS_SUMMARY','System','2021-06-24 23:52:16',NULL,NULL,NULL,NULL),(374,1000,78,'DASHBOARD_SHOW_DISCOUNT_APPLICABLE_BILL_TABLE','System','2021-05-21 02:17:33',NULL,NULL,NULL,NULL),(375,1040,79,'VENDORS_ADD_TO_LOCAL_VENDOR_LIST','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(376,1011,5,'USERS_DELETE','System','2021-06-11 13:30:32',NULL,NULL,NULL,NULL),(377,1021,70,'PURCHASE_ORDER_SEND_VENDOR_APPROVAL','System','2021-05-21 21:32:36',NULL,NULL,NULL,NULL),(378,1027,1,'PO_NUMBER_CONFIGURATION_CREATE','System','2021-06-14 21:41:05',NULL,NULL,NULL,NULL),(379,1027,2,'PO_NUMBER_CONFIGURATION_SEARCH','System','2021-06-14 21:41:57',NULL,NULL,NULL,NULL),(380,1027,4,'PO_NUMBER_CONFIGURATION_EDIT','System','2021-06-14 21:42:42',NULL,NULL,NULL,NULL),(381,1027,5,'PO_NUMBER_CONFIGURATION_DELETE','System','2021-06-14 21:43:22',NULL,NULL,NULL,NULL),(382,1019,16,'BILL_CHANGE_ASSIGNEE','System','2021-06-15 13:48:00',NULL,NULL,NULL,NULL),(383,1051,3,'EXPENSES_DETAIL_VIEW','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(384,1035,5,'VENDORS_DELETE','System','2021-11-02 17:25:50',NULL,NULL,NULL,NULL),(385,1037,84,'VENDORS_RESEND_VENDOR_INVITATION','System','2021-12-28 17:05:11',NULL,NULL,NULL,NULL),(386,1037,85,'VENDORS_DELETE_VENDOR_INVITATION','System','2021-12-28 17:05:11',NULL,NULL,NULL,NULL),(387,1039,86,'VENDORS_REJECT_VENDOR_REQUEST','System','2021-12-28 17:05:11',NULL,NULL,NULL,NULL),(388,1039,87,'VENDORS_DELETE_VENDOR_REQUEST','System','2021-12-28 17:05:11',NULL,NULL,NULL,NULL),(391,1022,45,'PO_RECEIPT_RE_OPEN_PO_RECEIPT','System','2021-07-07 19:59:00',NULL,NULL,NULL,NULL),(396,1000,88,'SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 16:35:21',NULL,NULL,NULL,NULL),(397,1000,89,'SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 16:36:12',NULL,NULL,NULL,NULL),(398,1000,90,'SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 16:36:54',NULL,NULL,NULL,NULL),(399,1028,91,'SEND_CONFIGURATION_REQUEST','System','2021-09-28 21:45:53',NULL,NULL,NULL,NULL),(400,1028,92,'CONFIGURE_PAYMENT_ACTION','System','2021-08-23 10:31:55',NULL,NULL,NULL,NULL),(401,1032,3,'PAYMENT_DETAIL_VIEW','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(402,1064,6,'PAYMENT_APPROVE','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(403,1064,7,'PAYMENT_REJECT','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(404,1032,11,'PAYMENT_SUBMIT','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(405,1032,93,'PAYMENT_PAY_NOW','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(406,1033,3,'PAYMENT_BATCH_DETAIL_VIEW','System','2021-09-27 14:43:19',NULL,NULL,NULL,NULL),(407,1032,95,'PAYMENT_SCHEDULE_PAYMENT','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(408,1033,96,'PAYMENT_CANCEL_BATCH_PAYMENT','System','2021-09-27 14:37:27',NULL,NULL,NULL,NULL),(409,1064,40,'PAYMENT_OVERRIDE_APPROVAL','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(410,1030,1,'BILL_TEMPLATES_CREATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(411,1030,4,'BILL_TEMPLATES_EDIT','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(412,1030,14,'BILL_TEMPLATES_ACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(413,1030,13,'BILL_TEMPLATES_INACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(414,1030,5,'BILL_TEMPLATES_DELETE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(415,1030,3,'BILL_TEMPLATES_DETAIL_VIEW','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(416,1030,97,'BILL_TEMPLATES_DOWNLOAD','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(417,1031,1,'RECURRING_BILLS_CREATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(418,1031,4,'RECURRING_BILLS_EDIT','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(419,1031,14,'RECURRING_BILLS_ACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(420,1031,13,'RECURRING_BILLS_INACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(421,1031,5,'RECURRING_BILLS_DELETE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(422,1031,3,'RECURRING_BILLS_DETAIL_VIEW','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(423,1032,98,'PAYMENT_DOWNLOAD_ATTACHMENT','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(424,1034,101,'PAYMENT_VIEW_SUMMARY','System','2021-09-27 14:31:39',NULL,NULL,NULL,NULL),(425,1064,10,'PAYMENT_VIEW_AUDIT_TRIAL','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(426,1012,99,'ROLES_CLONE','System','2021-09-30 07:33:00',NULL,NULL,NULL,NULL),(428,1035,102,'VENDOR_SHOW_BILLS','System','2021-10-29 08:09:09',NULL,NULL,NULL,NULL),(429,1035,103,'VENDOR_SHOW_BILL_PAYMENTS','System','2021-10-29 08:15:01',NULL,NULL,NULL,NULL),(430,1035,104,'VENDOR_SHOW_PURCHASE_ORDERS','System','2021-10-29 08:19:07',NULL,NULL,NULL,NULL),(431,1035,105,'VENDOR_SHOW_PO_RECEIPTS','System','2021-10-29 08:23:32',NULL,NULL,NULL,NULL),(432,1035,13,'VENDOR_INACTIVATE','System','2021-10-29 08:33:58',NULL,NULL,NULL,NULL),(436,1040,3,'VENDOR_COMMUNITY_VENDORS_DETAIL_VIEW','System','2021-10-29 08:48:38',NULL,NULL,NULL,NULL),(437,1035,14,'VENDOR_ACTIVATE','System','2021-11-01 14:08:03',NULL,NULL,NULL,NULL),(438,1041,1,'DEPARTMENT_CREATE','System','2021-11-11 10:13:05',NULL,NULL,NULL,NULL),(439,1041,4,'DEPARTMENT_EDIT','System','2021-11-11 10:15:26',NULL,NULL,NULL,NULL),(440,1041,5,'DEPARTMENT_DELETE','System','2021-11-11 10:16:21',NULL,NULL,NULL,NULL),(441,1041,13,'DEPARTMENT_INACTIVE','System','2021-11-11 10:17:25',NULL,NULL,NULL,NULL),(442,1041,14,'DEPARTMENT_ACTIVE','System','2021-11-11 10:18:04',NULL,NULL,NULL,NULL),(444,1042,2,'INBOX_SEARCH','System','2021-11-02 11:11:41',NULL,NULL,NULL,NULL),(445,1042,5,'INBOX_DELETE','System','2021-11-02 12:27:24',NULL,NULL,NULL,NULL),(446,1042,108,'INBOX_ATTACH_TO','System','2021-11-02 12:35:24',NULL,NULL,NULL,NULL),(447,1042,109,'INBOX_REVIEW','System','2021-11-02 12:40:07',NULL,NULL,NULL,NULL),(448,1042,110,'INBOX_MOVE_TO_TO_PROCESS','System','2021-11-02 12:47:42',NULL,NULL,NULL,NULL),(449,1042,111,'INBOX_RECOVER','System','2021-11-02 12:53:41',NULL,NULL,NULL,NULL),(450,1042,113,'INBOX_EMAIL_EDIT','System','2021-11-02 12:53:41',NULL,NULL,NULL,NULL),(451,1042,112,'INBOX_SEGREGATE','System','2021-11-17 12:10:56',NULL,NULL,NULL,NULL),(452,1043,114,'SHOW_HIDE_FIELD','System','2021-12-28 19:46:52',NULL,NULL,NULL,NULL),(453,1044,115,'ENABLE_FEATURES','System','2021-12-28 11:38:45',NULL,NULL,NULL,NULL),(457,1035,116,'ENABLE_ACCESS_TO_CONFIDENTIAL_DOCUMENTS','System','2022-01-05 14:43:42',NULL,NULL,NULL,NULL),(458,1010,117,'PROJECT_CODES_DETAIL_VIEW','System','2022-01-31 18:53:03',NULL,NULL,NULL,NULL),(459,1045,1,'PO_PRICE_VARIANCE_CONFIGURATION_CREATE','System','2022-02-17 13:58:31',NULL,NULL,NULL,NULL),(460,1045,2,'PO_PRICE_VARIANCE_CONFIGURATION_SEARCH','System','2022-02-17 13:59:57',NULL,NULL,NULL,NULL),(461,1045,4,'PO_PRICE_VARIANCE_CONFIGURATION_EDIT','System','2022-02-17 14:01:43',NULL,NULL,NULL,NULL),(462,1045,5,'PO_PRICE_VARIANCE_CONFIGURATION_DELETE','System','2022-02-17 14:03:01',NULL,NULL,NULL,NULL),(463,1021,118,'PURCHASE_ORDER_SEND_ATTACHMENT','System','2022-02-22 10:30:55',NULL,NULL,NULL,NULL),(464,1051,17,'EXPENSES_UNDO','System','2022-06-09 13:19:12',NULL,NULL,NULL,NULL),(465,1021,17,'PURCHASE_ORDER_UNDO_ACTION','System','2022-02-24 10:00:00',NULL,NULL,NULL,NULL),(466,1021,119,'CLOSE_PURCHASE_ORDER','System','2022-03-01 14:29:36',NULL,NULL,NULL,NULL),(467,1021,120,'RE_OPEN_PURCHASE_ORDER','System','2022-03-01 15:30:39',NULL,NULL,NULL,NULL),(468,1021,38,'PURCHASE_ORDER_SKIP_APPROVAL','System','2022-03-14 08:45:09',NULL,NULL,NULL,NULL),(471,1046,121,'CONFIGURE_PO_VARIANCE_ALLOWANCE','System','2022-03-09 13:32:20',NULL,NULL,NULL,NULL),(472,1046,122,'MANAGE_ADDITIONAL_FIELDS','System','2022-03-09 13:32:42',NULL,NULL,NULL,NULL),(473,1046,123,'MANAGE_SHOW_HIDE_FIELDS','System','2022-03-09 13:33:00',NULL,NULL,NULL,NULL),(474,1046,124,'PO_NO_CONFIGURATION','System','2022-03-09 13:33:25',NULL,NULL,NULL,NULL),(475,1046,125,'PAYMENT_CONFIGURATION','System','2022-03-09 15:44:47',NULL,NULL,NULL,NULL),(476,1046,126,'FEATURE_CONFIGURATION','System','2022-03-09 15:53:28',NULL,NULL,NULL,NULL),(478,1049,1,'CREDIT_NOTE_CREATE','System','2022-04-15 15:00:32',NULL,NULL,NULL,NULL),(479,1049,2,'CREDIT_NOTE_SEARCH','System','2022-04-19 10:36:27',NULL,NULL,NULL,NULL),(480,1049,3,'CREDIT_NOTE_DETAIL_VIEW','System','2022-04-19 10:40:33',NULL,NULL,NULL,NULL),(481,1049,4,'CREDIT_NOTE_EDIT','System','2022-04-19 10:40:49',NULL,NULL,NULL,NULL),(482,1049,5,'CREDIT_NOTE_DELETE','System','2022-04-19 10:42:43',NULL,NULL,NULL,NULL),(483,1049,127,'CREDIT_NOTE_APPLY_TO_BILL','System','2022-04-25 16:04:40',NULL,NULL,NULL,NULL),(484,1019,128,'BILL_APPLY_CREDIT_NOTE','System','2022-04-25 16:05:25',NULL,NULL,NULL,NULL),(485,1032,128,'APPLY_CREDIT_NOTE_TO_APPROVED_BILLS','System','2022-05-06 12:23:59',NULL,NULL,NULL,NULL),(486,1049,129,'CREDIT_NOTE_VIEW_ATTACHED_BILL','System','2022-05-06 12:29:12',NULL,NULL,NULL,NULL),(487,1021,130,'VIEW_ATTACHED_CREDIT_NOTES','System','2022-05-11 17:41:59',NULL,NULL,NULL,NULL),(489,1021,132,'CREATE_CREDIT_NOTE','System','2022-05-18 15:19:56',NULL,NULL,NULL,NULL),(490,1052,1,'CREDIT_CARD_CREATE','System','2022-06-09 12:16:06',NULL,NULL,NULL,NULL),(491,1052,4,'CREDIT_CARD_EDIT','System','2022-06-09 12:16:42',NULL,NULL,NULL,NULL),(492,1052,14,'CREDIT_CARD_ACTIVE','System','2022-06-09 13:10:37',NULL,NULL,NULL,NULL),(493,1052,13,'CREDIT_CARD_INACTIVE','System','2022-06-09 13:10:39',NULL,NULL,NULL,NULL),(494,1052,5,'CREDIT_CARD_DELETE','System','2022-06-09 13:10:43',NULL,NULL,NULL,NULL),(495,1053,8,'CREDIT_CARD_UPLOAD_TRANSACTIONS_UPLOAD','System','2022-06-09 14:00:44',NULL,NULL,NULL,NULL),(496,1053,4,'CREDIT_CARD_UPLOAD_TRANSACTIONS_EDIT','System','2022-06-09 14:00:41',NULL,NULL,NULL,NULL),(497,1054,1,'CREDIT_CARD_PROCESS_TRANSACTIONS_CREATE','System','2022-06-09 14:00:39',NULL,NULL,NULL,NULL),(498,1054,10,'CREDIT_CARD_PROCESS_TRANSACTIONS_VIEW_AUDIT_TRIAL','System','2022-06-09 14:00:37',NULL,NULL,NULL,NULL),(499,1054,11,'CREDIT_CARD_PROCESS_TRANSACTIONS_SUBMIT','System','2022-06-09 14:00:34',NULL,NULL,NULL,NULL),(500,1054,77,'CREDIT_CARD_PROCESS_TRANSACTIONS_SAVE_AS_APPROVED','System','2022-06-09 14:00:32',NULL,NULL,NULL,NULL),(501,1055,6,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_APPROVE','System','2022-06-09 14:02:01',NULL,NULL,NULL,NULL),(502,1055,60,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_QUICK_APPROVE','System','2022-06-09 14:02:03',NULL,NULL,NULL,NULL),(503,1055,7,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_REJECT','System','2022-06-09 14:02:05',NULL,NULL,NULL,NULL),(504,1055,16,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_CHANGE_ASSIGNEE','System','2022-06-09 14:02:08',NULL,NULL,NULL,NULL),(505,1055,38,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_SKIP_APPROVAL','System','2022-06-09 14:01:41',NULL,NULL,NULL,NULL),(506,1055,10,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_VIEW_AUDIT_TRIAL','System','2022-06-09 14:01:33',NULL,NULL,NULL,NULL),(507,1055,40,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_OVERRIDE_APPROVAL','System','2022-06-09 14:01:30',NULL,NULL,NULL,NULL),(508,1056,133,'CREDIT_CARD_APPROVED_TRANSACTIONS_GENERATE_BILL','System','2022-06-09 14:01:24',NULL,NULL,NULL,NULL),(509,1056,10,'CREDIT_CARD_APPROVED_TRANSACTIONS_VIEW_AUDIT_TRIAL','System','2022-06-09 14:01:20',NULL,NULL,NULL,NULL),(510,1057,8,'CREDIT_CARD_RECEIPT_UPLOAD','System','2022-06-09 13:59:05',NULL,NULL,NULL,NULL),(511,1057,5,'CREDIT_CARD_RECEIPT_DELETE','System','2022-06-09 13:59:06',NULL,NULL,NULL,NULL),(512,1057,98,'CREDIT_CARD_RECEIPT_DOWNLOAD_ATTACHMENT','System','2022-06-09 13:59:08',NULL,NULL,NULL,NULL),(513,1021,134,'PO_GENERATE_PO_RECEIPT','System','2022-06-16 10:47:00',NULL,NULL,NULL,NULL),(515,1031,42,'RECURRING_BILLS_CREATE_BILL','System','2022-06-22 17:43:21',NULL,NULL,NULL,NULL),(516,1057,135,'CREDIT_CARD_RECEIPT_UPLOAD_FOR_USER','System','2022-07-04 13:42:33',NULL,NULL,NULL,NULL),(517,1061,136,'REMINDER_CONFIGURATION','System','2024-01-31 06:51:17',NULL,NULL,NULL,NULL),(518,1046,137,'CONFIGURE_MILEAGE_RATE','System','2022-08-17 15:12:31',NULL,NULL,NULL,NULL),(519,1019,138,'BILL_OFFLINE_PAYMENT_PROCESSING','System','2022-11-02 17:54:44',NULL,NULL,NULL,NULL),(520,1051,139,'VIEW_ALL_EXPENSE_REPORTS','System','2022-11-11 12:08:46',NULL,NULL,NULL,NULL),(521,1058,1,'VENDOR_GROUP_CREATE','System','2023-01-15 13:36:00',NULL,NULL,NULL,NULL),(522,1058,4,'VENDOR_GROUP_EDIT','System','2023-01-15 13:36:00',NULL,NULL,NULL,NULL),(523,1058,5,'VENDOR_GROUP_DELETE','System','2023-01-15 13:36:00',NULL,NULL,NULL,NULL),(524,1058,13,'VENDOR_GROUP_INACTIVATE','System','2023-01-15 13:36:00',NULL,NULL,NULL,NULL),(525,1058,14,'VENDOR_GROUP_ACTIVATE','System','2023-01-15 13:36:00',NULL,NULL,NULL,NULL),(526,1019,13,'BILL_INACTIVATE','System','2023-01-17 15:03:31',NULL,NULL,NULL,NULL),(527,1019,14,'BILL_ACTIVATE','System','2023-01-17 15:03:34',NULL,NULL,NULL,NULL),(528,1064,60,'PAYMENT_QUICK_APPROVE','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(529,1049,47,'CREDIT_NOTE_CSV_EXPORT','System','2023-03-08 10:50:00',NULL,NULL,NULL,NULL),(530,1059,2,'V_CARD_SEARCH','System','2023-03-27 13:16:38',NULL,NULL,NULL,NULL),(531,1059,4,'V_CARD_EDIT','System','2023-03-27 13:18:15',NULL,NULL,NULL,NULL),(532,1059,140,'V_CARD_CANCEL','System','2023-03-27 13:22:43',NULL,NULL,NULL,NULL),(533,1059,3,'V_CARD_DETAIL_VIEW','System','2023-03-27 13:29:01',NULL,NULL,NULL,NULL),(534,1059,142,'V_CARD_ACTIVITY_LOG','System','2023-04-10 14:05:29',NULL,NULL,NULL,NULL),(535,1046,141,'MANDATORY_FIELD_CONFIGURATION','System','2023-04-04 13:30:09',NULL,NULL,NULL,NULL),(536,1060,1,'CREATE_INVOICE','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(537,1060,4,'EDIT_INVOICE','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(538,1060,3,'VIEW_INVOICE_DETAIL_VIEW','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(539,1060,5,'DELETE_INVOICE','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(540,1060,10,'VIEW_INVOICE_AUDIT_TRAIL','System','2023-04-18 13:17:08',NULL,NULL,NULL,NULL),(541,1060,39,'DOWNLOAD_INVOICE_RECEPIT','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(542,1060,47,'EXPORT_INVOICE_CSV','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(543,1060,143,'MARK_AS_INVOICE_PAID','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(544,1060,144,'MARK_AS_INVOICE_UNPAID','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(545,1060,145,'IMPORT_INVOICE','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(546,1021,147,'PURCHASE_ORDER_CREATE_DIGITAL_CARD','System','2023-06-14 05:22:19',NULL,NULL,NULL,NULL),(547,1059,14,'V_CARD_ACTIVE','System','2023-06-09 14:59:14',NULL,NULL,NULL,NULL),(548,1059,13,'V_CARD_INACTIVE','System','2023-06-09 14:59:47',NULL,NULL,NULL,NULL),(550,1059,1,'V_CARD_CREATE','System','2023-06-14 10:12:13',NULL,NULL,NULL,NULL),(551,1053,148,'CREDIT_CARD_DELETE_STATEMENT','System','2023-07-14 11:31:00',NULL,NULL,NULL,NULL),(552,1054,149,'CREDIT_CARD_DELETE_TRANSACTION','System','2023-07-14 11:31:00',NULL,NULL,NULL,NULL),(553,1054,150,'CREDIT_CARD_VIEW_ALL_TRANSACTIONS','System','2023-07-14 11:31:00',NULL,NULL,NULL,NULL),(554,1054,151,'CREDIT_CARD_SPLIT_TRANSACTION','system','2023-07-25 10:21:00',NULL,NULL,NULL,NULL),(555,1021,152,'PURCHASE_ORDER_VIEW_ALL_PO','System','2023-08-25 10:58:00',NULL,NULL,NULL,NULL),(556,1019,153,'BILL_VIEW_ALL_BILLS','System','2023-08-25 10:53:00',NULL,NULL,NULL,NULL),(557,1035,47,'VENDORS_CSV_EXPORT','System','2023-10-16 11:10:06',NULL,NULL,NULL,NULL),(558,1057,154,'CREDIT_CARD_VIEW_RECEIPT','System','2023-12-05 08:22:21',NULL,NULL,NULL,NULL),(559,1062,1,'FUNDING_ACCOUNT_CREATE','System','2024-01-25 13:00:00',NULL,NULL,NULL,NULL),(560,1062,4,'FUNDING_ACCOUNT_EDIT','System','2024-01-25 13:00:00',NULL,NULL,NULL,NULL),(561,1062,5,'FUNDING_ACCOUNT_DELETE','System','2024-01-25 13:00:00',NULL,NULL,NULL,NULL),(563,1062,13,'FUNDING_ACCOUNT_INACTIVE','System','2024-02-08 17:24:37',NULL,NULL,NULL,NULL),(564,1062,14,'FUNDING_ACCOUNT_ACTIVE','System','2024-02-08 17:29:02',NULL,NULL,NULL,NULL),(565,1035,156,'REQUEST_ACH_INFO','System','2024-03-11 17:17:00',NULL,NULL,NULL,NULL),(566,1019,157,'APPLY_NEGATIVE_BILL','System','2024-03-14 12:57:00',NULL,NULL,NULL,NULL),(567,1019,158,'REMOVE_NEGATIVE_BILL','System','2024-03-14 12:57:00',NULL,NULL,NULL,NULL),(568,1063,159,'PAYMENT_PROCESS_PAYMENT_REQUEST_UPLOAD','System','2024-04-03 09:47:04',NULL,NULL,NULL,NULL),(569,1064,160,'PAYMENT_CHECK_STOP_PAYMENT','System','2024-04-11 16:10:52',NULL,NULL,NULL,NULL),(570,1064,161,'PAYMENT_CHECK_RETURN','System','2024-04-11 16:11:18',NULL,NULL,NULL,NULL),(571,1064,164,'PAYMENT_ACKNOWLEDGEMENT','System','2024-07-25 13:40:44',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `umm_menu_privilage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_privilages`
--

DROP TABLE IF EXISTS `umm_privilages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_privilages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) NOT NULL DEFAULT '',
  `text` varchar(250) NOT NULL DEFAULT '',
  `auth_code` varchar(50) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_privilages`
--

LOCK TABLES `umm_privilages` WRITE;
/*!40000 ALTER TABLE `umm_privilages` DISABLE KEYS */;
INSERT INTO `umm_privilages` VALUES (1,'Create','Create','CREATE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(2,'Search','Search','SEARCH','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(3,'Detail View','Detail View','DETAIL_VIEW','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(4,'Edit','Edit','EDIT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(5,'Delete','Delete','DELETE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(6,'Approve','Approve','APPROVE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(7,'Reject','Reject','REJECT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(8,'Upload','Upload','UPLOAD','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(10,'View Audit Trail','View Audit Trail','VIEW_AUDIT_TRAIL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(11,'Submit','Submit','SUBMIT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(12,'Re-Submit','Re-Submit','RE_SUBMIT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(13,'Inactivate','Inactivate','INACTIVATE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(14,'Activate','Activate','ACTIVATE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(15,'Reset Password','Reset Password','RESET_PASSWORD','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(16,'Change Assignee','Change Assignee','CHANGE_ASSIGNEE','System','2021-03-31 17:27:15',NULL,NULL,NULL,NULL),(17,'Undo Last Action','Undo Last Action','UNDO_ACTION','System','2021-03-31 17:27:15',NULL,NULL,NULL,NULL),(22,'System Shortcuts','System Shortcuts','SYSTEM_SHORTCUTS','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(23,'Invoice Summary ','Invoice Summary ','INVOICE_SUMMARY ','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(24,'Accumulated Invoice Summary ','Accumulated Invoice Summary ','ACCUMULATED_INVOICE_SUMMARY ','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(25,'Invoice Approval','Invoice Approval','INVOICE_APPROVAL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(26,'Change Invoice','Change Invoice','CHANGE_INVOICE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(27,'Mark As Mailed','Mark As Mailed','MARK_AS_MAILED','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(28,'Cancel Payment','Cancel Payment','REVOKE_PAYMENT','System','2023-01-16 08:09:22',NULL,NULL,NULL,NULL),(29,'Check Sync','Check Sync','CHECK_SYNC','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(30,'Vendor Sync','Vendor Sync','VENDOR_SYNC','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(31,'Change Auto Sync Status','Change Auto Sync Status','CHANGE_AUTO_SYNC_STATUS','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(32,'View Check Sync History','View Check Sync History','VIEW_CHECK_SYNC_HISTORY','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(33,'View Vendor Sync History','View Vendor Sync History','VIEW_VENDOR_SYNC_HISTORY','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(34,'View Discount Applicable Invoices','View Discount Applicable Invoices','VIEW_DISCOUNT_APPLICABLE_INVOICES','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(35,'View Invoice','View Invoice','VIEW_INVOICE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(37,'Change Package','Change Package','CHANGE_PACKAGE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(38,'Skip Approval','Skip Approval','SKIP_APPROVAL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(39,'Download Receipt','Download Receipt','DOWNLOAD_RECEIPT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(40,'Override Approval','Override Approval','OVERRIDE_APPROVAL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(41,'Close PO Receipt','Close PO Receipt','CLOSE_PO_RECEIPT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(42,'Create Bill','Create Bill','CREATE_BILL','System','2021-04-01 14:13:36',NULL,NULL,NULL,NULL),(43,'Edit Description','Edit Description','EDIT_DESCRIPTION','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(44,'Generate Detailed Report','Generate Detailed Report','GENERATE_DETAILED_REPORT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(45,'Re-open PO Receipt','Re-open PO Receipt','RE_OPEN_PO_RECEIPT','System','2021-04-01 14:13:36',NULL,NULL,NULL,NULL),(46,'Download Invoice','Download Invoice','DOWNLOAD_INVOICE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(47,'CSV Export','CSV Export','CSV_EXPORT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(48,'CSV Import','CSV Import','CSV_IMPORT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(50,'Approve Permission Request','Approve Permission Request','APPROVE_PERMISSION_REQUEST','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(51,'Reject Permission Request','RejectPermission Request','REJECTPERMISSION_REQUEST','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(54,'Add Vendor','Add Vendor','ADD_VENDOR','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(55,'Unlock','Unlock','UNLOCK','System','2021-02-11 22:23:37',NULL,NULL,NULL,NULL),(56,'Convert To Agency Portal','Convert To Agency Portal','CONVERT_TO_PORTAL','System','2021-02-11 22:41:46',NULL,NULL,NULL,NULL),(57,'Send An Invitation','Send An Invitation','SEND_VENDOR_INVITATION','System','2021-06-25 13:10:59',NULL,NULL,NULL,NULL),(58,'Approve Vendor Request','Approve Vendor Request','APPROVE_VENDOR_REQUEST','System','2021-06-25 13:10:59',NULL,NULL,NULL,NULL),(59,'Process','Process','PROCESS','System','2021-02-11 23:51:24',NULL,NULL,NULL,NULL),(60,'Quick Approve','Quick Approve','QUICK_APPROVE','System','2021-02-11 23:53:21',NULL,NULL,NULL,NULL),(61,'Download Bill','Download Bill','DOWNLOAD_BILL','System','2021-02-11 23:59:44',NULL,NULL,NULL,NULL),(62,'Apply Payments','Apply Payments','APPLY_PAYMENT','System','2021-02-12 00:01:00',NULL,NULL,NULL,NULL),(63,'View Payments','View Payments','VIEW_PAYMENTS','System','2021-02-12 00:01:26',NULL,NULL,NULL,NULL),(64,'Change Bill','Change Bill','CHANGE_BILL','System','2021-02-12 00:06:22',NULL,NULL,NULL,NULL),(65,'View Bills','View Bills','VIEW_BILLS','System','2021-02-12 00:09:06',NULL,NULL,NULL,NULL),(66,'Download Report','Download Report','DOWNLOAD_REPORT','System','2021-02-12 00:18:06',NULL,NULL,NULL,NULL),(67,'Attach To a Bill','Attach To a Bill','ATTACH_TO_A_BILL','System','2021-02-12 00:23:04',NULL,NULL,NULL,NULL),(68,'View Report','View Report','VIEW_REPORT','System','2021-02-12 00:32:30',NULL,NULL,NULL,NULL),(70,'Send to Vendor Approval','Send to Vendor Approval','SEND_VENDOR_APPROVAL','System','2021-04-01 13:51:25',NULL,NULL,NULL,NULL),(71,'Show Vendor Request Card','Show Vendor Request Card','SHOW_VENDOR_REQUEST_CARD','System','2021-04-13 15:16:13',NULL,NULL,NULL,NULL),(72,'Show Pending and Rejected Bills Card','Show Pending and Rejected Bills Card','SHOW_PENDING_AND_REJECTED_BILLS_CARD','System','2021-04-13 15:17:02',NULL,NULL,NULL,NULL),(73,'Show Pending and Rejected PO Card','Show Pending and Rejected PO Card','SHOW_PENDING_AND_REJECTED_PO_CARD','System','2021-04-13 15:18:58',NULL,NULL,NULL,NULL),(74,'Show Pending and Rejected Expense Card','Show Pending and Rejected Expense Card','SHOW_PENDING_AND_REJECTED_EXPENSE_CARD','System','2021-04-13 15:19:38',NULL,NULL,NULL,NULL),(75,'Show Monthly Transaction Summary Chart','Show Monthly Transaction Summary Chart','SHOW_MONTHLY_TRANSACTION_SUMMARY_CHART','System','2021-04-13 15:20:43',NULL,NULL,NULL,NULL),(76,'Show Monthly Bills and Payment Summary Chart','Show Monthly Bills and Payment Summary Chart','SHOW_MONTHLY_BILLS_AND_PAYMENT_SUMMARY_CHART','System','2021-04-13 15:21:36',NULL,NULL,NULL,NULL),(77,'Save as Approved','Save as Approved','SAVE_AS_APPROVED','System','2021-04-20 12:23:27',NULL,NULL,NULL,NULL),(78,'Show Discount Applicable Bill Table','Show Discount Applicable Bill Table','SHOW_DISCOUNT_APPLICABLE_BILL_TABLE','System','2021-04-20 12:23:27',NULL,NULL,NULL,NULL),(79,'Add To Local Vendor List','Add To Local Vendor List','ADD_TO_LOCAL_VENDOR_LIST','System','2021-06-25 13:10:59',NULL,NULL,NULL,NULL),(80,'Show Sub Account\'s Bills Summary','Show Sub Account\'s Bills Summary','SHOW_SUB_ACCOUNTS_BILL_SUMMARY','System','2021-06-25 00:21:30',NULL,NULL,NULL,NULL),(81,'Show Sub Account\'s Bill Payments Summary','Show Sub Account\'s Bill Payments Summary','SHOW_SUB_ACCOUNTS_BILL_PAYMENT_SUMMARY','System','2021-06-25 00:21:37',NULL,NULL,NULL,NULL),(82,'Show Sub Account\'s Purchase Orders Summary','Show Sub Account\'s Purchase Orders Summary','SHOW_SUB_ACCOUNTS_PURCHASE_ORDERS_SUMMARY','System','2021-06-25 00:21:42',NULL,NULL,NULL,NULL),(83,'Show Sub Account\'s Expense Reports Summary','Show Sub Account\'s Expense Reports Summary','SHOW_SUB_ACCOUNTS_EXPENSE_REPORTS_SUMMARY','System','2021-06-25 00:21:48',NULL,NULL,NULL,NULL),(84,'Resend An Invitation','Resend An Invitation','RESEND_VENDOR_INVITATION','System','2021-06-23 01:44:07',NULL,NULL,NULL,NULL),(85,'Delete An Invitation','Delete An Invitation','DELETE_VENDOR_INVITATION','System','2021-06-23 01:44:09',NULL,NULL,NULL,NULL),(86,'Reject Vendor Request','Reject Vendor Request','REJECT_VENDOR_REQUEST','System','2021-06-23 01:44:12',NULL,NULL,NULL,NULL),(87,'Delete Vendor Request','Delete Vendor Request','DELETE_VENDOR_REQUEST','System','2021-06-23 01:44:17',NULL,NULL,NULL,NULL),(88,'Show Bills Awaiting Your Approval Table','Show Bills Awaiting Your Approval Table','SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 16:26:18',NULL,NULL,NULL,NULL),(89,'Show POS Awaiting Your Approval Table','Show POs Awaiting Your Approval Table','SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 16:28:10',NULL,NULL,NULL,NULL),(90,'Show Expense Reports Awaiting Your Approval Table','Show Expense Reports Awaiting Your Approval Table','SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 16:31:49',NULL,NULL,NULL,NULL),(91,'Send Configuration Request','Send Configuration Request','SEND_CONFIGURATION_REQUEST','System','2021-09-28 21:45:53',NULL,NULL,NULL,NULL),(92,'Configure Payment','Configure Payment','CONFIGURE_PAYMENT_ACTION','System','2021-08-23 10:31:10',NULL,NULL,NULL,NULL),(93,'Pay Now','Pay Now','PAY_NOW','System','2021-09-02 09:43:40',NULL,NULL,NULL,NULL),(94,'Make an Offline Payment','Make an Offline Payment','MAKE_AN_OFFLINE_PAYMENT','System','2021-09-02 09:44:21',NULL,NULL,NULL,NULL),(95,'Schedule Payment','Schedule Payment','SCHEDULE_PAYMENT','System','2021-09-02 09:45:47',NULL,NULL,NULL,NULL),(96,'Cancel Batch Payment','Cancel Batch Payment','CANCEL_BATCH_PAYMENT','System','2021-09-02 09:46:42',NULL,NULL,NULL,NULL),(97,'Download attachments','Download Attachments','DOWNLOAD_ATTACHMENTS','System','2021-09-30 09:20:31',NULL,NULL,NULL,NULL),(98,'Download Attachment','Download Attachment','DOWNLOAD_ATTACHMENT','System','2021-09-30 09:20:31',NULL,NULL,NULL,NULL),(99,'Clone','Clone','CLONE','System','2021-09-30 07:27:00',NULL,NULL,NULL,NULL),(101,'View Summary','View Summary','VIEW_SUMMARY','System','2021-09-13 14:30:38',NULL,NULL,NULL,NULL),(102,'Show Bills','Show bills','SHOW_BILLS','System','2021-10-29 08:06:45',NULL,NULL,NULL,NULL),(103,'Show Bill Payments','Show Bill Payments','SHOW_BILL_PAYMENTS','System','2021-10-29 08:12:51',NULL,NULL,NULL,NULL),(104,'Show Purchase Orders','Show Purchase Orders','SHOW_PURCHASE_ORDERS','System','2021-10-29 08:17:05',NULL,NULL,NULL,NULL),(105,'Show PO Receipts','Show PO Receipts','SHOW_PO_RECEIPTS','System','2021-10-29 08:22:00',NULL,NULL,NULL,NULL),(106,'Create And Send Invitation','Create And Send Invitation','CREATE_AND_SEND_INVITATION','System','2021-10-29 08:36:33',NULL,NULL,NULL,NULL),(107,'Upload And Send Invitation','Upload And Send Invitation','UPLOAD_AND_SEND_INVITATION','System','2021-10-29 08:40:49',NULL,NULL,NULL,NULL),(108,'Attach To','Attach To','ATTACH_TO','System','2021-11-02 12:31:35',NULL,NULL,NULL,NULL),(109,'Send to Process Bill','Send to Process Bill','REVIEW','System','2021-12-17 10:41:39',NULL,NULL,NULL,NULL),(110,'Move To \'To Process\'','Move To \'To Process\'','MOVE_TO_TO_PROCESS','System','2021-11-02 12:44:51',NULL,NULL,NULL,NULL),(111,'Recover','Recover','RECOVER','System','2021-11-02 12:52:32',NULL,NULL,NULL,NULL),(112,'Segregate','Segregate','SEGREGATE','System','2021-11-17 11:45:39',NULL,NULL,NULL,NULL),(113,'Edit Email','Edit Email','EDIT_EMAIL','System','2021-11-17 11:45:39',NULL,NULL,NULL,NULL),(114,'Show And Hide Field','Show And Hide Field','SHOW_HIDE_FIELD','System','2021-12-28 19:44:48',NULL,NULL,NULL,NULL),(115,'Enable Feature','Enable Disable Feature','ENABLE_FEATURES','System','2022-01-04 10:16:21',NULL,NULL,NULL,NULL),(116,'Enable Access To Confidential Documents','Enable Access To Confidential Documents','ENABLE_ACCESS_TO_CONFIDENTIAL_DOCUMENTS','System','2022-01-05 14:40:28',NULL,NULL,NULL,NULL),(117,'Detail View','Detail View','PROJECT_CODES_DETAIL_VIEW','System','2022-01-05 14:40:28',NULL,NULL,NULL,NULL),(118,'Email To Vendor','Email To Vendor','PURCHASE_ORDER_SEND_ATTACHMENT','System','2022-02-23 05:29:41',NULL,NULL,NULL,NULL),(119,'Close Purchase Order','Close Purchase Order','CLOSE_PURCHASE_ORDER','System','2022-03-01 14:28:19',NULL,NULL,NULL,NULL),(120,'Re-open Purchase Order','Re-open Purchase Order','RE_OPEN_PURCHASE_ORDER','System','2022-03-01 15:27:46',NULL,NULL,NULL,NULL),(121,'Configure PO Variance Allowance','Configure PO Variance Allowance','CONFIGURE_PO_VARIANCE_ALLOWANCE','System','2022-03-09 13:11:42',NULL,NULL,NULL,NULL),(122,'Manage Additional Fields','Manage Additional Fields','MANAGE_ADDITIONAL_FIELDS','System','2022-03-09 13:12:40',NULL,NULL,NULL,NULL),(123,'Manage Show/Hide Fields','Manage Show/Hide Fields','MANAGE_SHOW_HIDE_FIELDS','System','2022-03-09 13:13:49',NULL,NULL,NULL,NULL),(124,'PO Number Configuration','PO Number Configuration','PO_NO_CONFIGURATION','System','2022-03-09 13:14:53',NULL,NULL,NULL,NULL),(125,'Payment Configuration','Payment Configuration','PAYMENT_CONFIGURATION','System','2022-03-09 15:41:28',NULL,NULL,NULL,NULL),(126,'Feature Configuration','Feature Configuration','FEATURE_CONFIGURATION','System','2022-03-09 15:42:30',NULL,NULL,NULL,NULL),(127,'Apply To Bill','Apply To Bill','CREDIT_NOTE_APPLY_TO_BILL','System','2022-04-25 15:59:24',NULL,NULL,NULL,NULL),(128,'Apply Credit Note','Apply Credit Note','BILL_APPLY_CREDIT_NOTE','System','2022-04-25 16:01:39',NULL,NULL,NULL,NULL),(129,'View Attached Bills','View Attached Bills','CREDIT_NOTE_VIEW_ATTACHED_BILL','System','2022-05-06 12:27:55',NULL,NULL,NULL,NULL),(130,'View Attached Credit Notes','View Attached Credit Notes','VIEW_ATTACHED_CREDIT_NOTE','System','2022-05-11 17:39:51',NULL,NULL,NULL,NULL),(132,'Create Credit Note','Create Credit Note','CREATE_CREDIT_NOTE','System','2022-05-18 15:15:27',NULL,NULL,NULL,NULL),(133,'Generate Bill','Generate Bill','GENERATE_BILL','System','2022-06-09 12:54:59',NULL,NULL,NULL,NULL),(134,'Generate PO Receipt','Generate PO Receipt','GENERATE_PO_RECEIPT','System','2022-06-16 10:30:00',NULL,NULL,NULL,NULL),(135,'Upload receipts for other users','Upload receipts for other users','RECEIPT_UPLOAD_FOR_USER','System','2022-07-04 13:41:34',NULL,NULL,NULL,NULL),(136,'Reminder Configuration','Reminder Configuration','REMINDER_CONFIGURATION','System','2022-08-07 12:16:39',NULL,NULL,NULL,NULL),(137,'Configure Mileage Rate','Configure Mileage Rate','CONFIGURE_MILEAGE_RATE','System','2022-08-17 15:08:07',NULL,NULL,NULL,NULL),(138,'Offline Payment Processing','Offline Payment Processing','OFFLINE_PAYMENT_PROCESSING','System','2022-11-02 17:53:01',NULL,NULL,NULL,NULL),(139,'View All Expense Reports','View All Expense Reports','VIEW_ALL_EXPENSE_REPORTS','System','2022-11-11 12:04:15',NULL,NULL,NULL,NULL),(140,'Cancel','Cancel','CANCEL','System','2023-03-27 13:21:56',NULL,NULL,NULL,NULL),(141,'Mandatory field configuration','Mandatory field configuration','FIELD_CONFIGURATION','System','2023-04-04 13:21:56',NULL,NULL,NULL,NULL),(142,'Activity Log','Activity log','ACTIVITY_LOG','System','2023-04-10 16:58:41',NULL,NULL,NULL,NULL),(143,'Mark As Paid','Mark As Paid','MARK_AS_PAID','Sytem','2023-04-18 12:56:42',NULL,NULL,NULL,NULL),(144,'Mark As Unpaid','Mark As Unpaid','MARK_AS_UNPAID','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(145,'Import Invoice','Import Invoice','IMPORT_INVOICE','System','2023-04-18 12:45:00',NULL,NULL,NULL,NULL),(146,'Top Up','Top Up','TOP_UP','System','2023-06-09 15:00:41',NULL,NULL,NULL,NULL),(147,'Create Digital Card','Create Digital Card','CREATE_DIGITAL_CARD','System','2023-06-14 10:09:50',NULL,NULL,NULL,NULL),(148,'Delete Statement','Delete Statement','DELETE_STATEMENT','System','2023-07-14 11:15:00',NULL,NULL,NULL,NULL),(149,'Delete Transaction','Delete Transaction','DELETE_TRANSACTION','System','2023-07-14 11:15:00',NULL,NULL,NULL,NULL),(150,'View All Transactions','View All Transactions','VIEW_ALL_TRANSACTIONS','System','2023-07-14 11:15:00',NULL,NULL,NULL,NULL),(151,'Split Transaction','Split Transaction','SPLIT_TRANSACTION','System','2023-07-25 00:00:00',NULL,NULL,NULL,NULL),(152,'View All Po','View All Purchase Orders','PURCHASE_ORDER_VIEW_ALL_PO','System','2023-11-20 07:24:25',NULL,NULL,NULL,NULL),(153,'View All Bills','View All Bills','BILL_VIEW_ALL_BILLS','System','2023-08-25 10:51:00',NULL,NULL,NULL,NULL),(154,'View Attachment','View Attachment','CREDIT_CARD_VIEW_ATTACHMENT','System','2023-08-25 10:51:00',NULL,NULL,NULL,NULL),(156,'Send ACH Info Request','Send ACH Info Request','REQUEST_ACH_INFO','System','2024-03-11 17:17:00',NULL,NULL,NULL,NULL),(157,'Apply Negative Bills','Apply Negative Bills','APPLY_NEGATIVE_BILL','System','2024-03-14 12:57:00',NULL,NULL,NULL,NULL),(158,'Remove Negative Bills','Remove Negative Bills','REMOVE_NEGATIVE_BILL','System','2024-03-14 12:57:00',NULL,NULL,NULL,NULL),(159,'Payment Request Upload','Payment Request Upload','PAYMENT_REQUEST_UPLOAD','System','2024-04-03 12:57:00',NULL,NULL,NULL,NULL),(160,'Check Stop Payment','Check Stop Payment','CHECK_STOP_PAYMENT','System','2024-04-11 15:59:11',NULL,NULL,NULL,NULL),(161,'Check Return','Check Return','CHECK_RETURN','System','2024-04-11 15:59:44',NULL,NULL,NULL,NULL),(164,'Payment Acknowledgement','Payment Acknowledgement','PAYMENT_ACKNOWLEDGEMENT','System','2024-07-17 15:39:44',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `umm_privilages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_role_field_config`
--

DROP TABLE IF EXISTS `umm_role_field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_role_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `sub_account_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ROLE_ID_FK_7` (`role_id`),
  KEY `FIELD_ID_FK_7` (`field_id`),
  CONSTRAINT `FIELD_ID_FK_7` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`),
  CONSTRAINT `ROLE_ID_FK_7` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_role_field_config`
--

LOCK TABLES `umm_role_field_config` WRITE;
/*!40000 ALTER TABLE `umm_role_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_role_field_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_role_mst`
--

DROP TABLE IF EXISTS `umm_role_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_role_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(5) NOT NULL DEFAULT '',
  `vendor_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT '0000-00-00 00:00:00',
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_role_mst`
--

LOCK TABLES `umm_role_mst` WRITE;
/*!40000 ALTER TABLE `umm_role_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_role_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_role_previlege`
--

DROP TABLE IF EXISTS `umm_role_previlege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_role_previlege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `sub_account_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id_for_role` (`privilege_id`) USING BTREE,
  KEY `menu_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `umm_role_previlege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_role_previlege`
--

LOCK TABLES `umm_role_previlege` WRITE;
/*!40000 ALTER TABLE `umm_role_previlege` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_role_previlege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_address`
--

DROP TABLE IF EXISTS `umm_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(300) DEFAULT NULL,
  `address_line_2` varchar(300) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `city` varchar(200) DEFAULT '',
  `country` varchar(200) DEFAULT '',
  `address_state` varchar(200) DEFAULT '',
  `zipcode` varchar(30) DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `umm_user_address_ibfk_1` (`user_id`),
  CONSTRAINT `umm_user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_address`
--

LOCK TABLES `umm_user_address` WRITE;
/*!40000 ALTER TABLE `umm_user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_approval_group`
--

DROP TABLE IF EXISTS `umm_user_approval_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_approval_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `approval_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_ID_FK_1` (`user_id`),
  KEY `AP_GROUP_FK1` (`approval_group_id`),
  CONSTRAINT `AP_GROUP_FK1` FOREIGN KEY (`approval_group_id`) REFERENCES `common_approval_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USER_ID_FK_1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_approval_group`
--

LOCK TABLES `umm_user_approval_group` WRITE;
/*!40000 ALTER TABLE `umm_user_approval_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_approval_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_department`
--

DROP TABLE IF EXISTS `umm_user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `sub_account_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_department`
--

LOCK TABLES `umm_user_department` WRITE;
/*!40000 ALTER TABLE `umm_user_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_import_issue`
--

DROP TABLE IF EXISTS `umm_user_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST6` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST6` FOREIGN KEY (`import_mst_id`) REFERENCES `umm_user_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_import_issue`
--

LOCK TABLES `umm_user_import_issue` WRITE;
/*!40000 ALTER TABLE `umm_user_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_import_mst`
--

DROP TABLE IF EXISTS `umm_user_import_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT '',
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_import_mst`
--

LOCK TABLES `umm_user_import_mst` WRITE;
/*!40000 ALTER TABLE `umm_user_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_import_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_mst`
--

DROP TABLE IF EXISTS `umm_user_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone_no` varchar(20) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `login_attempt` int(1) NOT NULL,
  `password` varchar(200) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `nic_passport_no` varchar(50) DEFAULT NULL,
  `image_attached` char(1) NOT NULL DEFAULT '',
  `first_login` char(1) NOT NULL,
  `account_locked_date` datetime DEFAULT NULL,
  `pro_pic_content_type` varchar(100) DEFAULT NULL,
  `pro_pic_name` varchar(150) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `last_login_date` datetime DEFAULT NULL,
  `last_login_date_time` datetime DEFAULT NULL,
  `user_type` varchar(3) NOT NULL,
  `temporary_password` varchar(200) DEFAULT '',
  `temporary_password_status` char(1) DEFAULT NULL,
  `temporary_password_issue_date` datetime DEFAULT NULL,
  `temporary_password_expired_date` datetime DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `propic_id` int(11) DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `jira_account_id` varchar(400) DEFAULT NULL,
  `avs_validated` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_mst`
--

LOCK TABLES `umm_user_mst` WRITE;
/*!40000 ALTER TABLE `umm_user_mst` DISABLE KEYS */;
INSERT INTO `umm_user_mst` VALUES (1,'4ccc7194-5df8-4544-b394-3e62d62acdf0','papertrl_system_schedule','System Schedule',NULL,'papertrl_system_schedule',NULL,'D',0,'$2a$10$y7uaBNBgCUO479OdpBhd0uKt4hT1KCavYFpAnczN4/NCoDmN5t7Y.','2021-09-20 15:50:10','PAPERTRL_SYSTEM',NULL,'N','N',NULL,NULL,NULL,NULL,'',NULL,'2021-09-09 03:57:09','I','','A','2021-09-09 00:00:00','2021-09-09 00:00:00',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `umm_user_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_propic`
--

DROP TABLE IF EXISTS `umm_user_propic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_propic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `image_data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_propic`
--

LOCK TABLES `umm_user_propic` WRITE;
/*!40000 ALTER TABLE `umm_user_propic` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_propic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umm_user_role_relation`
--

DROP TABLE IF EXISTS `umm_user_role_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `umm_user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `USER_FK1` (`user_id`) USING BTREE,
  KEY `ROLE_FK2` (`role_id`) USING BTREE,
  CONSTRAINT `ROLE_FK2` FOREIGN KEY (`role_id`) REFERENCES `umm_role_mst` (`id`),
  CONSTRAINT `USER_FK1` FOREIGN KEY (`user_id`) REFERENCES `umm_user_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_role_relation`
--

LOCK TABLES `umm_user_role_relation` WRITE;
/*!40000 ALTER TABLE `umm_user_role_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `umm_user_role_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_csv_export_format`
--

DROP TABLE IF EXISTS `vp_bill_csv_export_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_csv_export_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(50) NOT NULL,
  `format_code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_csv_export_format`
--

LOCK TABLES `vp_bill_csv_export_format` WRITE;
/*!40000 ALTER TABLE `vp_bill_csv_export_format` DISABLE KEYS */;
INSERT INTO `vp_bill_csv_export_format` VALUES (1,'Default','DEFAULT',1),(2,'Business Central','BC',0),(3,'Blackbaud','BB',0),(4,'KERA DEFAULT','KERA',0),(5,'SAGE','SAGE',0),(6,'International Support Group','ISG',0),(7,'TIDEWATER','TW',0);
/*!40000 ALTER TABLE `vp_bill_csv_export_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_mail_option`
--

DROP TABLE IF EXISTS `vp_payment_mail_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_mail_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `value` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_mail_option`
--

LOCK TABLES `vp_payment_mail_option` WRITE;
/*!40000 ALTER TABLE `vp_payment_mail_option` DISABLE KEYS */;
INSERT INTO `vp_payment_mail_option` VALUES (1,'First Class (F)','F','A'),(2,'Priority (P)','P','A'),(3,'Next Day (N)','N','A');
/*!40000 ALTER TABLE `vp_payment_mail_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_recipient_detail`
--

DROP TABLE IF EXISTS `vp_payment_recipient_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_recipient_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_type` varchar(100) DEFAULT NULL,
  `company_name` varchar(300) DEFAULT NULL,
  `recipient_first_name` varchar(200) DEFAULT NULL,
  `recipient_last_name` varchar(200) DEFAULT NULL,
  `account_type` varchar(100) DEFAULT NULL,
  `account_routing_number` varchar(100) DEFAULT NULL,
  `encoded_account_routing_number` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `encoded_account_number` varchar(100) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `preferred_payment_type` int(11) DEFAULT NULL,
  `remittance_email_address` varchar(150) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `payee_token` varchar(250) DEFAULT NULL,
  `check_to_be_mail` tinyint(1) DEFAULT NULL,
  `mail_option` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipient_user_fk` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_recipient_detail`
--

LOCK TABLES `vp_payment_recipient_detail` WRITE;
/*!40000 ALTER TABLE `vp_payment_recipient_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_recipient_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_type_for_user`
--

DROP TABLE IF EXISTS `vp_payment_type_for_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_type_for_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_type_for_user`
--

LOCK TABLES `vp_payment_type_for_user` WRITE;
/*!40000 ALTER TABLE `vp_payment_type_for_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_type_for_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-28 12:00:47
