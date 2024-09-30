-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Linux (x86_64)
--
-- Host: 10.11.31.61    Database: papertrl_depl_testing_tenant_script
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
-- Table structure for table `common_account_number`
--

DROP TABLE IF EXISTS `common_account_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_account_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) DEFAULT NULL,
  `account_detail_type` int(11) DEFAULT NULL,
  `number` varchar(100) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `parent_account` int(11) DEFAULT NULL,
  `as_at_date` date DEFAULT NULL,
  `as_at_date_balance` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) DEFAULT NULL,
  `current_balance_with_sub_accounts` decimal(20,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `classification` varchar(100) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `sub_level` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `is_purchase_account` char(2) DEFAULT 'Q',
  `is_expense_account` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACCOUNT_TYPE_1` (`account_type`),
  CONSTRAINT `FK_ACCOUNT_TYPE_1` FOREIGN KEY (`account_type`) REFERENCES `common_account_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_account_number`
--

LOCK TABLES `common_account_number` WRITE;
/*!40000 ALTER TABLE `common_account_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_account_number_import`
--

DROP TABLE IF EXISTS `common_account_number_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_account_number_import` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_account_number_import`
--

LOCK TABLES `common_account_number_import` WRITE;
/*!40000 ALTER TABLE `common_account_number_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_account_number_import_issue`
--

DROP TABLE IF EXISTS `common_account_number_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_account_number_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_chart_of_account_import_mst` (`import_mst_id`),
  CONSTRAINT `FK__common_chart_of_account_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_account_number_import` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_account_number_import_issue`
--

LOCK TABLES `common_account_number_import_issue` WRITE;
/*!40000 ALTER TABLE `common_account_number_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_account_number_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_account_sub_type`
--

DROP TABLE IF EXISTS `common_account_sub_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_account_sub_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `short_code` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ACCOUNT_TYPE` (`account_type`),
  CONSTRAINT `FK_ACCOUNT_TYPE` FOREIGN KEY (`account_type`) REFERENCES `common_account_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_account_sub_type`
--

LOCK TABLES `common_account_sub_type` WRITE;
/*!40000 ALTER TABLE `common_account_sub_type` DISABLE KEYS */;
INSERT INTO `common_account_sub_type` VALUES (1,1,'Accounts Receivable (A/R)','AccountsReceivable'),(2,2,'Allowance for Bad Debts','AllowanceForBadDebts'),(3,2,'Development Costs','DevelopmentCosts'),(4,2,'Employee Cash Advances','EmployeeCashAdvances'),(5,2,'Inventory','Inventory'),(6,2,'Investment - Mortgage/Real Estate Loans','Investment_MortgageRealEstateLoans'),(7,2,'Investment - Tax-Exempt Securities','Investment_TaxExemptSecurities'),(8,2,'Investment - U.S. Government Obligations','Investment_USGovernmentObligations'),(9,2,'Investments - Other','Investments_Other'),(10,2,'Loans To Officers','LoansToOfficers'),(11,2,'Loans to Others','LoansToOthers'),(12,2,'Loans to Stockholders','LoansToStockholders'),(13,2,'Other Current Assets','OtherCurrentAssets'),(14,2,'Prepaid Expenses','PrepaidExpenses'),(15,2,'Retainage','Retainage'),(16,2,'Undeposited Funds','UndepositedFunds'),(17,3,'Cash on hand','CashOnHand'),(18,3,'Checking','Checking'),(19,3,'Money Market','MoneyMarket'),(20,3,'Rents Held in Trust','RentsHeldInTrust'),(21,3,'Savings','Savings'),(22,3,'Trust account','TrustAccount'),(23,4,'Accumulated Amortization','AccumulatedAmortization'),(24,4,'Accumulated Depletion','AccumulatedDepletion'),(25,4,'Accumulated Depreciation','AccumulatedDepreciation'),(26,4,'Buildings','Buildings'),(27,4,'Depletable Assets','DepletableAssets'),(28,4,'Fixed Asset Computers','FixedAssetComputers'),(29,4,'Fixed Asset Copiers','FixedAssetCopiers'),(30,4,'Fixed Asset Furniture','FixedAssetFurniture'),(31,4,'Fixed Asset Other Tools Equipment','FixedAssetOtherToolsEquipment'),(32,4,'Fixed Asset Phone','FixedAssetPhone'),(33,4,'Fixed Asset Photo Video','FixedAssetPhotoVideo'),(34,4,'Fixed Asset Software','FixedAssetSoftware'),(35,4,'Furniture & Fixtures','FurnitureAndFixtures'),(36,4,'Intangible Assets','IntangibleAssets'),(37,4,'Land','Land'),(38,4,'Leasehold Improvements','LeaseholdImprovements'),(39,4,'Machinery & Equipment','MachineryAndEquipment'),(40,4,'Other fixed assets','OtherFixedAssets'),(41,4,'Vehicles','Vehicles'),(42,5,'Accumulated Amortization of Other Assets','AccumulatedAmortizationOfOtherAssets'),(43,5,'Goodwill','Goodwill'),(44,5,'Lease Buyout','LeaseBuyout'),(45,5,'Licenses','Licenses'),(46,5,'Organizational Costs','OrganizationalCosts'),(47,5,'Other Long-term Assets','OtherLong_termAssets'),(48,5,'Security Deposits','SecurityDeposits'),(49,6,'Accounts Payable (A/P)','AccountsPayable'),(50,7,'Credit Card','CreditCard'),(51,8,'Federal Income Tax Payable','FederalIncomeTaxPayable'),(52,8,'Insurance Payable','InsurancePayable'),(53,8,'Line of Credit','LineOfCredit'),(54,8,'Loan Payable','LoanPayable'),(55,8,'Other Current Liabilities','OtherCurrentLiabilities'),(56,8,'Payroll Clearing','PayrollClearing'),(57,8,'Payroll Tax Payable','PayrollTaxPayable'),(58,8,'Prepaid Expenses Payable','PrepaidExpensesPayable'),(59,8,'Rents in trust - Liability','RentsInTrustLiability'),(60,8,'Sales Tax Payable','SalesTaxPayable'),(61,8,'State/Local Income Tax Payable','StateLocalIncomeTaxPayable'),(62,8,'Trust Accounts - Liabilities','Trust Accounts _Liabilities'),(63,8,'Undistributed Tips','UndistributedTips'),(64,9,'Notes Payable','NotesPayable'),(65,9,'Other Long Term Liabilities','OtherLongTermLiabilities'),(66,9,'Shareholder Notes Payable','ShareholderNotesPayable'),(67,10,'Accumulated Adjustment','AccumulatedAdjustment'),(68,10,'Common Stock','CommonStock'),(69,10,'Estimated Taxes','EstimatedTaxes'),(70,10,'Healthcare','Healthcare'),(71,10,'Opening Balance Equity','OpeningBalanceEquity'),(72,10,'Owner\'s Equity','OwnersEquity'),(73,10,'Paid-In Capital or Surplus','PaidInCapitalOrSurplus'),(74,10,'Partner Contributions','PartnerContributions'),(75,10,'Partner\'s Equity','PartnersEquity'),(76,10,'Personal Expense','PersonalExpense'),(77,10,'Personal Income','PersonalIncome'),(78,10,'Preferred Stock','PreferredStock'),(79,10,'Retained Earnings','RetainedEarnings'),(80,10,'Treasury Stock','TreasuryStock'),(81,11,'Discounts/Refunds Given','DiscountsRefundsGiven'),(82,11,'Non-Profit Income','NonProfitIncome'),(83,11,'Other Primary Income','OtherPrimaryIncome'),(84,11,'Sales of Product Income','SalesOfProductIncome'),(85,11,'Service/Fee Income','ServiceFeeIncome'),(86,11,'Unapplied Cash Payment Income','UnappliedCashPaymentIncome'),(87,12,'Dividend Income','DividendIncome'),(88,12,'Interest Earned','InterestEarned'),(89,12,'Other Investment Income','OtherInvestmentIncome'),(90,12,'Other Miscellaneous Income','OtherMiscellaneousIncome'),(91,12,'Tax-Exempt Interest','TaxExemptInterest'),(92,13,'Cost of labor - COS','CostOfLaborCos'),(93,13,'Equipment Rental - COS','EquipmentRentalCos'),(94,13,'Other Costs of Services - COS','OtherCostsOfServiceCos'),(95,13,'Shipping, Freight & Delivery - COS','ShippingFreightDeliveryCos'),(96,13,'Supplies & Materials - COGS','SuppliesMaterialsCogs'),(97,14,'Advertising/Promotional','AdvertisingPromotional'),(98,14,'Auto','Auto'),(99,14,'Bad Debts','BadDebts'),(100,14,'Bank Charges','BankCharges'),(101,14,'Charitable Contributions','CharitableContributions'),(102,14,'Cost of Labor','CostOfLabor'),(103,14,'Dues & subscriptions','DuesSubscriptions'),(104,14,'Entertainment','Entertainment'),(105,14,'Entertainment Meals','EntertainmentMeals'),(106,14,'Equipment Rental','EquipmentRental'),(107,14,'Finance costs','FinanceCosts'),(108,14,'Insurance','Insurance'),(109,14,'Interest Paid','InterestPaid'),(110,14,'Legal & Professional Fees','LegalProfessionalFees'),(111,14,'Office/General Administrative Expenses','OfficeGeneralAdministrativeExpenses'),(112,14,'Other Business Expenses','OtherBusinessExpenses'),(113,14,'Other Miscellaneous Service Cost','OtherMiscellaneousServiceCost'),(114,14,'Payroll Expenses','PayrollExpenses'),(115,14,'Promotional Meals','PromotionalMeals'),(116,14,'Rent or Lease of Buildings','RentOrLeaseOfBuildings'),(117,14,'Repair & Maintenance','RepairMaintenance'),(118,14,'Shipping, Freight & Delivery','ShippingFreightAndDelivery'),(119,14,'Supplies & Materials','SuppliesMaterials'),(120,14,'Taxes Paid','TaxesPaid'),(121,14,'Travel','Travel'),(122,14,'Travel Meals','TravelMeals'),(123,14,'Unapplied Cash Bill Payment Expense','UnappliedCashBillPaymentExpense'),(124,14,'Utilities','Utilities'),(125,15,'Amortization','Amortization'),(126,15,'Depreciation','Depreciation'),(127,15,'Exchange Gain or Loss','ExchangeGainOrLoss'),(128,15,'Gas And Fuel','GasAndFuel'),(129,15,'Home Office','HomeOffice'),(130,15,'Homeowner Rental Insurance','HomeownerRentalInsurance'),(131,15,'Mortgage Interest Home Office','MortgageInterestHomeOffice'),(132,15,'Other Home Office Expenses','OtherHomeOfficeExpenses'),(133,15,'Other Miscellaneous Expense','OtherMiscellaneousExpense'),(134,15,'Other Vehicle Expenses','OtherVehicleExpenses'),(135,15,'Parking and Tolls','ParkingAndTolls'),(136,15,'Penalties & Settlements','PenaltiesSettlements'),(137,15,'Rent and Lease Home Office','RentAndLeaseHomeOffice'),(138,15,'Repairs and Maintenance Home Office','RepairsAndMaintenanceHomeOffice'),(139,15,'Utilities Home Office','UtilitiesHomeOffice'),(140,15,'Vehicle','Vehicle'),(141,15,'Vehicle Insurance','VehicleInsurance'),(142,15,'Vehicle Lease','VehicleLease'),(143,15,'Vehicle Loan','VehicleLoan'),(144,15,'Vehicle Loan Interest','VehicleLoan Interest'),(145,15,'Vehicle Registration','VehicleRegistration'),(146,15,'Vehicle Repairs','VehicleRepairs'),(147,15,'Wash and Road Services','WashAndRoadServices'),(148,8,'Global Tax Payable','GlobalTaxPayable');
/*!40000 ALTER TABLE `common_account_sub_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_account_type`
--

DROP TABLE IF EXISTS `common_account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `short_name` varchar(200) NOT NULL,
  `short_name_no_space` varchar(200) NOT NULL,
  `short_name_underscore` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_account_type`
--

LOCK TABLES `common_account_type` WRITE;
/*!40000 ALTER TABLE `common_account_type` DISABLE KEYS */;
INSERT INTO `common_account_type` VALUES (1,'Accounts receivable (A/R)','Accounts Receivable','AccountsReceivable','ACCOUNTS_RECEIVABLE'),(2,'Other Current Assets','Other Current Asset','OtherCurrentAsset','OTHER_CURRENT_ASSET'),(3,'Bank','Bank','Bank','BANK'),(4,'Fixed Assets','Fixed Asset','FixedAsset','FIXED_ASSET'),(5,'Other Assets','Other Asset','OtherAsset','OTHER_ASSET'),(6,'Accounts payable (A/P)','Accounts Payable','AccountsPayable','ACCOUNTS_PAYABLE'),(7,'Credit Card','Credit Card','CreditCard','CREDIT_CARD'),(8,'Other Current Liabilities','Other Current Liability','OtherCurrentLiability','OTHER_CURRENT_LIABILITY'),(9,'Long Term Liabilities','Long Term Liability','LongTermLiability','LONG_TERM_LIABILITY'),(10,'Equity','Equity','Equity','EQUITY'),(11,'Income','Income','Income','INCOME'),(12,'Other Income','Other Income','OtherIncome','OTHER_INCOME'),(13,'Cost of Goods Sold','Cost of Goods Sold','CostOfGoodsSold','COST_OF_GOODS_SOLD'),(14,'Expenses','Expense','Expense','EXPENSE'),(15,'Other Expense','Other Expense','OtherExpense','OTHER_EXPENSE'),(16,'Non Posting','Non Posting','NonPosting','NON_POSTING'),(17,'Assets','Assets','Assets','ASSETS'),(18,'Liabilities','Liabilities','Liabilities','LIABILITIES');
/*!40000 ALTER TABLE `common_account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_additional_document_relation`
--

DROP TABLE IF EXISTS `common_additional_document_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_additional_document_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `required` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT NULL,
  `appear_on_report` tinyint(1) DEFAULT NULL,
  `header_appear_on_report` varchar(6) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(100) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_field` (`field_id`),
  CONSTRAINT `fk_field` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_additional_document_relation`
--

LOCK TABLES `common_additional_document_relation` WRITE;
/*!40000 ALTER TABLE `common_additional_document_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_document_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_additional_field`
--

DROP TABLE IF EXISTS `common_additional_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_additional_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `field_name` varchar(80) NOT NULL,
  `max_length` int(5) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `field_type_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `field_type_name` varchar(150) DEFAULT '',
  `data_type` varchar(150) DEFAULT NULL,
  `create_new` char(1) DEFAULT NULL,
  `multiple` char(1) DEFAULT NULL,
  `file_types` varchar(300) DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'A',
  `row_count` int(50) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_additional_field`
--

LOCK TABLES `common_additional_field` WRITE;
/*!40000 ALTER TABLE `common_additional_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_additional_field_option`
--

DROP TABLE IF EXISTS `common_additional_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_additional_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` varchar(100) NOT NULL,
  `data_source_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_FIELD_ID` (`field_id`),
  CONSTRAINT `FK_FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_additional_field_option`
--

LOCK TABLES `common_additional_field_option` WRITE;
/*!40000 ALTER TABLE `common_additional_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_additional_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_additional_field_type`
--

DROP TABLE IF EXISTS `common_additional_field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_additional_field_type` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_additional_field_type`
--

LOCK TABLES `common_additional_field_type` WRITE;
/*!40000 ALTER TABLE `common_additional_field_type` DISABLE KEYS */;
INSERT INTO `common_additional_field_type` VALUES (1,'Textbox','A'),(2,'Date Field','A'),(3,'Drop Down Field','A'),(4,'Text Area','A'),(5,'Label','A'),(6,'File Input','A'),(7,'Radio Button','A'),(8,'Check Box','A');
/*!40000 ALTER TABLE `common_additional_field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_additional_field_validation`
--

DROP TABLE IF EXISTS `common_additional_field_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_additional_field_validation` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_additional_field_validation`
--

LOCK TABLES `common_additional_field_validation` WRITE;
/*!40000 ALTER TABLE `common_additional_field_validation` DISABLE KEYS */;
INSERT INTO `common_additional_field_validation` VALUES (1,'Name'),(2,'Display Order'),(3,'Required'),(4,'Max Length'),(5,'Data Type'),(6,'Drop Down Properties'),(7,'Data Source'),(8,'Accept'),(9,'Rows'),(10,'Value'),(11,'Options');
/*!40000 ALTER TABLE `common_additional_field_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_additional_field_validation_relation`
--

DROP TABLE IF EXISTS `common_additional_field_validation_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_additional_field_validation_relation` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `validation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `field_id` (`field_id`) USING BTREE,
  KEY `validation_id` (`validation_id`) USING BTREE,
  CONSTRAINT `field_id` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `validation_id` FOREIGN KEY (`validation_id`) REFERENCES `common_additional_field_validation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_additional_field_validation_relation`
--

LOCK TABLES `common_additional_field_validation_relation` WRITE;
/*!40000 ALTER TABLE `common_additional_field_validation_relation` DISABLE KEYS */;
INSERT INTO `common_additional_field_validation_relation` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,1),(7,2,2),(8,2,3),(9,3,1),(10,3,2),(11,3,3),(12,4,1),(13,4,2),(14,4,3),(15,4,4),(16,4,9),(17,5,1),(18,5,2),(19,6,1),(20,6,2),(21,6,3),(22,6,8),(23,7,1),(24,7,2),(25,7,3),(26,3,6),(27,3,7),(28,5,10),(30,7,11),(31,8,2),(32,8,3),(33,8,1);
/*!40000 ALTER TABLE `common_additional_field_validation_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_approval_code`
--

DROP TABLE IF EXISTS `common_approval_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `long_name` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `expense_category_id` int(11) NOT NULL,
  `project_budget` decimal(20,2) DEFAULT 0.00,
  `amount_invoiced` decimal(20,2) DEFAULT 0.00,
  `remaining_amount` decimal(20,2) DEFAULT 0.00,
  `status` char(1) NOT NULL,
  `contract_value` decimal(20,2) DEFAULT 0.00,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_username` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EXP_CAT` (`expense_category_id`),
  KEY `PARENT_ID_INDEX` (`parent_id`) USING BTREE,
  KEY `CREATED_USER_INDEX` (`created_by`) USING BTREE,
  CONSTRAINT `FK_EXP_CAT` FOREIGN KEY (`expense_category_id`) REFERENCES `common_approval_code_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_code`
--

LOCK TABLES `common_approval_code` WRITE;
/*!40000 ALTER TABLE `common_approval_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_approval_code_category`
--

DROP TABLE IF EXISTS `common_approval_code_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_code_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_code_category`
--

LOCK TABLES `common_approval_code_category` WRITE;
/*!40000 ALTER TABLE `common_approval_code_category` DISABLE KEYS */;
INSERT INTO `common_approval_code_category` VALUES (1,'Expense','I'),(2,'Project','A');
/*!40000 ALTER TABLE `common_approval_code_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_approval_code_import_issue`
--

DROP TABLE IF EXISTS `common_approval_code_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_code_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST4` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST4` FOREIGN KEY (`import_mst_id`) REFERENCES `common_approval_code_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_code_import_issue`
--

LOCK TABLES `common_approval_code_import_issue` WRITE;
/*!40000 ALTER TABLE `common_approval_code_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_approval_code_import_mst`
--

DROP TABLE IF EXISTS `common_approval_code_import_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_approval_code_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
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
-- Dumping data for table `common_approval_code_import_mst`
--

LOCK TABLES `common_approval_code_import_mst` WRITE;
/*!40000 ALTER TABLE `common_approval_code_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_approval_code_import_mst` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_approval_group`
--

LOCK TABLES `common_approval_group` WRITE;
/*!40000 ALTER TABLE `common_approval_group` DISABLE KEYS */;
INSERT INTO `common_approval_group` VALUES (1,'Administrator','A','admin','2019-11-19 22:58:33',NULL,NULL,NULL,NULL),(3,'No Approval Group','A','admin','2020-03-31 09:31:43',NULL,NULL,NULL,NULL);
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
-- Table structure for table `common_audit_trial_status`
--

DROP TABLE IF EXISTS `common_audit_trial_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_audit_trial_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `sort_order` int(2) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_audit_trial_status`
--

LOCK TABLES `common_audit_trial_status` WRITE;
/*!40000 ALTER TABLE `common_audit_trial_status` DISABLE KEYS */;
INSERT INTO `common_audit_trial_status` VALUES (1,'Uploaded by ',1,'fa fa-upload','bg-blue'),(2,'Reviewed and submitted by ',2,'fa fa-location-arrow','bg-blue'),(3,'Approved by ',3,'fa fa-check','bg-blue'),(4,'Rejected by ',4,'fa fa-close','bg-red'),(5,'Reassigned by ',5,'fa fa-share','bg-blue'),(6,'Deleted by ',6,'fa fa-trash','bg-red'),(7,'Re submitted by ',7,'fa fa-angle-double-right','bg-blue'),(8,'Approved and re-assigned by ',7,'fa fa-angle-double-right','bg-blue'),(9,'Revert back to',8,'fa fa-undo','bg-blue'),(10,'Created by ',1,'fa fa-upload','bg-blue'),(11,'Payment issued by ',10,'fa fa-credit-card','bg-blue'),(12,'Check mailed by ',11,'fa fa-envelope-open',' bg-blue'),(13,'Payment revoked by ',12,'fa fa-undo',' bg-red'),(14,'Payment Invoice changed by',13,'fa fa-undo',' bg-red'),(15,'Submitted by',1,'fa fa-upload','bg-blue'),(16,'Skipped approval by',2,'fa fa-step-forward','bg-blue'),(17,'Updated by',3,'fa fa-pencil','bg-blue'),(18,'Sent to vendor by',4,'fa fa-paper-plane-o','bg-blue'),(19,'Mark as under discussion by',5,'fa fa-thumb-tack','bg-blue'),(20,'Taged by',6,'fa fa-tag','bg-blue'),(21,'Un tagged by',7,'fa fa-tag','bg-red'),(22,'Imported by',14,'fafa-thumb-tack','bg-blue'),(23,'Save as approved by',15,'fa fa-check','bg-blue'),(24,'Approved by ',3,'fa fa-check','bg-blue'),(25,'Rejected by',4,'fa fa-close','bg-red'),(26,'Deleted by',6,'fa fa-trash','bg-red'),(27,'Cancelled by',14,'fa fa-close','bg-red'),(28,'Recurring bill generated by',2,'fa fa-cogs','bg-blue'),(29,'Recurring bill generated and approved by',3,'fa fa-check','bg-blue'),(30,'Batch processing started',16,'fa fa-cogs','bg-blue'),(31,'Batch submitted to payment system',17,'fa fa-check-square-o','bg-blue'),(32,'Batch failed by payment system',18,'fa fa-exclamation-triangle','bg-red'),(33,'Batch completed by payment system',20,'fa fa-check-circle-o','bg-green'),(34,'Note added by',21,'fa fa-commenting-o','bg-blue'),(35,'Opened by',22,'fa fa-check-circle-o','bg-green'),(36,'Closed by',23,'fa fa-times','bg-red'),(37,'Edited and save as approved by',24,'fa fa-pencil','bg-blue'),(38,'Edited and submitted for approval by',25,'fa fa-pencil','bg-blue'),(39,'Credit note applied by',1,'fa fa-list-alt','bg-blue'),(40,'Credit note removed by',2,'fa fa-list-alt','bg-red'),(41,'Marked as offline payment processing by',1,'fa fa-credit-card','bg-blue');
/*!40000 ALTER TABLE `common_audit_trial_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_action`
--

DROP TABLE IF EXISTS `common_automation_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_code` varchar(100) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_action`
--

LOCK TABLES `common_automation_action` WRITE;
/*!40000 ALTER TABLE `common_automation_action` DISABLE KEYS */;
INSERT INTO `common_automation_action` VALUES (1,'CREATE_APPROVAL_WORKFLOW','Create Approval Workflow'),(2,'SEND_EMAIL_NOTIFICATION','Send Email Notification'),(3,'SEND_USER_NOTIFICATION','Send User Notification'),(4,'SET_FIELD_VALUE','Set Field Value'),(5,'EXECUTE_AUTOMATION','Execute Automation'),(6,'SYNC_WITH_THIRD_PART_APPLICATION','Sync With Third-Part Application'),(7,'ASSIGN_TO','Assign To'),(8,'ASSIGN_FINAL_APPROVAL_USER','Assign Final Approval User');
/*!40000 ALTER TABLE `common_automation_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_action_config`
--

DROP TABLE IF EXISTS `common_automation_action_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_action_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATIO_ID_FK1` (`automation_id`),
  KEY `ACTION_ID_FK1` (`action_id`),
  CONSTRAINT `ACTION_ID_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATIO_ID_FK1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_action_config`
--

LOCK TABLES `common_automation_action_config` WRITE;
/*!40000 ALTER TABLE `common_automation_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_action_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_chain_config`
--

DROP TABLE IF EXISTS `common_automation_chain_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_chain_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `chain_to` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK6` (`automation_id`),
  KEY `CHAIN_ID_FK1` (`chain_to`),
  KEY `ACTION_FK9` (`action_id`),
  CONSTRAINT `ACTION_FK9` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `CHAIN_ID_FK1` FOREIGN KEY (`chain_to`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_chain_config`
--

LOCK TABLES `common_automation_chain_config` WRITE;
/*!40000 ALTER TABLE `common_automation_chain_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_chain_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_condition`
--

DROP TABLE IF EXISTS `common_automation_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(100) NOT NULL,
  `second_value` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_condition`
--

LOCK TABLES `common_automation_condition` WRITE;
/*!40000 ALTER TABLE `common_automation_condition` DISABLE KEYS */;
INSERT INTO `common_automation_condition` VALUES (1,'Equals',0),(2,'Not Equals',0),(3,'Greater Than',0),(4,'Greater Than or Equal',0),(5,'Less Than',0),(6,'Less Than or Equal',0),(7,'Contains',0),(8,'Between',1),(9,'Is Empty',0),(10,'Is Not Empty',0);
/*!40000 ALTER TABLE `common_automation_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_condition_config`
--

DROP TABLE IF EXISTS `common_automation_condition_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_condition_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `adjoint_condition` varchar(50) NOT NULL,
  `condition_order` int(11) NOT NULL,
  `first_value` varchar(500) DEFAULT NULL,
  `second_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FIELD_ID_FK1` (`field_id`),
  KEY `FIELD_CONDITION_FK1` (`condition_id`),
  KEY `AUTOMATION_ID_FK1` (`automation_id`),
  CONSTRAINT `AUTOMATION_ID_FK1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FIELD_CONDITION_FK1` FOREIGN KEY (`condition_id`) REFERENCES `common_automation_condition` (`id`),
  CONSTRAINT `FIELD_ID_FK1` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_condition_config`
--

LOCK TABLES `common_automation_condition_config` WRITE;
/*!40000 ALTER TABLE `common_automation_condition_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_condition_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_condition_template`
--

DROP TABLE IF EXISTS `common_automation_condition_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_condition_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `template` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_CONDITION_TEMPLATE_FK` (`automation_id`),
  CONSTRAINT `AUTOMATION_CONDITION_TEMPLATE_FK` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_condition_template`
--

LOCK TABLES `common_automation_condition_template` WRITE;
/*!40000 ALTER TABLE `common_automation_condition_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_condition_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_document_action_config`
--

DROP TABLE IF EXISTS `common_automation_document_action_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_document_action_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `automation_action` tinyint(1) NOT NULL DEFAULT 0,
  `automation_rule_action` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__common_automation_event` (`event_id`),
  KEY `FK__common_automation_action` (`action_id`),
  KEY `FK_common_automation_event_action_config_common__document_type` (`document_type_id`),
  CONSTRAINT `FK__common_automation_action` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `FK__common_automation_event` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`),
  CONSTRAINT `FK_common_automation_event_action_config_common__document_type` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_document_action_config`
--

LOCK TABLES `common_automation_document_action_config` WRITE;
/*!40000 ALTER TABLE `common_automation_document_action_config` DISABLE KEYS */;
INSERT INTO `common_automation_document_action_config` VALUES (1,1,1,1,1,0),(2,1,1,2,1,0),(3,1,1,3,1,0),(4,1,1,4,1,0),(5,1,2,2,1,0),(6,1,2,3,1,0),(7,1,2,4,1,0),(8,1,3,2,1,0),(9,1,3,3,1,0),(10,1,3,4,1,0),(11,1,3,6,1,0),(12,1,4,2,1,0),(13,1,4,3,1,0),(14,1,5,2,1,0),(15,1,5,3,1,0),(16,1,6,2,1,0),(17,1,6,3,1,0),(18,1,6,6,1,0),(19,1,10,2,1,0),(20,1,10,3,1,0),(21,2,1,1,1,0),(22,2,1,2,1,0),(23,2,1,3,1,0),(24,2,1,4,1,0),(25,2,2,2,1,0),(26,2,2,3,1,0),(27,2,2,4,1,0),(28,2,3,2,1,0),(29,2,3,3,1,0),(30,2,3,4,1,0),(31,2,3,6,1,0),(32,2,4,2,1,0),(33,2,4,3,1,0),(34,2,5,2,1,0),(35,2,5,3,1,0),(36,2,6,2,1,0),(37,2,6,3,1,0),(38,2,6,6,1,0),(39,2,10,2,1,0),(40,2,10,3,1,0),(41,4,1,1,1,0),(42,4,1,2,1,0),(43,4,1,3,1,0),(44,4,1,4,1,0),(45,4,2,2,1,0),(46,4,2,3,1,0),(47,4,2,4,1,0),(48,4,3,2,1,0),(49,4,3,3,1,0),(50,4,3,4,1,0),(51,4,3,6,1,0),(52,4,4,2,1,0),(53,4,4,3,1,0),(54,4,5,2,1,0),(55,4,5,3,1,0),(56,4,6,2,1,0),(57,4,6,3,1,0),(58,4,6,6,1,0),(59,4,10,2,1,0),(60,4,10,3,1,0),(61,2,7,2,1,0),(62,2,7,3,1,0),(63,3,8,2,1,0),(64,3,8,3,1,0),(65,3,8,6,1,0),(66,3,6,2,1,0),(67,3,6,3,1,0),(68,3,6,6,1,0),(69,5,8,2,1,0),(70,5,8,3,1,0),(71,5,8,6,1,0),(72,5,9,2,1,0),(73,5,9,3,1,0),(74,5,9,6,1,0),(75,5,11,2,1,0),(76,5,11,3,1,0),(77,5,11,6,1,0),(78,5,12,2,1,0),(79,5,12,3,1,0),(80,5,13,2,1,0),(81,5,13,3,1,0),(82,5,13,6,1,0),(83,1,14,2,1,0),(84,1,14,3,1,0),(85,2,14,2,1,0),(86,2,14,3,1,0),(87,4,14,2,1,0),(88,4,14,3,1,0),(89,1,9,2,1,0),(90,1,9,3,1,0),(91,3,2,2,1,0),(92,3,2,3,1,0),(93,3,2,6,1,0),(94,5,1,1,1,0),(95,1,3,1,1,0),(96,2,3,1,1,0),(97,4,3,1,1,0),(98,5,3,1,1,0),(99,1,15,7,0,1),(100,1,16,7,0,1),(101,1,1,8,0,1),(102,10,1,1,1,0),(103,10,1,2,1,0),(104,10,1,3,1,0),(105,10,3,2,1,0),(106,10,3,3,1,0),(107,10,4,2,1,0),(108,10,4,3,1,0),(109,10,17,2,1,0),(110,10,17,3,1,0),(111,10,18,2,1,0),(112,10,18,3,1,0),(113,10,19,2,1,0),(114,10,19,3,1,0),(115,10,20,2,1,0),(116,10,20,3,1,0),(117,10,3,1,1,0),(118,10,10,2,1,0),(119,10,10,3,1,0);
/*!40000 ALTER TABLE `common_automation_document_action_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_document_section`
--

DROP TABLE IF EXISTS `common_automation_document_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_document_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_document_section`
--

LOCK TABLES `common_automation_document_section` WRITE;
/*!40000 ALTER TABLE `common_automation_document_section` DISABLE KEYS */;
INSERT INTO `common_automation_document_section` VALUES (1,'Header Section','A'),(2,'Line Item Section','A'),(3,'Item Cost Distribution Section','A'),(4,'Expense Cost Distribution Section','A'),(5,'Basic Information','A'),(6,'Postal Address','A'),(7,'Remit Address','A'),(8,'W9 Form Information','A'),(9,'Account Details Section','A'),(10,'Payment Information','A');
/*!40000 ALTER TABLE `common_automation_document_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_document_section_relation`
--

DROP TABLE IF EXISTS `common_automation_document_section_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_document_section_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_document_section_relation`
--

LOCK TABLES `common_automation_document_section_relation` WRITE;
/*!40000 ALTER TABLE `common_automation_document_section_relation` DISABLE KEYS */;
INSERT INTO `common_automation_document_section_relation` VALUES (1,1,1),(3,1,3),(4,1,4),(5,2,1),(6,2,2),(7,3,1),(8,3,2),(9,4,1),(10,4,2),(11,5,1),(12,6,5),(13,6,6),(14,6,7),(15,6,8),(16,2,9),(17,3,9),(18,6,10),(19,8,1),(20,8,2);
/*!40000 ALTER TABLE `common_automation_document_section_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_document_type`
--

DROP TABLE IF EXISTS `common_automation_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` varchar(100) NOT NULL,
  `short_code` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `show_hide_enable` tinyint(1) DEFAULT NULL,
  `automation_enable` tinyint(1) NOT NULL DEFAULT 0,
  `automation_rule_enable` tinyint(1) NOT NULL DEFAULT 0,
  `notification_enable` tinyint(1) NOT NULL,
  `payment_enable` tinyint(1) NOT NULL,
  `attach_to_enable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_document_type`
--

LOCK TABLES `common_automation_document_type` WRITE;
/*!40000 ALTER TABLE `common_automation_document_type` DISABLE KEYS */;
INSERT INTO `common_automation_document_type` VALUES (1,'Bill','BILL','A',0,1,1,1,1,0),(2,'Purchase Order','PO','A',1,1,0,1,0,1),(3,'Purchase Order Receipt','PO_RECEIPT','A',0,1,0,0,0,1),(4,'Expense Report','EXPENSE','A',0,1,0,1,1,1),(5,'Offline Payment','BILL_PAYMENT','A',0,1,0,0,0,0),(6,'Vendor','VENDOR','A',0,0,0,1,0,1),(8,'Credit Note','CREDIT_NOTE','A',0,0,0,0,0,0),(9,'Credit Card','CREDIT_CARD','I',0,0,0,1,0,0),(10,'Online Payment','BATCH_PAYMENT','A',0,1,0,1,0,0),(11,'Inbox','INBOX','I',0,0,0,1,0,0);
/*!40000 ALTER TABLE `common_automation_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_document_type_config`
--

DROP TABLE IF EXISTS `common_automation_document_type_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_document_type_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AUTOMATION_ID1` (`automation_id`),
  KEY `FK_DOCUMENT_TYPE1` (`document_type_id`),
  KEY `FK_EVENT1` (`event_id`),
  CONSTRAINT `FK_AUTOMATION_ID1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FK_DOCUMENT_TYPE1` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_EVENT1` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_document_type_config`
--

LOCK TABLES `common_automation_document_type_config` WRITE;
/*!40000 ALTER TABLE `common_automation_document_type_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_document_type_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_document_type_event`
--

DROP TABLE IF EXISTS `common_automation_document_type_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_document_type_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `automation_event` tinyint(1) NOT NULL DEFAULT 0,
  `automation_rule_event` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOC_TYPE_FK` (`document_type_id`),
  KEY `EVENT_FK` (`event_id`),
  CONSTRAINT `DOC_TYPE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_document_type_event`
--

LOCK TABLES `common_automation_document_type_event` WRITE;
/*!40000 ALTER TABLE `common_automation_document_type_event` DISABLE KEYS */;
INSERT INTO `common_automation_document_type_event` VALUES (1,1,1,1,1,0),(2,1,2,1,0,0),(3,1,3,1,0,0),(4,1,5,1,0,0),(5,1,4,1,0,0),(6,1,6,1,0,0),(7,1,9,1,0,0),(8,1,10,1,0,0),(9,2,1,1,1,0),(10,2,2,1,0,0),(11,2,3,1,0,0),(12,2,5,1,0,0),(13,2,4,1,0,0),(14,2,6,1,0,0),(16,2,10,1,0,0),(17,4,1,1,1,0),(18,4,2,1,0,0),(19,4,3,1,0,0),(20,4,5,1,0,0),(21,4,4,1,0,0),(22,4,6,1,0,0),(24,4,10,1,0,0),(25,2,7,1,0,0),(26,3,8,1,0,0),(27,3,6,1,0,0),(28,3,2,1,0,0),(29,5,8,1,0,0),(31,5,9,1,0,0),(32,5,11,1,0,0),(33,5,12,1,0,0),(34,5,13,1,0,0),(35,1,14,1,0,0),(36,2,14,1,0,0),(37,4,14,1,0,0),(38,1,15,0,1,0),(39,1,16,0,1,0),(40,10,1,1,0,0),(41,10,3,1,0,0),(42,10,4,1,0,0),(43,10,17,1,0,0),(46,10,20,1,0,0),(47,10,10,1,0,0);
/*!40000 ALTER TABLE `common_automation_document_type_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_email_config`
--

DROP TABLE IF EXISTS `common_automation_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `email_address` varchar(500) NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK3` (`automation_id`),
  KEY `ACTION_FK5` (`action_id`),
  CONSTRAINT `ACTION_FK5` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK3` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_email_config`
--

LOCK TABLES `common_automation_email_config` WRITE;
/*!40000 ALTER TABLE `common_automation_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_event`
--

DROP TABLE IF EXISTS `common_automation_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_event`
--

LOCK TABLES `common_automation_event` WRITE;
/*!40000 ALTER TABLE `common_automation_event` DISABLE KEYS */;
INSERT INTO `common_automation_event` VALUES (1,'Submit',0),(2,'Edit & Resubmit',0),(3,'Approve',0),(4,'Reject',0),(5,'Skip Approval',0),(6,'Delete',0),(7,'Send to Vendor',0),(8,'Create',0),(9,'Upload',0),(10,'Reassign',0),(11,'Void',0),(12,'Mark as Mailed',0),(13,'Apply to Different Bill',0),(14,'Save as Approved',0),(15,'Enter Expense Line Description',0),(16,'Enter Item Line Description',0),(17,'Pay',0),(18,'Payment Success',0),(19,'Payment Fail',0),(20,'Cancel',0),(36,'Save as Draft',0);
/*!40000 ALTER TABLE `common_automation_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_event_config`
--

DROP TABLE IF EXISTS `common_automation_event_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_event_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_automation_mst` (`automation_id`),
  KEY `FK_common_automation_event` (`event_id`),
  CONSTRAINT `FK_common_automation_event` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`),
  CONSTRAINT `FK_common_automation_mst` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_event_config`
--

LOCK TABLES `common_automation_event_config` WRITE;
/*!40000 ALTER TABLE `common_automation_event_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_event_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_expense_cost_config`
--

DROP TABLE IF EXISTS `common_automation_expense_cost_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_expense_cost_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  KEY `AUTOMATION_ID_FK_12` (`automation_id`),
  CONSTRAINT `AUTOMATION_ID_FK_12` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `common_automation_expense_cost_config_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `common_automation_expense_cost_config_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_expense_cost_config`
--

LOCK TABLES `common_automation_expense_cost_config` WRITE;
/*!40000 ALTER TABLE `common_automation_expense_cost_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_expense_cost_config` ENABLE KEYS */;
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
  `show_hide_enable_default` tinyint(1) DEFAULT 0,
  `data_type` varchar(50) NOT NULL,
  `drop_down_id` int(11) DEFAULT NULL,
  `drop_down_url` varchar(200) DEFAULT NULL,
  `second_value` tinyint(1) NOT NULL,
  `max_length` int(11) NOT NULL,
  `notification_enable` tinyint(1) NOT NULL DEFAULT 0,
  `field_weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK` (`document_type`),
  KEY `FK_common_automation_field_common_drop_down` (`drop_down_id`),
  CONSTRAINT `DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK_common_automation_field_common_drop_down` FOREIGN KEY (`drop_down_id`) REFERENCES `common_drop_down` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_field`
--

LOCK TABLES `common_automation_field` WRITE;
/*!40000 ALTER TABLE `common_automation_field` DISABLE KEYS */;
INSERT INTO `common_automation_field` VALUES (1,1,'billNo','Bill Number',1,1,0,0,'text',NULL,NULL,0,50,0,NULL),(2,1,'billAmount','Bill Amount',1,1,0,0,'decimal',NULL,NULL,1,19,1,NULL),(3,1,'vendorId','Vendor',1,1,0,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0,1,NULL),(4,1,'templateId','Bill Template',1,1,0,0,'int',NULL,'/vendor_portal/sec_get_all_bill_templates_v2',0,0,0,NULL),(5,1,'poId','PO Number',1,1,1,1,'int',NULL,'/vendor_portal/sec_get_approved_po_list_v2',0,0,0,NULL),(6,1,'receiptId','PO Receipt Number',1,1,1,1,'int',NULL,'/vendor_portal/sec_get_all_receipt_drop_down_v2',0,0,0,NULL),(7,1,'billDateFormat','Date Format',0,0,0,0,'int',NULL,'/common_service/sec_view_dateformats_v2',0,0,0,NULL),(8,1,'billDate','Bill Date',1,1,0,0,'date',NULL,NULL,1,0,0,NULL),(9,1,'term','Payment Term',1,1,0,0,'int',NULL,'/vendor_portal/sec_get_bill_terms_list_v2',0,0,0,NULL),(10,1,'dueDate','Due Date',1,1,0,0,'date',NULL,NULL,1,0,0,NULL),(11,1,'additionalNotes','Comment',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(12,1,'itemId','Item Code',0,0,0,0,'int',NULL,'/common_service/sec_get_item_dropdown_list_v2',0,0,0,NULL),(13,1,'description','Item Name',0,0,0,0,'text',NULL,NULL,0,50,0,NULL),(14,1,'qty','Units',0,0,0,0,'int',NULL,NULL,1,50,0,NULL),(15,1,'rate','Unit Price',0,0,0,0,'decimal',NULL,NULL,1,19,0,NULL),(16,1,'tax','Tax Amount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(17,3,'receiptNumber','PO Receipt Number',1,1,0,0,'text',NULL,NULL,0,50,0,NULL),(18,3,'receiptDate','PO Receipt Date',1,1,0,0,'date',NULL,NULL,1,0,0,NULL),(19,3,'vendorId','Vendor',1,1,0,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0,0,NULL),(20,3,'poId','PO Number',1,1,0,0,'text',NULL,NULL,0,50,0,NULL),(21,3,'poDate','PO Date',1,1,0,0,'date',NULL,NULL,1,0,0,NULL),(22,3,'receivedBy','Received By',0,0,0,0,'int',NULL,NULL,0,0,0,NULL),(23,3,'itemNumber','Item Number',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(24,3,'description','Item Name',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(25,3,'uom','UOM',0,0,1,1,'int',NULL,'/common_service/sec_get_uom_dropdown_list',0,0,0,NULL),(26,3,'remainingQty','Remaining Qty',0,0,1,1,'int',NULL,NULL,1,50,0,NULL),(27,3,'receivedQty','Received Qty',0,0,1,1,'int',NULL,NULL,1,50,0,NULL),(28,3,'unitPrice','Unit Price',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(29,3,'amount','Amount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(30,3,'totalAmount','Total Amount',1,1,0,0,'decimal',NULL,NULL,1,19,0,NULL),(31,3,'notes','Notes',0,0,0,0,'text',NULL,NULL,0,50,0,NULL),(32,2,'poNumber','PO Number',1,1,1,1,'text',NULL,NULL,0,50,0,NULL),(33,2,'poDate','Submit Date',1,1,1,1,'date',NULL,NULL,1,0,0,NULL),(34,2,'vendorId','Vendor',1,1,0,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0,1,NULL),(35,2,'projectCodeId','Project / Task',1,1,1,1,'int',NULL,'/common_service/sec_get_detailed_approval_codes_by_category?categoryId=2',0,0,1,NULL),(36,2,'deliveryDate','Date of Delivery ',1,1,1,1,'date',NULL,NULL,1,0,0,NULL),(37,2,'pocPhone','Contact Number',0,1,1,1,'text',NULL,NULL,0,50,0,NULL),(38,2,'pocName','Contact Person',1,1,1,1,'text',NULL,NULL,0,50,0,NULL),(39,2,'notes','Notes',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(40,2,'shippingAddress','Shipping Address',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(41,2,'billingAddress','Billing Address',0,0,1,1,'text',NULL,NULL,0,0,0,NULL),(42,2,'purchaseOrderDetails.itemNumber','Item Number',0,0,1,1,'int',NULL,'/common_service/sec_get_item_dropdown_list_v2',0,0,0,NULL),(43,2,'purchaseOrderDetails.itemName','Item Name',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(44,2,'purchaseOrderDetails.uomId','UOM',0,0,1,1,'int',NULL,'/common_service/sec_get_uom_dropdown_list',0,0,0,NULL),(45,2,'purchaseOrderDetails.qty','QTY',0,0,1,1,'int',NULL,NULL,1,50,0,NULL),(46,2,'purchaseOrderDetails.unitPrice','Price',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(47,2,'purchaseOrderDetails.discountAmount','Discount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(48,2,'purchaseOrderDetails.amount','Item Line Amount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(49,2,'taxAmount','Tax amount',1,1,1,1,'decimal',NULL,NULL,1,19,0,NULL),(50,2,'discountAmount','Discount Amount',1,1,1,1,'decimal',NULL,NULL,1,19,0,NULL),(51,2,'netAmount','Net Amount',1,1,1,1,'decimal',NULL,NULL,1,19,1,NULL),(52,4,'reportName','Report Name',1,0,1,1,'text',NULL,NULL,0,50,0,NULL),(53,4,'businessPurpose','Business Purpose',1,0,1,1,'text',NULL,NULL,0,50,0,NULL),(55,4,'startFrom','Date From',0,0,0,0,'date',NULL,NULL,1,0,0,NULL),(56,4,'merchant','Merchant',0,0,0,0,'text',NULL,NULL,0,50,0,NULL),(57,4,'projectAccountCode','Project / Task',0,0,0,0,'int',NULL,'/common_service/sec_get_detailed_approval_codes_by_category',0,0,0,NULL),(58,4,'expenseType','Expense Type',0,0,0,0,'int',NULL,'/vendor_portal/sec_get_account_dropdown_list',0,0,0,NULL),(59,4,'amount','Line Amount',0,0,0,0,'decimal',NULL,NULL,1,19,1,NULL),(60,4,'totalAmount','Net Amount',1,0,0,0,'decimal',NULL,NULL,1,19,0,NULL),(61,4,'notes','Notes',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(64,5,'billId','Bill Number',1,1,0,0,'int',NULL,'/vendor_portal/sec_get_all_bills_dropdown_v2',0,0,0,NULL),(65,5,'paymentTypeId','Payment Method',1,1,0,0,'int',NULL,'/common_service/sec_view_payment_types',0,0,0,NULL),(66,5,'paymentReferanceNo','Payment Reference',1,1,0,0,'text',NULL,NULL,0,50,0,NULL),(67,5,'billDate','Invoice Date',0,1,0,0,'date',NULL,NULL,1,0,0,NULL),(68,5,'paymentDate','Payment Date',1,1,0,0,'date',NULL,NULL,1,0,0,NULL),(69,5,'balanceToBePaid','Balance to be Paid',0,1,0,0,'decimal',NULL,NULL,1,19,0,NULL),(70,5,'amount','Payment Amount',1,1,0,0,'decimal',NULL,NULL,1,19,1,NULL),(71,5,'discountAmount','Discount Amount',1,1,0,0,'decimal',NULL,NULL,1,19,0,NULL),(73,2,'status','Status',1,1,0,1,'int',12,NULL,0,0,0,NULL),(74,1,'status','Status',1,1,0,0,'int',12,NULL,0,0,0,NULL),(75,1,'submittedBy','Submit User',1,0,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(76,2,'createdBy','Submit User',1,0,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(77,3,'createdBy','Created User',1,0,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(78,4,'createdBy','Created User',1,0,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(79,5,'createdBy','Created User',1,0,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(80,4,'endDate','Date To',0,0,0,0,'date',NULL,NULL,1,0,0,NULL),(81,2,'ItemGrossAmount','Item Gross Amount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(82,2,'poDate','PO Date',0,0,1,1,'date',NULL,NULL,1,50,0,NULL),(83,2,'purchaseOrderDetails.description','Description',0,0,1,1,'text',NULL,NULL,0,50,0,NULL),(86,2,'departmentName','Department',0,0,1,1,'text',NULL,NULL,1,100,0,NULL),(87,2,'purchaseOrderDetails.departmentName','Item Line Department',0,0,1,1,'text',NULL,NULL,1,100,0,NULL),(88,2,'purchaseOrderAccountDetails.departmentName','Account Line Department',0,0,1,1,'text',NULL,NULL,1,100,0,NULL),(89,2,'accountGrossAmount','Account Gross Amount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(90,2,'purchaseOrderAccountDetails.accountNumber','Account Number',0,0,1,0,'text',NULL,NULL,1,50,0,NULL),(91,2,'purchaseOrderAccountDetails.accountName','Account Name',0,0,1,1,'text',NULL,NULL,1,300,0,NULL),(92,2,'purchaseOrderAccountDetails.amount','Account Line Amount',0,0,1,1,'decimal',NULL,NULL,1,19,0,NULL),(93,1,'departmentId','Department',1,1,0,0,'int',23,'/common_service/sec_get_department',0,0,1,NULL),(94,2,'departmentId','Department',1,1,0,0,'int',23,'/common_service/sec_get_department',0,0,1,NULL),(95,4,'departmentId','Department',0,0,0,0,'int',23,'/common_service/sec_get_department',0,0,0,NULL),(96,1,'eventExecutedUser','Event Executed User',1,1,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(97,2,'eventExecutedUser','Event Executed User',1,1,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(98,3,'eventExecutedUser','Event Executed User',1,1,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(99,4,'eventExecutedUser','Event Executed User',1,1,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(100,5,'eventExecutedUser','Event Executed User',1,1,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(101,2,'purchaseOrderDetails.vendorItemNumber','SKU',0,0,1,1,'text',NULL,NULL,1,50,0,NULL),(102,1,'description','Description',1,1,0,0,'text',NULL,NULL,0,500,0,NULL),(103,1,'approvalUser','Final Approval User',1,1,0,0,'int',NULL,'/user_management/sec_get_userlist_dropdown',0,0,0,NULL),(104,1,'approvalGroup','Final Approval Group',1,1,0,0,'int',NULL,'/user_management/sec_view_approval_group_list_v2',0,0,0,NULL),(105,10,'totalAmount','Batch Total',1,1,0,0,'decimal',NULL,NULL,1,19,1,NULL),(106,10,'vendorId','Vendor',1,1,0,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0,1,NULL),(107,4,'vendorId','Vendor',0,1,0,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0,1,NULL),(109,11,'vendorId','Vendor',0,0,0,0,'int',NULL,'/vendor_portal/sec_local_vendor_dropdown_list_v2',0,0,1,NULL),(110,11,'amount','Amount',0,0,0,0,'decimal',NULL,NULL,1,19,1,NULL),(111,9,'amount','Amount',0,0,0,0,'decimal',NULL,NULL,1,19,1,NULL),(112,1,'expenseAccountIdList','Account Number',1,0,0,0,'int',NULL,'/common_service/sec_get_account_dropdown_list',0,0,0,NULL),(113,1,'itemIdList','Item Number',1,0,0,0,'int',NULL,'/common_service/sec_get_item_dropdown_list_not_considering_vendor',0,0,0,NULL),(114,2,'expenseAccountIdList','Account Number',1,0,0,0,'int',NULL,'/common_service/sec_get_account_dropdown_list',0,0,0,NULL),(115,2,'itemIdList','Item Number',1,0,0,0,'int',NULL,'/common_service/sec_get_item_dropdown_list_not_considering_vendor',0,0,0,NULL),(116,4,'expenseAccountIdList','Account Number',1,0,0,0,'int',NULL,'/common_service/sec_get_account_dropdown_list',0,0,0,NULL),(117,1,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(118,1,'approvedDate','Approved Date',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(119,1,'discountApplicableDate','Discount Applicable Date',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(120,2,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(121,4,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(122,6,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(123,9,'updateOn','Update On',1,0,0,0,'data',NULL,NULL,1,0,0,NULL),(124,9,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(125,10,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL),(126,11,'createdOn','Created On',1,0,0,0,'date',NULL,NULL,1,0,0,NULL);
/*!40000 ALTER TABLE `common_automation_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_field_condition`
--

DROP TABLE IF EXISTS `common_automation_field_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_field_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FIELD_ID_FK4` (`field_id`),
  KEY `FILED_CONDITION_FK3` (`condition_id`),
  CONSTRAINT `FIELD_ID_FK4` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`),
  CONSTRAINT `FILED_CONDITION_FK3` FOREIGN KEY (`condition_id`) REFERENCES `common_automation_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_field_condition`
--

LOCK TABLES `common_automation_field_condition` WRITE;
/*!40000 ALTER TABLE `common_automation_field_condition` DISABLE KEYS */;
INSERT INTO `common_automation_field_condition` VALUES (1,1,1),(2,1,2),(3,1,7),(4,2,1),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,2,6),(11,2,8),(12,3,1),(13,3,2),(15,4,1),(16,4,2),(18,5,1),(19,5,2),(21,6,1),(22,6,2),(24,7,1),(25,7,1),(26,7,7),(27,8,1),(28,8,2),(29,8,3),(30,8,4),(31,8,5),(32,8,6),(34,8,8),(35,9,1),(36,9,2),(38,10,1),(39,10,2),(40,10,3),(41,10,4),(42,10,5),(43,10,6),(45,10,8),(46,11,1),(47,11,2),(48,11,7),(49,12,1),(50,12,2),(51,12,7),(52,13,1),(53,13,2),(54,13,7),(55,14,1),(56,14,2),(57,14,3),(58,14,4),(59,14,5),(60,14,6),(61,14,7),(62,14,8),(63,15,1),(64,15,2),(65,15,3),(66,15,4),(67,15,5),(68,15,6),(69,15,7),(70,15,8),(71,16,1),(72,16,2),(73,16,3),(74,16,4),(75,16,5),(76,16,6),(77,16,7),(78,16,8),(79,17,1),(80,17,2),(82,18,1),(83,18,2),(84,18,3),(85,18,4),(86,18,5),(87,18,6),(89,18,8),(90,19,1),(91,19,2),(93,20,1),(94,20,2),(96,21,1),(97,21,2),(98,21,3),(99,21,4),(100,21,5),(101,21,6),(103,21,8),(104,22,1),(105,22,2),(106,22,7),(107,23,1),(108,23,2),(109,23,7),(110,24,1),(111,24,2),(112,24,7),(113,25,1),(114,25,2),(115,25,7),(116,26,1),(117,26,2),(118,26,3),(119,26,4),(120,26,5),(121,26,6),(122,26,7),(123,26,8),(124,27,1),(125,27,2),(126,27,3),(127,27,4),(128,27,5),(129,27,6),(130,27,7),(131,27,8),(132,28,1),(133,28,2),(134,28,3),(135,28,4),(136,28,5),(137,28,6),(138,28,7),(139,28,8),(140,29,1),(141,29,2),(142,29,3),(143,29,4),(144,29,5),(145,29,6),(146,29,7),(147,29,8),(148,30,1),(149,30,2),(150,30,3),(151,30,4),(152,30,5),(153,30,6),(155,30,8),(156,31,1),(157,31,2),(158,31,7),(159,32,1),(160,32,2),(162,33,1),(163,33,2),(164,33,3),(165,33,4),(166,33,5),(167,33,6),(169,33,8),(170,34,1),(171,34,2),(173,35,1),(174,35,2),(176,36,1),(177,36,2),(178,36,3),(179,36,4),(180,36,5),(181,36,6),(183,36,8),(184,37,1),(185,37,2),(186,37,7),(187,38,1),(188,38,2),(189,38,7),(190,39,1),(191,39,2),(192,39,7),(193,40,1),(194,40,2),(195,40,7),(196,41,1),(197,41,2),(198,41,7),(199,42,1),(200,42,2),(201,42,7),(202,43,1),(203,43,2),(204,43,7),(205,44,1),(206,44,2),(207,44,7),(208,45,1),(209,45,2),(210,45,3),(211,45,4),(212,45,5),(213,45,6),(214,45,7),(215,45,8),(216,46,1),(217,46,2),(218,46,3),(219,46,4),(220,46,5),(221,46,6),(222,46,7),(223,46,8),(224,47,1),(225,47,2),(226,47,3),(227,47,4),(228,47,5),(229,47,6),(231,47,8),(232,48,1),(233,48,2),(234,48,3),(235,48,4),(236,48,5),(237,48,6),(238,48,7),(239,48,8),(240,49,1),(241,49,2),(242,49,3),(243,49,4),(244,49,5),(245,49,6),(247,49,8),(248,50,1),(249,50,2),(250,50,3),(251,50,4),(252,50,5),(253,50,6),(254,50,7),(255,50,8),(256,51,1),(257,51,2),(258,51,3),(259,51,4),(260,51,5),(261,51,6),(263,51,8),(264,52,1),(265,52,2),(266,52,7),(267,53,1),(268,53,2),(269,53,7),(273,55,1),(274,55,2),(275,55,3),(276,55,4),(277,55,5),(278,55,6),(280,55,8),(281,56,1),(282,56,2),(283,56,7),(284,57,1),(285,57,2),(286,57,7),(287,58,1),(288,58,2),(289,58,7),(290,59,1),(291,59,2),(292,59,3),(293,59,4),(294,59,5),(295,59,6),(296,59,7),(297,59,8),(298,60,1),(299,60,2),(300,60,3),(301,60,4),(302,60,5),(303,60,6),(305,60,8),(306,61,1),(307,61,2),(308,61,7),(315,64,1),(316,64,2),(318,65,1),(319,65,2),(321,66,1),(322,66,2),(323,66,7),(324,67,1),(325,67,2),(326,67,3),(327,67,4),(328,67,5),(329,67,6),(331,67,8),(332,68,1),(333,68,2),(334,68,3),(335,68,4),(336,68,5),(337,68,6),(339,68,8),(340,69,1),(341,69,2),(342,69,3),(343,69,4),(344,69,5),(345,69,6),(347,69,8),(348,70,1),(349,70,2),(350,70,3),(351,70,4),(352,70,5),(353,70,6),(355,70,8),(356,71,1),(357,71,2),(358,71,3),(359,71,4),(360,71,5),(361,71,6),(363,71,8),(367,73,1),(368,73,2),(370,74,1),(371,74,2),(373,5,9),(374,6,9),(375,75,1),(376,75,2),(378,76,1),(379,76,2),(381,77,1),(382,77,2),(384,78,1),(385,78,2),(387,79,1),(388,79,2),(389,80,1),(390,80,2),(391,80,3),(392,80,4),(393,80,5),(394,80,6),(395,80,8),(396,93,1),(397,93,2),(398,94,1),(399,94,2),(400,95,1),(401,95,2),(402,5,10),(403,96,1),(404,97,1),(405,98,1),(406,99,1),(407,100,1),(408,102,1),(409,102,7),(410,103,1),(411,103,2),(412,104,1),(413,104,2),(414,105,1),(415,105,2),(416,105,3),(417,105,4),(418,105,5),(419,105,6),(420,105,8),(421,106,1),(422,106,2),(423,96,2),(424,97,2),(425,98,2),(426,99,2),(427,100,2),(428,109,1),(429,109,2),(430,110,1),(431,110,2),(432,110,3),(433,110,4),(434,110,5),(435,110,6),(436,110,8),(437,107,1),(438,107,2),(439,111,1),(440,111,2),(441,111,3),(442,111,4),(443,111,5),(444,111,6),(445,111,8),(446,112,1),(447,112,2),(448,113,1),(449,113,2),(450,114,1),(451,114,2),(452,115,1),(453,115,2),(454,116,1),(455,116,2);
/*!40000 ALTER TABLE `common_automation_field_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_field_config`
--

DROP TABLE IF EXISTS `common_automation_field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_value` varchar(200) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK5` (`automation_id`),
  KEY `FIELD_ID_FK2` (`field_id`),
  KEY `ACTION_FK8` (`action_id`),
  CONSTRAINT `ACTION_FK8` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK5` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FIELD_ID_FK2` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_field_config`
--

LOCK TABLES `common_automation_field_config` WRITE;
/*!40000 ALTER TABLE `common_automation_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_field_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_item_cost_config`
--

DROP TABLE IF EXISTS `common_automation_item_cost_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_item_cost_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `project_id` int(11) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `AUTOMATION_FK_10` (`automation_id`),
  KEY `PROJECT_ID_FK_2` (`project_id`),
  CONSTRAINT `AUTOMATION_FK_10` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_2` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `common_automation_item_cost_config_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_item_cost_config`
--

LOCK TABLES `common_automation_item_cost_config` WRITE;
/*!40000 ALTER TABLE `common_automation_item_cost_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_item_cost_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_mst`
--

DROP TABLE IF EXISTS `common_automation_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) CHARACTER SET latin1 NOT NULL,
  `automation_name` varchar(100) NOT NULL,
  `rule_automation` tinyint(4) NOT NULL DEFAULT 0,
  `document_type` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_automation_mst_common_automation_document_type` (`document_type`),
  CONSTRAINT `FK_common_automation_mst_common_automation_document_type` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_mst`
--

LOCK TABLES `common_automation_mst` WRITE;
/*!40000 ALTER TABLE `common_automation_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_notification`
--

DROP TABLE IF EXISTS `common_automation_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_config_id` int(11) DEFAULT NULL,
  `document_type` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `notifiled_user` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NOTIFICATION_CONFIG_FK1` (`notification_config_id`),
  KEY `DOCUMENT_TYPE_FK7` (`document_type`),
  KEY `EVENT_ID_FK_1` (`event_id`),
  CONSTRAINT `DOCUMENT_TYPE_FK7` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_ID_FK_1` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`),
  CONSTRAINT `NOTIFICATION_CONFIG_FK1` FOREIGN KEY (`notification_config_id`) REFERENCES `common_automation_notification_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_notification`
--

LOCK TABLES `common_automation_notification` WRITE;
/*!40000 ALTER TABLE `common_automation_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_notification_config`
--

DROP TABLE IF EXISTS `common_automation_notification_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_notification_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `notification_user` text NOT NULL,
  `notification_type` varchar(100) DEFAULT NULL,
  `notification_content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK4` (`automation_id`),
  KEY `ACTION_FK4` (`action_id`),
  CONSTRAINT `ACTION_FK4` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK4` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_notification_config`
--

LOCK TABLES `common_automation_notification_config` WRITE;
/*!40000 ALTER TABLE `common_automation_notification_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_notification_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_system_sync_config`
--

DROP TABLE IF EXISTS `common_automation_system_sync_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_system_sync_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK7` (`automation_id`),
  KEY `ACTION_FK10` (`action_id`),
  CONSTRAINT `ACTION_FK10` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK7` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_system_sync_config`
--

LOCK TABLES `common_automation_system_sync_config` WRITE;
/*!40000 ALTER TABLE `common_automation_system_sync_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_system_sync_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_automation_workflow_config`
--

DROP TABLE IF EXISTS `common_automation_workflow_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_automation_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `approval_group` int(1) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`automation_id`),
  KEY `ACTION_FK1` (`action_id`),
  KEY `FK_common_automation_workflow_config_common_audit_trial_status` (`status_id`),
  CONSTRAINT `ACTION_FK1` FOREIGN KEY (`action_id`) REFERENCES `common_automation_action` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK2` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `FK_common_automation_workflow_config_common_audit_trial_status` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_automation_workflow_config`
--

LOCK TABLES `common_automation_workflow_config` WRITE;
/*!40000 ALTER TABLE `common_automation_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_automation_workflow_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_data_source`
--

DROP TABLE IF EXISTS `common_data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_data_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `config_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_data_source`
--

LOCK TABLES `common_data_source` WRITE;
/*!40000 ALTER TABLE `common_data_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_data_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_data_source_config`
--

DROP TABLE IF EXISTS `common_data_source_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_data_source_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `field` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_data_source_config`
--

LOCK TABLES `common_data_source_config` WRITE;
/*!40000 ALTER TABLE `common_data_source_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_data_source_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_date_format`
--

DROP TABLE IF EXISTS `common_date_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_date_format` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sort_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_date_format`
--

LOCK TABLES `common_date_format` WRITE;
/*!40000 ALTER TABLE `common_date_format` DISABLE KEYS */;
INSERT INTO `common_date_format` VALUES ('dd-MM-yyyy','30-12-2018',1),('dd-MMM-yyyy','30-Dec-2018',2),('dd-MMMM-yyyy','30-December-2018',6),('dd.MM.yy','30.12.18',7),('dd.MM.yyyy','30.12.2018',8),('dd.MMM.yy','30.Dec.18',9),('dd.MMM.yyyy','30.Dec.2018',10),('dd.MMMM.yy','30.December.18',11),('dd.MMMM.yyyy','30.December.2018',12),('dd/MM/yyyy','30/12/2018',4),('dd/MMM/yyyy','30/Dec/2018',13),('dd/MMMM/yyyy','30/December/2018',14),('MM-dd-yyyy','12-30-2018',15),('MM.dd.yy','12.30.18',16),('MM.dd.yyyy','12.30.2018',17),('MM/dd/yy','12/30/18',57),('MM/dd/yyyy','12/30/2018',5),('MMM dd, yyyy','Dec 30, 2018',18),('MMM-dd-yyyy','Dec-30-2018',19),('MMM.dd.yy','Dec.30.18',20),('MMM.dd.yyyy','Dec.30.2018',21),('MMM/dd/yyyy','Dec/30/2018',22),('MMMM dd, yyyy','December 30, 2018',57),('MMMM-dd-yyyy','December-30-2018',23),('MMMM/dd/yyyy','December/30/2018',24),('yy MMM ,dd','18 Dec ,30',25),('yy-dd-MMM','18-30-Dec',26),('yy-dd-MMMM','18-30-December',27),('yy-MM/dd','18-12-30',28),('yy-MMM-dd','18-Dec-30',29),('yy-MMMM-dd','18-December-30',30),('yy.dd.MMM','18.30.Dec',31),('yy.dd.MMMM','18.30.December',32),('yy.MM.dd','18.12.30',33),('yy.MMM.dd','18.Dec.30',34),('yy.MMMM.dd','18.December.30',35),('yy/dd/MMM','18/30/Dec',36),('yy/dd/MMMM','18/30/December',37),('yy/MM/dd','18/12/30',38),('yy/MMM/dd','18/Dec/30',39),('yy/MMMM/dd','18/December/30',40),('yyyy MMM ,dd','2018 Dec ,30',41),('yyyy-dd-MMM','2018-30-Dec',42),('yyyy-dd-MMMM','2018-30-December',43),('yyyy-MM-dd','2018-12-30',44),('yyyy-MMM-dd','2018-Dec-30',45),('yyyy-MMMM-dd','2018-December-30',46),('yyyy.dd.MMM','2018.30.Dec',47),('yyyy.dd.MMMM','2018.30.December',48),('yyyy.MM.dd','2018.12.30',49),('yyyy.MMM.dd','2018.Dec.30',50),('yyyy.MMMM.dd','2018.December.30',51),('yyyy/dd/MMM','2018/30/Dec',52),('yyyy/dd/MMMM','2018/30/December',53),('yyyy/MM/dd','2018/12/30',54),('yyyy/MMM/dd','2018/Dec/30',55),('yyyy/MMMM/dd','2018/December/30',56);
/*!40000 ALTER TABLE `common_date_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_department`
--

DROP TABLE IF EXISTS `common_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `department_code` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `created_username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_department`
--

LOCK TABLES `common_department` WRITE;
/*!40000 ALTER TABLE `common_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_description_base_memorization`
--

DROP TABLE IF EXISTS `common_description_base_memorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_description_base_memorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_description_base_memorization`
--

LOCK TABLES `common_description_base_memorization` WRITE;
/*!40000 ALTER TABLE `common_description_base_memorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_description_base_memorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_document_ad_hoc_workflow_config`
--

DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_document_ad_hoc_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(100) DEFAULT NULL,
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
-- Dumping data for table `common_document_ad_hoc_workflow_config`
--

LOCK TABLES `common_document_ad_hoc_workflow_config` WRITE;
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_document_ad_hoc_workflow_detail_config`
--

DROP TABLE IF EXISTS `common_document_ad_hoc_workflow_detail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_document_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AUTOMATION_ID_FK2` (`workflow_id`),
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`),
  CONSTRAINT `AD_HOC_WORKFLOW_FK_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `AUDIT_TRIAL_STATUS_FK_1` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_document_ad_hoc_workflow_detail_config`
--

LOCK TABLES `common_document_ad_hoc_workflow_detail_config` WRITE;
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_ad_hoc_workflow_detail_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_document_drawer_name`
--

DROP TABLE IF EXISTS `common_document_drawer_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_document_drawer_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drawer_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_document_drawer_name`
--

LOCK TABLES `common_document_drawer_name` WRITE;
/*!40000 ALTER TABLE `common_document_drawer_name` DISABLE KEYS */;
INSERT INTO `common_document_drawer_name` VALUES (1,'BILL_PO_LIST_MODAL'),(2,'EXPENSE_DRAFT_LIST_MODAL'),(3,'PO_DRAFT_LIST_MODAL'),(4,'PO_RECEIPT_DRAFT_LIST_MODAL'),(5,'CREATE_BILL_DRAFT_LIST_MODAL'),(6,'CREDIT_NOTE_DRAFT_LIST_MODAL');
/*!40000 ALTER TABLE `common_document_drawer_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_document_drawer_visibility_user_wise`
--

DROP TABLE IF EXISTS `common_document_drawer_visibility_user_wise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_document_drawer_visibility_user_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `drawer_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__modal_visibility_user_wise_modal_template` (`drawer_id`) USING BTREE,
  CONSTRAINT `FK__drawer_visibility_user_wise_drawer_name` FOREIGN KEY (`drawer_id`) REFERENCES `common_document_drawer_name` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_document_drawer_visibility_user_wise`
--

LOCK TABLES `common_document_drawer_visibility_user_wise` WRITE;
/*!40000 ALTER TABLE `common_document_drawer_visibility_user_wise` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_drawer_visibility_user_wise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_document_workflow_config`
--

DROP TABLE IF EXISTS `common_document_workflow_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_document_workflow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `document_type` int(11) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `ah_hoc_workflow_id` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `workflow_level` int(3) NOT NULL,
  `no_of_level` int(3) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_FK_1` (`document_type`),
  KEY `AUTOMATION_ID_FK_1` (`automation_id`),
  KEY `EVENT_FK_1` (`event_id`),
  KEY `AD_HOC_FK_7` (`ah_hoc_workflow_id`),
  CONSTRAINT `AD_HOC_FK_7` FOREIGN KEY (`ah_hoc_workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `AUTOMATION_ID_FK_1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `DOCUMENT_TYPE_FK_1` FOREIGN KEY (`document_type`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_FK_1` FOREIGN KEY (`event_id`) REFERENCES `common_automation_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_document_workflow_config`
--

LOCK TABLES `common_document_workflow_config` WRITE;
/*!40000 ALTER TABLE `common_document_workflow_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_document_workflow_config` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down`
--

LOCK TABLES `common_drop_down` WRITE;
/*!40000 ALTER TABLE `common_drop_down` DISABLE KEYS */;
INSERT INTO `common_drop_down` VALUES (1,'Active Inactive Status Drop Down'),(3,'User Status'),(6,'Item Taxability'),(8,'Bill Payment Status'),(10,'Additional Field Required Status'),(11,'Additional Field Active Status'),(12,'Internal Approval Status'),(13,'Vendor Approval Status'),(14,'Export Status'),(15,'Approval Status'),(16,'Payment Status'),(17,'PO Receipt Status'),(18,'Vendor Invitation Status'),(19,'Object Type'),(20,'Availability Status'),(21,'Approval Status'),(22,'Is PO Account Status'),(23,'OCR Bill Template Active Status'),(24,'Department'),(25,'Payment Status of Batch'),(26,'Approval Status of Batch'),(27,'Purchase Order Status'),(28,'Credit Card Process Status'),(29,'Ticket Status'),(30,'Credit Note Status'),(31,'Sync Events'),(32,'Expense Approval Status'),(33,'Payment Medium');
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down_connection`
--

LOCK TABLES `common_drop_down_connection` WRITE;
/*!40000 ALTER TABLE `common_drop_down_connection` DISABLE KEYS */;
INSERT INTO `common_drop_down_connection` VALUES (1,1,1),(2,1,2),(5,3,3),(10,6,4),(11,6,5),(15,8,6),(16,8,7),(17,8,8),(21,10,9),(22,10,10),(23,11,1),(24,11,2),(25,13,14),(26,13,20),(27,13,11),(28,12,13),(29,12,12),(30,12,11),(32,3,1),(33,3,2),(34,14,15),(35,14,16),(38,15,11),(39,15,12),(40,16,34),(41,16,17),(42,16,18),(44,17,1),(45,17,21),(46,18,11),(47,18,13),(48,19,22),(49,19,23),(50,19,24),(51,19,25),(52,19,26),(53,19,27),(54,19,28),(55,19,29),(56,19,30),(57,13,12),(58,15,13),(59,20,35),(60,20,36),(61,21,11),(63,21,13),(64,13,13),(65,22,37),(66,22,38),(67,23,1),(68,23,2),(69,25,39),(70,25,40),(71,25,41),(72,25,42),(73,25,43),(74,26,44),(75,26,45),(76,26,46),(77,16,47),(78,25,48),(79,27,49),(80,27,21),(81,27,13),(82,27,12),(85,29,51),(86,29,52),(87,29,53),(88,29,54),(89,29,55),(90,29,56),(91,29,57),(92,29,58),(93,29,59),(94,29,60),(95,29,61),(96,29,62),(98,28,12),(100,28,43),(101,30,1),(102,30,48),(103,31,63),(104,31,64),(105,31,65),(106,32,11),(107,32,12),(108,32,13),(109,32,66),(110,27,66),(111,17,66),(112,15,66),(113,30,66),(114,33,67),(115,33,68);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down_url`
--

LOCK TABLES `common_drop_down_url` WRITE;
/*!40000 ALTER TABLE `common_drop_down_url` DISABLE KEYS */;
INSERT INTO `common_drop_down_url` VALUES (1,'Vendor List','/vendor_portal/sec_local_vendor_dropdown_list_v2'),(2,'Payment Types','/tenant_management/sec_get_payment_types'),(3,'Payment Related Document Types','/common_service/sec_get_payment_related_document_types'),(4,'Department List','/common_service/sec_get_department'),(5,'Report Types','/common_service/sec_view_report_types'),(6,'Report Filers','/common_service/sec_view_report_filters'),(7,'Country List','/common_service/sec_view_countries'),(8,'Cities List','/common_service/sec_view_cities'),(9,'Approved By List','/user_management/sec_get_userlist_dropdown'),(10,'Approval Group List','/user_management/sec_view_approval_group_list_v2'),(11,'Aging List','assets/demo/data/dropdowns/report/aging-data.json'),(12,'Custom Field List','/common_service/sec_get_detail_section_additional_fields_v2'),(13,'Account List','/common_service/sec_get_account_dropdown_list'),(14,'TransAction Type List','assets/demo/data/dropdowns/report/transaction-type.json'),(15,'Status List','assets/demo/data/dropdowns/report/status-list.json'),(16,'Project Task List','/common_service/sec_get_detailed_approval_codes_by_category'),(17,'Po Billable Table Data','/common_service/sec_get_billable_po_transactions_report'),(18,'Bill Billable Table Data','/common_service/sec_get_billable_bill_transactions_report'),(19,'Expense Billable Table Data','/common_service/sec_get_billable_expense_transactions_report'),(20,'Additional Field Document types','/common_service/sec_get_all_additional_field_document_types_v2'),(21,'Field types','/common_service/sec_field_types');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_drop_down_value`
--

LOCK TABLES `common_drop_down_value` WRITE;
/*!40000 ALTER TABLE `common_drop_down_value` DISABLE KEYS */;
INSERT INTO `common_drop_down_value` VALUES (1,'A','Active'),(2,'I','Inactive'),(3,'L','Locked'),(4,'TRUE','Taxable'),(5,'FALSE','Non Taxable'),(6,'V','Void'),(7,'A','Paid'),(8,'M','Mailed'),(9,'TRUE','Required'),(10,'FALSE','Optional'),(11,'A','Approved'),(12,'R','Rejected'),(13,'P','Pending'),(14,'NA','Not-Assigned'),(15,'Y','Exported'),(16,'N','Not Exported'),(17,'N','Not Paid'),(18,'H','Partially Paid'),(19,'DP','Deletion Pending'),(20,'U','Under Discussion'),(21,'C','Closed'),(22,'OBJECT_TYPE_ACCOUNT','Accounts'),(23,'OBJECT_TYPE_ITEM','Items'),(24,'OBJECT_TYPE_PROJECT','Project Codes'),(25,'OBJECT_TYPE_BILL_PAYMENT','Bill Payment'),(26,'OBJECT_TYPE_VENDOR','Vendor'),(27,'OBJECT_TYPE_PO','Purchase Order'),(28,'OBJECT_TYPE_PO_RECEIPT','Purchase Order Receipt'),(29,'OBJECT_TYPE_BILL','Bill'),(30,'OBJECT_TYPE_EXPENSE','Expense'),(34,'Y','Paid'),(35,'Y','YES'),(36,'N','NO'),(37,'Z','YES'),(38,'Q','NO'),(39,'O','Pending'),(40,'U','Submitted'),(41,'S','Success'),(42,'F','Failed'),(43,'No','Unprocessed'),(44,'Approved','Approved'),(45,'Rejected','Rejected'),(46,'Pending','Pending'),(47,'O','Processing'),(48,'C','Canceled'),(49,'A','Open'),(50,'Pr','Processed'),(51,'Waiting for Support','Waiting for Support'),(52,'Canceled','Canceled'),(53,'Closed','Closed'),(54,'Done','Done'),(55,'Escalated','Escalated'),(56,'In Progress','In Progress'),(57,'Open','Open'),(58,'Pending ','Pending '),(59,'Reopened','Reopened'),(60,'Resolved','Resolved'),(61,'Waiting for Customer','Waiting for Customer'),(62,'Work in Progress','Work in Progress'),(63,'C','Create'),(64,'U','Update'),(65,'D','Delete'),(66,'T','Draft'),(67,'1','Online'),(68,'0','Offline');
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
-- Table structure for table `common_email_privilege`
--

DROP TABLE IF EXISTS `common_email_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_email_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_privilage_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_email_privilege`
--

LOCK TABLES `common_email_privilege` WRITE;
/*!40000 ALTER TABLE `common_email_privilege` DISABLE KEYS */;
INSERT INTO `common_email_privilege` VALUES (1,151,4),(2,151,5),(3,160,6),(4,161,6),(5,170,6),(6,119,7),(7,119,8),(8,139,9),(9,140,9),(10,150,9),(11,26,1),(12,26,2),(13,55,1),(14,55,2),(15,29,3),(16,30,3),(18,172,3);
/*!40000 ALTER TABLE `common_email_privilege` ENABLE KEYS */;
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
-- Table structure for table `common_email_type`
--

DROP TABLE IF EXISTS `common_email_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_email_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_service` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_email_type`
--

LOCK TABLES `common_email_type` WRITE;
/*!40000 ALTER TABLE `common_email_type` DISABLE KEYS */;
INSERT INTO `common_email_type` VALUES (1,'Invoice has approved'),(2,'Invoice has rejected'),(3,'Invoice submitted for approval'),(4,'Purchase Order has approved'),(5,'Purchase Order has rejected'),(6,'Purchase Order submitted for approval'),(7,'Expense has approved'),(8,'Expense has rejected'),(9,'Expense submitted for approval');
/*!40000 ALTER TABLE `common_email_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_column_template`
--

LOCK TABLES `common_grid_column_template` WRITE;
/*!40000 ALTER TABLE `common_grid_column_template` DISABLE KEYS */;
INSERT INTO `common_grid_column_template` VALUES (8,3,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(9,3,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(10,3,'apgr.id','Approval Group ID',1,1,1,1,1,1,0,NULL,'left','input','Approval Group ID',3,NULL,150,NULL),(11,3,'apgr.name','Approval Group Name',1,1,1,1,1,1,0,NULL,'left','input','Approval Group Name',4,NULL,150,NULL),(12,3,'usm.name','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',5,NULL,150,NULL),(13,3,'apgr.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',6,NULL,150,NULL),(14,3,'apgr.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',7,1,150,NULL),(15,2,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(16,2,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(17,2,'usm.email','Email Address',1,1,1,1,1,1,0,NULL,'left','input','Email Address',3,NULL,150,NULL),(18,2,'usm.name','Name',1,1,1,1,1,1,0,NULL,'left','input','Name',4,NULL,150,NULL),(19,2,'usm.nicPassportNo','Employee No.',1,1,1,1,1,1,0,NULL,'left','input','Employee No.',5,NULL,150,NULL),(20,2,'approvalGroup.approvalGroupId','Approval Groups',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Groups',6,NULL,150,NULL),(21,2,'rolem.id','Role',1,1,1,1,1,1,0,NULL,'left','dropdown','Role',7,NULL,150,NULL),(22,2,'usm.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',10,3,150,NULL),(23,4,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(24,4,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(25,4,'acct.id','Account Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Account Type',3,NULL,150,NULL),(26,4,'accdt.id','Account Detail Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Account Detail Type',4,NULL,150,NULL),(27,4,'acc.number','Account No',1,1,1,1,1,1,0,NULL,'left','input','Account No',5,NULL,150,NULL),(28,4,'acc.name','Account Name',1,1,1,1,1,1,0,NULL,'left','input','Account Name',6,NULL,150,NULL),(29,4,'accParent.id','Parent Account',1,1,1,1,1,1,0,NULL,'left','dropdown','Parent Account',7,NULL,150,NULL),(30,4,'acc.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',10,1,150,NULL),(31,5,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(32,5,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(33,5,'type.id','Item Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Item Type',5,NULL,150,NULL),(34,5,'cat.id','Category',1,1,1,1,1,1,0,NULL,'left','dropdown','Category',7,NULL,150,NULL),(35,5,'item.itemNumber','Item No',1,1,1,1,1,1,0,NULL,'left','input','Item No',3,NULL,150,NULL),(36,5,'item.name','Item Name',1,1,1,1,1,1,0,NULL,'left','input','Item Name',4,NULL,150,NULL),(37,5,'item.taxable','Taxability',1,1,1,1,1,1,0,NULL,'center','dropdown','Taxability',8,6,150,NULL),(38,5,'item.salesPrice','Selling Price',1,1,1,1,1,1,0,NULL,'right','numeric','Selling Price',9,NULL,150,NULL),(39,5,'item.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',10,1,150,NULL),(41,6,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(42,6,'tenant.tenantId','Tenant ID',1,1,1,1,1,1,0,NULL,'left','input','Tenant ID',3,NULL,150,NULL),(43,6,'tenant.ownerName','Company Name',1,1,1,1,1,1,0,NULL,'left','input','Company Name',4,NULL,150,NULL),(44,6,'tenant.ownerEmail','Email Address',1,1,1,1,1,1,0,NULL,'left','input','Email Address',5,NULL,150,NULL),(45,6,'tenant.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',6,1,150,NULL),(46,7,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(47,7,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(48,7,'chk.paymentReferanceNo','Payment Ref.',1,1,1,1,1,1,0,NULL,'left','input','Payment Ref.',3,NULL,150,NULL),(49,7,'chk.amount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',4,NULL,150,NULL),(50,7,'chk.discountAmount','Discount Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Discount Amount',5,NULL,150,NULL),(51,7,'chk.paymentDate','Date',1,1,1,1,1,1,0,NULL,'center','date','Date',6,NULL,150,NULL),(52,7,'vi.billNo','Bill No.',1,1,1,1,1,1,0,NULL,'left','input','Bill No.',7,NULL,150,NULL),(53,7,'vi.billAmount','Bill Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Bill Amount',8,NULL,150,NULL),(54,7,'vi.vendorId','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','All',9,NULL,150,NULL),(55,7,'vi.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',10,NULL,150,NULL),(56,7,'vi.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',11,NULL,150,NULL),(57,7,'chk.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',13,8,150,NULL),(58,8,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(59,8,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(60,8,'vendor.name','Vendor Name',1,1,1,1,1,1,0,NULL,'left','input','Vendor Name',3,NULL,150,NULL),(61,8,'vendor.email','Contact Email',1,1,1,1,1,1,0,NULL,'left','input','Contact Email',4,NULL,150,NULL),(62,8,'vendor.contactPerson','Contact Name',1,1,1,1,1,1,0,NULL,'left','input','Contact Name',5,NULL,150,NULL),(63,8,'vendor.contactNumber','Contact Phone',1,1,1,1,1,1,0,NULL,'left','input','Contact Phone',6,NULL,150,NULL),(64,8,'address.country','Country',1,1,1,1,1,1,0,NULL,'left','dropdown','All',7,NULL,150,NULL),(65,8,'vendor.socialSecNo','Social Security No',1,1,1,1,1,1,0,NULL,'left','input','Social Security No',8,NULL,150,NULL),(66,8,'sic.code','SIC Code',1,1,1,1,1,1,0,NULL,'left','input','SIC Code',9,NULL,150,NULL),(67,8,'naic.code','NAIC Code',1,1,1,1,1,1,0,NULL,'left','input','NAIC Code',10,NULL,150,NULL),(68,9,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(69,9,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(70,9,'req.vendorName','Vendor Name',1,1,1,1,1,1,0,NULL,'left','input','Vendor Name',3,NULL,150,NULL),(71,9,'req.contactPerson','Contact Name',1,1,1,1,1,1,0,NULL,'left','input','Contact Name',4,NULL,150,NULL),(72,9,'req.contactNumber','Contact Number',1,1,1,1,1,1,0,NULL,'left','input','Contact Number',5,NULL,150,NULL),(73,9,'req.vendorEmail','Email Address',1,1,1,1,1,1,0,NULL,'left','input','Email Address',6,NULL,150,NULL),(74,9,'req.requestOn','Request Date',1,1,1,1,1,1,0,NULL,'center','date','Request Date',7,NULL,150,NULL),(75,9,'req.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',8,15,150,NULL),(76,10,'checkbox',NULL,0,0,0,0,0,0,NULL,NULL,'center','checkbox','',1,NULL,50,NULL),(77,10,'action','Action',1,0,0,0,0,0,NULL,NULL,'center','actionButton','',2,NULL,NULL,NULL),(78,10,'appCode.name','Project Code',1,1,1,1,1,1,NULL,NULL,'left','input','Project Code',3,NULL,NULL,NULL),(80,10,'appCode.createdOn','Created Date',1,0,1,1,1,1,NULL,NULL,'center','date','Created Date',12,NULL,NULL,NULL),(81,10,'appCode.createdUsername','Created By',1,0,1,1,1,1,NULL,NULL,'left','input','Created By',13,NULL,NULL,NULL),(82,10,'appCode.status','Status',1,0,1,1,1,1,NULL,NULL,'center','dropdown','All',14,1,NULL,NULL),(83,7,'vi.poId','PO No.',1,1,1,1,1,1,0,NULL,'left','dropdown','PO No',12,NULL,150,NULL),(84,11,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(85,11,'dc.moduleId','Document Type',1,0,1,1,1,1,0,NULL,'left','multiSelect','Document Type',3,NULL,150,20),(86,11,'field.fieldName','Field Name',1,1,1,1,1,1,0,NULL,'left','input','Field Name',4,NULL,150,NULL),(87,11,'field.fieldTypeId','Field Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Field Type',5,NULL,150,21),(88,11,'field.required','Required',0,1,1,1,1,1,0,NULL,'center','dropdown','All',6,10,150,NULL),(89,11,'field.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',7,1,150,NULL),(90,1,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(91,1,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(92,1,'rolem.id','Role ID',1,1,1,1,1,1,0,NULL,'left','number','Role ID',3,NULL,150,NULL),(93,1,'rolem.name','Role Name',1,1,1,1,1,1,0,NULL,'left','input','Role Name',4,NULL,150,NULL),(94,1,'rolem.createdBy','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',5,NULL,150,NULL),(95,1,'rolem.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'left','date','Created Date',6,NULL,150,NULL),(96,1,'rolem.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',7,1,150,NULL),(97,12,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(98,12,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(99,12,'automation.automationName','Name',1,1,1,1,1,1,0,NULL,'left','input','Name',3,NULL,150,NULL),(100,12,'automation.documentType','Document Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Document Type',4,NULL,150,NULL),(101,12,'documentEvent.eventId','Event',1,1,1,1,1,1,0,NULL,'left','dropdown','Event',5,NULL,150,NULL),(102,12,'automation.createdByName','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',6,NULL,150,NULL),(103,12,'automation.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',7,NULL,150,NULL),(104,12,'automation.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',8,1,150,NULL),(105,13,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(106,13,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(107,13,'po.vendorId','Vendor',1,1,1,1,1,1,0,NULL,'left','dropdown','Vendor',3,NULL,150,NULL),(108,13,'po.poNumber','PO Number',1,1,1,1,1,1,0,NULL,'left','input','PO Number',4,NULL,150,NULL),(109,13,'po.projectCodeId','Project / Task',1,1,1,1,1,1,0,NULL,'left','dropdown','Project / Task',5,NULL,150,NULL),(110,13,'po.netAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(111,13,'po.poDate','PO Date',1,1,1,1,1,1,0,NULL,'center','date','PO Date',7,NULL,150,NULL),(112,13,'po.deliveryDate','Delivery Date',1,1,1,1,1,1,0,NULL,'center','date','Delivery Date',8,NULL,150,NULL),(113,13,'po.createdByName','Submitted By',1,1,1,1,1,1,0,NULL,'left','input','Submitted By',9,NULL,150,NULL),(114,13,'po.createdOn','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',10,NULL,150,NULL),(115,13,'po.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',11,27,150,NULL),(116,13,'po.vendorApprovalStatus','Vendor Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Vendor Approval Status',12,13,150,NULL),(117,14,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(118,14,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(119,14,'vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(120,14,'bill.billNo','Bill Number',1,1,1,1,1,1,0,NULL,'left','input','Bill Number',4,NULL,150,NULL),(122,14,'bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',5,NULL,150,NULL),(123,14,'bill.billAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(124,14,'term.id','Term',1,1,1,1,1,1,0,NULL,'left','dropdown','Term',7,NULL,150,NULL),(125,14,'bill.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',8,NULL,150,NULL),(126,14,'po.id','Purchase Order',1,1,1,1,1,1,0,NULL,'left','dropdown','Purchase Order',9,NULL,150,NULL),(127,14,'receipt.id','Purchase Order Receipt',1,1,1,1,1,1,0,NULL,'left','dropdown','Purchase Order Receipt',10,NULL,150,NULL),(128,14,'bill.submittedByName','Submitted By',1,1,1,1,1,1,0,NULL,'left','input','Submitted By',11,NULL,150,NULL),(129,14,'bill.submittedOn','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',12,NULL,150,NULL),(130,14,'bill.balanceAmount','Remaining Balance',1,1,1,1,1,1,0,NULL,'right','numeric','Remaining Balance',13,NULL,150,NULL),(131,14,'bill.discountAmount','Applied Discount',1,1,1,1,1,1,0,NULL,'right','numeric','Discount Amount',14,NULL,150,NULL),(132,14,'bill.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',15,NULL,150,NULL),(133,14,'bill.approvedDate','Approve Date',1,1,1,1,1,1,0,NULL,'center','date','Approve Date',16,NULL,150,NULL),(134,14,'bill.status','Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Approval Status',17,15,150,NULL),(135,14,'bill.paymentStatus','Payment Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Payment Status',18,16,150,NULL),(136,14,'bill.applicableDiscountAmount','Applicable Discount',1,1,1,1,1,1,0,NULL,'right','numeric','Applicable Discount',19,NULL,150,NULL),(137,14,'bill.discountApplicableDate','Discount Applicable Date',1,1,1,1,1,1,0,NULL,'center','date','Discount Applicable Date',20,NULL,150,NULL),(138,14,'bill.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',21,14,150,NULL),(139,15,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(140,15,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(141,15,'expense.id','Report Number',1,1,1,1,1,1,0,NULL,'left','number','Report Number',3,NULL,150,NULL),(142,15,'expense.reportName','Report Name',1,1,1,1,1,1,0,NULL,'left','input','Report Name',4,NULL,150,NULL),(143,15,'expense.createdOn','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',6,NULL,150,NULL),(144,15,'expense.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',7,NULL,150,NULL),(145,15,'appGroup.id','Approval Group',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Group',8,NULL,150,NULL),(146,15,'automation.id','Automation Name',1,1,1,1,1,1,0,NULL,'left','dropdown','Automation Name',9,NULL,150,NULL),(147,15,'expense.totalAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',10,NULL,150,NULL),(148,15,'expense.status','Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Approval Status',11,32,150,NULL),(149,15,'expense.startFrom','From Date',1,1,1,1,1,1,0,NULL,'center','date','From Date',12,NULL,150,NULL),(150,15,'expense.endDate','To Date',1,1,1,1,1,1,0,NULL,'center','date','To Date',13,NULL,150,NULL),(151,15,'expense.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',14,14,150,NULL),(152,16,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(153,16,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(154,16,'receipt.receiptNumber','Receipt Number',1,1,1,1,1,1,0,NULL,'left','input','Receipt Number',3,NULL,150,NULL),(155,16,'receipt.vendorId','Vendor Name',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor Name',4,NULL,150,NULL),(156,16,'receipt.poId','PO Number',1,1,1,1,1,1,0,NULL,'left','dropdown','PO Number',5,NULL,150,NULL),(157,16,'receipt.receiptDate','Receipt Date',1,1,1,1,1,1,0,NULL,'center','date','Receipt Date',6,NULL,150,NULL),(158,16,'receipt.createdByName','Created User',1,1,1,1,1,1,0,NULL,'left','input','Created User',7,NULL,150,NULL),(159,16,'receipt.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',8,NULL,150,NULL),(160,16,'receipt.totalAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',9,NULL,150,NULL),(161,16,'receipt.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',10,17,150,NULL),(162,17,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(163,17,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(164,17,'vpInv.emailAddress','Email Address',1,1,1,1,1,1,0,NULL,'left','input','Email Address',3,NULL,150,NULL),(165,17,'vpInv.vendorName','Vendor Name',1,1,1,1,1,1,0,NULL,'left','input','Vendor Name',4,NULL,150,NULL),(166,17,'vpInv.contactName','Contact Name',1,1,1,1,1,1,0,NULL,'left','input','Contact Name',5,NULL,150,NULL),(167,17,'vpInv.createdBy','Invited By',1,1,1,1,1,1,0,NULL,'left','input','Invited By',6,NULL,150,NULL),(168,17,'vpInv.createdOn','Invited On',1,1,1,1,1,1,0,NULL,'center','date','Invited On',7,NULL,150,NULL),(169,17,'vpInv.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',8,18,150,NULL),(170,18,'syncDetail.referenceNo','Reference No',1,0,0,1,1,1,0,NULL,'left','input','Reference No',3,NULL,150,NULL),(172,18,'syncDetail.amount','Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Amount',4,NULL,150,NULL),(173,18,'syncDetail.createdOn','Date',1,0,1,1,1,1,0,NULL,'center','date','Date',1,NULL,150,NULL),(174,18,'syncDetail.objectType','Data Type',1,0,1,1,1,1,0,NULL,'left','dropdown','Data Type',2,19,150,NULL),(177,19,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(178,19,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(179,19,'syncDetail.referenceNo','Reference No',1,0,0,1,1,1,0,NULL,'left','input','Reference No',5,NULL,150,NULL),(181,19,'syncDetail.amount','Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(182,19,'syncDetail.createdOn','Date',1,0,1,1,1,1,0,NULL,'center','date','Date',3,NULL,150,NULL),(183,19,'syncDetail.objectType','Data Type',1,0,1,1,1,1,0,NULL,'left','dropdown','Data Type',4,19,150,NULL),(186,20,'syncDetail.referenceNo','Reference No',1,0,0,1,1,1,0,NULL,'left','input','Reference No',3,NULL,150,NULL),(188,20,'syncDetail.amount','Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Amount',3,NULL,150,NULL),(189,20,'syncDetail.syncDateTime','Date',1,0,1,1,1,1,0,NULL,'center','date','Date',1,NULL,150,NULL),(190,20,'syncDetail.objectType','Data Type',1,0,1,1,1,1,0,NULL,'left','dropdown','Data Type',2,19,150,NULL),(193,21,'syncDetail.referenceNo','Reference No',1,1,1,1,1,1,0,NULL,'left','input','Name',3,NULL,150,NULL),(194,21,'syncDetail.objectType','Data Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Object Type',4,19,150,NULL),(195,21,'fail.failedDateTime','Date',1,1,1,1,1,1,0,NULL,'center','date','Date',5,NULL,150,NULL),(196,21,'fail.failedReason','Message',1,1,1,1,1,1,0,NULL,'left','input','Message',7,NULL,150,NULL),(197,16,'receipt.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',11,14,150,NULL),(198,15,'expense.createdByName','Submitted User',1,1,1,1,1,1,0,NULL,'left','input','Submit User',5,NULL,150,NULL),(199,7,'chk.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',14,14,150,NULL),(200,14,'bill.approvalGroup','Approval Group',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Group',22,NULL,150,NULL),(201,13,'po.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',13,NULL,150,NULL),(202,13,'po.approvalGroup','Approval Group',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Group',14,NULL,150,NULL),(204,22,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(205,22,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(206,22,'bill.billNo','Bill Number',1,1,1,1,1,1,0,NULL,'left','input','Bill Number',4,NULL,150,NULL),(207,22,'bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',5,NULL,150,NULL),(208,22,'bill.billAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(209,22,'term.id','Term',1,1,1,1,1,1,0,NULL,'left','dropdown','Term',7,NULL,150,NULL),(210,22,'bill.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',8,NULL,150,NULL),(211,22,'po.id','Purchase Order',1,1,1,1,1,1,0,NULL,'left','dropdown','Purchase Order',9,NULL,150,NULL),(212,22,'receipt.id','Purchase Order Receipt',1,1,1,1,1,1,0,NULL,'left','dropdown','Purchase Order Receipt',10,NULL,150,NULL),(213,22,'bill.submittedByName','Submitted By',1,1,1,1,1,1,0,NULL,'left','input','Submitted By',11,NULL,150,NULL),(214,22,'bill.submittedOn','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',12,NULL,150,NULL),(215,22,'bill.balanceAmount','Remaining Balance',1,1,1,1,1,1,0,NULL,'right','numeric','Remaining Balance',13,NULL,150,NULL),(216,22,'bill.discountAmount','Applied Discount',1,1,1,1,1,1,0,NULL,'right','numeric','Discount Amount',14,NULL,150,NULL),(217,22,'bill.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',15,NULL,150,NULL),(218,22,'bill.approvedDate','Approve Date',1,1,1,1,1,1,0,NULL,'center','date','Approve Date',16,NULL,150,NULL),(219,22,'bill.status','Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Approval Status',17,15,150,NULL),(220,22,'bill.paymentStatus','Payment Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Payment Status',18,16,150,NULL),(221,22,'bill.applicableDiscountAmount','Applicable Discount',1,1,1,1,1,1,0,NULL,'right','numeric','Applicable Discount',19,NULL,150,NULL),(222,22,'bill.discountApplicableDate','Discount Applicable Date',1,1,1,1,1,1,0,NULL,'center','date','Discount Applicable Date',20,NULL,150,NULL),(223,22,'bill.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',21,14,150,NULL),(224,22,'bill.approvalGroup','Approval Group',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Group',22,NULL,150,NULL),(225,23,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(226,23,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(227,23,'chk.paymentReferanceNo','Payment Ref.',1,1,1,1,1,1,0,NULL,'left','input','Payment Ref.',3,NULL,150,NULL),(228,23,'chk.amount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',4,NULL,150,NULL),(229,23,'chk.discountAmount','Discount Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Discount Amount',5,NULL,150,NULL),(230,23,'chk.paymentDate','Date',1,1,1,1,1,1,0,NULL,'center','date','Date',6,NULL,150,NULL),(231,23,'vi.billNo','Bill No',1,1,1,1,1,1,0,NULL,'left','input','Bill No.',7,NULL,150,NULL),(232,23,'vi.billAmount','Bill Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Bill Amount',8,NULL,150,NULL),(233,23,'vi.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',10,NULL,150,NULL),(234,23,'vi.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',11,NULL,150,NULL),(235,23,'chk.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','All',13,8,150,NULL),(236,23,'vi.poId','PO No',1,1,1,1,1,1,0,NULL,'left','dropdown','PO No',12,NULL,150,NULL),(237,23,'chk.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',14,14,150,NULL),(238,24,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(239,24,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(240,24,'po.poNumber','PO Number',1,1,1,1,1,1,0,NULL,'left','input','PO Number',4,NULL,150,NULL),(241,24,'po.projectCodeId','Project / Task',1,1,1,1,1,1,0,NULL,'left','dropdown','Project / Task',5,NULL,150,NULL),(242,24,'po.netAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(243,24,'po.poDate','PO Date',1,1,1,1,1,1,0,NULL,'center','date','PO Date',7,NULL,150,NULL),(244,24,'po.deliveryDate','Delivery Date',1,1,1,1,1,1,0,NULL,'center','date','Delivery Date',8,NULL,150,NULL),(245,24,'po.createdByName','Submitted By',1,1,1,1,1,1,0,NULL,'left','input','Submitted By',9,NULL,150,NULL),(246,24,'po.createdOn','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',10,NULL,150,NULL),(247,24,'po.status','Internal Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Internal Approval Status',11,12,150,NULL),(248,24,'po.vendorApprovalStatus','Vendor Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Vendor Approval Status',12,13,150,NULL),(249,24,'po.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',13,NULL,150,NULL),(250,24,'po.approvalGroup','Approval Group',1,1,1,1,1,1,0,NULL,'left','dropdown','Approval Group',14,NULL,150,NULL),(251,25,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(252,25,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(253,25,'receipt.receiptNumber','Receipt Number',1,1,1,1,1,1,0,NULL,'left','input','Receipt Number',3,NULL,150,NULL),(254,25,'receipt.poId','PO Number',1,1,1,1,1,1,0,NULL,'left','dropdown','PO Number',5,NULL,150,NULL),(255,25,'receipt.receiptDate','Receipt Date',1,1,1,1,1,1,0,NULL,'center','date','Receipt Date',6,NULL,150,NULL),(256,25,'receipt.createdBy','Create User',1,1,1,1,1,1,0,NULL,'left','input','Create User',7,NULL,150,NULL),(257,25,'receipt.createdOn','Create Date',1,1,1,1,1,1,0,NULL,'center','date','Create Date',8,NULL,150,NULL),(258,25,'receipt.totalAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',9,NULL,150,NULL),(259,25,'receipt.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',10,17,150,NULL),(260,25,'receipt.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',11,14,150,NULL),(261,13,'po.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',15,14,150,NULL),(262,24,'po.exportStatus','Export Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Export Status',15,14,150,NULL),(263,26,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(264,26,'vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(265,26,'bill.billNo','Bill Number',1,1,1,1,1,1,0,NULL,'left','input','Bill Number',7,NULL,150,NULL),(266,26,'bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',10,NULL,150,NULL),(267,26,'bill.status','Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Approval Status',17,21,150,NULL),(268,26,'bill.billAmount','Bill Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Bill Amount',8,NULL,150,NULL),(269,26,'bill.term','Term',1,1,1,1,1,1,0,NULL,'left','dropdown','Term',7,NULL,150,NULL),(270,26,'bill.applicableDiscountAmount','Applicable Discount Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Applicable Discount Amount',5,NULL,150,NULL),(271,26,'bill.discountApplicableDate','Discount Applicable Date',1,1,1,1,1,1,0,NULL,'center','date','Discount Applicable Date',10,NULL,150,NULL),(272,27,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(273,27,'poc.departmentId','Department Name',1,1,1,1,1,1,0,NULL,'left','dropdown','Department Name',2,NULL,150,NULL),(274,27,'poc.poNoPattern','PO Number Pattern',1,1,1,1,1,1,0,NULL,'left','input','PO Number Pattern',3,NULL,150,NULL),(275,27,'poc.createdUserName','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',4,NULL,150,NULL),(276,27,'poc.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',5,NULL,150,NULL),(277,27,'poc.override','Override',1,1,1,0,1,1,0,NULL,'center','dropdown','Override',6,20,150,NULL),(278,28,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(279,28,'vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(280,28,'bill.billNo','Bill Number',1,1,1,1,1,1,0,NULL,'left','input','Bill Number',4,NULL,150,NULL),(281,28,'bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',5,NULL,150,NULL),(282,28,'bill.billAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(283,28,'term.id','Term',1,1,1,1,1,1,0,NULL,'left','dropdown','Term',7,NULL,150,NULL),(284,28,'bill.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',8,NULL,150,NULL),(285,29,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(286,29,'po.vendorId','Vendor',1,1,1,1,1,1,0,NULL,'left','dropdown','Vendor',3,NULL,150,NULL),(287,29,'po.poNumber','PO Number',1,1,1,1,1,1,0,NULL,'left','input','PO Number',4,NULL,150,NULL),(288,29,'po.projectCodeId','Project / Task',1,1,1,1,1,1,0,NULL,'left','dropdown','Project / Task',5,NULL,150,NULL),(289,29,'po.netAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(290,29,'po.poDate','PO Date',1,1,1,1,1,1,0,NULL,'center','date','PO Date',7,NULL,150,NULL),(291,30,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(292,30,'expense.id','Report Number',1,1,1,1,1,1,0,NULL,'left','input','Report Number',3,NULL,150,NULL),(293,30,'expense.reportName','Report Name',1,1,1,1,1,1,0,NULL,'left','input','Report Name',4,NULL,150,NULL),(294,30,'expense.createdOn','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',6,NULL,150,NULL),(295,30,'expense.createdByName','Submitted User',1,1,1,1,1,1,0,NULL,'left','input','Submit User',5,NULL,150,NULL),(296,10,'appCode.description','Description',1,0,1,1,1,1,NULL,NULL,'left','input','Description',8,NULL,NULL,NULL),(297,11,'field.sectionId','Section',0,0,0,0,0,0,0,NULL,'left','multiSelect','Section',3,NULL,150,NULL),(298,4,'acc.isPurchaseAccount','Purchasing Account',1,1,1,1,1,1,0,NULL,'center','dropdown','Purchasing Account',8,22,150,NULL),(299,10,'appCode.contractValue','Contract Value',1,1,1,1,1,1,NULL,NULL,'right','numeric','Contract Value',4,NULL,NULL,NULL),(300,13,'dept.id','Department',1,1,1,1,1,1,0,NULL,'left','dropdown','Department',16,NULL,150,NULL),(301,14,'dept.id','Department',1,1,1,1,1,1,0,NULL,'left','dropdown','Department',23,NULL,150,NULL),(302,10,'appCode.projectBudget','Budget',1,1,1,1,1,1,NULL,NULL,'right','numeric','Budget',5,NULL,NULL,NULL),(303,10,'appCode.amountInvoiced','Amount Invoiced',1,1,1,1,1,1,NULL,NULL,'right','numeric','Amount Invoiced',6,NULL,NULL,NULL),(304,10,'appCode.remainingAmount','Remaining Amount',1,0,1,1,1,1,NULL,NULL,'right','numeric','Remaining Amount',7,NULL,NULL,NULL),(305,31,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(306,31,'vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(307,31,'temp.templateName','Template Name',1,1,1,1,1,1,0,NULL,'left','input','Template Name',4,NULL,150,NULL),(308,31,'temp.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',5,23,150,NULL),(309,31,'temp.createdBy','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',6,NULL,150,NULL),(310,31,'temp.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',7,NULL,150,NULL),(311,31,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(312,32,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(313,32,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(314,32,'vendor.name','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',4,NULL,150,NULL),(315,32,'bill.billNo','Bill Number',1,1,1,1,1,1,0,NULL,'left','input','Bill Number',5,NULL,150,NULL),(316,32,'bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',6,NULL,150,NULL),(317,32,'bill.billAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',8,NULL,150,NULL),(318,32,'bill.paidAmount','Paid Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Paid Amount',9,NULL,150,NULL),(319,32,'bill.balanceAmount','Balance Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Balance Amount',11,NULL,150,NULL),(320,32,'bill.paymentType','Payment Type',1,0,1,1,1,1,0,NULL,'left','input','Payment Type',13,NULL,150,NULL),(321,32,'bill.paymentAmount','Payment Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Payment Amount',14,NULL,150,NULL),(322,32,'bill.applicableDiscount','Applicable Discount',1,0,1,1,1,1,0,NULL,'left','input','Applied Discount',16,NULL,150,NULL),(323,32,'bill.paymentStatus','Payment Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Payment Status',18,16,150,NULL),(324,32,'bill.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',7,NULL,150,NULL),(325,32,'comment','Comment',1,0,1,1,1,1,0,NULL,'left','input','Comment',15,NULL,150,NULL),(326,32,'expand','',1,0,0,0,0,0,0,NULL,'center','expand','',2,NULL,150,NULL),(327,32,'bill.referenceNo','Reference Number',1,0,1,1,1,1,0,NULL,'left','input','Reference No',12,NULL,150,NULL),(328,33,'txn.batchId','Batch ID',1,0,0,0,0,0,0,NULL,'left','input','Batch ID',1,NULL,150,NULL),(329,33,'txn.txnRef','Reference Number',1,0,0,0,0,0,0,NULL,'left','input','Transaction Id',2,NULL,150,NULL),(331,33,'txn.paidAmount','Paid Amount',1,0,0,0,0,0,0,NULL,'right','numeric','Paid Amount',3,NULL,150,NULL),(332,33,'txn.txnDate','Transaction Date',1,0,0,0,0,0,0,NULL,'center','date','Transaction Date',7,NULL,150,NULL),(333,33,'txn.paymentDate','Payment Date',1,0,0,0,0,0,0,NULL,'center','date','Payment Date',4,NULL,150,NULL),(335,34,'billTxn.vendorId','Vendor',1,1,1,1,1,1,0,NULL,'left','input','Vendor',2,NULL,150,NULL),(336,34,'pay.noOfBills','No. of Bills',1,1,1,1,1,1,0,NULL,'right','numeric','No. of Bills',3,NULL,150,NULL),(337,34,'pay.paymentAmount','Payment Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Payment Amount',4,NULL,150,NULL),(338,34,'pay.balanceToBePaid','Balance to be Paid',1,1,1,1,1,1,0,NULL,'right','numeric','Balance to be Paid',5,NULL,150,NULL),(339,34,'expand',NULL,1,0,0,0,0,0,0,NULL,'center','expand','',1,NULL,150,NULL),(340,34,'delete',NULL,1,0,0,0,0,0,0,NULL,'center','deleteButton','',6,NULL,150,NULL),(341,35,'txn.billNo','Bill No.',1,0,0,0,0,0,0,NULL,'left','input','Bill No',1,NULL,150,NULL),(342,35,'txn.billDate','Bill Date',1,0,0,0,0,0,0,NULL,'center','date','Bill Date',2,NULL,150,NULL),(343,35,'txn.billAmount','Bill Amount',1,0,0,0,0,0,0,NULL,'right','numeric','Bill Amount',4,NULL,150,NULL),(344,35,'txn.dueDate','Due Date',1,0,0,0,0,0,0,NULL,'center','date','Due Date',3,NULL,150,NULL),(346,35,'txn.paymentType','Payment Type',1,0,0,0,0,0,0,NULL,'left','input','Payment Type',6,NULL,150,NULL),(347,36,'expand','',1,0,0,0,0,0,0,NULL,'center','expand','',2,NULL,150,NULL),(348,36,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(349,36,'batch.tpBatchId','Batch ID',1,1,1,1,1,1,0,NULL,'left','input','Batch ID',4,NULL,150,NULL),(350,36,'batch.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',5,NULL,150,NULL),(351,36,'batch.totalAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',6,NULL,150,NULL),(352,36,'batch.noOfVendor','No. of Vendors',1,0,1,1,1,1,0,NULL,'right','numeric','No. of Vendors',7,NULL,150,NULL),(353,36,'batch.noOfBills','No. of Bills',1,0,1,1,1,1,0,NULL,'right','numeric','No. of Bills',8,NULL,150,NULL),(354,36,'batch.timeToCancel','Time Left to Cancel',1,0,1,1,1,1,0,NULL,'center','time','Time Left to cancel',9,NULL,150,NULL),(355,36,'batch.status','Approval Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Approval Status',10,26,150,NULL),(356,36,'batch.paymentStatus','Payment Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Payment Status',11,25,150,NULL),(357,36,'batch.providerId','Payment Provider',1,1,1,1,1,1,0,NULL,'left','dropdown','Payment Provider',12,NULL,150,NULL),(358,36,'batch.createdBy','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',13,NULL,150,NULL),(359,36,'batch.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',14,NULL,150,NULL),(360,36,'batch.approvedDate','Approved Date',1,1,1,1,1,1,0,NULL,'center','date','Approved Date',15,NULL,150,NULL),(361,36,'batch.processedDate','Processed Date',1,1,1,1,1,1,0,NULL,'center','date','Processed Date',16,NULL,150,NULL),(362,37,'txn.txnRef','Reference Number',1,0,0,0,0,0,0,NULL,'left','input','Transaction Id',3,NULL,150,NULL),(363,37,'txn.billNo','Bill No.',1,0,0,0,0,0,0,NULL,'left','input','Bill No',2,NULL,150,NULL),(364,37,'txn.vendor','Vendor',1,0,0,0,0,0,0,NULL,'left','input','Vendor',1,NULL,150,NULL),(365,37,'txn.paidAmount','Paid Amount',1,0,0,0,0,0,0,NULL,'right','numeric','Paid Amount',4,NULL,150,NULL),(366,37,'txn.txnDate','Transaction Date',1,0,0,0,0,0,0,NULL,'center','date','Transaction Date',8,NULL,150,NULL),(367,37,'txn.paymentDate','Payment Date',1,0,0,0,0,0,0,NULL,'center','date','Payment Date',5,NULL,150,NULL),(368,37,'txn.approvalStatus','Approval Status',1,0,0,0,0,0,0,NULL,'center','input','Approval Status',6,NULL,150,NULL),(369,37,'txn.paymentType','Transaction Type',1,0,0,0,0,0,0,NULL,'left','input','Transaction Type',9,NULL,150,NULL),(370,37,'txn.reason','Reason (If failed)',1,0,0,0,0,0,0,NULL,'left','input','Reason (If Faild)',10,NULL,150,NULL),(371,38,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(372,38,'billTxn.vendorId','Vendor',1,1,0,1,1,1,0,NULL,'left','multiSelect','Vendor',2,NULL,150,NULL),(373,38,'pay.noOfBills','No. Of Bills',1,0,0,1,1,1,0,NULL,'right','numeric','No. Of Bills',4,NULL,150,NULL),(374,38,'pay.paymentAmount','Paid Amount',1,0,0,1,1,1,0,NULL,'right','numeric','Paid Amount',4,NULL,150,NULL),(375,38,'pay.balanceToBePaid','Due Amount',1,0,0,1,1,1,0,NULL,'right','numeric','Due Amount',4,NULL,150,NULL),(376,38,'pay.discountedAmount','Total Discount',1,0,0,1,1,1,0,NULL,'right','numeric','Total Discount',6,NULL,150,NULL),(380,39,'txn.batchId','Batch ID',1,0,0,0,0,0,0,NULL,'left','numeric','Batch ID',1,NULL,150,NULL),(381,39,'txn.paymentReferenceNo','Payment Reference No',1,0,0,0,0,0,0,NULL,'left','numeric','Payment Reference No',2,NULL,150,NULL),(382,39,'txn.paymentDate','Payment Date',1,0,0,0,0,0,0,NULL,'left','date','Payment Date',3,NULL,150,NULL),(383,39,'txn.paymentAmount','Payment Amount',1,0,0,0,0,0,0,NULL,'left','numeric','Payment Amount',4,NULL,150,NULL),(384,39,'txn.paymentType','Payment Type',1,0,0,0,0,0,0,NULL,'right','input','Payment Type',5,NULL,150,NULL),(385,39,'txn.status','Status',1,0,0,0,0,0,0,NULL,'center','input','Status',6,NULL,150,NULL),(386,40,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(387,40,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(388,40,'recBill.scheduleName','Schedule Name',1,1,1,1,1,1,0,NULL,'left','input','Schedule Name',3,NULL,150,NULL),(389,40,'recBill.intervalValue','Interval',1,1,1,1,1,1,0,NULL,'left','dropdown','Interval',5,NULL,150,NULL),(390,40,'vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',6,NULL,150,NULL),(391,40,'term.id','Term',1,1,1,1,1,1,0,NULL,'left','dropdown','Term',7,NULL,150,NULL),(392,40,'recBill.billAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',8,NULL,150,NULL),(393,40,'recBill.lastGenerationDate','Last Generated Date',1,1,1,1,1,1,0,NULL,'center','date','Last Generated Date',9,NULL,150,NULL),(394,33,'txn.approvalStatus','Approval Status',1,0,0,0,0,0,0,NULL,'center','dropdown','Approval Status',5,NULL,150,NULL),(395,33,'txn.paymentType','Transaction Type',1,0,0,0,0,0,0,NULL,'left','dropdown','Transaction Type',8,NULL,150,NULL),(396,33,'txn.reason','Reason (If failed)',1,0,0,0,0,0,0,NULL,'left','input','Reason (If Faild)',9,NULL,150,NULL),(397,40,'recBill.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',10,NULL,150,NULL),(398,40,'recBill.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',11,1,150,NULL),(399,35,'txn.txnRef','Reference Number',1,0,0,0,0,0,0,NULL,'left','input','Reference No',7,NULL,150,NULL),(400,35,'txn.paymentAmount','Payment Amount',1,0,0,0,0,0,0,NULL,'right','input','Payment Amount',9,NULL,150,NULL),(401,35,'txn.appliedDiscount','Applied Discount',1,0,0,0,0,0,0,NULL,'right','input','Applied Discount',10,NULL,150,NULL),(402,35,'txn.comment','Comment',1,0,0,0,0,0,0,NULL,'left','input','Comment',11,NULL,150,NULL),(403,35,'delete',NULL,1,0,0,0,0,0,0,NULL,'center','deleteButton','',12,NULL,150,NULL),(407,34,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'left','input','',16,NULL,150,NULL),(408,34,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'left','input','',17,NULL,150,NULL),(409,34,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'left','input','',18,NULL,150,NULL),(410,34,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'left','input','',19,NULL,150,NULL),(411,41,'billTxn.vendorId','Vendor',1,0,0,0,0,0,0,NULL,'left','input','Vendor',2,NULL,150,NULL),(412,41,'pay.noOfBills','No. of Bills',1,0,0,0,0,0,0,NULL,'right','number','No. of Bills',3,NULL,150,NULL),(413,41,'pay.paymentAmount','Payment Amount',1,0,0,0,0,0,0,NULL,'right','number','Payment Amount',4,NULL,150,NULL),(414,41,'pay.balanceToBePaid','Balance to be Paid',1,0,0,0,0,0,0,NULL,'right','number','Balance to be Paid',5,NULL,150,NULL),(415,41,'expand',NULL,1,0,0,0,0,0,0,NULL,'center','expand','',1,NULL,150,NULL),(416,42,'txn.billNo','Bill No.',1,0,0,0,0,0,0,NULL,'left','input','Bill No',1,NULL,150,NULL),(417,42,'txn.billDate','Bill Date',1,0,0,0,0,0,0,NULL,'center','date','Bill Date',2,NULL,150,NULL),(418,42,'txn.billAmount','Bill Amount',1,0,0,0,0,0,0,NULL,'right','numeric','Bill Amount',4,NULL,150,NULL),(419,42,'txn.dueDate','Due Date',1,0,0,0,0,0,0,NULL,'center','date','Due Date',3,NULL,150,NULL),(420,42,'txn.paymentTypeName','Payment Type',1,0,0,0,0,0,0,NULL,'left','input','Payment Type',6,NULL,150,NULL),(421,42,'txn.txnRef','Reference Number',1,0,0,0,0,0,0,NULL,'left','input','Reference No',7,NULL,150,NULL),(422,42,'txn.paymentAmount','Payment Amount',1,0,0,0,0,0,0,NULL,'right','input','Payment Amount',9,NULL,150,NULL),(423,42,'txn.appliedDiscount','Applied Discount',1,0,0,0,0,0,0,NULL,'right','input','Applied Discount',10,NULL,150,NULL),(424,42,'txn.comment','Comment',1,0,0,0,0,0,0,NULL,'left','input','Comment',11,NULL,150,NULL),(426,41,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'center','input','',13,NULL,150,NULL),(427,41,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'center','input','',14,NULL,150,NULL),(428,41,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'center','input','',15,NULL,150,NULL),(429,41,'emptyColumn',NULL,1,0,0,0,0,0,0,NULL,'center','input','',16,NULL,150,NULL),(430,43,'bill.billNo','Bill No.',1,0,0,0,0,0,0,NULL,'left','input','Billl No',2,NULL,150,NULL),(431,43,'expand',NULL,1,0,0,0,0,0,0,NULL,'center','expand','',1,NULL,150,NULL),(432,43,'bill.billDate','Bill Date',1,0,0,0,0,0,0,NULL,'center','date','Bill Date',3,NULL,150,NULL),(433,43,'bill.billAmount','Bill Amount',1,0,0,0,0,0,0,NULL,'right','number','Bill Amount',4,NULL,150,NULL),(434,43,'bill.paidAmount','Paid Amount',1,0,0,0,0,0,0,NULL,'right','number','Paid Amount',5,NULL,150,NULL),(435,43,'bill.balanceAmount','Balance Amount',1,0,0,0,0,0,0,NULL,'right','number','Balance Amount',6,NULL,150,NULL),(436,43,'bill.discountAmount','Discount Amount',1,0,0,0,0,0,0,NULL,'right','number','Discount Amount',7,NULL,150,NULL),(437,43,'bill.discountApplicableDate','Discount Applicable Date',0,0,0,0,0,0,0,NULL,'center','date','Discount Applicable Date',8,NULL,150,NULL),(438,43,'bill.dueDate','Due Date',1,0,0,0,0,0,0,NULL,'center','date','Due Date',9,NULL,150,NULL),(439,44,'txn.billNo','Bill No.',1,0,0,0,0,0,0,NULL,'left','input','Bill No',1,NULL,150,NULL),(440,44,'txn.txnRef','Payment Reference No.',1,0,0,0,0,0,0,NULL,'left','input','Payment Reference No',2,NULL,150,NULL),(441,44,'txn.paidAmount','Paid Amount',1,0,0,0,0,0,0,NULL,'right','number','Paid Amount',3,NULL,150,NULL),(442,44,'txn.paymentStatus','Payment Status',1,0,0,0,0,0,0,NULL,'center','number','Payment Status',5,NULL,150,NULL),(443,44,'txn.paymentType','Payment Type',1,0,0,0,0,0,0,NULL,'left','input','Payment Type',6,NULL,150,NULL),(444,44,'txn.approvalStatus','Approval Status',1,0,0,0,0,0,0,NULL,'center','input','Approval Status',4,NULL,150,NULL),(445,37,'txn.paymentStatus','Payment Status',1,0,0,0,0,0,0,NULL,'center','input','Payment Status',7,NULL,150,NULL),(448,32,'bill.paymentUnderProcessing','Payments In Process',1,1,1,1,1,1,0,NULL,'right','numeric','Payment Under Processing',10,NULL,150,NULL),(449,40,'recBill.noOfGeneration','No. of Bills Generated',1,1,1,1,1,1,0,NULL,'center','number','No. of Bills Generated',4,NULL,150,NULL),(450,33,'txn.paymentStatus','Payment Status',1,0,0,0,0,0,0,NULL,'center','input','Payment Status',6,NULL,150,NULL),(451,45,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(452,45,'vendor.name','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(453,45,'bill.billNo','Bill No.',1,1,1,1,1,1,0,NULL,'left','input','Bill Number',4,NULL,150,NULL),(454,45,'bill.billDate','Bill Date',1,1,1,1,1,1,0,NULL,'center','date','Bill Date',5,NULL,150,NULL),(455,45,'bill.billAmount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',7,NULL,150,NULL),(456,45,'bill.paidAmount','Paid Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Paid Amount',8,NULL,150,NULL),(457,45,'bill.balanceAmount','Balance Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Balance Amount',11,NULL,150,NULL),(458,45,'bill.paymentType','Payment Type',1,0,1,1,1,1,0,NULL,'left','input','Payment Type',12,NULL,150,NULL),(459,45,'bill.paymentAmount','Payment Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Payment Amount',13,NULL,150,NULL),(460,45,'bill.applicableDiscount','Applicable Discount',1,0,1,1,1,1,0,NULL,'right','input','Applied Discount',15,NULL,150,NULL),(461,45,'bill.paymentStatus','Payment Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Payment Status',16,16,150,NULL),(462,45,'bill.dueDate','Due Date',1,1,1,1,1,1,0,NULL,'center','date','Due Date',6,NULL,150,NULL),(463,45,'comment','Comment',1,0,1,1,1,1,0,NULL,'left','input','Comment',14,NULL,150,NULL),(465,45,'bill.referenceNo','Reference Number',1,0,1,1,1,1,0,NULL,'left','input','Reference No',10,NULL,150,NULL),(466,45,'bill.paymentUnderProcessing','Payments In Process',1,1,1,1,1,1,0,NULL,'right','numeric','Payment Under Processing',9,NULL,150,NULL),(467,36,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(469,11,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(470,2,'usm.createdBy','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',8,NULL,150,NULL),(471,2,'usm.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'left','date','Created Date',9,NULL,150,NULL),(472,46,'dept.departmentCode','Department Code',1,1,1,1,1,1,0,NULL,'left','input','Department Code',3,NULL,150,NULL),(473,46,'dept.departmentName','Department Name',1,1,1,1,1,1,0,NULL,'left','input','Department Name',4,NULL,150,NULL),(474,46,'dept.createdUsername','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',5,NULL,150,NULL),(475,46,'dept.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',6,NULL,150,NULL),(476,46,'dept.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',5,1,150,NULL),(477,46,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(478,46,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(479,31,'tmpemail.email','Email(s)',1,1,1,1,1,1,0,NULL,'left','multiSelect','Email(s)',8,NULL,150,NULL),(480,10,'appCode.startDate','Start Date',1,0,1,1,1,1,NULL,NULL,'center','date','Start Date',10,NULL,NULL,NULL),(481,10,'appCode.endDate','End Date',1,0,1,1,1,1,NULL,NULL,'center','date','End Date',11,NULL,NULL,NULL),(482,47,'vendor.id','Vendor',1,1,0,1,1,1,0,NULL,'left','dropdown','Vendor',1,NULL,150,NULL),(483,47,'bill.billNo','Bill Number',1,1,0,1,1,1,0,NULL,'left','input','Bill No.',2,NULL,150,NULL),(484,47,'bill.billDate','Bill Date',1,1,0,1,1,1,0,NULL,'center','date','Bill Date',3,NULL,150,NULL),(485,47,'exp.amount','Allocated Amount',1,0,0,1,1,1,0,NULL,'right','','Allocated Amount',4,NULL,150,NULL),(486,48,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(487,48,'variance.vendorId','Vendor',1,1,1,1,1,1,0,NULL,'left','dropdown','Vendor',2,NULL,150,NULL),(488,48,'variance.priceVariance','Allowance',1,1,1,1,1,1,0,NULL,'right','numeric','Allowance',3,NULL,150,NULL),(489,48,'variance.createdUserName','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',4,NULL,150,NULL),(490,48,'variance.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',5,NULL,150,NULL),(492,5,'item.parentId','Parent Item',1,1,1,1,1,1,0,NULL,'left','dropdown','Parent Item',6,NULL,150,NULL),(493,14,'bill.paidAmount','Paid Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Paid Amount',24,NULL,150,NULL),(494,49,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(495,49,'creditNote.creditNoteNo','Credit Note Number',1,1,1,1,1,1,0,NULL,'left','input','Credit Note No.',2,NULL,150,NULL),(496,49,'creditNote.creditNoteDate','Credit Note Date',1,1,1,1,1,1,0,NULL,'center','date','Credit Note date',3,NULL,150,NULL),(497,49,'creditNote.vendorId','Vendor',1,1,1,1,1,1,0,NULL,'left','dropdown','Vendor',4,NULL,150,NULL),(498,49,'creditNote.vendorEmail','Vendor Email',1,1,1,1,1,1,0,NULL,'left','input','Vendor Email',5,NULL,150,NULL),(499,49,'creditNote.poId','Purchase Order',1,1,1,1,1,1,0,NULL,'left','dropdown','Purchase Order',6,NULL,150,NULL),(500,49,'creditNote.creditTotal','Credit Total',1,1,1,1,1,1,0,NULL,'right','numeric','Credit Total',9,NULL,150,NULL),(501,49,'creditNote.createdBy','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',10,NULL,150,NULL),(502,49,'creditNote.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',9,NULL,150,NULL),(503,50,'statement.fileName','File Name',1,1,1,1,1,1,0,NULL,'left','input','File Name',2,NULL,150,NULL),(508,50,'statement.createdByName','Uploaded By',1,1,1,1,1,1,0,NULL,'left','input','Uploaded By',6,NULL,150,NULL),(509,50,'statement.createdOn','Uploaded Date',1,1,1,1,1,1,0,NULL,'center','date','Uploaded Date',7,NULL,150,NULL),(510,50,'statement.totalRecords','Total Records',1,1,1,1,1,1,0,NULL,'right','number','Total Records',8,NULL,150,NULL),(511,50,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(512,51,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(513,51,'card.cardNo','Card Number',1,1,1,1,1,1,0,NULL,'left','input','Card Number',4,NULL,150,NULL),(514,51,'card.employeeName','Employee',1,1,1,1,1,1,0,NULL,'left','input','Employee',5,NULL,150,NULL),(515,51,'card.createdByName','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',6,NULL,150,NULL),(516,51,'card.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',7,NULL,150,NULL),(517,51,'card.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',8,1,150,NULL),(518,51,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(519,49,'creditNote.creditBalance','Credit Balance',1,1,1,1,1,1,0,NULL,'right','numeric','Credit Balance',8,NULL,150,NULL),(520,14,'bill.creditAmount','Credit Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Credit Amount',25,NULL,150,NULL),(521,52,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(522,52,'sup.issueKey','Ticket No.',1,1,1,1,1,1,0,NULL,'left','input','Ticket No.',2,NULL,150,NULL),(523,52,'sup.summary','Summary',1,1,1,1,1,1,0,NULL,'left','input','Summary',3,NULL,150,NULL),(524,52,'sup.description','Description',1,1,1,1,1,1,0,NULL,'left','input','Description',4,NULL,150,NULL),(525,52,'sup.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',5,NULL,150,NULL),(526,52,'sup.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',6,29,150,NULL),(527,53,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(528,53,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(529,53,'receipt.cardNo','Card Number',1,1,1,1,1,1,0,NULL,'left','input','Card Number',4,NULL,150,NULL),(530,53,'receipt.transactionDate','Transaction Date',1,1,1,1,1,1,0,NULL,'center','date','Transaction Date',5,NULL,150,NULL),(531,53,'receipt.amount','Transaction Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Transaction Amount',6,NULL,150,NULL),(532,53,'receipt.merchant','Merchant',1,1,1,1,1,1,0,NULL,'left','input','Merchant',7,NULL,150,NULL),(533,53,'receipt.description','Description',1,1,1,1,1,1,0,NULL,'left','input','Description',8,NULL,150,NULL),(534,54,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(535,54,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(536,54,'transaction.transactionDate','Transaction Date',1,1,1,1,1,1,0,NULL,'center','date','Transaction Date',5,NULL,150,NULL),(537,54,'transaction.postingDate','Posting Date',1,1,1,1,1,1,0,NULL,'center','date','Posting Date',6,NULL,150,NULL),(538,54,'transaction.merchant','Merchant',1,1,1,1,1,1,0,NULL,'left','input','Merchant',7,NULL,150,NULL),(539,54,'transaction.cardNo','Card Number',1,1,1,1,1,1,0,NULL,'left','input','Card Number',13,NULL,150,NULL),(540,54,'transaction.description','Description',1,1,1,1,1,1,0,NULL,'left','input','Description',8,NULL,150,NULL),(541,54,'transaction.amount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',9,NULL,150,NULL),(542,54,'transaction.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',14,28,150,NULL),(543,54,'transaction.account','Account',1,0,1,1,1,1,0,NULL,'left','','Account',10,NULL,150,NULL),(544,54,'transaction.projectCode','Project / Task',1,0,1,1,1,1,0,NULL,'left','','Project Code',11,NULL,150,NULL),(545,54,'transaction.missingReceiptAvailability','Missing Receipt',1,0,1,1,1,1,0,NULL,'center','','Missing Receipt',3,NULL,150,NULL),(546,54,'transaction.receipt','Receipt',1,0,1,1,1,1,0,NULL,'left','','Receipt',4,NULL,150,NULL),(547,54,'transaction.billable','Billable',1,1,1,1,1,1,0,NULL,'center','dropdown','Billable',12,20,150,NULL),(548,55,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(549,55,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(550,55,'transaction.transactionDate','Transaction Date',1,1,1,1,1,1,0,NULL,'center','date','Transaction Date',5,NULL,150,NULL),(551,55,'transaction.postingDate','Posting Date',1,1,1,1,1,1,0,NULL,'center','date','Posting Date',6,NULL,150,NULL),(552,55,'transaction.merchant','Merchant',1,1,1,1,1,1,0,NULL,'left','input','Merchant',8,NULL,150,NULL),(553,55,'transaction.cardNo','Card Number',1,1,1,1,1,1,0,NULL,'left','input','Card Number',14,NULL,150,NULL),(554,55,'transaction.description','Description',1,1,1,1,1,1,0,NULL,'left','input','Description',9,NULL,150,NULL),(555,55,'transaction.amount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',10,NULL,150,NULL),(556,55,'transaction.employeeName','Employee',1,1,1,1,1,1,0,NULL,'left','input','Employee',7,NULL,150,NULL),(557,55,'transaction.account','Account',1,0,1,1,1,1,0,NULL,'left','','Account',11,NULL,150,NULL),(558,55,'transaction.projectCode','Project / Task',1,0,1,1,1,1,0,NULL,'left','','Project Code',12,NULL,150,NULL),(559,55,'transaction.missingReceiptAvailability','Missing Receipt',0,0,0,0,0,0,0,NULL,'center','','Missing Receipt',3,NULL,150,NULL),(560,55,'transaction.receipt','Receipt',1,0,1,1,1,1,0,NULL,'left','','Receipt',4,NULL,150,NULL),(561,55,'transaction.billable','Billable',1,1,1,1,1,1,0,NULL,'center','dropdown','Billable',13,20,150,NULL),(562,49,'creditNote.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',15,30,150,NULL),(563,55,'transaction.remarks','Comment',1,0,1,1,1,1,0,NULL,'left','','Comment',17,NULL,150,NULL),(564,55,'transaction.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',18,NULL,150,NULL),(565,55,'transaction.approvedDate','Approved Date',1,1,1,1,1,1,0,NULL,'center','date','Approved Date',20,NULL,150,NULL),(566,55,'transaction.approvalGroupName','Approve Group',1,1,1,1,1,1,0,NULL,'left','input','Approve Group',19,NULL,150,NULL),(567,55,'transaction.approver','Next Assignee',1,0,1,1,1,1,0,NULL,'left','','Next Assignee',16,NULL,150,NULL),(568,56,'checkbox','',1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(569,56,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(570,56,'transaction.transactionDate','Transaction Date',1,1,1,1,1,1,0,NULL,'center','date','Transaction Date',5,NULL,150,NULL),(571,56,'transaction.postingDate','Posting Date',1,1,1,1,1,1,0,NULL,'center','date','Posting Date',6,NULL,150,NULL),(572,56,'transaction.merchant','Merchant',1,1,1,1,1,1,0,NULL,'left','input','Merchant',8,NULL,150,NULL),(573,56,'transaction.cardNo','Card Number',1,1,1,1,1,1,0,NULL,'left','input','Card Number',14,NULL,150,NULL),(574,56,'transaction.description','Description',1,1,1,1,1,1,0,NULL,'left','input','Description',9,NULL,150,NULL),(575,56,'transaction.amount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',10,NULL,150,NULL),(576,56,'transaction.employeeName','Employee',1,1,1,1,1,1,0,NULL,'left','input','Employee',7,NULL,150,NULL),(577,56,'transaction.accountName','Account',1,0,1,1,1,1,0,NULL,'left','','Account',11,NULL,150,NULL),(578,56,'transaction.projectCodeName','Project / Task',1,0,1,1,1,1,0,NULL,'left','','Project Code',12,NULL,150,NULL),(579,56,'transaction.missingReceiptAvailability','Missing Receipt',0,0,0,0,0,0,0,NULL,'center','','Missing Receipt',3,NULL,150,NULL),(580,56,'transaction.receipt','Receipt',1,0,1,1,1,1,0,NULL,'left','','Receipt',4,NULL,150,NULL),(581,56,'transaction.billable','Billable',1,1,1,1,1,1,0,NULL,'center','dropdown','Billable',13,20,150,NULL),(582,56,'transaction.remarks','Comment',1,0,1,1,1,1,0,NULL,'left','','Comment',17,NULL,150,NULL),(583,56,'transaction.approvalUserName','Approval User',1,1,1,1,1,1,0,NULL,'left','input','Approval User',18,NULL,150,NULL),(584,56,'transaction.approvedDate','Approved Date',1,1,1,1,1,1,0,NULL,'center','date','Approved Date',20,NULL,150,NULL),(585,56,'transaction.approvalGroupName','Approve Group',1,1,1,1,1,1,0,NULL,'left','input','Approve Group',19,NULL,150,NULL),(586,32,'bill.creditAmount','Credit Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Credit Amount',17,NULL,150,NULL),(587,53,'receipt.createdOn','Uploaded Date',1,1,1,1,1,1,0,NULL,'center','date','Uploaded Date',10,NULL,150,NULL),(588,57,'receipt.transactionDate','Transaction Date',1,1,1,1,1,1,0,NULL,'center','date','Transaction Date',1,NULL,150,NULL),(589,57,'receipt.amount','Amount',1,1,1,1,1,1,0,NULL,'right','numeric','Amount',2,NULL,150,NULL),(590,57,'receipt.merchant','Merchant',1,1,1,1,1,1,0,NULL,'left','input','Merchant',4,NULL,150,NULL),(591,57,'receipt.description','Description',1,1,1,1,1,1,0,NULL,'left','input','Description',5,NULL,150,NULL),(592,57,'image','Image',1,0,1,0,1,1,0,NULL,'center','','Image',6,NULL,150,NULL),(593,57,'actionBtn','Action',1,0,1,0,0,0,0,NULL,'center','','Action',7,NULL,150,NULL),(594,51,'vendor.id','Vendor',1,1,1,1,1,1,0,NULL,'left','multiSelect','Vendor',3,NULL,150,NULL),(597,55,'transaction.submittedDate','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',21,NULL,150,NULL),(598,56,'transaction.submittedDate','Submitted Date',1,1,1,1,1,1,0,NULL,'center','date','Submitted Date',21,NULL,150,NULL),(599,18,'syncDetail.recodeStatus','Event',1,0,1,1,1,1,0,NULL,'center','dropdown','Event',6,31,150,NULL),(600,19,'syncDetail.recodeStatus','Event',1,0,1,1,1,1,0,NULL,'center','dropdown','Event',6,31,150,NULL),(601,20,'syncDetail.recodeStatus','Event',1,0,1,1,1,1,0,NULL,'center','dropdown','Event',6,31,150,NULL),(602,21,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(603,21,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(604,21,'syncDetail.recodeStatus','Event',1,0,1,1,1,1,0,NULL,'center','dropdown','Event',6,31,150,NULL),(605,21,'syncDetail.tpCompanyId','Company',1,1,1,1,1,1,0,NULL,'left','dropdown','Company',8,NULL,150,NULL),(606,58,'pullDetail.referenceNo','Reference No',1,0,0,1,1,1,0,NULL,'left','input','Reference No',3,NULL,150,NULL),(607,58,'pullDetail.amount','Amount',1,0,1,1,1,1,0,NULL,'right','numeric','Amount',3,NULL,150,NULL),(608,58,'pullDetail.syncDateTime','Date',1,0,1,1,1,1,0,NULL,'center','date','Date',1,NULL,150,NULL),(609,58,'pullDetail.objectType','Data Type',1,0,1,1,1,1,0,NULL,'left','dropdown','Data Type',2,19,150,NULL),(610,58,'pullDetail.recordStatus','Event',1,0,1,1,1,1,0,NULL,'center','dropdown','Event',6,31,150,NULL),(611,53,'receipt.createdBy','Uploaded By',1,1,1,1,1,1,0,NULL,'left','input','Uploaded By',9,NULL,150,NULL),(612,59,'failRecord.referenceNumber','Reference No',1,1,1,1,1,1,0,NULL,'left','input','Name',3,NULL,150,NULL),(613,59,'incompleteDetail.objectType','Data Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Object Type',4,19,150,NULL),(614,59,'failRecord.failedDateTime','Date',1,1,1,1,1,1,0,NULL,'center','date','Date',5,NULL,150,NULL),(615,59,'failRecord.failedReason','Message',1,1,1,1,1,1,0,NULL,'left','input','Message',7,NULL,150,NULL),(616,59,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(617,59,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(618,59,'failRecord.recordStatus','Event',1,0,1,1,1,1,0,NULL,'center','dropdown','Event',6,31,150,NULL),(619,59,'incompleteDetail.tpCompanyId','Company',1,1,1,1,1,1,0,NULL,'left','dropdown','Company',8,NULL,150,NULL),(620,60,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(621,60,'action',NULL,1,0,0,0,0,0,1,'right','center','actionButton','',60,NULL,50,NULL),(622,60,'reminder.name','Reminder Name',1,1,1,1,1,1,0,NULL,'left','input','Reminder Name',3,NULL,150,NULL),(623,60,'reminder.documentTypeId','Document Type',1,1,1,1,1,1,0,NULL,'left','dropdown','Document Type',4,NULL,150,NULL),(625,60,'reminder.createdByName','Created By',1,1,1,1,1,1,0,NULL,'left','input','Created By',6,NULL,150,NULL),(626,60,'reminder.createdOn','Created Date',1,1,1,1,1,1,0,NULL,'center','date','Created Date',7,NULL,150,NULL),(627,60,'reminder.status','Status',1,1,1,1,1,1,0,NULL,'center','dropdown','Status',8,1,150,NULL),(628,61,'mileage.mileageRate','Mileage Rate',1,0,0,0,0,0,0,NULL,'right','','Mileage Rate',1,NULL,150,NULL),(629,61,'mileage.effectiveFrom','Effective From',1,0,0,0,0,0,0,NULL,'center','date','Effective From',2,NULL,150,NULL),(630,61,'mileage.effectiveTo','Effective To',1,0,0,0,0,0,0,NULL,'center','date','Effective To',3,NULL,150,NULL),(631,4,'acc.isExpenseAccount','Expense Account',1,1,1,1,1,1,0,NULL,'center','dropdown','Expense Account',9,22,150,NULL),(632,62,'txn.txnRef','Ref No.',1,1,0,0,1,1,0,NULL,'left','input','Ref No.',2,NULL,160,NULL),(633,62,'txn.batchNo','Batch No.',1,1,0,0,1,1,0,NULL,'left','input','Batch No.',3,NULL,160,NULL),(634,62,'txn.documentNo','Document No.',1,1,0,0,1,1,0,NULL,'left','input','Document No.',4,NULL,160,NULL),(635,62,'txn.payeeName','Payee',1,1,0,0,1,1,0,NULL,'left','input','Payee',5,NULL,170,NULL),(636,62,'txn.txnAmount','Amount',1,1,0,0,1,1,0,NULL,'right','numeric','Amount',6,NULL,140,NULL),(637,62,'txn.createdOn','Created Date',1,1,0,0,1,1,0,NULL,'left','date','Created Date',7,NULL,160,NULL),(638,62,'txn.status','Approval Status',1,1,0,0,1,1,0,NULL,'left','dropdown','Approval Status',8,15,171,NULL),(639,62,'txn.txnType','Payment Type',1,1,0,0,1,1,0,NULL,'left','dropdown','Payment Type',10,NULL,160,2),(640,62,'txn.reason','Reason (If failed)',1,1,0,0,1,1,0,NULL,'left','input','Reason (If failed)',12,NULL,310,NULL),(641,62,'action',NULL,1,0,0,0,0,0,1,'right','left','actionButton','',60,NULL,50,NULL),(642,62,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(643,62,'txn.isOnline','Online / Offline',0,0,0,0,0,1,0,NULL,'left','dropdown','Online / Offline',10,33,150,NULL),(644,62,'txn.paymentStatus','Payment Status',1,1,0,0,1,1,0,NULL,'left','dropdown','Payment Status',9,25,171,NULL),(645,62,'txn.documentType','Document Type',0,0,0,0,0,1,0,NULL,'left','dropdown','Document Type',1,NULL,150,3),(646,62,'txn.trxDate','Payment Date',1,1,0,0,1,1,0,NULL,'left','date','Payment Date',11,NULL,160,NULL),(647,63,'checkbox',NULL,1,0,0,0,0,0,1,'left','center','checkbox','',1,NULL,50,NULL),(648,63,'doc.docNo','Document No.',1,1,0,0,0,1,1,'left','left','input','Document No.',2,NULL,160,NULL),(649,63,'doc.payee','Payee',1,1,0,0,0,1,1,'left','left','input','Payee',3,NULL,160,NULL),(650,63,'doc.docDate','Date',1,1,0,0,1,1,0,NULL,'center','date','Date',4,NULL,160,NULL),(651,63,'doc.dueDate','Due Date',1,1,0,0,1,0,0,NULL,'center','date','Due Date',5,NULL,160,NULL),(652,63,'doc.amount','Amount',1,1,0,0,1,1,0,NULL,'right','numeric','Amount',6,NULL,140,NULL),(653,63,'doc.paidAmount','Paid Amount',1,1,0,0,1,1,0,NULL,'right','numeric','Paid Amount',7,NULL,140,NULL),(654,63,'doc.paymentUnderProcessing','In Process',1,1,0,0,1,0,0,NULL,'right','numeric','In Process',8,NULL,140,NULL),(655,63,'doc.balanceAmount','Balance',1,1,0,0,1,0,0,NULL,'right','numeric','Balance',9,NULL,140,NULL),(656,63,'doc.referenceNo','Reference No',1,0,0,0,1,0,0,NULL,'left','input','Reference No',12,NULL,160,NULL),(657,63,'doc.txnType','Payment Type',1,0,0,0,1,0,0,NULL,'left','input','Payment Type',10,NULL,140,2),(658,63,'doc.txnAmount','Transaction Amount',1,0,0,0,1,0,0,NULL,'right','numeric','Transaction Amount',13,NULL,160,NULL),(659,63,'doc.comment','Comment',1,0,0,0,1,0,0,NULL,'left','input','Comment',14,NULL,170,NULL),(660,63,'doc.applicableDiscountAmount','Disc.',1,0,0,0,1,0,0,NULL,'right','numeric','Disc.',15,NULL,140,NULL),(661,63,'doc.paymentStatus','Payment Status',1,1,0,0,1,1,0,NULL,'left','dropdown','Payment Status',17,25,140,NULL),(662,63,'doc.creditAmount','Credit Amount',1,0,0,0,1,0,0,NULL,'right','numeric','Credit Amount',16,NULL,140,NULL),(663,63,'doc.paymentDate','Payment Date',1,0,0,0,1,0,0,NULL,'center','date','Payment Date',11,NULL,160,NULL),(664,63,'doc.receipt','Receipt',1,0,0,0,1,0,0,NULL,'left','input','Receipt',18,NULL,180,NULL),(665,15,'expense.paymentStatus','Payment Status',1,1,0,0,1,1,0,NULL,'left','dropdown','Payment Status',14,16,150,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_filter_template`
--

LOCK TABLES `common_grid_filter_template` WRITE;
/*!40000 ALTER TABLE `common_grid_filter_template` DISABLE KEYS */;
INSERT INTO `common_grid_filter_template` VALUES (1,1,NULL,'roleId','Role ID','input'),(2,1,NULL,'roleName','Role Name','input'),(3,1,NULL,'createdBy','Created By','input'),(4,1,NULL,'createDate','Create Date','date'),(5,1,1,'status','Status','dropdown'),(6,3,NULL,'apgr.id','Approval Group ID','input'),(7,3,NULL,'apgr.name','Approval Group Name','input'),(8,3,NULL,'usm.name','Created By','input'),(9,3,NULL,'apgr.dateCreated','Create Date','date'),(10,3,1,'apgr.status','Status','dropdown'),(11,2,NULL,'usm.email','Email Address','input'),(12,2,NULL,'usm.name','Name','input'),(13,2,NULL,'usm.nicPassportNo','Employee No','input'),(14,2,NULL,'approvalGroups','Approval Groups','dropdown'),(15,2,NULL,'rolem.name','Role','dropdown'),(16,2,1,'usm.status','Status','dropdown'),(17,4,NULL,'acct.name','Account Type','dropdown'),(18,4,NULL,'accdt.name','Account Detail Type','dropdown'),(19,4,NULL,'acc.number','Account No','input'),(20,4,NULL,'acc.name','Account Name','input'),(21,4,NULL,'acc2.name','Parent Account','dropdown'),(22,4,1,'acc.status','Status','dropdown'),(23,5,NULL,'type.name','Item Type','dropdown'),(24,5,NULL,'cat.name','Category','input'),(25,5,NULL,'item.itemNumber','Item No','input'),(26,5,NULL,'item.name','Item Name','input'),(27,5,6,'item.taxable','Taxability','dropdown'),(28,5,NULL,'item.salesPrice','Selling Price','input'),(29,5,1,'item.status','Status','dropdown'),(30,6,NULL,'tenantId','Tenant ID','input'),(31,6,NULL,'companyName','Company Name','input'),(32,6,NULL,'emailAddress','Email Address','input'),(33,6,1,'status','Status','dropdown'),(34,7,NULL,'chk.paymentReferanceNo','Payment Ref','input'),(35,7,NULL,'chk.amount','Amount','input'),(36,7,NULL,'chk.discountAmount','Bill Amount','input'),(37,7,NULL,'chk.paymentDate','Date','date'),(38,7,NULL,'vi.invoiceNo','Bill No','input'),(39,7,NULL,'vi.invoiceAmount','Bill Amount','input'),(40,7,NULL,'vn.name','Vendor','input'),(41,7,NULL,'vi.invoiceDate','Bill Date','date'),(42,7,NULL,'vi.dueDate','Due Date','date'),(43,7,8,'chk.status','Status','dropdown'),(44,8,NULL,'vendor.name','Vendor Name','input'),(45,8,NULL,'vendor.contactPerson','Contact Name','input'),(46,8,NULL,'vendor.contactNumber','Contact No','input'),(47,8,NULL,'vendor.email','Contact Email','input'),(48,9,NULL,'req.vendorName','Vendor Name','input'),(49,9,NULL,'req.contactPerson','Contact Name','input'),(50,9,NULL,'req.contactNumber','Contact Number','input'),(51,9,NULL,'req.vendorEmail','Email Address','input'),(52,9,NULL,'req.status','Status','dropdown'),(53,7,NULL,'po.poNumber','PO No','input'),(54,10,NULL,'appCode.name','Project Code','input'),(56,10,NULL,'appCode.createdOn','Create Date','date'),(57,10,NULL,'usm.name','Created By','input'),(59,10,1,'appCode.status','Status','dropdown'),(60,11,NULL,'field.moduleId','Document Type','dropdown'),(61,11,NULL,'field.fieldName','Field Name','dropdown'),(62,11,NULL,'field.fieldId','Field Type','dropdown'),(63,11,10,'field.required','Required Status','dropdown'),(64,11,11,'field.status','Active Status','dropdown'),(65,12,NULL,'aut.name','Name','input'),(66,12,NULL,'configDoc.documentTypeId','Document Type','dropdown'),(67,12,NULL,'configDoc.eventId','Event','dropdown'),(68,12,NULL,'aut.createdBy','Created By','input'),(69,12,NULL,'aut.createdDate','Created Date','date'),(71,12,1,'aut.staus','Status','dropdown'),(72,13,NULL,'vendorId','Vendor','dropdown'),(73,13,NULL,'poNumber','PO Number','input'),(74,13,NULL,'projectCodeId','Project / Task','dropdown'),(75,13,NULL,'netAmount','Amount','numeric'),(76,13,NULL,'poDate','PO Date','date'),(77,13,NULL,'deliveryDate','Delivery Date','date'),(78,13,NULL,'createdBy','Submited By','input'),(79,13,NULL,'createdOn','Submited Date','input'),(80,13,12,'status','Internal Approval Status','dropdown'),(81,13,13,'vendorApprovalStatus','Vendor Approval Status','dropdown');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_state_template`
--

LOCK TABLES `common_grid_state_template` WRITE;
/*!40000 ALTER TABLE `common_grid_state_template` DISABLE KEYS */;
INSERT INTO `common_grid_state_template` VALUES (1,1,0,25,'50,100,307,307,307,307,307'),(2,3,0,25,'50,100,306,306,306,307,307'),(3,2,0,25,'50,100,255,268,246,256,256,256,256,256'),(4,4,0,25,'50,102,257,257,257,257,257,257,257,257'),(5,5,0,25,'50,100,220,218,214,218,218,219,219,219'),(6,6,0,25,'50,100,100,100,100'),(7,7,0,25,'50,100,210,155,155,155,155,155,155,155,155,155,145,145'),(8,8,0,25,'50,100,210,210,210,210,210,250,200,200'),(9,9,0,25,'50,100,210,210,210,210,181,181'),(10,10,0,25,'50,100,305,305,305,305,305,305,305'),(11,11,0,25,'50,100,260,210,210,210,210'),(12,12,0,25,'58,147,147,147,147,147,147'),(13,13,0,25,'50,100,220,218,214,218,218,219,219,219,219,219,219,219,219,219,219'),(14,14,0,25,'51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200'),(15,15,0,25,'50,100,220,215,215,215,215,215,215,215,215,215,215,215'),(16,16,0,25,'50,100,220,218,214,218,218,219,219,219,219'),(17,18,0,25,'210,210,210,210,210'),(18,19,0,25,'50,210,210,210,210,210,210'),(19,20,0,25,'210,210,210,210,210'),(20,21,0,25,'50,210,210,210,210,210,300,210'),(21,17,0,25,'50,100,218,218,218,218,218,218'),(22,23,0,25,'50,100,154,155,155,155,155,155,155,155,155'),(23,24,0,25,'50,100,218,214,218,218,219,219,219,219,219,219,219,219'),(24,22,0,25,'51,126,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200,200'),(25,25,0,25,'50,100,218,214,218,218,219,219,219'),(26,26,0,25,'100,210,210,210,210,210,210,210'),(27,27,0,25,'100,210,210,210,210,210'),(28,28,0,25,'100,210,210,210,210,210,210'),(29,29,0,25,'100,210,210,210,210,210'),(30,30,0,25,'100,210,210,210,210'),(31,31,0,25,'50,100,210,210,210,210,210,210'),(32,32,0,25,'50,50,100,210,210,135,135,180,180,180,180,210,210,180,210,210,145,180'),(33,33,0,25,'210,210,210,210,210,210,250,210,210,210'),(34,34,0,25,'50,200,200,200,200,50,210,210,210,210'),(35,35,0,25,'210,210,210,210,210,210,210,210,250,50'),(36,36,0,25,'50,50,100,210,135,180,145,145,160,145,145,210,210,210,135,135'),(37,37,0,25,'100,150,100,100,75,75,210,250,210,210'),(38,38,0,25,'135,210,210,210,210,210'),(39,39,0,25,'210,210,210,210,210,210,210'),(40,40,0,25,'50,100,250,210,210,210,210,210,210,210,210,210,210'),(41,41,0,25,'50,200,200,200,200,200,200,200,200'),(42,42,0,25,'0210,210,210,210,210,50,210,210,210,210'),(43,43,0,25,'50,210,135,180,180,180,180,135'),(44,44,0,25,'210,210,210,210,210,210'),(45,45,0,25,'50,210,210,135,135,180,180,180,210,180,210,180,210,210,145'),(46,46,0,25,'50,100,210,210,210,210,210'),(47,47,0,25,'210,210,210,210'),(48,48,0,25,'50,210,210,210,210'),(49,49,0,25,'100,210,210,210,210,210,210,210,210,210,210'),(50,50,0,25,'100,210,210,210,210'),(51,51,0,25,'50,100,210,210,210,210,210,210'),(52,52,0,25,'210,210,210,210,210'),(53,53,0,25,'50,100,210,210,210,210,350,210,210'),(54,54,0,25,'50,100,80,210,180,180,210,300,210,210,210,120,210,210'),(55,55,0,25,'50,100,210,180,180,210,210,300,210,210,210,120,210,210,210,210,210,210,210,210'),(56,56,0,25,'50,100,210,180,180,210,210,300,210,210,210,120,210,210,210,210,210,210,210'),(57,57,0,25,'210,210,210,210,210,100'),(58,58,0,25,'210,210,210,210,210'),(59,59,0,25,'50,210,210,210,210,210,300,210'),(60,60,0,25,'50,100,210,210,210,210,210'),(61,61,0,25,'210,210,210'),(62,62,0,25,'50,20'),(63,63,0,10,'50,20');
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
  PRIMARY KEY (`id`),
  KEY `FK1_TABLE_ID` (`grid_id`),
  CONSTRAINT `common_grid_state_user_wice_ibfk_1` FOREIGN KEY (`grid_id`) REFERENCES `common_grid_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_grid_template`
--

LOCK TABLES `common_grid_template` WRITE;
/*!40000 ALTER TABLE `common_grid_template` DISABLE KEYS */;
INSERT INTO `common_grid_template` VALUES (1,'ROLE_LIST'),(2,'USER_LIST'),(3,'APPROVAL_GROUP_LIST'),(4,'ACCOUNT_LIST'),(5,'ITEM_LIST'),(6,'SUB_ACCOUNT_LIST'),(7,'BILL_PAYMENT_LIST'),(8,'COMMUNITY_VENDOR_LIST'),(9,'VENDOR_REQUEST_LIST'),(10,'PROJECT_CODE_LIST'),(11,'ADDITIONAL_FIELD_LIST'),(12,'AUTOMATION_LIST'),(13,'PO_LIST'),(14,'BILL_LIST'),(15,'EXPENSE_LIST'),(16,'PO_RECEIPT_LIST'),(17,'VENDOR_INVITATION_LIST'),(18,'SYNC_ACCOUNT_PROCESSING_LIST'),(19,'SYNC_ACCOUNT_PENDING_LIST'),(20,'SYNC_ACCOUNT_COMPLETED'),(21,'SYNC_ACCOUNT_FAILED_LIST'),(22,'VENDOR_BILL_LIST'),(23,'VENDOR_BILL_PAYMENT_LIST'),(24,'VENDOR_PURCHASE_ORDER_LIST'),(25,'VENDOR_PO_RECEIPTS'),(26,'DISCOUNT_APPLICABLE_LIST'),(27,'PO_NUMBER_CONFIGURATION_LIST'),(28,'TGRID_BILL_LIST'),(29,'TGRID_PO_LIST'),(30,'TGRID_EXP_LIST'),(31,'OCR_BILL_TEMPLATE'),(32,'PAYMENT_APPROVED_BILL'),(33,'PAYMENT_UNDER_APPROVED_BILL'),(34,'PAYMENT_REVIEW'),(35,'PAYMENT_UNDER_REVIEW'),(36,'PAYMENT_BATCH_WISE'),(37,'PAYMENT_UNDER_BATCH_WISE'),(38,'PAYMENT_VENDOR_WISE'),(39,'PAYMENT_UNDER_VENDOR_WISE'),(40,'RECURRING_BILL_TEMPLATE_LIST'),(41,'BATCH_DETAIL_VIEW'),(42,'BATCH_UNDER_DETAIL_VIEW'),(43,'VENDOR_WISE_SUMMARY'),(44,'VENDOR_WISE_UNDER_SUMMARY'),(45,'PAYMENT_ADD_BILLS'),(46,'DEPARTMENT_LIST'),(47,'PROJECT_CODE_BILLS'),(48,'PO_PRICE_VARIANCE_LIST'),(49,'CREDIT_NOTE_LIST'),(50,'CREDIT_CARD_STATEMENT_UPLOAD_LIST'),(51,'CREDIT_CARD_STATEMENT_CREDIT_CARD_LIST'),(52,'SUPPORT_TICKET'),(53,'CREDIT_CARD_RECEIPT'),(54,'CREDIT_CARD_PROCESS_LIST'),(55,'CREDIT_CARD_TRANSACTION_LIST'),(56,'CREDIT_CARD_APPROVED_LIST'),(57,'CREDIT_CARD_RECEIPT_POPUP'),(58,'SYNC_ACCOUNT_COMPLETED_PULL'),(59,'SYNC_ACCOUNT_FAILED_PULL_LIST'),(60,'REMINDER_CONFIGURATION'),(61,'EXPENSE_MILEAGE_RATE'),(62,'TRANSACTION_LIST'),(63,'APPROVED_DOCUMENT_LIST');
/*!40000 ALTER TABLE `common_grid_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_inbox_attachment`
--

DROP TABLE IF EXISTS `common_inbox_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_inbox_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_url` varchar(255) DEFAULT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `segregated_status` char(1) DEFAULT NULL,
  `email_id` int(11) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `original_attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `common_inbox_attachment_common_inbox_email_id_fk` (`email_id`),
  KEY `common_inbox_email_vp_bill_id_fk` (`bill_id`),
  CONSTRAINT `common_inbox_attachment_common_inbox_email_id_fk` FOREIGN KEY (`email_id`) REFERENCES `common_inbox_email` (`id`),
  CONSTRAINT `common_inbox_email_vp_bill_id_fk` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_inbox_attachment`
--

LOCK TABLES `common_inbox_attachment` WRITE;
/*!40000 ALTER TABLE `common_inbox_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_inbox_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_inbox_attachment_history`
--

DROP TABLE IF EXISTS `common_inbox_attachment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_inbox_attachment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  `vendor_attachment_type` int(11) DEFAULT NULL,
  `document_attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `common_inbox_attachment_history_common_inbox_attachment_id_fk` (`attachment_id`),
  CONSTRAINT `common_inbox_attachment_history_common_inbox_attachment_id_fk` FOREIGN KEY (`attachment_id`) REFERENCES `common_inbox_attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_inbox_attachment_history`
--

LOCK TABLES `common_inbox_attachment_history` WRITE;
/*!40000 ALTER TABLE `common_inbox_attachment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_inbox_attachment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_inbox_email`
--

DROP TABLE IF EXISTS `common_inbox_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_inbox_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(150) DEFAULT NULL,
  `email_user_name` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `processed_status` char(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `received_date_time` datetime DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `mail_server_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_inbox_email`
--

LOCK TABLES `common_inbox_email` WRITE;
/*!40000 ALTER TABLE `common_inbox_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_inbox_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_company_approval_code`
--

DROP TABLE IF EXISTS `common_integration_company_approval_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_company_approval_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code_id` int(11) NOT NULL,
  `tp_company_id` varchar(300) NOT NULL,
  `tp_company_name` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_PROJECTCODE` (`project_code_id`) USING BTREE,
  CONSTRAINT `FK_PROJECTCODE` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_company_approval_code`
--

LOCK TABLES `common_integration_company_approval_code` WRITE;
/*!40000 ALTER TABLE `common_integration_company_approval_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_company_approval_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_config_property`
--

DROP TABLE IF EXISTS `common_integration_config_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_config_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `system_property` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_config_property`
--

LOCK TABLES `common_integration_config_property` WRITE;
/*!40000 ALTER TABLE `common_integration_config_property` DISABLE KEYS */;
INSERT INTO `common_integration_config_property` VALUES (1,6,'Department Dimension Code',0),(2,6,'Payment Journal Code(ACH)',0),(3,6,'Payment Journal Code(Cash)',0),(4,6,'Payment Journal Code(V Card)',0),(5,6,'Payment Journal Code(Credit Card)',0),(6,6,'Payment Journal Code(Check)',0);
/*!40000 ALTER TABLE `common_integration_config_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_config_value`
--

DROP TABLE IF EXISTS `common_integration_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_config_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integration_mst_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `config_property_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `PROP_ID_FK` (`config_property_id`) USING BTREE,
  CONSTRAINT `PROP_ID_FK` FOREIGN KEY (`config_property_id`) REFERENCES `common_integration_config_property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_config_value`
--

LOCK TABLES `common_integration_config_value` WRITE;
/*!40000 ALTER TABLE `common_integration_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_error`
--

DROP TABLE IF EXISTS `common_integration_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(200) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `error_detail` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_error`
--

LOCK TABLES `common_integration_error` WRITE;
/*!40000 ALTER TABLE `common_integration_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_failed_record`
--

DROP TABLE IF EXISTS `common_integration_failed_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_failed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(100) DEFAULT NULL,
  `papertrl_id` int(11) DEFAULT NULL,
  `system_short_code` varchar(30) DEFAULT NULL,
  `failed_reason` varchar(500) DEFAULT NULL,
  `reference_number` varchar(255) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `failed_date_time` datetime NOT NULL,
  `system_id` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `tp_company_id` varbinary(200) DEFAULT NULL,
  `record_status` varchar(1) DEFAULT NULL,
  `object_sync_mst_id` int(11) DEFAULT NULL,
  `incomplete_record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_failed_record`
--

LOCK TABLES `common_integration_failed_record` WRITE;
/*!40000 ALTER TABLE `common_integration_failed_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_failed_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_id_connection`
--

DROP TABLE IF EXISTS `common_integration_id_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_id_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `papertrl_id` int(11) NOT NULL,
  `tp_id` varchar(100) NOT NULL,
  `papertrl_parent_id` int(11) DEFAULT NULL,
  `tp_parent_id` varchar(100) DEFAULT NULL,
  `system_short_code` varchar(30) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `edit_sequence` varchar(200) DEFAULT NULL,
  `tp_company_id` varchar(300) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_id_connection`
--

LOCK TABLES `common_integration_id_connection` WRITE;
/*!40000 ALTER TABLE `common_integration_id_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_id_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_incomplete_record`
--

DROP TABLE IF EXISTS `common_integration_incomplete_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_incomplete_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_id` varchar(100) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `string_data` text DEFAULT NULL,
  `byte_data` mediumblob DEFAULT NULL,
  `system_short_code` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `attempt` int(11) NOT NULL,
  `tp_company_id` varchar(300) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_incomplete_record`
--

LOCK TABLES `common_integration_incomplete_record` WRITE;
/*!40000 ALTER TABLE `common_integration_incomplete_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_incomplete_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_service`
--

DROP TABLE IF EXISTS `common_integration_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `service_type` int(5) NOT NULL,
  `service_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_service`
--

LOCK TABLES `common_integration_service` WRITE;
/*!40000 ALTER TABLE `common_integration_service` DISABLE KEYS */;
INSERT INTO `common_integration_service` VALUES (1,'Push accounts to','A',1,1),(2,'Pull accounts from','A',2,1),(3,'Pull unit of measurements from','A',2,2),(4,'Push unit of measurements to','A',1,2),(5,'Push items to','A',1,3),(6,'Pull items from','A',2,3),(7,'Push project codes to','A',1,5),(8,'Pull project codes from','A',2,5),(9,'Push payment terms to','A',1,6),(10,'Pull payment terms from','A',2,6),(11,'Push vendors to','A',1,7),(12,'Pull vendors from','A',2,7),(13,'Push purchase orders to','A',1,8),(14,'Pull purchase orders from','A',2,8),(15,'Push bills to','A',1,9),(16,'Pull bills from','A',2,9),(17,'Push purchase order receipts to','A',1,10),(18,'Pull purchase order receipts from','A',2,10),(19,'Push payments to','A',1,11),(20,'Pull payments from','A',2,11),(21,'Push deleted records to','A',1,13),(22,'Pull deleted records from','A',2,13),(23,'Push expenses to','A',1,12),(24,'Pull item categories from','A',2,4),(25,'Push item categories to','A',1,4),(26,'Push departments to','A',1,14),(27,'Pull departments from','A',2,14),(28,'Push additional fields to','A',1,15),(29,'Pull additional fields from','A',2,15);
/*!40000 ALTER TABLE `common_integration_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_service_dependency`
--

DROP TABLE IF EXISTS `common_integration_service_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_service_dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `dependant_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_service_dependency`
--

LOCK TABLES `common_integration_service_dependency` WRITE;
/*!40000 ALTER TABLE `common_integration_service_dependency` DISABLE KEYS */;
INSERT INTO `common_integration_service_dependency` VALUES (1,5,1),(2,5,4),(3,5,11),(4,6,2),(5,6,3),(6,6,12),(24,13,5),(25,13,11),(26,13,7),(27,14,6),(28,14,12),(29,14,8),(30,17,13),(31,18,14),(32,15,1),(33,15,11),(34,15,5),(35,15,7),(36,15,13),(37,16,2),(38,16,6),(39,16,8),(40,16,12),(41,16,14),(42,19,11),(43,19,15),(44,20,12),(45,20,16),(46,23,1),(47,23,11),(48,23,5),(49,23,7),(51,15,9),(52,16,10),(53,21,1),(54,21,5),(55,21,7),(56,21,11),(57,21,13),(58,21,15),(59,21,17),(60,21,19),(61,21,23),(62,22,2),(63,22,6),(64,22,8),(65,22,12),(66,22,14),(67,22,16),(68,22,18),(69,22,20),(70,5,25),(71,6,24);
/*!40000 ALTER TABLE `common_integration_service_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_service_group`
--

DROP TABLE IF EXISTS `common_integration_service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_service_group`
--

LOCK TABLES `common_integration_service_group` WRITE;
/*!40000 ALTER TABLE `common_integration_service_group` DISABLE KEYS */;
INSERT INTO `common_integration_service_group` VALUES (1,'Chart of Accounts',1,1),(2,'UOMs',0,11),(3,'Items',1,8),(4,'Item Categories',0,12),(5,'Project Codes',1,9),(6,'Terms',0,13),(7,'Vendors',1,2),(8,'Purchase Orders',1,5),(9,'Bills',1,3),(10,'Purchase Order Receipts',1,6),(11,'Payments',1,4),(12,'Expenses',1,7),(13,'Deleted Records',1,10),(14,'Departments',0,14),(15,'Additional Fields',1,15);
/*!40000 ALTER TABLE `common_integration_service_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_service_status`
--

DROP TABLE IF EXISTS `common_integration_service_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_service_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `tp_company_id` varchar(300) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `syncable` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_service_status`
--

LOCK TABLES `common_integration_service_status` WRITE;
/*!40000 ALTER TABLE `common_integration_service_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_integration_service_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_integration_system_service`
--

DROP TABLE IF EXISTS `common_integration_system_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_integration_system_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_SERVICE` (`service_id`) USING BTREE,
  CONSTRAINT `FK_SERVICE` FOREIGN KEY (`service_id`) REFERENCES `common_integration_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_integration_system_service`
--

LOCK TABLES `common_integration_system_service` WRITE;
/*!40000 ALTER TABLE `common_integration_system_service` DISABLE KEYS */;
INSERT INTO `common_integration_system_service` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,2,1),(27,2,2),(28,2,5),(29,2,6),(30,2,7),(31,2,8),(32,2,9),(33,2,10),(34,2,11),(35,2,12),(36,2,13),(37,2,14),(38,2,15),(39,2,16),(41,2,20),(42,2,23),(43,2,24),(44,2,25),(45,3,1),(46,3,2),(47,3,3),(48,3,4),(49,3,5),(50,3,6),(51,3,7),(52,3,8),(53,3,9),(54,3,10),(55,3,11),(56,3,12),(57,3,13),(58,3,14),(59,3,15),(60,3,16),(61,3,17),(62,3,18),(64,3,20),(65,3,21),(66,3,22),(67,3,23),(68,3,24),(69,3,25),(70,4,2),(71,4,3),(72,4,4),(73,4,5),(74,4,6),(75,4,7),(76,4,8),(77,4,9),(78,4,10),(79,4,11),(80,4,12),(81,4,13),(82,4,14),(83,4,15),(84,4,16),(86,4,20),(87,4,21),(88,4,23),(89,4,24),(90,4,25),(91,2,21),(92,1,26),(93,1,27),(94,2,26),(95,2,27),(96,3,26),(97,3,27),(98,4,26),(99,4,27),(100,2,22),(101,4,22),(102,4,1),(103,4,18),(104,4,28),(105,4,29),(107,5,2),(108,5,3),(111,5,6),(112,5,7),(113,5,8),(115,5,10),(116,5,11),(117,5,12),(118,5,13),(119,5,14),(120,5,15),(121,5,16),(126,5,21),(128,5,23),(132,5,27),(134,5,29),(135,6,2),(136,6,3),(137,6,4),(138,6,5),(139,6,6),(140,6,7),(141,6,8),(142,6,9),(143,6,10),(144,6,11),(145,6,12),(146,6,13),(147,6,14),(148,6,15),(149,6,16),(150,6,20),(151,6,21),(152,6,23),(153,6,24),(154,6,25),(155,6,26),(156,6,27),(157,6,22),(158,6,1),(159,6,18),(160,6,28),(161,6,29),(162,7,1),(163,7,2),(164,7,3),(165,7,4),(166,7,6),(167,7,9),(168,7,10),(169,7,12),(170,7,13),(171,7,14),(172,7,15),(173,7,16),(174,7,20),(175,7,21),(176,7,22),(177,7,28),(178,7,29),(179,7,24),(180,7,26),(181,7,27),(182,7,7),(183,7,8),(184,7,23),(185,6,19);
/*!40000 ALTER TABLE `common_integration_system_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_attachment`
--

DROP TABLE IF EXISTS `common_item_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_attachment` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `image_data` mediumblob DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `product_mst_id` int(15) NOT NULL,
  `item_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_attachment_common_product_mst` (`product_mst_id`),
  CONSTRAINT `FK_common_product_attachment_common_product_mst` FOREIGN KEY (`product_mst_id`) REFERENCES `common_item_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_attachment`
--

LOCK TABLES `common_item_attachment` WRITE;
/*!40000 ALTER TABLE `common_item_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_category`
--

DROP TABLE IF EXISTS `common_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_category` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_category`
--

LOCK TABLES `common_item_category` WRITE;
/*!40000 ALTER TABLE `common_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_import_issue`
--

DROP TABLE IF EXISTS `common_item_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_product_import_issue_common_product_import_mst` (`import_mst_id`),
  CONSTRAINT `FK_common_product_import_issue_common_product_import_mst` FOREIGN KEY (`import_mst_id`) REFERENCES `common_item_import_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_import_issue`
--

LOCK TABLES `common_item_import_issue` WRITE;
/*!40000 ALTER TABLE `common_item_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_import_mst`
--

DROP TABLE IF EXISTS `common_item_import_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_import_mst` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_import_mst`
--

LOCK TABLES `common_item_import_mst` WRITE;
/*!40000 ALTER TABLE `common_item_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_import_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_mst`
--

DROP TABLE IF EXISTS `common_item_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_mst` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `item_number` varchar(50) NOT NULL,
  `partner_service` tinyint(1) DEFAULT 0,
  `taxable` tinyint(1) DEFAULT NULL,
  `buying_price` decimal(19,2) DEFAULT NULL,
  `sales_price` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `purchase_description` varchar(255) DEFAULT NULL,
  `sales_description` varchar(255) DEFAULT NULL,
  `inventory_asset_account` int(11) DEFAULT NULL,
  `income_account` int(11) DEFAULT NULL,
  `expense_account` int(11) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) NOT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sub_level` int(5) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_product_type` (`product_type_id`),
  CONSTRAINT `FK__common_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `common_item_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_mst`
--

LOCK TABLES `common_item_mst` WRITE;
/*!40000 ALTER TABLE `common_item_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_type`
--

DROP TABLE IF EXISTS `common_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_type`
--

LOCK TABLES `common_item_type` WRITE;
/*!40000 ALTER TABLE `common_item_type` DISABLE KEYS */;
INSERT INTO `common_item_type` VALUES (1,'Inventory','Product you buy and/or sell and that you track quantities of.','A','fa fa-shopping-basket'),(2,'Non-Inventory','Product you buy and/or sell but don\'t need to (or can\'t) track quantities of, for example, nuts and bolts used in an installation.','A','fa fa-archive'),(3,'Service','Service that you provide to customers, for example, landscaping or tax preparation service.','A','fa fa-taxi'),(4,'Other','Use for miscellaneous labor, material, or part charges, such as delivery charges, setup fees, and service charges.','A','fa fa-ellipsis-h');
/*!40000 ALTER TABLE `common_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_item_vendor_wise`
--

DROP TABLE IF EXISTS `common_item_vendor_wise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_item_vendor_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `vendor_item_description` varchar(255) DEFAULT NULL,
  `vendor_item_price` decimal(19,2) DEFAULT NULL,
  `lead_time` varchar(200) DEFAULT NULL,
  `min_order_qty` decimal(19,2) DEFAULT NULL,
  `vendor_item_image_url` varchar(255) DEFAULT NULL,
  `item_mst_id` int(11) NOT NULL,
  `image_file_type` varchar(500) DEFAULT NULL,
  `image_file_name` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_item_vendor_wise`
--

LOCK TABLES `common_item_vendor_wise` WRITE;
/*!40000 ALTER TABLE `common_item_vendor_wise` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_item_vendor_wise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_merchant_base_memorization`
--

DROP TABLE IF EXISTS `common_merchant_base_memorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_merchant_base_memorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MERCHANT_ACCOUNT_FK` (`account_id`),
  CONSTRAINT `MERCHANT_ACCOUNT_FK` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_merchant_base_memorization`
--

LOCK TABLES `common_merchant_base_memorization` WRITE;
/*!40000 ALTER TABLE `common_merchant_base_memorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_merchant_base_memorization` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `FK_notification_subscription_event` (`event_id`),
  CONSTRAINT `FK_notification_subscription_event` FOREIGN KEY (`event_id`) REFERENCES `common_notification_subscription_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_email_template`
--

LOCK TABLES `common_notification_email_template` WRITE;
/*!40000 ALTER TABLE `common_notification_email_template` DISABLE KEYS */;
INSERT INTO `common_notification_email_template` VALUES (1,'BILL_SUBMITTED_TO_DIRECT_APPROVER','Bill (BILL-NO) has submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Bill Number <span id=\"BILL_NUMBER\" > Bill Number </span> of <span id=\"VENDOR_NAME\" > Vendor Name </span> has been submitted by <span id=\"SUBMITTED_BY\" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Bill.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',1,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(2,'BILL_APPROVED','Bill (BILL-NO) has approved ','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Bill <span id=\"BILL_NUMBER\" > Bill Number </span> has been approved by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',2,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(3,'BILL_REJECTED','Bill (BILL-NO) has rejected','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Bill <span id=\"BILL_NUMBER\" > Bill Number </span> has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span> due to <span style=\"color:red\" id=\"REASON\"> Reject Reason </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',3,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(4,'EXPENSE_SUBMITTED_TO_DIRECT_APPROVER','Expense report (EXPENSE-NAME) has submitted for your approval ','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n				<td><ul></ul><ul></ul>Expense Report <span id=\"REPORT_NAME\" > Report Name </span> has been submitted by <span id=\"SUBMITTED_BY\" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the expense report.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',7,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(5,'EXPENSE_APPROVED','Expense Report (EXPENSE-NAME) has approved ','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of  submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul> Your submitted expense report <span id=\"REPORT_NAME\" > Expense Report Name </span>  has been approved by <span id=\"APPROVER_NAME\" > Assigned approver </span>.</td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',8,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(6,'EXPENSE_REJECTED','Expense Report  (EXPENSE-NAME) has rejected','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of  submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n				<td><ul></ul><ul></ul>Expense Report <span id=\"REPORT_NAME\" > Report Name </span> has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span> due to <span style=\"color:red\" id=\"REASON\"> Reject Reason </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',9,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(7,'PO_SUBMITTED_TO_DIRECT_APPROVER','Purchase order (PO-NO) has  submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\" > Purchase Order Number </span> has been submitted by <span id=\"SUBMITTED_BY\" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',4,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(8,'PO_APPROVED','Purchase Order (PO-NO) has approved ','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\" > Purchase Order Number </span> has been approved by <span id=\"APPROVER_NAME\" > Assigned approver</span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',5,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(9,'PO_REJECTED','Purchase Order (PO-NO) has rejected','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of submitted person</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\" > Purchase Order Number </span> has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span> due to <span style=\"color:red\" id=\"REASON\"> Reject Reason</span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',6,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(10,'RECEIVED_PAYMENT','Payment Recived For (BILL-NO)','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of Vendor</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>You have received <span id=\"RECEIVED_AMOUNT\"> Received Amount</span> for <span id=\"BILL_NUMBER\" > Bill Number</span> from <span id=\"CUSTOMER_NAME\"> Customer Name </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',10,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(11,'BILL_SUBMITTED_TO_APPROVAL_GROUP','Bill (BILL-NO) has submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Invoice Number <span id=\"BILL_NUMBER\" > Invoice Number </span> has been submitted by <span id=\"VENDOR_NAME\" > Vendor Name </span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the invoice.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',13,'A','admin','2021-05-26',NULL,NULL,NULL,NULL),(12,'BILL_ASSIGNEE_LIST_EMPTY','No users found in the approval group to approve','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Bill number <span id=\"BILL_NUMBER\">001255</span> has been submitted by <span id=\"CREATED_BY\">created by</span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',14,'A','admin','2021-05-26',NULL,NULL,NULL,NULL),(13,'PO_SUBMITTED_TO_APPROVAL_GROUP','Purchase Order (PO-NO) has submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\" > Purchase Order Number </span> has been submitted by <span id=\"SUBMITTED_BY\"> Name of Submitted Person </span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',15,'A','admin','2021-05-28',NULL,NULL,NULL,NULL),(14,'PO_ASSIGNEE_LIST_EMPTY','No user found in the approval group to approve','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\">001255</span> has been submitted by <span id=\"CREATED_BY\">created by</span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',16,'A','admin','2021-05-28',NULL,NULL,NULL,NULL),(15,'PO_SUBMITTED_TO_VENDOR_APPROVAL','Purchase Order (PO-NO) has submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of the vendor</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\" > Purchase Order Number </span> has been submitted by <span id=\"SUBMITTED_BY\" > Name of Submitted Person </span> for your approval. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the Purchase Order.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',16,'A','admin','2021-05-28',NULL,NULL,NULL,NULL),(16,'EXPENSE_SUBMITTED_TO_APPROVAL_GROUP','Expense (EXPENSE-NAME) has submitted for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Expense Report <span id=\"REPORT_NAME\" > Expense Report Name </span> has been submitted by <span id=\"SUBMITTED_BY\" > Name of the submitted person </span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the expense report.</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',17,'A','admin','2021-05-29',NULL,NULL,NULL,NULL),(17,'EXPENSE_ASSIGNEE_LIST_EMPTY','No users found in the approval group to approve','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Expense report  <span id=\"REPORT_NAME\" > Expense Report Name </span> has been submitted by <span id=\"CREATED_BY\">created by</span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a id=\"URL\" href=\"\">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',18,'A','admin','2021-05-29',NULL,NULL,NULL,NULL),(18,'BULCK_BILL_REJECTED','Bill (BILL-NO) has rejected','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of uploader</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul>Bill <span id=\"BILL_NUMBER\" > Bill Number </span> has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',3,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(19,'BULCK_EXPENSE_REJECTED','Expense Report  (EXPENSE-NAME) has rejected','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of  submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\"> 				<td><ul></ul><ul></ul>Expense Report <span id=\"REPORT_NAME\" > Report Name </span> has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',9,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(20,'BULCK_PO_REJECTED','Purchase Order (PO-NO) has rejected','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul>Purchase Order <span id=\"PO_NUMBER\" > Purchase Order Number </span> has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',6,'A','admin','2021-05-25',NULL,NULL,NULL,NULL),(21,'VENDOR_REQUEST_FOR_APPROVAL','A vendor request received for your approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold;\">Dear <span id=\"APPROVER_NAME\">Approver Name</span>,</td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td><span id=\"INVITED_BY\" style=\"font-weight: bold;\"> Vendor Business Name </span> vendor likes to add you as their customer in PaperTrl.</td>\r\n            </tr>\r\n            <tr>\r\n                <td>To view this request and for further actions please visit <a id=\"URL\" href=\"\">PaperTrl.com</a> <span id=\"ACCOUNT_NAME\"></span> ( <b>Vendor Requests</b> tab under <b>Vendors</b> )</td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    For any further clarifications, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr style=\"margin-top: 65px;\">\r\n                <td>\r\n                    <span style=\"font-weight: bold;\">\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        <ul></ul>\r\n                        Thank You,\r\n                    </span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td><img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /></td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 8pt; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10pt; font-family: \'Helvetica\', sans-serif; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n            <tr>\r\n                <td></td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',19,'A','admin','2021-06-23',NULL,NULL,NULL,NULL),(22,'AUTOMATION_EMAIL_TEMPLATE','Automation email','<html> <head>     <meta charset=\"UTF-8\">     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> </head>  <body> 	<table style=\"color: #207580;\"> 	 	<tr>        <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_ADDRESS\">Email address</span>,</td>     </tr> 	<tr style=\"height:20px\"><tr> 	<tr>      <td>  	 <span id=\"EMAIL_CONTENT\" >Email Content here</span> 	 </td>     </tr> 	<tr style=\"height:10px\"><tr> 	<tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>     </tr> 	 	<tr style=\"line-height: 70px;\">                 <td>                     <span style=\"font-weight: bold\">Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr> 	 	 	<table>  </body> </html>',NULL,'A','admin','2021-08-04',NULL,NULL,NULL,NULL),(23,'PAYMENT_REQUEST_SUBMITTED_TO_DIRECT_APPROVER','Payment request has submitted for your approval','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul> A payment request has been submitted by <span id=\"SUBMITTED_BY\" > Name of Submitted Person </span> for your approval. </td>             </tr> 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the payment request.</td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',10,'A','admin','2021-09-22',NULL,NULL,NULL,NULL),(24,'PAYMENT_REQUEST_SUBMITTED_TO_APPROVAL_GROUP','Payment request has submitted for your approval group','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul>A payment request has been submitted by <span id=\"SUBMITTED_BY\" > Name of Submitted Person </span> for the approval of <span id=\"APPROVAL_GROUP\">Name of the Approval Group</span> approval group. </td>             </tr> 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the payment request.</td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',11,'A','admin','2021-09-22',NULL,NULL,NULL,NULL),(25,'PAYMENT_REQUEST_APPROVED','Payment request has approved','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of the submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul>A payment request that you have submitted has been approved by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>             </tr> 			 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to see more details.</td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr> 			 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td> <span style=\"color:#fc6d26\"> NOTICE : The system will automatically process further steps on your payment request. Kindly note that it can take up to 3 - 5 business days for the funds to get credited. </span>. </td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr> 			             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',20,'A','admin','2021-09-22',NULL,NULL,NULL,NULL),(26,'PAYMENT_REQUEST_REJECTED','Payment request has rejected','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\"> 				<td><ul></ul><ul></ul>A payment request that you have submitted has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span> due to <span style=\"color:red\" id=\"REASON\"> Reject Reason </span>. </td>             </tr> 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to see more details.</td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr> 			             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',21,'A','admin','2021-09-22',NULL,NULL,NULL,NULL),(27,'PAYMENT_REQUEST_ASSIGNEE_LIST_EMPLTY','No user found in the approval group to approval','<html>   <head>     <meta charset=\"UTF-8\">     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">   </head>   <body>     <table style=\"color: #207580;\">       <tr>         <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of admin users</span>, </td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr style=\"margin-left: 250px\">         <td>           <ul></ul>           <ul></ul>A payment request has been submitted by <span id=\"CREATED_BY\">created by</span> for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> approval group, But there is no user found in this approval group.         </td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\">             <a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a>           </span>         </td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr style=\"margin-top: 65px\">         <td>           <span style=\"font-weight: bold\">             <ul></ul>             <ul></ul>             <ul></ul>             <ul></ul>Thank You!           </span>         </td>       </tr>       <tr>         <td>           <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />         </td>       </tr>       <tr>         <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>           <p class=\"MsoNormal\">             <span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span>             <span style=\"font-size:8.0pt;color:#014708\"></span>           </p>           <p>             <span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span>             <span style=\"color:black\"></span>             <span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span>             <u></u>             <u></u>           </p>         </td>       </tr>     </table>   </body> </html>',22,'A','admin','2021-09-22',NULL,NULL,NULL,NULL),(28,'PAYMENT_SUCCESSFULLY_COMPLETED','Payment successfully completed','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of the submitted person</span>,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul>Payment (<span id=\"PAY_REF\">Payment Reference</span>) of Bill (<span id=\"BILL_NUMBER\">Bill Number</span>) has been successfully completed. </td>             </tr> 			 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to see more details.</td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr> 			 		             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',23,'A','admin','2021-09-23',NULL,NULL,NULL,NULL),(29,'PAYMENT_FAILED','Payment failed','<html>    <head>       <meta charset=\"UTF-8\">       <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">    </head>    <body>       <table style=\"color: #207580;\">          <tr>             <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of the submitted person</span>,</td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr style=\"margin-left: 250px\">             <td>                <ul></ul>                <ul></ul>                Payment (<span id=\"PAY_REF\"> Payment Reference </span>) of Bill (<span id=\"BILL_NUMBER\"> Bill Number </span>) has been failed due to <span id=\"FAIL_REASON\" style=\"color:red\"> Fail Reason</span>             </td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to see more details.</td>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr>             <td></td>          </tr>          <tr style=\"margin-top: 65px\">             <td>                <span style=\"font-weight: bold\">                   <ul></ul>                   <ul></ul>                   <ul></ul>                   <ul></ul>                   Thank You!                </span>             </td>          </tr>          <tr>             <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>          </tr>          <tr>             <td>                This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>             </td>          </tr>       </table>    </body> </html>',24,'A','admin','2021-09-23',NULL,NULL,NULL,NULL),(30,'SEND_PAYMENT_SUPPORT_TEAM_EMAIL','Payment support request','<html>     <head>         <meta charset=\"UTF-8\">         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">     </head>     <body>         <table style=\"color: #207580;\">             <tr>                 <td style=\"font-weight: bold\">Dear Support Team,</td>             </tr>             <tr> <td></td> </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-left: 250px\">                 <td><ul></ul><ul></ul>   				<span id=\"SUBMITTED_BY\" style=\"font-weight: bold;\"> Name of Submitted Person </span> has requested to be configured with  				<span id=\"PAYMENT_PROVIDER\" style=\"font-weight: bold;\"> Name of the Payment provider </span> provider for <span id=\"CLIENT_NAME\" style=\"font-weight: bold;\"> Name of the Customer</td>             </tr> 			<tr><td></td></tr> 			<tr><td></td></tr> 			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to configure the payment provider.</td>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr>                 <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>             </tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr><td></td></tr>             <tr style=\"margin-top: 65px\">                 <td>                     <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>                 </td>             </tr>             <tr>                 <td>                     <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>                 </td>             </tr>             <tr>                 <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>                     <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that                             is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information                             herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>                     <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">                         </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>                 </td>             </tr>         </table>     </body> </html>',NULL,'A','admin','2021-09-28',NULL,NULL,NULL,NULL),(31,'SEND_INBOX_EMAIL_CHANGE_REQUEST_EMAIL','Customer inbox email change request','<html><head> <meta charset=\"UTF-8\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head><body> <table style=\"color: #207580;\"> <tr> <td style=\"font-weight: bold\">Dear Support Team,</td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td> <ul></ul> <ul></ul> <span id=\"CLIENT_NAME\" style=\"font-weight: bold;\"> company(pvt)Ltd </span> has requested to change their inbox email address to <span id=\"REQUESTED_EMAIL\" style=\"font-weight: bold;\"> new_email@test.com </span> </td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr> <td></td> </tr> <tr style=\"margin-top: 65px\"> <td> <span style=\"font-weight: bold\"> <ul></ul> <ul></ul> <ul></ul> <ul></ul> Thank You! </span> </td> </tr> <tr> <td> <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" /> </td> </tr> <tr> <td> This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span> <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p> <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\"> </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p> </td> </tr> </table></body></html>',NULL,'A','admin','2021-12-02',NULL,NULL,NULL,NULL),(32,'PO_TO_VENDOR','To whom it may concern','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Hello</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul> <span id=\"MAILED_BY\" > </span> has sent you the PO attachment of Purchase Order <span id=\"PO_NUMBER\"> </span> for your reference </td>\r\n            </tr>\r\n			\r\n			\r\n			<tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',NULL,'A','admin','2022-02-21',NULL,NULL,NULL,NULL),(33,'TRANSACTION_SUBMITTED_DIRECT_APPROVER','Credit transaction(s) submitted for you approval','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul> <span id=\"COUNT\" > </span> credit transaction(s) has been submitted for your approval.</td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the tansaction(s).</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',29,'A','admin','2022-06-02',NULL,NULL,NULL,NULL),(34,'TRANSACTION_ASSIGNEE_LIST_EMPTY','No users found in the approval group to approve','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">User\'s Name</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul><span id=\"CREATED_BY\"></span>has submitted credit transaction(s) for the approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> approval group, But there is no user found in this approval group. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',30,'A','admin','2022-06-02',NULL,NULL,NULL,NULL),(35,'TRANSACTION_SUBMITTED_TO_APPROVAL_GROUP','Credit transaction(s) submitted for you approval group','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of assigned approver</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul><span id=\"COUNT\"></span> credit transaction(s) has been submitted for your approval of <span id=\"APPROVAL_GROUP\">Project Manager</span> Approval Group. </td>\r\n            </tr>\r\n			<tr><td></td></tr>\r\n			<tr><td></td></tr>\r\n			<td>Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to Approve or Reject the tansaction(s).</td>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',31,'A','admin','2022-06-02',NULL,NULL,NULL,NULL),(36,'TRANSACTION_REJECTED','Your credit transaction(s) has rejected','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Your credit transaction(s) has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span> due to <span style=\"color:red\" id=\"REASON\"> Reject Reason </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',32,'A','admin','2022-06-02',NULL,NULL,NULL,NULL),(37,'BULK_TRANSACTION_REJECTED','Your credit transaction(s) has rejected','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Your credit transaction(s) has been rejected by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',32,'A','admin','2022-06-02',NULL,NULL,NULL,NULL),(38,'TRANSACTION_APPROVED','Your credit transaction(s) has approved','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    </head>\r\n    <body>\r\n        <table style=\"color: #207580;\">\r\n            <tr>\r\n                <td style=\"font-weight: bold\">Dear <span id=\"EMAIL_SEND_TO\">name of uploader</span>,</td>\r\n            </tr>\r\n            <tr> <td></td> </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-left: 250px\">\r\n                <td><ul></ul><ul></ul>Your credit transaction(s) has been approved by <span id=\"APPROVER_NAME\" > Assigned approver </span>. </td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr>\r\n                <td>If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span></td>\r\n            </tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr><td></td></tr>\r\n            <tr style=\"margin-top: 65px\">\r\n                <td>\r\n                    <span style=\"font-weight: bold\"><ul></ul><ul></ul><ul></ul><ul></ul>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <img style=\"width: 170px;height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\"/>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style=\"font-weight: bold\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\"><span style=\"font-size:8.0pt;color:#207580\">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that\r\n                            is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information\r\n                            herein. If you have received this message in error, please advise the sender immediately.</span><span style=\"font-size:8.0pt;color:#014708\"></span></p>\r\n                    <p><span style=\"font-size:18.0pt;font-family:Webdings;color:green\">P</span><span style=\"color:black\">\r\n                        </span><span style=\"font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u></p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>',33,'A','admin','2022-06-02',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `common_notification_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_message`
--

DROP TABLE IF EXISTS `common_notification_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_type_name` varchar(50) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `notification_message` varchar(100) NOT NULL,
  `clickable` tinyint(4) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_message_notification_subscription_type` (`notification_type_id`),
  KEY `FK_common_notification_message_common_event` (`event_id`),
  CONSTRAINT `FK_common_message_notification_subscription_type` FOREIGN KEY (`notification_type_id`) REFERENCES `common_notification_subscription_type` (`id`),
  CONSTRAINT `FK_common_notification_message_common_event` FOREIGN KEY (`event_id`) REFERENCES `common_notification_subscription_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_message`
--

LOCK TABLES `common_notification_message` WRITE;
/*!40000 ALTER TABLE `common_notification_message` DISABLE KEYS */;
INSERT INTO `common_notification_message` VALUES (1,'Bill',1,'has submitted for your approval',1,1),(2,'Bill',1,'has approved',1,2),(3,'Bill',1,'has rejected',1,3),(4,'Bill',1,'has submitted for your approval group',1,13),(5,'Bill',1,'no users in an assigned approval group',0,14),(6,'Expense',4,'has submitted for your approval',1,7),(7,'Expense',4,'has approved',1,8),(8,'Expense',4,'has rejected',1,9),(9,'Expense',4,'has submitted for your approval group',1,17),(10,'Expense',4,'no users in an assigned approval group',0,18),(11,'Purchase order',2,'has submitted for your approval',1,4),(12,'Purchase order',2,'has approved',1,5),(13,'Purchase order',2,'has rejected',1,6),(14,'Purchase order',2,'has submitted for your approval group',1,15),(15,'Purchase order',2,'no users in an assigned approval group',0,16),(16,'Vendor request ',6,'has requested your approval',1,19),(17,'Payment request',5,'has submitted for your approval',1,10),(18,'Payment request',5,'has submitted for your approval group',1,11),(19,'Payment request',5,'has approved',1,20),(20,'Payment request',5,'has rejected',1,21),(21,'Payment request',5,'has no users in an assigned approval group',1,22),(22,'Payment',5,'has successfully completed',1,23),(23,'Payment',5,'has payment failed',1,24),(24,'Credit note',8,'has submitted',1,25),(25,'Credit note',8,'has deleted',0,26),(26,'Credit note',8,'has canceled',1,27),(27,'Credit card transaction',9,'credit transaction(s) have been uploaded to the system to be processed',1,28),(28,'Credit card transaction',9,'credit transaction(s) has been submitted for your approval.',1,29),(29,'Credit card transaction',9,'no users in an assigned approval group',0,30),(30,'Credit card transaction',9,'credit transaction(s) has been submitted for your approval group',1,31),(31,'Credit card transaction',9,'credit transactions rejected',1,32),(32,'Credit card transaction',9,'Credit transactions approved',1,33),(33,'Credit card transaction',10,'A receipt has been uploaded by EMPLOYEE_NAME on your behalf',1,35);
/*!40000 ALTER TABLE `common_notification_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_mst`
--

DROP TABLE IF EXISTS `common_notification_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `reference_status` char(1) DEFAULT '',
  `clickable` tinyint(4) NOT NULL,
  `to_user` varchar(50) NOT NULL,
  `notification_type_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `tenant_id` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_mst`
--

LOCK TABLES `common_notification_mst` WRITE;
/*!40000 ALTER TABLE `common_notification_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_notification_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_subscription_event`
--

DROP TABLE IF EXISTS `common_notification_subscription_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_subscription_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(150) NOT NULL,
  `enable_notification` tinyint(1) NOT NULL DEFAULT 0,
  `enable_email` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(1) NOT NULL,
  `subscription_type_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_notification_subscription_type` (`subscription_type_id`),
  CONSTRAINT `FK_common_notification_subscription_type` FOREIGN KEY (`subscription_type_id`) REFERENCES `common_notification_subscription_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_subscription_event`
--

LOCK TABLES `common_notification_subscription_event` WRITE;
/*!40000 ALTER TABLE `common_notification_subscription_event` DISABLE KEYS */;
INSERT INTO `common_notification_subscription_event` VALUES (1,'A bill is submitted for your approval',1,1,'A',1),(2,'A bill you submitted is approved',1,1,'A',1),(3,'A bill you submitted is rejected',1,1,'A',1),(4,'A purchase order is submitted for your approval',1,1,'A',2),(5,'A purchase order you submitted is approved',1,1,'A',2),(6,'A purchase order you submitted is rejected',1,1,'A',2),(7,'An expense report is submitted for your approval',1,1,'A',4),(8,'An expense report you submitted is approved',1,1,'A',4),(9,'An expense report you submitted is rejected',1,1,'A',4),(10,'A payment request submitted for your approval',1,1,'A',5),(11,'A payment is submitted for your approval group',1,1,'A',5),(12,'When System creates new vendor',1,0,'A',6),(13,'A bill is submitted for your approval group',1,1,'A',1),(14,'There are no users in an assigned approval group',1,1,'A',1),(15,'A purchase order is submitted for your approval group',1,1,'A',2),(16,'There are no users in an assigned approval group',1,1,'A',2),(17,'An expense report is submitted for your approval group',1,1,'A',4),(18,'There are no users in an assigned approval group',1,1,'A',4),(19,'A vendor request your approval',1,1,'A',6),(20,'A payment request you submitted is approved',1,1,'A',5),(21,'A payment request you submitted is rejected',1,1,'A',5),(22,'There are no users in an assigned approval group',1,1,'A',5),(23,'When payment successfully completed',1,1,'A',5),(24,'When payment failed',1,1,'A',5),(25,'A credit note is submitted',1,0,'A',8),(26,'A credit note is deleted',1,0,'A',8),(27,'A credit note is canceled',1,0,'A',8),(28,'Your credit transaction list has been uploaded to the system',1,0,'A',9),(29,'Transaction(s) submitted for your approval',1,1,'A',9),(30,'There are no users in an assigned approval group',1,1,'A',9),(31,'Transaction(s) submitted for your approval group',1,1,'A',9),(32,'Transaction(s) you submitted is rejected',1,1,'A',9),(33,'Transaction(s) you submitted is approved',1,1,'A',9),(35,'A receipt upload by someone else on your behalf',1,0,'A',10);
/*!40000 ALTER TABLE `common_notification_subscription_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_subscription_privilege`
--

DROP TABLE IF EXISTS `common_notification_subscription_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_subscription_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_event_id` int(15) NOT NULL,
  `menu_privilege` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_privilege_common_notification_subscription_event` (`subscription_event_id`),
  KEY `FK_privilege_umm_menu_privilage` (`menu_privilege`),
  CONSTRAINT `FK_privilege_common_notification_subscription_event` FOREIGN KEY (`subscription_event_id`) REFERENCES `common_notification_subscription_event` (`id`),
  CONSTRAINT `FK_privilege_umm_menu_privilage` FOREIGN KEY (`menu_privilege`) REFERENCES `umm_menu_privilage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_subscription_privilege`
--

LOCK TABLES `common_notification_subscription_privilege` WRITE;
/*!40000 ALTER TABLE `common_notification_subscription_privilege` DISABLE KEYS */;
INSERT INTO `common_notification_subscription_privilege` VALUES (1,1,64),(2,1,66),(3,1,119),(4,2,61),(5,2,62),(6,3,61),(7,3,62),(8,13,64),(9,13,66),(10,13,119),(11,14,119),(12,4,88),(13,4,89),(14,4,120),(15,5,84),(16,6,84),(17,15,88),(18,15,89),(19,15,120),(20,16,120),(21,7,105),(22,7,106),(23,7,111),(24,8,102),(25,9,102),(26,17,105),(27,17,106),(28,17,111),(29,18,111),(30,19,58),(31,10,402),(32,10,403),(33,10,404),(34,10,405),(35,11,402),(36,11,403),(37,11,404),(38,11,405),(39,20,402),(40,20,403),(41,20,404),(42,20,405),(43,21,402),(44,21,403),(45,21,404),(46,21,405),(47,22,402),(48,22,403),(49,22,404),(50,22,405),(51,23,402),(52,23,403),(53,23,404),(54,23,405),(55,24,402),(56,24,403),(57,24,404),(58,24,405),(59,25,478),(60,25,479),(61,25,480),(62,25,481),(63,25,482),(64,26,478),(65,26,479),(66,26,480),(67,26,481),(68,26,482),(69,27,478),(70,27,479),(71,27,480),(72,27,481),(73,27,482),(74,29,497),(75,30,497),(76,31,497),(77,32,497),(78,33,497),(79,29,499),(80,30,499),(81,31,499),(82,32,499),(83,33,499),(84,29,500),(85,30,500),(86,31,500),(87,32,500),(88,33,500),(89,29,501),(90,30,501),(91,31,501),(92,32,501),(93,33,501),(94,29,502),(95,30,502),(96,31,502),(97,32,502),(98,33,502),(99,29,503),(100,30,503),(101,31,503),(102,32,503),(103,33,503),(104,29,504),(105,30,504),(106,31,504),(107,32,504),(108,33,504),(109,29,505),(110,30,505),(111,31,505),(112,32,505),(113,33,505),(114,29,507),(115,30,507),(116,31,507),(117,32,507),(118,33,507),(119,35,516);
/*!40000 ALTER TABLE `common_notification_subscription_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_subscription_type`
--

DROP TABLE IF EXISTS `common_notification_subscription_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_subscription_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_subscription_type`
--

LOCK TABLES `common_notification_subscription_type` WRITE;
/*!40000 ALTER TABLE `common_notification_subscription_type` DISABLE KEYS */;
INSERT INTO `common_notification_subscription_type` VALUES (1,'Bill','A'),(2,'Purchase Order','A'),(3,'Purchase Order Receipt','A'),(4,'Expense','A'),(5,'Payment','A'),(6,'Vendor','A'),(8,'Credit Note','A'),(9,'Credit Card Statements','A'),(10,'Receipt','A');
/*!40000 ALTER TABLE `common_notification_subscription_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_notification_subscription_user_wise`
--

DROP TABLE IF EXISTS `common_notification_subscription_user_wise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_notification_subscription_user_wise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `enable_notification` tinyint(4) NOT NULL DEFAULT 0,
  `enable_email` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_on` date NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` date DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_notification_subscription_user_wise`
--

LOCK TABLES `common_notification_subscription_user_wise` WRITE;
/*!40000 ALTER TABLE `common_notification_subscription_user_wise` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_notification_subscription_user_wise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_object_received_mst`
--

DROP TABLE IF EXISTS `common_object_received_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_object_received_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `papertrl_id` int(11) NOT NULL,
  `tp_id` varbinary(200) NOT NULL,
  `object_type` varchar(200) NOT NULL,
  `system_id` int(11) NOT NULL,
  `system_name` varchar(200) NOT NULL,
  `record_status` varchar(1) NOT NULL,
  `reference_no` varchar(200) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `sync_date_time` datetime NOT NULL,
  `tp_company_id` varbinary(200) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_object_received_mst`
--

LOCK TABLES `common_object_received_mst` WRITE;
/*!40000 ALTER TABLE `common_object_received_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_object_received_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_object_sync_date_time`
--

DROP TABLE IF EXISTS `common_object_sync_date_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_object_sync_date_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(50) NOT NULL,
  `system_id` int(11) NOT NULL,
  `sync_date_time` datetime NOT NULL,
  `tp_integration_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_object_sync_date_time`
--

LOCK TABLES `common_object_sync_date_time` WRITE;
/*!40000 ALTER TABLE `common_object_sync_date_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_object_sync_date_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_object_sync_mst`
--

DROP TABLE IF EXISTS `common_object_sync_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_object_sync_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_mst_id` int(11) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `system_id` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `recode_status` char(1) NOT NULL,
  `reference_no` varchar(300) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `sync_date_time` datetime DEFAULT NULL,
  `sync_status` char(1) NOT NULL,
  `attempts` int(2) DEFAULT 0,
  `tp_company_id` varchar(300) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mst_id` (`object_mst_id`) USING BTREE,
  KEY `obj_type` (`object_type`) USING BTREE,
  KEY `sys_id` (`system_id`) USING BTREE,
  KEY `company_id` (`tp_company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_object_sync_mst`
--

LOCK TABLES `common_object_sync_mst` WRITE;
/*!40000 ALTER TABLE `common_object_sync_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_object_sync_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_custom_interval`
--

DROP TABLE IF EXISTS `common_recurring_custom_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_custom_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_interval_name` varchar(50) NOT NULL,
  `custom_interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_custom_interval`
--

LOCK TABLES `common_recurring_custom_interval` WRITE;
/*!40000 ALTER TABLE `common_recurring_custom_interval` DISABLE KEYS */;
INSERT INTO `common_recurring_custom_interval` VALUES (1,'Day(s)','DAYS','A'),(2,'Week(s)','WEEKS','A'),(3,'Month(s)','MONTHS','A'),(4,'Years(s)','YEARS','A');
/*!40000 ALTER TABLE `common_recurring_custom_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_day`
--

DROP TABLE IF EXISTS `common_recurring_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(50) NOT NULL,
  `day_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_day`
--

LOCK TABLES `common_recurring_day` WRITE;
/*!40000 ALTER TABLE `common_recurring_day` DISABLE KEYS */;
INSERT INTO `common_recurring_day` VALUES (1,'1st','1','A'),(2,'2nd','2','A'),(3,'3rd','3','A'),(4,'4th','4','A'),(5,'5th','5','A'),(6,'6th','6','A'),(7,'7th','7','A'),(8,'8th','8','A'),(9,'9th','9','A'),(10,'10th','10','A'),(11,'11th','11','A'),(12,'12th','12','A'),(13,'13th','13','A'),(14,'14th','14','A'),(15,'15th','15','A'),(16,'16th','16','A'),(17,'17th','17','A'),(18,'18th','18','A'),(19,'19th','19','A'),(20,'20th','20','A'),(21,'21st','21','A'),(22,'22nd','22','A'),(23,'23rd','23','A'),(24,'24th','24','A'),(25,'25th','25','A'),(26,'26th','26','A'),(27,'27th','27','A'),(28,'28th','28','A');
/*!40000 ALTER TABLE `common_recurring_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_day_of_week`
--

DROP TABLE IF EXISTS `common_recurring_day_of_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_day_of_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_of_week_name` varchar(50) NOT NULL,
  `day_of_week_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_day_of_week`
--

LOCK TABLES `common_recurring_day_of_week` WRITE;
/*!40000 ALTER TABLE `common_recurring_day_of_week` DISABLE KEYS */;
INSERT INTO `common_recurring_day_of_week` VALUES (1,'Monday','MON','A'),(2,'Tuesday','TUE','A'),(3,'Wednesday','WED','A'),(4,'Thursday','THU','A'),(5,'Friday','FRI','A'),(6,'Saturday','SAT','A'),(7,'Sunday','SUN','A');
/*!40000 ALTER TABLE `common_recurring_day_of_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_generation_frequent`
--

DROP TABLE IF EXISTS `common_recurring_generation_frequent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_generation_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generation_frequent` varchar(50) NOT NULL,
  `generation_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_generation_frequent`
--

LOCK TABLES `common_recurring_generation_frequent` WRITE;
/*!40000 ALTER TABLE `common_recurring_generation_frequent` DISABLE KEYS */;
INSERT INTO `common_recurring_generation_frequent` VALUES (1,'Day','DAY','A'),(2,'First','FIRST','A'),(3,'Second','SECOND','A'),(4,'Third','THIRD','A'),(5,'Fourth','FOURTH','A'),(6,'Last','LAST','A');
/*!40000 ALTER TABLE `common_recurring_generation_frequent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_interval`
--

DROP TABLE IF EXISTS `common_recurring_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_interval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interval_name` varchar(50) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_interval`
--

LOCK TABLES `common_recurring_interval` WRITE;
/*!40000 ALTER TABLE `common_recurring_interval` DISABLE KEYS */;
INSERT INTO `common_recurring_interval` VALUES (1,'Daily','DAILY','A'),(2,'Weekly','WEEKLY','A'),(3,'Monthly','MONTHLY','A'),(4,'Yearly','YEARLY','A'),(5,'Custom','CUSTOM','A');
/*!40000 ALTER TABLE `common_recurring_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_month`
--

DROP TABLE IF EXISTS `common_recurring_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(50) NOT NULL,
  `month_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_month`
--

LOCK TABLES `common_recurring_month` WRITE;
/*!40000 ALTER TABLE `common_recurring_month` DISABLE KEYS */;
INSERT INTO `common_recurring_month` VALUES (1,'January ','JAN ','A'),(2,'February','FEB','A'),(3,'March','MAR','A'),(4,'April','APR','A'),(5,'May','MAY','A'),(6,'June','JUN','A'),(7,'July','JUL','A'),(8,'August','AUG','A'),(9,'September','SEP','A'),(10,'October','OCT','A'),(11,'November','NOV','A'),(12,'December','DEC','A');
/*!40000 ALTER TABLE `common_recurring_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_recurring_occurrence_frequent`
--

DROP TABLE IF EXISTS `common_recurring_occurrence_frequent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_recurring_occurrence_frequent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occurrence_frequent` varchar(50) NOT NULL,
  `occurrence_frequent_value` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_recurring_occurrence_frequent`
--

LOCK TABLES `common_recurring_occurrence_frequent` WRITE;
/*!40000 ALTER TABLE `common_recurring_occurrence_frequent` DISABLE KEYS */;
INSERT INTO `common_recurring_occurrence_frequent` VALUES (1,'Specific Date','SPEC_DATE','A'),(2,'No. of occurrences','NO_OF_OCC','A');
/*!40000 ALTER TABLE `common_recurring_occurrence_frequent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_condition_script`
--

DROP TABLE IF EXISTS `common_reminder_condition_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_condition_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `script_data` text DEFAULT NULL,
  `reminder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_reminder_id` (`reminder_id`),
  CONSTRAINT `FK__common_reminder_id` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_condition_script`
--

LOCK TABLES `common_reminder_condition_script` WRITE;
/*!40000 ALTER TABLE `common_reminder_condition_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_reminder_condition_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_document_event_config`
--

DROP TABLE IF EXISTS `common_reminder_document_event_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_document_event_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENT_TYPE_EVENT_REMINDER_FK` (`document_type_id`),
  KEY `EVENT_CONFIG_REMINDER_FK` (`event_id`),
  KEY `EVENT_CONFIG_FIELD_ID` (`field_id`),
  CONSTRAINT `DOCUMENT_TYPE_EVENT_REMINDER_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `EVENT_CONFIG_FIELD_ID` FOREIGN KEY (`field_id`) REFERENCES `common_automation_field` (`id`),
  CONSTRAINT `EVENT_CONFIG_REMINDER_FK` FOREIGN KEY (`event_id`) REFERENCES `common_reminder_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_document_event_config`
--

LOCK TABLES `common_reminder_document_event_config` WRITE;
/*!40000 ALTER TABLE `common_reminder_document_event_config` DISABLE KEYS */;
INSERT INTO `common_reminder_document_event_config` VALUES (1,1,1,117),(2,2,1,120),(3,10,1,125),(4,4,1,121),(5,9,1,124),(6,1,2,10),(7,1,3,119),(8,1,4,118),(9,1,5,117),(10,9,5,124),(11,6,7,122),(12,11,6,126);
/*!40000 ALTER TABLE `common_reminder_document_event_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_document_usage`
--

DROP TABLE IF EXISTS `common_reminder_document_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_document_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_of_occurrences` int(11) DEFAULT NULL,
  `no_of_escalation_occurrences` int(11) DEFAULT NULL,
  `no_of_days_triggered` int(11) DEFAULT NULL,
  `no_of_escalation_triggered` int(11) DEFAULT NULL,
  `last_reminder_triggered_date` date DEFAULT NULL,
  `last_escalation_triggered_date` date DEFAULT NULL,
  `document_id` int(11) NOT NULL DEFAULT 0,
  `document_type_id` int(11) NOT NULL DEFAULT 0,
  `reminder_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__common_automation_document_type` (`document_type_id`),
  KEY `FK__common_reminder_mst` (`reminder_id`),
  CONSTRAINT `FK__common_automation_document_type` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `FK__common_reminder_mst` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_document_usage`
--

LOCK TABLES `common_reminder_document_usage` WRITE;
/*!40000 ALTER TABLE `common_reminder_document_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_reminder_document_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_escalate_user`
--

DROP TABLE IF EXISTS `common_reminder_escalate_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_escalate_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `reminder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ESCALATE_USER_REMINDER_MST_FK` (`reminder_id`),
  CONSTRAINT `ESCALATE_USER_REMINDER_MST_FK` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_escalate_user`
--

LOCK TABLES `common_reminder_escalate_user` WRITE;
/*!40000 ALTER TABLE `common_reminder_escalate_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_reminder_escalate_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_event`
--

DROP TABLE IF EXISTS `common_reminder_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_event`
--

LOCK TABLES `common_reminder_event` WRITE;
/*!40000 ALTER TABLE `common_reminder_event` DISABLE KEYS */;
INSERT INTO `common_reminder_event` VALUES (1,'Is Pending for'),(2,'Due date meets in'),(3,'Discount applicable period will end in'),(4,'Is approved but not paid for'),(5,'Is unsubmitted for'),(6,'Has unprocessed documents for'),(7,'Request is pending for');
/*!40000 ALTER TABLE `common_reminder_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_exclude_user`
--

DROP TABLE IF EXISTS `common_reminder_exclude_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_exclude_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `reminder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EXCLUDE_USER_REMINDER_MST_FK` (`reminder_id`),
  CONSTRAINT `EXCLUDE_USER_REMINDER_MST_FK` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_exclude_user`
--

LOCK TABLES `common_reminder_exclude_user` WRITE;
/*!40000 ALTER TABLE `common_reminder_exclude_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_reminder_exclude_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_field_condition_config`
--

DROP TABLE IF EXISTS `common_reminder_field_condition_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_field_condition_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) NOT NULL,
  `reminder_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `data_type` varchar(50) NOT NULL,
  `adjoint_condition` varchar(50) NOT NULL,
  `condition_order` int(11) NOT NULL,
  `value_one` varchar(500) DEFAULT NULL,
  `value_two` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CONDITION_CONFIG_REMINDER_MST_FK` (`reminder_id`),
  CONSTRAINT `CONDITION_CONFIG_REMINDER_MST_FK` FOREIGN KEY (`reminder_id`) REFERENCES `common_reminder_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_field_condition_config`
--

LOCK TABLES `common_reminder_field_condition_config` WRITE;
/*!40000 ALTER TABLE `common_reminder_field_condition_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_reminder_field_condition_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_mst`
--

DROP TABLE IF EXISTS `common_reminder_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `frequency` int(11) NOT NULL,
  `no_of_days` int(11) NOT NULL DEFAULT 0,
  `no_of_occurrence` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `escalation_present` char(1) NOT NULL,
  `escalate_from_occurrences` int(11) DEFAULT NULL,
  `escalate_frequency` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(100) NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `REMINDER_MST_DOCUMENT_TYPE_FK` (`document_type_id`),
  KEY `REMINDER_MST_EVENT_FK` (`event_id`),
  CONSTRAINT `REMINDER_MST_DOCUMENT_TYPE_FK` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`),
  CONSTRAINT `REMINDER_MST_EVENT_FK` FOREIGN KEY (`event_id`) REFERENCES `common_reminder_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_mst`
--

LOCK TABLES `common_reminder_mst` WRITE;
/*!40000 ALTER TABLE `common_reminder_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_reminder_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminder_template`
--

DROP TABLE IF EXISTS `common_reminder_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_reminder_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(100) NOT NULL,
  `notification_message` varchar(100) NOT NULL,
  `email_subject` varchar(100) NOT NULL,
  `email_template` text NOT NULL,
  `event_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_reminder_event` (`event_id`),
  KEY `FK_common_reminder_template_common_automation_document_type` (`document_type_id`),
  CONSTRAINT `FK__common_reminder_event` FOREIGN KEY (`event_id`) REFERENCES `common_reminder_event` (`id`),
  CONSTRAINT `FK_common_reminder_template_common_automation_document_type` FOREIGN KEY (`document_type_id`) REFERENCES `common_automation_document_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminder_template`
--

LOCK TABLES `common_reminder_template` WRITE;
/*!40000 ALTER TABLE `common_reminder_template` DISABLE KEYS */;
INSERT INTO `common_reminder_template` VALUES (1,'Bill Reminder','Bills Awaiting Your Approval','*** REMINDER - Approval Pending ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the following Bills that are awaiting your approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to approve or reject the Bills.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',1,1),(2,'Bill Reminder','Due Dates Meeting Soon','*** REMINDER - Due Dates Meeting Soon ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the following Bills that are meeting due dates in a few days of time.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to complete the payments.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',2,1),(3,'Bill Reminder','Discount Period Ending Soon','*** REMINDER - Discount Period Ending Soon ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about Bills ending the applicable discount period in a few days of time.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to complete the payments.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',3,1),(4,'Bill Reminder','Approved, Unpaid Bills','*** REMINDER - Approved, Unpaid Bills ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the Bills that are approved but not yet paid.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to complete the payments.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',4,1),(5,'Bill Reminder','Unsubmitted Bills','*** REMINDER - Unsubmitted Bills ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about Bills that are not submitted.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to complete the submission.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',5,1),(6,'Purchase Order Reminder','Purchase orders Awaiting Your Approval','*** REMINDER - Approval Pending ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the following Purchase orders that are awaiting your approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to approve or reject the Purchase order.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',1,2),(7,'Expnse Report Reminder','Expense Awaiting Your Approval','*** REMINDER - Approval Pending ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the following Expenses that are awaiting your approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to approve or reject the Expense.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',1,4),(8,'Vendor Request Reminder','Pending Vendor Requests','*** REMINDER - Pending Vendor Requests ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you that the following  Vendor requests are pending approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to complete the approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',7,6),(9,'Credit Card Statement Reminder','Credit Card Statement Awaiting Your Approval','*** REMINDER - Approval Pending ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the following Credit Card Statements that are awaiting your approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to approve or reject the Credit Card Statements.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',1,9),(10,'Credit Card Statement Reminder','Unsubmitted Credit Card Statements','*** REMINDER - Unsubmitted Credit Card Statements ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about Credit Card Statements that are not submitted.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to complete the submission.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',5,9),(11,'Online Payment Reminder','Online payment Awaiting Your Approval','*** REMINDER - Approval Pending ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; background: #ffffff; margin: auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you about the following Online payments that are awaiting your approval.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to approve or reject the Online payments.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',1,10),(12,'Inbox Reminder','Inbox Contains Unprocessed Documents','*** REMINDER - Inbox Contains Unprocessed Documents ***','<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\" />\r\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    </head>\r\n    <body style=\"padding: 50px; background-color: #f7f7f7; font-family: \'Courier New\', Courier, monospace;\">\r\n        <table style=\"color: #404040; margin: background: #ffffff; auto;\" width=\"650px;\" cellspacing=\"0\">\r\n            <tr>\r\n                <th style=\"background: #3ab2ac; font-weight: 100; font-size: 30px; color: #fff; text-align: left; padding: 30px 40px;\" colspan=\"0\">Reminder</th>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"font-weight: bold; padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <br />\r\n                    Dear <span id=\"EMAIL_SEND_TO\">name of send to user</span>,\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ul></ul>\r\n                    This is to remind you that the following documents in your Inbox are unprocessed.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <ol id=\"LIST_DATA\">\r\n                    </ol>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    Please log in to <a id=\"URL\" href=\"\">PaperTrl</a> <span id=\"ACCOUNT_NAME\"></span> to process them.<br />\r\n                    <br />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    If you have any comments or questions, please do not hesitate to contact us at <span style=\"font-weight: bold;\"><a href=\"mailto:support@papertrl.com\">support@papertrl.com.</a></span>\r\n                </td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td style=\"padding: 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <span>Thank You!</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"padding: 0 40px; border: solid #bfbdbd; border-width: 0 1px 0 1px; border-spacing: 0;\">\r\n                    <img style=\"width: 170px; height: 45px;\" src=\"https://papertrl.com/wp-content/uploads/2019/09/logo.png\" />\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td\r\n                    style=\"\r\n                        padding: 0 40px;\r\n                        border: solid #bfbdbd;\r\n                        border-width: 0 1px 0 1px;\r\n                        border-spacing: 0;\r\n                        border-bottom: 1px solid #bfbdbd;\r\n                        padding-bottom: 40px;\r\n                        font-size: 11px;\r\n                    \"\r\n                >\r\n                    This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via\r\n                    <span style=\"font-weight: bold;\">support@papertrl.com</span>\r\n                    <p class=\"MsoNormal\">\r\n                        <span style=\"font-size: 10px; color: #207580;\">\r\n                            CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and\r\n                            exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this\r\n                            message or any information herein. If you have received this message in error, please advise the sender immediately.\r\n                        </span>\r\n                        <span style=\"font-size: 8pt; color: #014708;\"></span>\r\n                    </p>\r\n                    <p>\r\n                        <span style=\"font-size: 18pt; font-family: Webdings; color: green;\">P</span><span style=\"color: black;\"> </span>\r\n                        <span style=\"font-size: 10px; color: green;\">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span><u></u><u></u>\r\n                    </p>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </body>\r\n</html>\r\n',6,11);
/*!40000 ALTER TABLE `common_reminder_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_report_category`
--

DROP TABLE IF EXISTS `common_report_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_report_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_report_category`
--

LOCK TABLES `common_report_category` WRITE;
/*!40000 ALTER TABLE `common_report_category` DISABLE KEYS */;
INSERT INTO `common_report_category` VALUES (1,'AP Reports','A');
/*!40000 ALTER TABLE `common_report_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_report_filter`
--

DROP TABLE IF EXISTS `common_report_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_report_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` int(11) NOT NULL,
  `filter_field` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__common_report_type` (`report_type`),
  KEY `FK_common_report_filter_common_report_filter_field` (`filter_field`),
  CONSTRAINT `FK__common_report_type` FOREIGN KEY (`report_type`) REFERENCES `common_report_type` (`id`),
  CONSTRAINT `FK_common_report_filter_common_report_filter_field` FOREIGN KEY (`filter_field`) REFERENCES `common_report_filter_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_report_filter`
--

LOCK TABLES `common_report_filter` WRITE;
/*!40000 ALTER TABLE `common_report_filter` DISABLE KEYS */;
INSERT INTO `common_report_filter` VALUES (1,1,1),(2,1,2),(3,1,11),(4,2,2),(5,2,3),(6,2,5),(7,2,6),(8,2,7),(9,2,4),(10,2,8),(11,3,1),(12,4,2),(13,4,9),(14,4,10),(15,5,2),(16,6,2),(17,6,1),(18,7,2),(19,7,12),(20,7,1),(21,7,13),(22,7,14),(23,8,2),(24,8,12),(25,8,1),(26,8,13),(27,8,14),(28,9,15),(29,10,12),(30,10,16),(31,10,1),(32,11,12),(33,11,16),(34,11,1),(35,12,2),(36,12,17),(37,12,18),(38,12,19),(39,12,20),(40,13,21),(41,13,2),(53,14,21),(54,14,2),(55,13,22),(56,14,22),(57,15,19),(58,16,2),(59,16,9),(60,16,10),(61,16,21),(62,16,14);
/*!40000 ALTER TABLE `common_report_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_report_filter_field`
--

DROP TABLE IF EXISTS `common_report_filter_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_report_filter_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_report_filter_field`
--

LOCK TABLES `common_report_filter_field` WRITE;
/*!40000 ALTER TABLE `common_report_filter_field` DISABLE KEYS */;
INSERT INTO `common_report_filter_field` VALUES (1,'APPROVER'),(2,'VENDOR'),(3,'VENDOR_EMAIL'),(4,'VENDOR_CODE'),(5,'COUNTRY'),(6,'STATE'),(7,'CITY'),(8,'CONTACT_NO'),(9,'BILL_DATE'),(10,'DUE_DATE'),(11,'DATE_AGING'),(12,'CREATED_DATE'),(13,'REQUESTOR'),(14,'DEPARTMENT'),(15,'CUSTOM_FIELD'),(16,'ACCOUNT'),(17,'APPROVAL_GROUP'),(18,'REFERENCE_NUMBER'),(19,'TRANSACTION_TYPE'),(20,'CURRENTLY_ASSIGNED_USER'),(21,'PROJECT_CODE'),(22,'PO_STATUS');
/*!40000 ALTER TABLE `common_report_filter_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_report_type`
--

DROP TABLE IF EXISTS `common_report_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_report_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `report_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_common_report_type_common_report_category` (`report_category_id`),
  CONSTRAINT `FK_common_report_type_common_report_category` FOREIGN KEY (`report_category_id`) REFERENCES `common_report_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_report_type`
--

LOCK TABLES `common_report_type` WRITE;
/*!40000 ALTER TABLE `common_report_type` DISABLE KEYS */;
INSERT INTO `common_report_type` VALUES (1,'Cash Requirement Report',NULL,'A',1),(2,'Vendor Detail Report',NULL,'A',1),(3,'User Overview Report',NULL,'A',1),(4,'AP Details Report',NULL,'I',1),(5,'AP Aging Summary Report - Vendor wise',NULL,'A',1),(6,'AP Aging Summary Report - User wise',NULL,'A',1),(7,'Purchase Orders By Department Report',NULL,'A',1),(8,'Purchase Order Outstanding Report',NULL,'A',1),(9,'Expenses by Custom Field',NULL,'A',1),(10,'Expenses by Acccount Summary',NULL,'A',1),(11,'Expenses by Account Detail',NULL,'A',1),(12,'Transactions Awaiting Approval',NULL,'A',1),(13,'Project Purchase Orders Summary',NULL,'A',1),(14,'Purchase Order Receipt Detail',NULL,'A',1),(15,'Billable Transactions',NULL,'A',1),(16,'AP Detail',NULL,'A',1);
/*!40000 ALTER TABLE `common_report_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_separator`
--

DROP TABLE IF EXISTS `common_separator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_separator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `separator` varchar(10) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_separator`
--

LOCK TABLES `common_separator` WRITE;
/*!40000 ALTER TABLE `common_separator` DISABLE KEYS */;
INSERT INTO `common_separator` VALUES (1,'|','A'),(2,'#','A'),(3,'-','A'),(4,'/','A'),(5,'\\','A');
/*!40000 ALTER TABLE `common_separator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_state_mst`
--

DROP TABLE IF EXISTS `common_state_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_state_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_state_mst`
--

LOCK TABLES `common_state_mst` WRITE;
/*!40000 ALTER TABLE `common_state_mst` DISABLE KEYS */;
INSERT INTO `common_state_mst` VALUES (1,'Albama','AL'),(2,'Alaska','AK'),(3,'Arizona','AZ'),(4,'Arkansas','AR'),(5,'California','CA'),(6,'Colorado','CO'),(7,'Conneticut','CT'),(8,'Deleware','DE'),(9,'District of Columbia','DC'),(10,'Florida','FL'),(11,'Georgia','GA'),(12,'Hawaii','HI'),(13,'Idaho','ID'),(14,'Illinois','IL'),(15,'Indiana','IN'),(16,'Iowa','IA'),(17,'Kansas','KS'),(18,'Kentucky','KY'),(19,'Lousiana','LA'),(20,'Maine','ME'),(21,'Maryland','MD'),(22,'Massachusetts','MA'),(23,'Michigan','MI'),(24,'Minnesota','MN'),(25,'Mississippo','MS'),(26,'Missouri','MO'),(27,'Montana','MT'),(28,'Nebraska','NE'),(29,'Nevada','NV'),(30,'New Hampshire','NH'),(31,'New Jersey','NJ'),(32,'New Mexico','NM'),(33,'New York','NY'),(34,'North California','NC'),(35,'North Dakota','ND'),(36,'Ohio','OH'),(37,'Oklahoma','OK'),(38,'Oregon','OR'),(39,'Pennsylvania','PA'),(40,'Rhode Island','RI'),(41,'South California','SC'),(42,'South Dakota','SD'),(43,'Tennessee','TN'),(44,'Texas ','TX'),(45,'Utah','UT'),(46,'Vermont','VT'),(47,'Virginia','VA'),(48,'Washington','WA'),(49,'West Virginia','WV'),(50,'Wisconsin','WI'),(51,'Wyoming','WY'),(52,'American Samoa','AS'),(53,'Guam','GU'),(54,'Northern Mariana Islands','MP'),(55,'Puerto Rico','PR'),(56,'United States Minor Outlying Islands','UM'),(57,'Virgin Islands','VI'),(58,'Armed Forces Americas','AA'),(59,'Armed Forces Pacific','AP'),(60,'Armed Forces Others','AE');
/*!40000 ALTER TABLE `common_state_mst` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_system_task`
--

LOCK TABLES `common_system_task` WRITE;
/*!40000 ALTER TABLE `common_system_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_system_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_uom`
--

DROP TABLE IF EXISTS `common_uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(10) DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_uom`
--

LOCK TABLES `common_uom` WRITE;
/*!40000 ALTER TABLE `common_uom` DISABLE KEYS */;
INSERT INTO `common_uom` VALUES (1,'HR','Human Resource','A'),(2,'EA','Each','A');
/*!40000 ALTER TABLE `common_uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_user_email_subscription`
--

DROP TABLE IF EXISTS `common_user_email_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_user_email_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_user_email_subscription`
--

LOCK TABLES `common_user_email_subscription` WRITE;
/*!40000 ALTER TABLE `common_user_email_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_email_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_user_notification`
--

DROP TABLE IF EXISTS `common_user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_user_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_name` varchar(100) NOT NULL,
  `refno` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `status` char(5) NOT NULL,
  `message` varchar(100) NOT NULL,
  `style` varchar(100) NOT NULL,
  `delete_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`to_user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_user_notification`
--

LOCK TABLES `common_user_notification` WRITE;
/*!40000 ALTER TABLE `common_user_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_user_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_bill`
--

DROP TABLE IF EXISTS `hst_vp_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_bill` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `bill_attachment_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `bill_date_str` varchar(40) DEFAULT NULL,
  `bill_date_format` varchar(40) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `content_extractable` char(1) DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT NULL,
  `submitted_by_name` varchar(200) DEFAULT NULL,
  `deletection_level` char(1) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `discount_applicable_date` datetime DEFAULT NULL,
  `bill_type` char(1) DEFAULT NULL,
  `applicable_discount_amount` decimal(19,2) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `submitted_by_vendor` tinyint(1) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `schedule_template_id` int(11) DEFAULT NULL,
  `vendor_schedule_template_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `undo_status` char(1) DEFAULT NULL,
  `inbox_attachment_id` int(11) DEFAULT NULL,
  `ocr_running_status` char(1) DEFAULT NULL,
  `close_po` tinyint(1) DEFAULT 0,
  `ocr_running_date` date DEFAULT NULL,
  `statement_id` int(11) DEFAULT NULL,
  `credit_amount` decimal(19,2) DEFAULT NULL,
  `action_status` int(15) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `HST_VP_BILL_VENDOR_ID_FK_8` (`vendor_id`) USING BTREE,
  KEY `HST_VP_BILL_PO_KEY_FK_1` (`po_id`),
  KEY `HST_VP_BILL_AUTOMATION_ID_FK_6` (`automation_id`),
  KEY `HST_VP_BILL_WORKFLOW_ID_FK_9` (`workflow_id`),
  KEY `HST_VP_BILL_BILL_ATTACHMENT_ID_FK_1` (`bill_attachment_id`),
  KEY `HST_VP_BILL_PO_RECEIPT_FK_1` (`receipt_id`),
  KEY `HST_VP_BILL_SCHEDULE_TEMPLATE_ID_FK_1` (`schedule_template_id`),
  KEY `hst_vp_bill_common_inbox_attachment_id_fk` (`inbox_attachment_id`),
  KEY `STATEMENT_ID_FK_2` (`statement_id`),
  KEY `FK_hst_vp_bill_common_automation_mst` (`automation_rule_id`),
  CONSTRAINT `FK_hst_vp_bill_common_automation_mst` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_AUTOMATION_ID_FK_6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_BILL_ATTACHMENT_ID_FK_1` FOREIGN KEY (`bill_attachment_id`) REFERENCES `vp_bill_attachment` (`id`),
  CONSTRAINT `HST_VP_BILL_PO_KEY_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_PO_RECEIPT_FK_1` FOREIGN KEY (`receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_SCHEDULE_TEMPLATE_ID_FK_1` FOREIGN KEY (`schedule_template_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_VENDOR_ID_FK_8` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `HST_VP_BILL_WORKFLOW_ID_FK_9` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`),
  CONSTRAINT `STATEMENT_ID_FK_2` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`),
  CONSTRAINT `hst_vp_bill_common_inbox_attachment_id_fk` FOREIGN KEY (`inbox_attachment_id`) REFERENCES `common_inbox_attachment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_bill`
--

LOCK TABLES `hst_vp_bill` WRITE;
/*!40000 ALTER TABLE `hst_vp_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_bill_additional_data`
--

DROP TABLE IF EXISTS `hst_vp_bill_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_bill_additional_data` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_value` text DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `bill_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_bill_additional_data_vp_invoice_mst` (`bill_mst_id`),
  KEY `FK_hst_vp_bill_additional_data_hst_vp_bill` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_bill_additional_data_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_hst_vp_bill_additional_data_vp_invoice_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_bill_additional_data`
--

LOCK TABLES `hst_vp_bill_additional_data` WRITE;
/*!40000 ALTER TABLE `hst_vp_bill_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_bill_additional_field_attachment`
--

DROP TABLE IF EXISTS `hst_vp_bill_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_bill_additional_field_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `bill_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_bill_additional_field_attachment_inv_mst` (`bill_mst_id`),
  KEY `FK_hst_vp_bill_additional_field_attachment_hst_vp_bill` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_bill_additional_field_attachment_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `FK_hst_vp_bill_additional_field_attachment_inv_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_bill_additional_field_attachment`
--

LOCK TABLES `hst_vp_bill_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `hst_vp_bill_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_bill_expense_cost_distribution`
--

DROP TABLE IF EXISTS `hst_vp_bill_expense_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_bill_expense_cost_distribution` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `hst_recode_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `receipt_url` varchar(300) DEFAULT NULL,
  `receipt_file_type` varchar(50) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `po_receipt_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_vendor_item_cost_distribution_vp_vendor_mst` (`bill_id`),
  KEY `FK_hst_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `FK_hst_vp_vendor_item_cost_distribution_project_id` (`project_id`),
  KEY `FK_hst_vp_bill_expense_cost_distribution_hst_vp_bill` (`hst_recode_id`),
  KEY `PO_REC_ID_FK_3` (`po_receipt_id`),
  CONSTRAINT `FK_hst_vp_bill_expense_cost_distribution_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `FK_hst_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_hst_vp_vendor_item_cost_distribution_project_id` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_hst_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_REC_ID_FK_3` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_bill_expense_cost_distribution`
--

LOCK TABLES `hst_vp_bill_expense_cost_distribution` WRITE;
/*!40000 ALTER TABLE `hst_vp_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_expense_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_bill_item_cost_distribution`
--

DROP TABLE IF EXISTS `hst_vp_bill_item_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_bill_item_cost_distribution` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) DEFAULT 0.00,
  `rate` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `item_number` varchar(50) DEFAULT '',
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT '',
  `hst_recode_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `receipt_url` varchar(300) DEFAULT NULL,
  `receipt_file_type` varchar(50) DEFAULT NULL,
  `po_receipt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`bill_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_project_id` (`project_id`),
  KEY `FK_hst_vp_invoice_item_cost_distribution_po_id` (`po_id`),
  KEY `FK_hst_vp_bill_item_cost_distribution_hst_vp_bill` (`hst_recode_id`),
  KEY `PO_REC_ID_FK_4` (`po_receipt_id`),
  CONSTRAINT `FK_hst_vp_bill_item_cost_distribution_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_common_product_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_po_id` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_project_id` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_hst_vp_invoice_item_cost_distribution_vp_vendor_invoice` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_REC_ID_FK_4` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_bill_item_cost_distribution`
--

LOCK TABLES `hst_vp_bill_item_cost_distribution` WRITE;
/*!40000 ALTER TABLE `hst_vp_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_item_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_bill_workflow_detail_config`
--

DROP TABLE IF EXISTS `hst_vp_bill_workflow_detail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_bill_workflow_detail_config` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  `hst_recode_id` int(15) NOT NULL,
  PRIMARY KEY (`recode_id`) USING BTREE,
  KEY `AUTOMATION_ID_FK2` (`workflow_id`) USING BTREE,
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`) USING BTREE,
  KEY `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` (`hst_recode_id`) USING BTREE,
  CONSTRAINT `FK_hst_vp_bill_workflow_detail_config_hst_vp_bill` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_bill` (`recode_id`),
  CONSTRAINT `hst_vp_bill_workflow_detail_config_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `hst_vp_bill_workflow_detail_config_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_bill_workflow_detail_config`
--

LOCK TABLES `hst_vp_bill_workflow_detail_config` WRITE;
/*!40000 ALTER TABLE `hst_vp_bill_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_bill_workflow_detail_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_credit_note_relation`
--

DROP TABLE IF EXISTS `hst_vp_credit_note_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_credit_note_relation` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `credit_note_id` int(11) DEFAULT NULL,
  `credit_note_no` varchar(50) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `applied_credit_amount` decimal(19,2) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_credit_note_relation`
--

LOCK TABLES `hst_vp_credit_note_relation` WRITE;
/*!40000 ALTER TABLE `hst_vp_credit_note_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_credit_note_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_expense_additional_data`
--

DROP TABLE IF EXISTS `hst_vp_expense_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_expense_additional_data` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `expense_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_additional_data_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_additional_data_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_expense_additional_data`
--

LOCK TABLES `hst_vp_expense_additional_data` WRITE;
/*!40000 ALTER TABLE `hst_vp_expense_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_expense_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_expense_additional_field_attachment`
--

DROP TABLE IF EXISTS `hst_vp_expense_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_expense_additional_field_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `expense_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT '',
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_additional_field_attachment_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_additional_field_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_expense_additional_field_attachment`
--

LOCK TABLES `hst_vp_expense_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `hst_vp_expense_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_expense_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_expense_attachment`
--

DROP TABLE IF EXISTS `hst_vp_expense_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_expense_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `expense_mst_id` int(11) NOT NULL,
  `expense_detail_id` int(11) DEFAULT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_attachment_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_expense_attachment`
--

LOCK TABLES `hst_vp_expense_attachment` WRITE;
/*!40000 ALTER TABLE `hst_vp_expense_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_expense_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_expense_detail`
--

DROP TABLE IF EXISTS `hst_vp_expense_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_expense_detail` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `expense_mst_id` int(11) DEFAULT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `project_code_name` varchar(255) DEFAULT NULL,
  `project_account_code` varchar(200) DEFAULT NULL,
  `expense_account_code` varchar(200) DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `expense_type` varchar(50) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `mileage_rate` decimal(19,2) DEFAULT 0.00,
  `mileage` decimal(19,2) DEFAULT NULL,
  `mileage_amount` decimal(19,2) DEFAULT 0.00,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_expense_detail_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_detail_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_expense_detail`
--

LOCK TABLES `hst_vp_expense_detail` WRITE;
/*!40000 ALTER TABLE `hst_vp_expense_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_expense_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_expense_mst`
--

DROP TABLE IF EXISTS `hst_vp_expense_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_expense_mst` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `total_mileage_amount` decimal(19,2) DEFAULT 0.00,
  `paid_amount` decimal(19,2) DEFAULT NULL,
  `payment_under_processing` decimal(19,2) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `total_miles_driven` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `report_name` varchar(50) DEFAULT NULL,
  `business_purpose` varchar(50) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `created_by_name` varchar(200) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `undo_status` char(1) NOT NULL,
  `action_status` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_expense_mst`
--

LOCK TABLES `hst_vp_expense_mst` WRITE;
/*!40000 ALTER TABLE `hst_vp_expense_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_expense_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_expense_workflow_detail_config`
--

DROP TABLE IF EXISTS `hst_vp_expense_workflow_detail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_expense_workflow_detail_config` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  `hst_recode_id` int(15) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `AUTOMATION_ID_FK2` (`workflow_id`) USING BTREE,
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`) USING BTREE,
  KEY `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_expense_mst` (`recode_id`),
  CONSTRAINT `hst_vp_expense_workflow_detail_config_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `hst_vp_expense_workflow_detail_config_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_expense_workflow_detail_config`
--

LOCK TABLES `hst_vp_expense_workflow_detail_config` WRITE;
/*!40000 ALTER TABLE `hst_vp_expense_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_expense_workflow_detail_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_account_detail`
--

DROP TABLE IF EXISTS `hst_vp_po_account_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_account_detail` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `purchase_order_mst_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_account_detail_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_account_detail_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_account_detail`
--

LOCK TABLES `hst_vp_po_account_detail` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_account_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_additional_data`
--

DROP TABLE IF EXISTS `hst_vp_po_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_additional_data` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `po_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_additional_data_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_additional_data_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_additional_data`
--

LOCK TABLES `hst_vp_po_additional_data` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_additional_field_attachment`
--

DROP TABLE IF EXISTS `hst_vp_po_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_additional_field_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_additional_field_attachment_hst_vp_expense_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_additional_field_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_additional_field_attachment`
--

LOCK TABLES `hst_vp_po_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_attachment`
--

DROP TABLE IF EXISTS `hst_vp_po_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_attachment` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_attachment_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_attachment_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_attachment`
--

LOCK TABLES `hst_vp_po_attachment` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_detail`
--

DROP TABLE IF EXISTS `hst_vp_po_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_detail` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `purchase_order_mst_id` int(11) NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(200) DEFAULT '',
  `qty` decimal(12,2) DEFAULT NULL,
  `remaining_qty` decimal(12,2) DEFAULT NULL,
  `credit_remaining_qty` decimal(12,2) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `per_unit_discount` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `hst_recode_id` int(11) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `unbilled_qty` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_hst_vp_po_detail_hst_vp_po_mst` (`hst_recode_id`),
  CONSTRAINT `FK_hst_vp_po_detail_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_detail`
--

LOCK TABLES `hst_vp_po_detail` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_mst`
--

DROP TABLE IF EXISTS `hst_vp_po_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_mst` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `po_number` varchar(100) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `account_gross_amount` decimal(19,2) DEFAULT NULL,
  `item_gross_amount` decimal(19,2) DEFAULT NULL,
  `vendor_approved_date` datetime DEFAULT NULL,
  `gross_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `net_amount` decimal(19,2) DEFAULT NULL,
  `tax_amount` decimal(19,2) NOT NULL,
  `contact_person` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `vendor_approval_status` char(1) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `price_variance` decimal(19,2) DEFAULT NULL,
  `remaining_price_variance` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(100) DEFAULT NULL,
  `approval_user_name` varchar(100) DEFAULT NULL,
  `poc_name` varchar(50) DEFAULT NULL,
  `poc_phone` varchar(40) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `receipt_status` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `export_status` char(1) NOT NULL,
  `approved_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `undo_status` char(1) DEFAULT NULL,
  `action_status` int(11) NOT NULL,
  PRIMARY KEY (`recode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_mst`
--

LOCK TABLES `hst_vp_po_mst` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hst_vp_po_workflow_detail_config`
--

DROP TABLE IF EXISTS `hst_vp_po_workflow_detail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hst_vp_po_workflow_detail_config` (
  `recode_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_order` int(3) NOT NULL,
  `status_id` int(10) DEFAULT NULL,
  `action_user` varchar(100) DEFAULT NULL,
  `hst_recode_id` int(15) NOT NULL,
  PRIMARY KEY (`recode_id`) USING BTREE,
  KEY `AUTOMATION_ID_FK2` (`workflow_id`) USING BTREE,
  KEY `AUDIT_TRIAL_STATUS_FK_1` (`status_id`) USING BTREE,
  KEY `FK_hst_vp_expense_workflow_detail_config_hst_vp_expense_mst` (`hst_recode_id`) USING BTREE,
  CONSTRAINT `FK_hst_vp_po_workflow_detail_config_hst_vp_po_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`),
  CONSTRAINT `hst_vp_po_workflow_detail_config_ibfk_2` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_ad_hoc_workflow_config` (`id`),
  CONSTRAINT `hst_vp_po_workflow_detail_config_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hst_vp_po_workflow_detail_config`
--

LOCK TABLES `hst_vp_po_workflow_detail_config` WRITE;
/*!40000 ALTER TABLE `hst_vp_po_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `hst_vp_po_workflow_detail_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_feature`
--

DROP TABLE IF EXISTS `support_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_feature`
--

LOCK TABLES `support_feature` WRITE;
/*!40000 ALTER TABLE `support_feature` DISABLE KEYS */;
INSERT INTO `support_feature` VALUES (1,'Bills','A','System ','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(2,'Purchase Orders','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(4,'Payments','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(5,'Chart of Accounts','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(6,'Expenses','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(7,'Items','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(8,'Projects','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(9,'Vendors','A','System','2022-05-04 09:48:00',NULL,NULL,NULL,NULL),(11,'Other','A','System','2022-05-12 17:39:27',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `support_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket`
--

DROP TABLE IF EXISTS `support_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int(11) DEFAULT NULL,
  `feature_id` int(10) DEFAULT NULL,
  `tp_ticket_id` varchar(100) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `assigned_to_user` varchar(200) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `issue_key` varchar(100) DEFAULT NULL,
  `other_feature_note` varchar(400) DEFAULT NULL,
  `customer_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TP_TICKET_ID_INDEX` (`tp_ticket_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket`
--

LOCK TABLES `support_ticket` WRITE;
/*!40000 ALTER TABLE `support_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_type`
--

DROP TABLE IF EXISTS `support_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(200) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_type`
--

LOCK TABLES `support_type` WRITE;
/*!40000 ALTER TABLE `support_type` DISABLE KEYS */;
INSERT INTO `support_type` VALUES (9,'Technical support','A','fa fa-cogs','Need help installing, configuring, or troubleshooting? Select this to request assistance.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL),(10,'Licensing and billing questions','A','fa fa-credit-card','Choose this if you have questions about licensing or billing.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL),(11,'Product trial questions','A','fa fa-phone-square','Trying out our product and want more information? Select this and we\'ll be happy to answer your questions.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL),(12,'Other questions','A','fa fa-question-circle','Don\'t see what you\'re looking for? Select this option and we\'ll help you out.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL),(14,'Report a bug','A','fa fa-bug','Tell us the problems you\'re experiencing.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL),(15,'Suggest a new feature','A','fa fa-lightbulb','Let us know your idea for a new feature.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL),(16,'Suggest improvement','A','fa fa-bolt','See a place where we can do better? We\'re all ears.','SYSTEM','2022-05-04 00:00:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `support_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_menu`
--

LOCK TABLES `umm_menu` WRITE;
/*!40000 ALTER TABLE `umm_menu` DISABLE KEYS */;
INSERT INTO `umm_menu` VALUES (1000,'Dashboard','Dashboard','fa fa-th-large','/home/dashboard',NULL,'S',1014,NULL,'Admin',1,'fa fa-th-large','Dashboard','Dashboard','A',1,1,1,1,'V2','DASHBOARD',1,'1014','System','2022-06-15 15:01:47',NULL,NULL,NULL,NULL),(1001,'Admin','Admin','fa fa-key','/home/admin',NULL,'S',1014,NULL,'Admin',11,'fa fa-key','Admin','Admin','A',1,1,1,0,'V2','ADMIN',1,'1014','System','2021-04-13 14:04:58',NULL,NULL,NULL,NULL),(1002,'Settings','Settings','fa fa-cog','/home/settings',NULL,'S',1014,NULL,'Admin',16,'fa fa-cog','Settings','Settings','A',1,1,0,0,'V2','SETTINGS',1,'1014','System','2022-06-17 14:32:28',NULL,NULL,NULL,NULL),(1003,'Automation','Automations','fa fa-tasks','/home/automation',NULL,'S',1014,NULL,'Admin',10,'fa fa-tasks','Automations','Automations','A',1,1,0,0,'V2','AUTOMATION',1,'1014','System','2021-10-13 01:40:05',NULL,NULL,NULL,NULL),(1004,'Vendors','Vendors','pi pi-users','/home/vendor',NULL,'S',1015,NULL,'Admin',8,'pi pi-users','Vendors','Vendors','A',0,1,0,0,'V2','VENDORS',1,'1015','System','2021-05-14 15:45:10',NULL,NULL,NULL,NULL),(1005,'Bills','Bills','fa fa-file-text','/home/bills',NULL,'S',1015,NULL,'Admin',3,'fa fa-file-text','Bills','Bills','A',0,1,0,1,'V2','BILL_MANAGEMENT',1,'1015','System','2022-06-22 13:34:57',NULL,NULL,NULL,NULL),(1006,'Purchase Orders','PO','fa fa-cart-arrow-down','/home/purchase-order',NULL,'S',1015,NULL,'Admin',2,'fa fa-cart-arrow-down','PO','PO','A',0,1,1,1,'V2','PO',0,'1015','System','2022-11-28 12:07:51',NULL,NULL,NULL,NULL),(1007,'Expenses','Expenses','fa fa-usd','/home/expense',NULL,'S',1015,NULL,'Admin',5,'fa fa-usd','Expenses','Expenses','A',0,1,0,1,'V2','EXPENSES',1,'1015','System','2022-06-15 15:01:47',NULL,NULL,NULL,NULL),(1008,'Items','Items','fa fa-cube','/home/item',NULL,'S',1014,NULL,'Admin',6,'fa fa-cube','Items','Items','A',0,1,1,0,'V2','ITEMS',1,'1014','System','2021-04-13 14:16:55',NULL,NULL,NULL,NULL),(1009,'Accounts','Accounts','fa fa-industry','/home/account',NULL,'S',1014,NULL,'Admin',5,'fa fa-industry','Accounts','Accounts','A',0,1,0,0,'V2','ACCOUNTS',1,'1014','System','2021-04-13 14:17:06',NULL,NULL,NULL,NULL),(1010,'Project','Projects','fa fa-code','/home/project-code',NULL,'S',1016,NULL,'Admin',7,'fa fa-code','Project Codes','Project Codes','A',0,1,0,0,'V2','PROJECT_CODES',1,'1016','System','2021-10-13 01:40:05',NULL,NULL,NULL,NULL),(1011,'Users','Users','fa fa-user','/home/admin','0','S',1001,NULL,'Admin',11,'fa fa-user','Users','Users','A',1,1,1,0,'V2','USERS',0,'1001,1014','System','2021-04-13 15:10:26',NULL,NULL,NULL,NULL),(1012,'Roles','Roles','fa fa-lock','/home/admin','1','S',1001,NULL,'Admin',11,'fa fa-lock','Roles','Roles','A',1,1,1,0,'V2','ROLES',0,'1001,1014','System','2021-04-13 15:10:32',NULL,NULL,NULL,NULL),(1013,'Approval Groups','Approval Groups','fa fa-users','/home/admin','2','S',1001,NULL,'Admin',11,'fa fa-users','Approval Groups','Approval Groups','A',1,1,1,0,'V2','APPROVAL_GROUPS',0,'1001,1014','System','2021-04-13 15:10:36',NULL,NULL,NULL,NULL),(1014,'Common','Common','fa fa-home','',NULL,'M',NULL,NULL,'Admin',13,'fa fa-home','Company','Company','A',1,1,0,0,'V2','CPMPANY',0,NULL,'System','2021-04-13 14:18:58',NULL,NULL,NULL,NULL),(1015,'Payable','Payable','fa fa-industry','',NULL,'M',NULL,NULL,'Admin',13,'fa fa-industry','Payable','Payable','A',1,1,0,0,'V2','PAYABLE',0,NULL,'System','2021-04-13 14:18:38',NULL,NULL,NULL,NULL),(1016,'Receivable','Receivable','fa fa-cube','',NULL,'M',NULL,NULL,'Admin',13,'fa fa-industry','Receivable','Receivable','A',1,1,0,0,'V2','RECEIVABLE',0,NULL,'System','2021-04-13 14:18:42',NULL,NULL,NULL,NULL),(1017,'Company Profile','Company Profile','fa fa-building','/home/settings','0','S',1002,NULL,'Admin',12,'fa fa-building','Company Profile','Company Profile','A',1,1,1,0,'V2','COMPANY_PROFILE',0,'1002,1014','System','2021-04-13 15:11:03',NULL,NULL,NULL,NULL),(1018,'Additional Fields','Additional Fields','fa fa-pencil-square-o','/home/settings','1','S',1002,NULL,'Admin',12,'fa fa-pencil-square-o','Additional Fields','Additional Fields','I',1,1,1,0,'V2','ADDITIONAL_FIELDS',0,'1002,1014','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1019,'Bills','Bills','fa fa-file-text','/home/bills','0','S',1005,NULL,'Admin',3,'fa fa-file-text','Bills','Bills','A',1,1,1,1,'V2','BILL',0,'1005,1015','System','2022-06-22 13:34:57',NULL,NULL,NULL,NULL),(1020,'Offline Payments','Offline Payments','fa fa-list-alt','/home/payments','3','S',1029,NULL,'Admin',4,'fa fa-list-alt','Offline Payments','Offline Payments','A',0,1,0,0,'V2','PAYMENT_OFFLINE_PAYMENT',0,'1005,1029','System','2021-09-28 15:26:35',NULL,NULL,NULL,NULL),(1021,'Purchase Orders','PO','fa fa-cart-arrow-down','/home/purchase-order','0','S',1006,NULL,'Admin',2,'fa fa-cart-arrow-down','Purchase Orders','Purchase Orders','A',1,1,1,1,'V2','PURCHASE_ORDER',1,'1006,1015','System','2022-11-28 12:07:51',NULL,NULL,NULL,NULL),(1022,'PO Receipts','PO Receipts','fa fa-usd','/home/purchase-order','1','S',1006,NULL,'Admin',2,'fa fa-usd','PO Receipts','PO Receipts','A',1,1,1,0,'V2','PO_RECEIPT',0,'1006,1015','System','2021-04-13 15:11:19',NULL,NULL,NULL,NULL),(1024,'Sync Dashboard','Sync Dashboard','fa fa-exchange','/home/sync-dashboard',NULL,'S',1014,NULL,'Admin',9,'fa fa-exchange','Sync Dashboard','Sync Dashboard','A',1,1,1,0,'V2','SYNC_DASHBORD',1,'1014','System','2021-04-13 14:20:39',NULL,NULL,NULL,NULL),(1025,'Reports','Reports','fa fa-pie-chart','/home/report','0','S',1014,NULL,'Admin',14,'fa fa-pie-chart','Reports','Reports','A',0,1,1,0,'V2','REPORTS',1,'1014','System','2021-07-14 18:50:24',NULL,NULL,NULL,NULL),(1027,'PO Number Configuration','PO Number Configuration','fa fa-building','/home/settings','0','S',1002,NULL,'Admin',13,'fa fa-pencil-square-o','PO Number Configuration','PO Number Configuration','I',0,1,0,0,'V2','PO_NUMBER_CONFIGURATION',0,'1002,1014','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1028,'Payment Configuration','Payment Configuration','fa fa-money','/home/settings','2','S',1002,NULL,'Admin',12,'fa fa-money','Payment Configuration','Payment Configuration','I',0,1,0,0,'V2','PAYMENT_CONFIGURATION',0,'1002,1014','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1029,'Payments','Payments','fa fa-credit-card','/home/payments','0','S',1015,NULL,'Admin',4,'fa fa-credit-card','Payments','Payments','A',1,1,1,0,'V2','PAYMENT',1,'1005,1015','System','2021-09-27 17:23:01',NULL,NULL,NULL,NULL),(1030,'Bill Templates','Bill Templates','fa fa-file-image-o','/home/bills','1','S',1005,NULL,'Admin',4,'fa fa-file-image-o','Bill Templates','Bill Templates','A',0,1,0,0,'V2','BILL_TEMPLATES',0,'1005,1015','admin','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1031,'Recurring Bills','Recurring Bills','fa fa-retweet','/home/bills','2','S',1005,NULL,'Admin',5,'fa fa-retweet','Recurring Bills','Recurring Bills','A',0,1,0,0,'V2','RECURRING_BILLS',0,'1005,1015','admin','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1032,'Approved Bills','Approved Bills','fa fa-check-square-o','/home/payments','0','S',1029,NULL,'Admin',1,'fa fa-check-square-o','Approved Bills','Approved Bills','I',0,1,0,0,'V2','PAYMENT_APPROVED_BILLS',0,'1005,1029','System','2021-09-28 12:01:11',NULL,NULL,NULL,NULL),(1033,'Batch Payments','Batch Payments','fa fa-sitemap','/home/payments','1','S',1029,NULL,'Admin',2,'fa fa-sitemap','Batch Payments','Batch Payments','I',0,1,0,0,'V2','PAYMENT_BATCH',0,'1005,1029','System','2021-09-28 12:01:11',NULL,NULL,NULL,NULL),(1034,'Vendor Payments','Vendor Payments','fa fa-handshake-o','/home/payments','2','S',1029,NULL,'Admin',3,'fa fa-handshake-o','Vendor Payments','Vendor Payments','I',0,1,0,0,'V2','PAYMENT_VENDOR',0,'1005,1029','System','2021-09-28 12:01:11',NULL,NULL,NULL,NULL),(1035,'Vendors','Vendors','pi pi-users','/home/vendor','0','S',1004,NULL,'Admin',0,'pi pi-users','Vendors','Vendors','A',0,1,0,0,'V2','VENDORS_SUB',0,'1004,1015','System','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1037,'Send An Invitation','Send An Invitation','fa fa-envelope-open','/home/vendor','1','S',1004,NULL,'Admin',1,'fa fa-envelope-open','Send An Invitation','Send An Invitation','A',0,1,0,0,'V2','SEND_AN_INVITATION',0,'1004,1015','System','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1038,'Import Vendors','Import Vendors','fa fa-sign-in','/home/vendor','2','S',1004,NULL,'Admin',2,'fa fa-sign-in','Import Vendors','Import Vendors','A',0,1,0,0,'V2','IMPORT_VENDORS',0,'1004,1015','System','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1039,'Vendor Request','Vendor Request','fa fa-paper-plane','/home/vendor','3','S',1004,NULL,'Admin',3,'fa fa-paper-plane','Vendor Request','Vendor Request','A',0,1,0,0,'V2','VENDOR_REQUEST',0,'1004,1015','System','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1040,'Community Vendors','Community Vendors','fa fa-users','/home/vendor','4','S',1004,NULL,'Admin',4,'fa fa-users','Community Vendors','Community Vendors','A',0,1,0,0,'V2','COMMUNITY_VENDORS',0,'1004,1015','System','2022-03-24 12:37:39',NULL,NULL,NULL,NULL),(1041,'Departments','Departments','fa fa-sitemap','/home/settings','1','S',1002,NULL,'Admin',13,'fa fa-sitemap','Departments','Departments','A',0,1,0,0,'V2','DEPARTMENTS',0,'1002,1014','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1042,'Inbox','Inbox','fa fa-inbox','/home/inbox','0','S',1014,NULL,'Admin',2,'fa fa-inbox','Inbox','Inbox','I',0,1,0,0,'V2','INBOX',1,'1014','System','2021-12-29 06:47:48',NULL,NULL,NULL,NULL),(1043,'Show And Hide Fields','Show And Hide Fields','fa fa-align-left','/home/settings','3','S',1002,NULL,'Admin',14,'fa fa-align-left','Show And Hide Fields','Show And Hide Fields','I',0,1,0,0,'V2','SHOW_HIDE_FIELDS',0,'1002,1014','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1044,'Manage Features','Manage Features','fa fa-cogs','/home/settings','0','S',1002,NULL,'Admin',5,'fa fa-cogs','Manage Features','Manage Features','I',0,1,0,0,'V2','MANAGE_FEATURES',0,'1002','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1045,'PO Price Variance Configuration','PO Price Variance Configuration','pi pi-money-bill','/home/settings','0','S',1002,NULL,'Admin',13,'pi pi-money-bill','PO Price Variance Configuration','PO Price Variance Configuration','I',0,1,0,0,'V2','PO_PRICE_VARIANCE_CONFIGURATION',0,'1002,1014','System','2022-03-21 12:02:32',NULL,NULL,NULL,NULL),(1046,'Configurations','Configurations','fa fa-cogs','/home/settings','2','S',1002,NULL,'Admin',13,'fa fa-cogs','Configurations','Configurations','A',0,1,0,0,'V2','CONFIGURATIONS',0,'1002,1014','System','2022-02-23 13:56:16',NULL,NULL,NULL,NULL),(1048,'Credit Card Statements','Credit Card Statements','pi pi-credit-card','/home/expense','1','S',1007,NULL,'Admin',1,'pi pi-credit-card','Credit Card Statements','Credit Card Statements','A',0,1,0,0,'V2','CREDIT_CARD_STATEMENTS',0,'1015,1007','admin','2022-06-10 04:05:35',NULL,NULL,NULL,NULL),(1049,'Credit Notes','Credit Notes','fa fa-list-alt','/home/bills','3','S',1005,NULL,'Admin',6,'fa fa-list-alt','Credit Notes','Credit Notes','A',0,1,0,0,'V2','CREDIT_NOTE',0,'1005,1015','System','2022-04-27 12:51:06',NULL,NULL,NULL,NULL),(1050,'Support Ticket','Support Tickets','fa-solid fa-headset','/home/support-ticket','','S',1014,NULL,'Admin',15,'fa-solid fa-headset','Support Ticket','Support Ticket','I',1,1,0,0,'V2','SUPPORT_TICKET',1,'1014','System','2022-11-28 12:07:51',NULL,NULL,NULL,NULL),(1051,'Expenses','Expenses','fa fa-usd','/home/expense','0','S',1007,NULL,'Admin',0,'fa fa-usd','Expenses','Expenses','A',0,1,0,1,'V2','EXPENSES',0,'1015,1007','System','2022-06-15 15:01:47',NULL,NULL,NULL,NULL),(1052,'Credit Card','Credit Card','pi pi-credit-card','/home/expense','1000','S',1048,NULL,'Admin',0,'pi pi-credit-card','Credit Card','Credit Card','A',0,1,0,0,'V2','CREDIT_CARD',0,'1015,1007,1048','System','2022-06-10 11:08:56',NULL,NULL,NULL,NULL),(1053,'Upload Transactions','Upload Transactions','pi pi-upload','/home/expense','1001','S',1048,NULL,'Admin',1,'pi pi-upload','Upload Transactions','Upload Transactions','A',0,1,0,0,'V2','CREDIT_CARD_UPLOAD_TRANSACTIONS',0,'1015,1007,1048','System','2022-06-10 11:08:56',NULL,NULL,NULL,NULL),(1054,'Process Transactons','Process Transactons','fa fa-share-square-o','/home/expense','1002','S',1048,NULL,'Admin',2,'fa fa-share-square-o','Process Transactons','Process Transactons','A',0,1,0,0,'V2','CREDIT_CARD_PROCESS_TRANSACTIONS',0,'1015,1007,1048','System','2022-06-10 11:08:56',NULL,NULL,NULL,NULL),(1055,'Submitted Transactions','Submitted Transactions','pi pi-envelope','/home/expense','1003','S',1048,NULL,'Admin',3,'pi pi-envelope','Submitted Transactions','Submitted Transactions','A',0,1,0,0,'V2','CREDIT_CARD_SUBMITTED_TRANSACTIONS',0,'1015,1007,1048','System','2022-06-10 11:08:56',NULL,NULL,NULL,NULL),(1056,'Approved Transactions','Approved Transactions','pi pi-check-square','/home/expense','1004','S',1048,NULL,'Admin',4,'pi pi-check-square','Approved Transactions','Approved Transactions','A',0,1,0,0,'V2','CREDIT_CARD_APPROVED_TRANSACTIONS',0,'1015,1007,1048','System','2022-06-10 11:08:56',NULL,NULL,NULL,NULL),(1057,'Receipt','Receipt','pi pi-book','/home/expense','2','S',1007,NULL,'Admin',2,'pi pi-book','Receipt','Receipt','A',0,1,0,0,'V2','CREDIT_CARD_RECEIPT',0,'1015,1007','System','2022-06-09 18:07:57',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_menu_privilage`
--

LOCK TABLES `umm_menu_privilage` WRITE;
/*!40000 ALTER TABLE `umm_menu_privilage` DISABLE KEYS */;
INSERT INTO `umm_menu_privilage` VALUES (1,1011,1,'USERS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(3,1011,13,'USERS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(4,1011,14,'USERS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(5,1011,4,'USERS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(6,1011,3,'USERS_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(7,1011,55,'USERS_UNLOCK','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(8,1011,8,'USERS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(9,1012,1,'ROLES_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(10,1012,5,'ROLES_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(11,1012,13,'ROLES_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(12,1012,14,'ROLES_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(13,1012,3,'ROLES_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(14,1012,4,'ROLES_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(15,1013,1,'APPROVAL_GROUPS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(16,1013,4,'APPROVAL_GROUPS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(17,1013,5,'APPROVAL_GROUPS_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(18,1013,13,'APPROVAL_GROUPS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(19,1013,14,'APPROVAL_GROUPS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(20,1013,8,'APPROVAL_GROUPS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(21,1017,4,'COMPANY_PROFILE_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(23,1017,56,'COMPANY_PROFILE_CONVERT_TO_PORTAL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(24,1018,1,'ADDITIONAL_FIELDS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(25,1018,4,'ADDITIONAL_FIELDS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(27,1018,13,'ADDITIONAL_FIELDS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(28,1018,14,'ADDITIONAL_FIELDS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(29,1003,1,'AUTOMATION_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(30,1003,4,'AUTOMATION_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(31,1003,5,'AUTOMATION_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(32,1003,13,'AUTOMATION_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(33,1003,14,'AUTOMATION_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(34,1003,3,'AUTOMATION_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(35,1008,1,'ITEMS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(36,1008,8,'ITEMS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(37,1008,4,'ITEMS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(38,1008,5,'ITEMS_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(39,1008,13,'ITEMS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(40,1008,14,'ITEMS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(41,1008,3,'ITEMS_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(42,1009,1,'ACCOUNTS_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(43,1009,8,'ACCOUNTS_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(44,1009,4,'ACCOUNTS_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(45,1009,5,'ACCOUNTS_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(46,1009,13,'ACCOUNTS_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(47,1009,14,'ACCOUNTS_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(48,1009,3,'ACCOUNTS_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(55,1035,1,'VENDORS_CREATE','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(56,1037,57,'VENDORS_SEND_VENDOR_INVITATION','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(57,1038,8,'VENDORS_UPLOAD','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(58,1039,58,'VENDORS_APPROVE_VENDOR_REQUEST','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(59,1035,4,'VENDORS_EDIT','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(60,1035,3,'VENDORS_DETAIL_VIEW','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(61,1019,1,'BILL_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(62,1019,59,'BILL_PROCESS','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(63,1019,4,'BILL_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(64,1019,6,'BILL_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(65,1019,7,'BILL_REJECT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(66,1019,60,'BILL_QUICK_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(67,1019,38,'BILL_SKIP_APPROVAL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(68,1019,3,'BILL_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(69,1019,10,'BILL_VIEW_AUDIT_TRAIL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(70,1019,61,'BILL_DOWNLOAD_BILL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(71,1019,62,'BILL_APPLY_PAYMENT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(72,1019,63,'BILL_VIEW_PAYMENTS','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(73,1019,5,'BILL_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(74,1019,47,'BILL_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(75,1020,1,'BILL_PAYMENT_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(76,1020,8,'BILL_PAYMENT_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(77,1020,64,'BILL_PAYMENT_CHANGE_BILL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(78,1020,27,'BILL_PAYMENT_MARK_AS_MAILED','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(79,1020,28,'BILL_PAYMENT_REVOKE_PAYMENT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(80,1020,3,'BILL_PAYMENT_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(81,1020,65,'BILL_PAYMENT_VIEW_BILLS','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(82,1020,47,'BILL_PAYMENT_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(83,1020,39,'BILL_PAYMENT_DOWNLOAD_RECEIPT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(84,1021,1,'PURCHASE_ORDER_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(85,1021,4,'PURCHASE_ORDER_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(86,1021,3,'PURCHASE_ORDER_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(87,1021,5,'PURCHASE_ORDER_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(88,1021,6,'PURCHASE_ORDER_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(89,1021,7,'PURCHASE_ORDER_REJECT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(90,1021,10,'PURCHASE_ORDER_VIEW_AUDIT_TRAIL','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(91,1021,47,'PURCHASE_ORDER_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(92,1021,66,'PURCHASE_ORDER_DOWNLOAD_REPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(93,1021,60,'PURCHASE_ORDER_QUICK_APPROVE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(94,1022,1,'PO_RECEIPT_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(95,1022,4,'PO_RECEIPT_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(96,1022,3,'PO_RECEIPT_DETAIL_VIEW','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(97,1022,5,'PO_RECEIPT_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(99,1022,41,'PO_RECEIPT_CLOSE_PO_RECEIPT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(100,1022,47,'PO_RECEIPT_CSV_EXPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(101,1022,66,'PO_RECEIPT_DOWNLOAD_REPORT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(102,1051,1,'EXPENSES_CREATE','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(103,1051,4,'EXPENSES_EDIT','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(104,1051,5,'EXPENSES_DELETE','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(105,1051,6,'EXPENSES_APPROVE','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(106,1051,7,'EXPENSES_REJECT','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(107,1051,10,'EXPENSES_VIEW_AUDIT_TRAIL','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(108,1051,66,'EXPENSES_DOWNLOAD_REPORT','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(109,1051,68,'EXPENSES_VIEW_REPORT','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(110,1051,47,'EXPENSES_CSV_EXPORT','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(111,1051,60,'EXPENSES_QUICK_APPROVE','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(112,1010,1,'PROJECT_CODES_CREATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(113,1010,4,'PROJECT_CODES_EDIT','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(114,1010,5,'PROJECT_CODES_DELETE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(115,1010,13,'PROJECT_CODES_INACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(116,1010,14,'PROJECT_CODES_ACTIVATE','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(117,1010,8,'PROJECT_CODES_UPLOAD','System','2021-03-14 16:37:55',NULL,NULL,NULL,NULL),(119,1019,40,'BILL_OVERRIDE_APPROVAL','System','2021-03-16 17:16:59',NULL,NULL,NULL,NULL),(120,1021,40,'PURCHASE_ORDER_OVERRIDE_APPROVAL','System','2021-03-16 17:17:02',NULL,NULL,NULL,NULL),(121,1051,40,'EXPENSES_OVERRIDE_APPROVAL','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(339,1019,17,'BILL_UNDO_ACTION','System','2021-03-31 16:11:30',NULL,NULL,NULL,NULL),(340,1021,16,'PURCHASE_ORDER_CHANGE_ASSIGNEE','System','2021-03-31 16:14:05',NULL,NULL,NULL,NULL),(342,1051,16,'EXPENSES_CHANGE_ASSIGNEE','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(344,1051,38,'EXPENSES_SKIP_APPROVAL','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(350,1022,42,'PO_RECEIPT_GENERATE_AN_INVOICE','System','2021-04-01 13:56:41',NULL,NULL,NULL,NULL),(351,1021,42,'PURCHASE_ORDER_CREATE_BILL','System','2021-04-01 14:01:35',NULL,NULL,NULL,NULL),(353,1024,3,'SYNC_DASHBORD_DETAIL_VIEW','System','2021-04-06 07:01:01',NULL,NULL,NULL,NULL),(354,1000,71,'DASHBOARD_SHOW_VENDOR_REQUEST_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(355,1000,72,'DASHBOARD_SHOW_PENDING_AND_REJECTED_BILLS_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(356,1000,73,'DASHBOARD_SHOW_PENDING_AND_REJECTED_PO_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(357,1000,74,'DASHBOARD_SHOW_PENDING_AND_REJECTED_EXPENSE_CARD','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(358,1000,75,'DASHBOARD_SHOW_MONTHLY_TRANSACTION_SUMMARY_CHART','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(359,1000,76,'DASHBOARD_SHOW_MONTHLY_BILLS_AND_PAYMENT_SUMMARY_CHART','System','2021-04-13 15:22:51',NULL,NULL,NULL,NULL),(360,1019,77,'BILL_SAVE_AS_APPROVED','System','2021-04-20 12:26:34',NULL,NULL,NULL,NULL),(361,1021,77,'PURCHASE_ORDER_SAVE_AS_APPROVED','System','2021-04-20 12:27:19',NULL,NULL,NULL,NULL),(362,1051,77,'EXPENSE_SAVE_AS_APPROVED','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(363,1025,68,'VIEW_REPORT_SHOW_REPORTS','System','2021-05-11 14:14:23',NULL,NULL,NULL,NULL),(374,1000,78,'DASHBOARD_SHOW_DISCOUNT_APPLICABLE_BILL_TABLE','System','2021-05-21 02:17:33',NULL,NULL,NULL,NULL),(375,1040,79,'VENDORS_ADD_TO_LOCAL_VENDOR_LIST','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(376,1011,5,'USERS_DELETE','System','2021-06-11 13:30:32',NULL,NULL,NULL,NULL),(377,1021,70,'PURCHASE_ORDER_SEND_VENDOR_APPROVAL','System','2021-05-21 21:32:36',NULL,NULL,NULL,NULL),(378,1027,1,'PO_NUMBER_CONFIGURATION_CREATE','System','2021-06-14 21:41:05',NULL,NULL,NULL,NULL),(379,1027,2,'PO_NUMBER_CONFIGURATION_SEARCH','System','2021-06-14 21:41:57',NULL,NULL,NULL,NULL),(380,1027,4,'PO_NUMBER_CONFIGURATION_EDIT','System','2021-06-14 21:42:42',NULL,NULL,NULL,NULL),(381,1027,5,'PO_NUMBER_CONFIGURATION_DELETE','System','2021-06-14 21:43:22',NULL,NULL,NULL,NULL),(382,1019,16,'BILL_CHANGE_ASSIGNEE','System','2021-06-15 13:48:00',NULL,NULL,NULL,NULL),(383,1051,3,'EXPENSES_DETAIL_VIEW','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(384,1035,5,'VENDORS_DELETE','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(385,1037,80,'VENDORS_RESEND_VENDOR_INVITATION','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(386,1037,81,'VENDORS_DELETE_VENDOR_INVITATION','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(387,1039,82,'VENDORS_REJECT_VENDOR_REQUEST','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(388,1039,83,'VENDORS_DELETE_VENDOR_REQUEST','System','2021-11-02 16:48:06',NULL,NULL,NULL,NULL),(391,1022,45,'PO_RECEIPT_RE_OPEN_PO_RECEIPT','System','2021-07-07 19:59:00',NULL,NULL,NULL,NULL),(392,1000,84,'SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 17:06:25',NULL,NULL,NULL,NULL),(393,1000,85,'SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 17:07:33',NULL,NULL,NULL,NULL),(394,1000,86,'SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 17:08:06',NULL,NULL,NULL,NULL),(399,1028,91,'SEND_CONFIGURATION_REQUEST','System','2021-09-28 21:46:24',NULL,NULL,NULL,NULL),(400,1028,92,'CONFIGURE_PAYMENT_ACTION','System','2021-08-23 10:31:55',NULL,NULL,NULL,NULL),(401,1032,3,'PAYMENT_DETAIL_VIEW','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(402,1033,6,'PAYMENT_APPROVE','System','2021-09-27 14:36:55',NULL,NULL,NULL,NULL),(403,1033,7,'PAYMENT_REJECT','System','2021-09-27 14:36:58',NULL,NULL,NULL,NULL),(404,1032,11,'PAYMENT_SUBMIT','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(405,1032,93,'PAYMENT_PAY_NOW','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(406,1033,3,'PAYMENT_BATCH_DETAIL_VIEW','System','2021-09-27 14:43:19',NULL,NULL,NULL,NULL),(407,1032,95,'PAYMENT_SCHEDULE_PAYMENT','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(408,1033,96,'PAYMENT_CANCEL_BATCH_PAYMENT','System','2021-09-27 14:37:27',NULL,NULL,NULL,NULL),(409,1033,40,'PAYMENT_OVERRIDE_APPROVAL','System','2021-09-27 14:37:42',NULL,NULL,NULL,NULL),(410,1030,1,'BILL_TEMPLATES_CREATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(411,1030,4,'BILL_TEMPLATES_EDIT','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(412,1030,14,'BILL_TEMPLATES_ACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(413,1030,13,'BILL_TEMPLATES_INACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(414,1030,5,'BILL_TEMPLATES_DELETE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(415,1030,3,'BILL_TEMPLATES_DETAIL_VIEW','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(416,1030,97,'BILL_TEMPLATES_DOWNLOAD','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(417,1031,1,'RECURRING_BILLS_CREATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(418,1031,4,'RECURRING_BILLS_EDIT','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(419,1031,14,'RECURRING_BILLS_ACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(420,1031,13,'RECURRING_BILLS_INACTIVATE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(421,1031,5,'RECURRING_BILLS_DELETE','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(422,1031,3,'RECURRING_BILLS_DETAIL_VIEW','admin','2021-09-09 11:59:00',NULL,NULL,NULL,NULL),(423,1032,98,'PAYMENT_DOWNLOAD_ATTACHMENT','System','2021-09-27 11:57:32',NULL,NULL,NULL,NULL),(424,1034,101,'PAYMENT_VIEW_SUMMARY','System','2021-09-27 14:31:39',NULL,NULL,NULL,NULL),(425,1033,10,'PAYMENT_VIEW_AUDIT_TRIAL','System','2021-09-27 14:40:38',NULL,NULL,NULL,NULL),(426,1012,99,'ROLES_CLONE','System','2021-09-30 07:33:00',NULL,NULL,NULL,NULL),(428,1035,102,'VENDOR_SHOW_BILLS','System','2021-10-29 08:09:09',NULL,NULL,NULL,NULL),(429,1035,103,'VENDOR_SHOW_BILL_PAYMENTS','System','2021-10-29 08:15:01',NULL,NULL,NULL,NULL),(430,1035,104,'VENDOR_SHOW_PURCHASE_ORDERS','System','2021-10-29 08:19:07',NULL,NULL,NULL,NULL),(431,1035,105,'VENDOR_SHOW_PO_RECEIPTS','System','2021-10-29 08:23:32',NULL,NULL,NULL,NULL),(432,1035,13,'VENDOR_INACTIVATE','System','2021-10-29 08:33:58',NULL,NULL,NULL,NULL),(436,1040,3,'VENDOR_COMMUNITY_VENDORS_DETAIL_VIEW','System','2021-10-29 08:48:38',NULL,NULL,NULL,NULL),(437,1035,14,'VENDOR_ACTIVATE','System','2021-11-01 14:08:03',NULL,NULL,NULL,NULL),(438,1041,1,'DEPARTMENT_CREATE','System','2021-11-11 10:13:05',NULL,NULL,NULL,NULL),(439,1041,4,'DEPARTMENT_EDIT','System','2021-11-11 10:15:26',NULL,NULL,NULL,NULL),(440,1041,5,'DEPARTMENT_DELETE','System','2021-11-11 10:16:21',NULL,NULL,NULL,NULL),(441,1041,13,'DEPARTMENT_INACTIVE','System','2021-11-11 10:17:25',NULL,NULL,NULL,NULL),(442,1041,14,'DEPARTMENT_ACTIVE','System','2021-11-11 10:18:04',NULL,NULL,NULL,NULL),(443,1041,8,'DEPARTMENT_UPLOAD','System','2021-11-11 10:18:53',NULL,NULL,NULL,NULL),(444,1042,2,'INBOX_SEARCH','System','2021-11-02 11:11:41',NULL,NULL,NULL,NULL),(445,1042,5,'INBOX_DELETE','System','2021-11-02 12:27:24',NULL,NULL,NULL,NULL),(446,1042,108,'INBOX_ATTACH_TO','System','2021-11-02 12:35:24',NULL,NULL,NULL,NULL),(447,1042,109,'INBOX_REVIEW','System','2021-11-02 12:40:07',NULL,NULL,NULL,NULL),(448,1042,110,'INBOX_MOVE_TO_TO_PROCESS','System','2021-11-02 12:47:42',NULL,NULL,NULL,NULL),(449,1042,111,'INBOX_RECOVER','System','2021-11-02 12:53:41',NULL,NULL,NULL,NULL),(450,1042,113,'INBOX_EMAIL_EDIT','System','2021-11-02 12:53:41',NULL,NULL,NULL,NULL),(451,1042,112,'INBOX_SEGREGATE','System','2021-11-17 12:10:56',NULL,NULL,NULL,NULL),(452,1043,114,'SHOW_HIDE_FIELD','System','2021-12-28 19:46:52',NULL,NULL,NULL,NULL),(453,1044,115,'ENABLE_FEATURES','System','2021-12-28 11:38:45',NULL,NULL,NULL,NULL),(457,1035,116,'ENABLE_ACCESS_TO_CONFIDENTIAL_DOCUMENTS','System','2022-01-05 14:43:42',NULL,NULL,NULL,NULL),(458,1010,117,'PROJECT_CODES_DETAIL_VIEW','System','2022-01-31 18:53:03',NULL,NULL,NULL,NULL),(459,1045,1,'PO_PRICE_VARIANCE_CONFIGURATION_CREATE','System','2022-02-17 13:58:31',NULL,NULL,NULL,NULL),(460,1045,2,'PO_PRICE_VARIANCE_CONFIGURATION_SEARCH','System','2022-02-17 13:59:57',NULL,NULL,NULL,NULL),(461,1045,4,'PO_PRICE_VARIANCE_CONFIGURATION_EDIT','System','2022-02-17 14:01:43',NULL,NULL,NULL,NULL),(462,1045,5,'PO_PRICE_VARIANCE_CONFIGURATION_DELETE','System','2022-02-17 14:03:01',NULL,NULL,NULL,NULL),(463,1021,118,'PURCHASE_ORDER_SEND_ATTACHMENT','System','2022-02-22 10:30:55',NULL,NULL,NULL,NULL),(464,1051,17,'EXPENSES_UNDO','System','2022-06-09 13:18:53',NULL,NULL,NULL,NULL),(465,1021,17,'PURCHASE_ORDER_UNDO_ACTION','System','2022-02-24 10:00:00',NULL,NULL,NULL,NULL),(466,1021,119,'CLOSE_PURCHASE_ORDER','System','2022-03-01 14:29:36',NULL,NULL,NULL,NULL),(467,1021,120,'RE_OPEN_PURCHASE_ORDER','System','2022-03-01 15:30:39',NULL,NULL,NULL,NULL),(468,1021,38,'PURCHASE_ORDER_SKIP_APPROVAL','System','2022-03-14 08:34:53',NULL,NULL,NULL,NULL),(471,1046,121,'CONFIGURE_PO_VARIANCE_ALLOWANCE','System','2022-03-09 13:32:20',NULL,NULL,NULL,NULL),(472,1046,122,'MANAGE_ADDITIONAL_FIELDS','System','2022-03-09 13:32:42',NULL,NULL,NULL,NULL),(473,1046,123,'MANAGE_SHOW_HIDE_FIELDS','System','2022-03-09 13:33:00',NULL,NULL,NULL,NULL),(474,1046,124,'PO_NO_CONFIGURATION','System','2022-03-09 13:33:25',NULL,NULL,NULL,NULL),(475,1046,125,'PAYMENT_CONFIGURATION','System','2022-03-09 15:44:47',NULL,NULL,NULL,NULL),(476,1046,126,'FEATURE_CONFIGURATION','System','2022-03-09 15:53:28',NULL,NULL,NULL,NULL),(478,1049,1,'CREDIT_NOTE_CREATE','System','2022-04-15 15:00:32',NULL,NULL,NULL,NULL),(479,1049,2,'CREDIT_NOTE_SEARCH','System','2022-04-19 10:36:27',NULL,NULL,NULL,NULL),(480,1049,3,'CREDIT_NOTE_DETAIL_VIEW','System','2022-04-19 10:40:33',NULL,NULL,NULL,NULL),(481,1049,4,'CREDIT_NOTE_EDIT','System','2022-04-19 10:40:49',NULL,NULL,NULL,NULL),(482,1049,5,'CREDIT_NOTE_DELETE','System','2022-04-19 10:42:43',NULL,NULL,NULL,NULL),(483,1049,127,'CREDIT_NOTE_APPLY_TO_BILL','System','2022-04-25 16:04:40',NULL,NULL,NULL,NULL),(484,1019,128,'BILL_APPLY_CREDIT_NOTE','System','2022-04-26 09:28:36',NULL,NULL,NULL,NULL),(485,1032,128,'APPLY_CREDIT_NOTE_TO_APPROVED_BILLS','System','2022-05-06 12:23:59',NULL,NULL,NULL,NULL),(486,1049,129,'CREDIT_NOTE_VIEW_ATTACHED_BILL','System','2022-05-06 12:29:12',NULL,NULL,NULL,NULL),(489,1021,132,'CREATE_CREDIT_NOTE','System','2022-05-18 15:19:56',NULL,NULL,NULL,NULL),(490,1052,1,'CREDIT_CARD_CREATE','System','2022-06-09 12:16:06',NULL,NULL,NULL,NULL),(491,1052,4,'CREDIT_CARD_EDIT','System','2022-06-09 12:16:42',NULL,NULL,NULL,NULL),(492,1052,14,'CREDIT_CARD_ACTIVE','System','2022-06-09 13:10:37',NULL,NULL,NULL,NULL),(493,1052,13,'CREDIT_CARD_INACTIVE','System','2022-06-09 13:10:39',NULL,NULL,NULL,NULL),(494,1052,5,'CREDIT_CARD_DELETE','System','2022-06-09 13:10:43',NULL,NULL,NULL,NULL),(495,1053,8,'CREDIT_CARD_UPLOAD_TRANSACTIONS_UPLOAD','System','2022-06-09 14:00:44',NULL,NULL,NULL,NULL),(496,1053,4,'CREDIT_CARD_UPLOAD_TRANSACTIONS_EDIT','System','2022-06-09 14:00:41',NULL,NULL,NULL,NULL),(497,1054,1,'CREDIT_CARD_PROCESS_TRANSACTIONS_CREATE','System','2022-06-09 14:00:39',NULL,NULL,NULL,NULL),(498,1054,10,'CREDIT_CARD_PROCESS_TRANSACTIONS_VIEW_AUDIT_TRIAL','System','2022-06-09 14:00:37',NULL,NULL,NULL,NULL),(499,1054,11,'CREDIT_CARD_PROCESS_TRANSACTIONS_SUBMIT','System','2022-06-09 14:00:34',NULL,NULL,NULL,NULL),(500,1054,77,'CREDIT_CARD_PROCESS_TRANSACTIONS_SAVE_AS_APPROVED','System','2022-06-09 14:00:32',NULL,NULL,NULL,NULL),(501,1055,6,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_APPROVE','System','2022-06-09 14:02:01',NULL,NULL,NULL,NULL),(502,1055,60,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_QUICK_APPROVE','System','2022-06-09 14:02:03',NULL,NULL,NULL,NULL),(503,1055,7,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_REJECT','System','2022-06-09 14:02:05',NULL,NULL,NULL,NULL),(504,1055,16,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_CHANGE_ASSIGNEE','System','2022-06-09 14:02:08',NULL,NULL,NULL,NULL),(505,1055,38,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_SKIP_APPROVAL','System','2022-06-09 14:01:41',NULL,NULL,NULL,NULL),(506,1055,10,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_VIEW_AUDIT_TRIAL','System','2022-06-09 14:01:33',NULL,NULL,NULL,NULL),(507,1055,40,'CREDIT_CARD_SUBMITTED_TRANSACTIONS_OVERRIDE_APPROVAL','System','2022-06-09 14:01:30',NULL,NULL,NULL,NULL),(508,1056,133,'CREDIT_CARD_APPROVED_TRANSACTIONS_GENERATE_BILL','System','2022-06-09 14:01:24',NULL,NULL,NULL,NULL),(509,1056,10,'CREDIT_CARD_APPROVED_TRANSACTIONS_VIEW_AUDIT_TRIAL','System','2022-06-09 14:01:20',NULL,NULL,NULL,NULL),(510,1057,8,'CREDIT_CARD_RECEIPT_UPLOAD','System','2022-06-09 13:59:05',NULL,NULL,NULL,NULL),(511,1057,5,'CREDIT_CARD_RECEIPT_DELETE','System','2022-06-09 13:59:06',NULL,NULL,NULL,NULL),(512,1057,98,'CREDIT_CARD_RECEIPT_DOWNLOAD_ATTACHMENT','System','2022-06-09 13:59:08',NULL,NULL,NULL,NULL),(513,1021,134,'PO_GENERATE_PO_RECEIPT','System','2022-06-16 10:47:00',NULL,NULL,NULL,NULL),(515,1031,42,'RECURRING_BILLS_CREATE_BILL','System','2022-06-22 17:43:21',NULL,NULL,NULL,NULL),(516,1057,135,'CREDIT_CARD_RECEIPT_UPLOAD_FOR_USER','System','2022-07-04 13:42:33',NULL,NULL,NULL,NULL),(517,1046,136,'REMINDER_CONFIGURATION','System','2022-08-07 12:19:34',NULL,NULL,NULL,NULL),(518,1046,137,'CONFIGURE_MILEAGE_RATE','System','2022-08-17 15:12:31',NULL,NULL,NULL,NULL),(519,1019,138,'BILL_OFFLINE_PAYMENT_PROCESSING','System','2022-11-02 17:54:44',NULL,NULL,NULL,NULL),(520,1051,139,'VIEW_ALL_EXPENSE_REPORTS','System','2022-11-11 12:08:46',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_privilages`
--

LOCK TABLES `umm_privilages` WRITE;
/*!40000 ALTER TABLE `umm_privilages` DISABLE KEYS */;
INSERT INTO `umm_privilages` VALUES (1,'Create','Create','CREATE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(2,'Search','Search','SEARCH','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(3,'Detail View','Detail View','DETAIL_VIEW','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(4,'Edit','Edit','EDIT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(5,'Delete','Delete','DELETE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(6,'Approve','Approve','APPROVE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(7,'Reject','Reject','REJECT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(8,'Upload','Upload','UPLOAD','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(10,'View Audit Trail','View Audit Trail','VIEW_AUDIT_TRAIL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(11,'Submit','Submit','SUBMIT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(12,'Re-Submit','Re-Submit','RE_SUBMIT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(13,'Inactivate','Inactivate','INACTIVATE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(14,'Activate','Activate','ACTIVATE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(15,'Reset Password','Reset Password','RESET_PASSWORD','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(16,'Change Assignee','Change Assignee','CHANGE_ASSIGNEE','System','2021-03-31 18:25:29',NULL,NULL,NULL,NULL),(17,'Undo Last Action','Undo Last Action','UNDO_ACTION','System','2021-03-31 18:25:29',NULL,NULL,NULL,NULL),(22,'System Shortcuts','System Shortcuts','SYSTEM_SHORTCUTS','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(23,'Invoice Summary ','Invoice Summary ','INVOICE_SUMMARY ','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(24,'Accumulated Invoice Summary ','Accumulated Invoice Summary ','ACCUMULATED_INVOICE_SUMMARY ','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(25,'Invoice Approval','Invoice Approval','INVOICE_APPROVAL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(26,'Change Invoice','Change Invoice','CHANGE_INVOICE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(27,'Mark As Mailed','Mark As Mailed','MARK_AS_MAILED','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(28,'Void Payment','Void Payment','REVOKE_PAYMENT','System','2021-02-12 00:08:43',NULL,NULL,NULL,NULL),(29,'Check Sync','Check Sync','CHECK_SYNC','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(30,'Vendor Sync','Vendor Sync','VENDOR_SYNC','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(31,'Change Auto Sync Status','Change Auto Sync Status','CHANGE_AUTO_SYNC_STATUS','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(32,'View Check Sync History','View Check Sync History','VIEW_CHECK_SYNC_HISTORY','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(33,'View Vendor Sync History','View Vendor Sync History','VIEW_VENDOR_SYNC_HISTORY','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(34,'View Discount Applicable Invoices','View Discount Applicable Invoices','VIEW_DISCOUNT_APPLICABLE_INVOICES','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(35,'View Invoice','View Invoice','VIEW_INVOICE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(37,'Change Package','Change Package','CHANGE_PACKAGE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(38,'Skip Approval','Skip Approval','SKIP_APPROVAL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(39,'Download Receipt','Download Receipt','DOWNLOAD_RECEIPT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(40,'Override Approval','Override Approval','OVERRIDE_APPROVAL','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(41,'Close PO Receipt','Close PO Receipt','CLOSE_PO_RECEIPT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(42,'Create Bill','Create Bill','CREATE_BILL','System','2021-04-01 08:54:21',NULL,NULL,NULL,NULL),(43,'Edit Description','Edit Description','EDIT_DESCRIPTION','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(44,'Generate Detailed Report','Generate Detailed Report','GENERATE_DETAILED_REPORT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(45,'Re-open PO Receipt','Re-open PO Receipt','RE_OPEN_PO_RECEIPT','System','2021-04-01 08:54:21',NULL,NULL,NULL,NULL),(46,'Download Invoice','Download Invoice','DOWNLOAD_INVOICE','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(47,'CSV Export','CSV Export','CSV_EXPORT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(48,'CSV Import','CSV Import','CSV_IMPORT','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(50,'Approve Permission Request','Approve Permission Request','APPROVE_PERMISSION_REQUEST','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(51,'Reject Permission Request','RejectPermission Request','REJECTPERMISSION_REQUEST','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(54,'Add Vendor','Add Vendor','ADD_VENDOR','System','2021-02-03 22:33:35',NULL,NULL,NULL,NULL),(55,'Unlock','Unlock','UNLOCK','System','2021-02-11 22:23:37',NULL,NULL,NULL,NULL),(56,'Convert To Agency Portal','Convert To Agency Portal','CONVERT_TO_PORTAL','System','2021-02-11 22:41:46',NULL,NULL,NULL,NULL),(57,'Send An Invitation','Send An Invitation','SEND_VENDOR_INVITATION','System','2021-06-25 13:10:21',NULL,NULL,NULL,NULL),(58,'Approve Vendor Request','Approve Vendor Request','APPROVE_VENDOR_REQUEST','System','2021-06-25 13:10:21',NULL,NULL,NULL,NULL),(59,'Process','Process','PROCESS','System','2021-02-11 23:51:24',NULL,NULL,NULL,NULL),(60,'Quick Approve','Quick Approve','QUICK_APPROVE','System','2021-02-11 23:53:21',NULL,NULL,NULL,NULL),(61,'Download Bill','Download Bill','DOWNLOAD_BILL','System','2021-02-11 23:59:44',NULL,NULL,NULL,NULL),(62,'Apply Payments','Apply Payments','APPLY_PAYMENT','System','2021-02-12 00:01:00',NULL,NULL,NULL,NULL),(63,'View Payments','View Payments','VIEW_PAYMENTS','System','2021-02-12 00:01:26',NULL,NULL,NULL,NULL),(64,'Change Bill','Change Bill','CHANGE_BILL','System','2021-02-12 00:06:22',NULL,NULL,NULL,NULL),(65,'View Bills','View Bills','VIEW_BILLS','System','2021-02-12 00:09:06',NULL,NULL,NULL,NULL),(66,'Download Report','Download Report','DOWNLOAD_REPORT','System','2021-02-12 00:18:06',NULL,NULL,NULL,NULL),(67,'Attach To a Bill','Attach To a Bill','ATTACH_TO_A_BILL','System','2021-02-12 00:23:04',NULL,NULL,NULL,NULL),(68,'View Report','View Report','VIEW_REPORT','System','2021-02-12 00:32:30',NULL,NULL,NULL,NULL),(70,'Send to Vendor Approval','Send to Vendor Approval','SEND_VENDOR_APPROVAL','System','2021-04-01 13:51:25',NULL,NULL,NULL,NULL),(71,'Show Vendor Request Card','Show Vendor Request Card','SHOW_VENDOR_REQUEST_CARD','System','2021-04-13 15:16:13',NULL,NULL,NULL,NULL),(72,'Show Pending and Rejected Bills Card','Show Pending and Rejected Bills Card','SHOW_PENDING_AND_REJECTED_BILLS_CARD','System','2021-04-13 15:17:02',NULL,NULL,NULL,NULL),(73,'Show Pending and Rejected PO Card','Show Pending and Rejected PO Card','SHOW_PENDING_AND_REJECTED_PO_CARD','System','2021-04-13 15:18:58',NULL,NULL,NULL,NULL),(74,'Show Pending and Rejected Expense Card','Show Pending and Rejected Expense Card','SHOW_PENDING_AND_REJECTED_EXPENSE_CARD','System','2021-04-13 15:19:38',NULL,NULL,NULL,NULL),(75,'Show Monthly Transaction Summary Chart','Show Monthly Transaction Summary Chart','SHOW_MONTHLY_TRANSACTION_SUMMARY_CHART','System','2021-04-13 15:20:43',NULL,NULL,NULL,NULL),(76,'Show Monthly Bills and Payment Summary Chart','Show Monthly Bills and Payment Summary Chart','SHOW_MONTHLY_BILLS_AND_PAYMENT_SUMMARY_CHART','System','2021-04-13 15:21:36',NULL,NULL,NULL,NULL),(77,'Save as Approved','Save as Approved','SAVE_AS_APPROVED','System','2021-04-20 12:23:27',NULL,NULL,NULL,NULL),(78,'Show Discount Applicable Bill Table','Show Discount Applicable Bill Table','SHOW_DISCOUNT_APPLICABLE_BILL_TABLE','System','2021-04-20 12:23:27',NULL,NULL,NULL,NULL),(79,'Add To Local Vendor List','Add To Local Vendor List','ADD_TO_LOCAL_VENDOR_LIST','System','2021-06-25 13:10:21',NULL,NULL,NULL,NULL),(80,'Resend An Invitation','Resend An Invitation','RESEND_VENDOR_INVITATION','System','2021-06-23 01:44:07',NULL,NULL,NULL,NULL),(81,'Delete An Invitation','Delete An Invitation','DELETE_VENDOR_INVITATION','System','2021-06-23 01:44:09',NULL,NULL,NULL,NULL),(82,'Reject Vendor Request','Reject Vendor Request','REJECT_VENDOR_REQUEST','System','2021-06-23 01:44:12',NULL,NULL,NULL,NULL),(83,'Delete Vendor Request','Delete Vendor Request','DELETE_VENDOR_REQUEST','System','2021-06-23 01:44:17',NULL,NULL,NULL,NULL),(84,'Show Bills Awaiting Your Approval Table','Show Bills Awaiting Your Approval Table','SHOW_BILLS_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 17:02:24',NULL,NULL,NULL,NULL),(85,'Show POS Awaiting Your Approval Table','Show POs Awaiting Your Approval Table','SHOW_PO_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 17:03:15',NULL,NULL,NULL,NULL),(86,'Show Expense Reports Awaiting Your Approval Table','Show Expense Reports Awaiting Your Approval Table','SHOW_EXPENSES_AWAITING_YOUR_APPROVAL_TABLE','System','2021-08-06 17:04:39',NULL,NULL,NULL,NULL),(91,'Send Configuration Request','Send Configuration Request','SEND_CONFIGURATION_REQUEST','System','2021-09-28 21:46:24',NULL,NULL,NULL,NULL),(92,'Configure Payment','Configure Payment','CONFIGURE_PAYMENT_ACTION','System','2021-08-23 10:31:10',NULL,NULL,NULL,NULL),(93,'Pay Now','Pay Now','PAY_NOW','System','2021-09-02 09:43:40',NULL,NULL,NULL,NULL),(94,'Make an Offline Payment','Make an Offline Payment','MAKE_AN_OFFLINE_PAYMENT','System','2021-09-02 09:44:21',NULL,NULL,NULL,NULL),(95,'Schedule Payment','Schedule Payment','SCHEDULE_PAYMENT','System','2021-09-02 09:45:47',NULL,NULL,NULL,NULL),(96,'Cancel Batch Payment','Cancel Batch Payment','CANCEL_BATCH_PAYMENT','System','2021-09-02 09:46:42',NULL,NULL,NULL,NULL),(97,'Download attachments','Download Attachments','DOWNLOAD_ATTACHMENTS','System','2021-09-30 09:19:33',NULL,NULL,NULL,NULL),(98,'Download Attachment','Download Attachment','DOWNLOAD_ATTACHMENT','System','2021-09-15 20:33:43',NULL,NULL,NULL,NULL),(99,'Clone','Clone','CLONE','admin','2021-09-30 07:27:00',NULL,NULL,NULL,NULL),(101,'View Summary','View Summary','VIEW_SUMMARY','System','2021-09-13 14:30:38',NULL,NULL,NULL,NULL),(102,'Show Bills','Show bills','SHOW_BILLS','System','2021-10-29 08:06:45',NULL,NULL,NULL,NULL),(103,'Show Bill Payments','Show Bill Payments','SHOW_BILL_PAYMENTS','System','2021-10-29 08:12:51',NULL,NULL,NULL,NULL),(104,'Show Purchase Orders','Show Purchase Orders','SHOW_PURCHASE_ORDERS','System','2021-10-29 08:17:05',NULL,NULL,NULL,NULL),(105,'Show PO Receipts','Show PO Receipts','SHOW_PO_RECEIPTS','System','2021-10-29 08:22:00',NULL,NULL,NULL,NULL),(106,'Create And Send Invitation','Create And Send Invitation','CREATE_AND_SEND_INVITATION','System','2021-10-29 08:36:33',NULL,NULL,NULL,NULL),(107,'Upload And Send Invitation','Upload And Send Invitation','UPLOAD_AND_SEND_INVITATION','System','2021-10-29 08:40:49',NULL,NULL,NULL,NULL),(108,'Attach To','Attach To','ATTACH_TO','System','2021-11-02 12:31:35',NULL,NULL,NULL,NULL),(109,'Send to Process Bill','Send to Process Bill','REVIEW','System','2021-12-17 10:36:54',NULL,NULL,NULL,NULL),(110,'Move To \'To Process\'','Move To \'To Process\'','MOVE_TO_TO_PROCESS','System','2021-11-02 12:44:51',NULL,NULL,NULL,NULL),(111,'Recover','Recover','RECOVER','System','2021-11-02 12:52:32',NULL,NULL,NULL,NULL),(112,'Segregate','Segregate','SEGREGATE','System','2021-11-17 11:45:39',NULL,NULL,NULL,NULL),(113,'Edit Email','Edit Email','EDIT_EMAIL','System','2021-11-17 11:45:39',NULL,NULL,NULL,NULL),(114,'Show And Hide Field','Show And Hide Field','SHOW_HIDE_FIELD','System','2021-12-28 19:44:48',NULL,NULL,NULL,NULL),(115,'Enable Feature','Enable Disable Feature','ENABLE_FEATURES','System','2022-01-04 07:30:57',NULL,NULL,NULL,NULL),(116,'Enable Access To Confidential Documents','Enable Access To Confidential Documents','ENABLE_ACCESS_TO_CONFIDENTIAL_DOCUMENTS','System','2022-01-05 14:40:28',NULL,NULL,NULL,NULL),(117,'Detail View','Detail View','PROJECT_CODES_DETAIL_VIEW','System','2022-01-05 14:40:28',NULL,NULL,NULL,NULL),(118,'Email To Vendor','Email To Vendor','PURCHASE_ORDER_SEND_ATTACHMENT','System','2022-02-23 05:29:26',NULL,NULL,NULL,NULL),(119,'Close Purchase Order','Close Purchase Order','CLOSE_PURCHASE_ORDER','System','2022-03-01 14:28:19',NULL,NULL,NULL,NULL),(120,'Re-open Purchase Order','Re-open Purchase Order','RE_OPEN_PURCHASE_ORDER','System','2022-03-01 15:27:46',NULL,NULL,NULL,NULL),(121,'Configure PO Variance Allowance','Configure PO Variance Allowance','CONFIGURE_PO_VARIANCE_ALLOWANCE','System','2022-03-09 13:11:42',NULL,NULL,NULL,NULL),(122,'Manage Additional Fields','Manage Additional Fields','MANAGE_ADDITIONAL_FIELDS','System','2022-03-09 13:12:40',NULL,NULL,NULL,NULL),(123,'Manage Show/Hide Fields','Manage Show/Hide Fields','MANAGE_SHOW_HIDE_FIELDS','System','2022-03-09 13:13:49',NULL,NULL,NULL,NULL),(124,'PO Number Configuration','PO Number Configuration','PO_NO_CONFIGURATION','System','2022-03-09 13:14:53',NULL,NULL,NULL,NULL),(125,'Payment Configuration','Payment Configuration','PAYMENT_CONFIGURATION','System','2022-03-09 15:41:28',NULL,NULL,NULL,NULL),(126,'Feature Configuration','Feature Configuration','FEATURE_CONFIGURATION','System','2022-03-09 15:42:30',NULL,NULL,NULL,NULL),(127,'Apply To Bill','Apply To Bill','CREDIT_NOTE_APPLY_TO_BILL','System','2022-04-25 15:59:24',NULL,NULL,NULL,NULL),(128,'Apply Credit Note','Apply Credit Note','BILL_APPLY_CREDIT_NOTE','System','2022-04-25 16:01:39',NULL,NULL,NULL,NULL),(129,'View Attached Bills','View Attached Bills','CREDIT_NOTE_VIEW_ATTACHED_BILL','System','2022-05-06 12:27:55',NULL,NULL,NULL,NULL),(130,'View Attached Credit Notes','View Attached Credit Notes','VIEW_ATTACHED_CREDIT_NOTE','System','2022-05-11 17:39:51',NULL,NULL,NULL,NULL),(132,'Create Credit Note','Create Credit Note','CREATE_CREDIT_NOTE','System','2022-05-18 15:15:27',NULL,NULL,NULL,NULL),(133,'Generate Bill','Generate Bill','GENERATE_BILL','System','2022-06-09 12:54:59',NULL,NULL,NULL,NULL),(134,'Generate PO Receipt','Generate PO Receipt','GENERATE_PO_RECEIPT','System','2022-06-16 10:30:00',NULL,NULL,NULL,NULL),(135,'Upload receipts for other users','Upload receipts for other users','RECEIPT_UPLOAD_FOR_USER','System','2022-07-04 13:41:34',NULL,NULL,NULL,NULL),(136,'Reminder Configuration','Reminder Configuration','REMINDER_CONFIGURATION','System','2022-08-07 12:16:39',NULL,NULL,NULL,NULL),(137,'Configure Mileage Rate','Configure Mileage Rate','CONFIGURE_MILEAGE_RATE','System','2022-08-17 15:08:07',NULL,NULL,NULL,NULL),(138,'Offline Payment Processing','Offline Payment Processing','OFFLINE_PAYMENT_PROCESSING','System','2022-11-02 17:53:01',NULL,NULL,NULL,NULL),(139,'View All Expense Reports','View All Expense Reports','VIEW_ALL_EXPENSE_REPORTS','System','2022-11-11 12:04:15',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_role_mst`
--

LOCK TABLES `umm_role_mst` WRITE;
/*!40000 ALTER TABLE `umm_role_mst` DISABLE KEYS */;
INSERT INTO `umm_role_mst` VALUES (1,'System Admin Role','A',NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16516 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_role_previlege`
--

LOCK TABLES `umm_role_previlege` WRITE;
/*!40000 ALTER TABLE `umm_role_previlege` DISABLE KEYS */;
INSERT INTO `umm_role_previlege` VALUES (2292,1,1014,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2293,1,1000,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2294,1,354,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2295,1,355,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2296,1,356,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2297,1,357,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2298,1,358,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2299,1,359,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2300,1,374,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2301,1,392,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2302,1,393,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2303,1,394,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2304,1,1009,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2305,1,42,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2306,1,43,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2307,1,44,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2308,1,45,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2309,1,46,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2310,1,47,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2311,1,48,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2312,1,1008,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2313,1,35,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2314,1,36,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2315,1,37,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2316,1,38,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2317,1,39,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2318,1,40,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2319,1,41,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2320,1,1024,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2321,1,353,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2322,1,1003,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2323,1,29,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2324,1,30,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2325,1,31,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2326,1,32,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2327,1,33,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2328,1,34,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2329,1,1001,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2330,1,1011,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2331,1,1,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2332,1,3,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2333,1,4,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2334,1,5,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2335,1,6,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2336,1,7,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2337,1,8,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2338,1,376,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2339,1,1012,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2340,1,9,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2341,1,10,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2342,1,11,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2343,1,12,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2344,1,13,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2345,1,14,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2346,1,1013,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2347,1,15,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2348,1,16,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2349,1,17,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2350,1,18,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2351,1,19,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2352,1,20,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2353,1,1002,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2354,1,1017,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2355,1,21,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2356,1,23,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2357,1,1018,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2358,1,24,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2359,1,25,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2360,1,26,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2361,1,27,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2362,1,28,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2363,1,1027,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2364,1,378,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2365,1,379,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2366,1,380,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2367,1,381,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2368,1,1025,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2369,1,363,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2370,1,1015,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2371,1,1006,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2372,1,1021,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2373,1,84,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2374,1,85,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2375,1,86,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2376,1,87,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2377,1,88,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2378,1,89,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2379,1,90,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2380,1,91,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2381,1,92,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2382,1,93,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2383,1,120,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2384,1,340,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2386,1,351,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2387,1,361,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2388,1,377,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2389,1,1022,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2390,1,94,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2391,1,95,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2392,1,96,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2393,1,97,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2394,1,98,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2395,1,99,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2396,1,100,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2397,1,101,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2398,1,350,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2399,1,391,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2400,1,1005,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2401,1,1019,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2402,1,61,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2403,1,62,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2404,1,63,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2405,1,64,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2406,1,65,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2407,1,66,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2408,1,67,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2409,1,68,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2410,1,69,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2411,1,70,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2412,1,71,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2413,1,72,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2414,1,73,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2415,1,74,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2416,1,119,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2417,1,339,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2418,1,360,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2419,1,382,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2420,1,1020,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2421,1,75,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2422,1,76,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2423,1,77,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2424,1,78,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2425,1,79,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2426,1,80,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2427,1,81,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2428,1,82,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2429,1,83,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2430,1,1007,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2431,1,102,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2432,1,103,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2433,1,104,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2434,1,105,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2435,1,106,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2436,1,107,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2437,1,108,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2438,1,109,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2439,1,110,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2440,1,111,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2441,1,121,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2442,1,342,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2444,1,344,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2445,1,362,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2446,1,383,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2447,1,1004,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2448,1,55,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2449,1,56,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2450,1,57,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2451,1,58,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2452,1,59,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2453,1,60,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2454,1,375,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2455,1,384,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2456,1,385,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2457,1,386,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2458,1,387,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2459,1,388,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2460,1,1016,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2461,1,1010,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2462,1,112,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2463,1,113,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2464,1,114,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2465,1,115,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2466,1,116,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2467,1,117,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2468,1,118,NULL,'admin','2021-08-10 12:13:23',NULL,NULL,NULL,NULL),(2469,1,399,NULL,'admin','2021-08-23 00:00:00',NULL,NULL,NULL,NULL),(2470,1,400,NULL,'admin','2021-08-23 00:00:00',NULL,NULL,NULL,NULL),(2471,1,410,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2472,1,411,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2473,1,412,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2474,1,413,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2475,1,414,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2476,1,415,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2477,1,416,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2478,1,417,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2479,1,418,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2480,1,419,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2481,1,420,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2482,1,421,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2483,1,422,NULL,'admin','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(2484,1,396,NULL,'System','2021-05-20 18:08:06',NULL,NULL,NULL,NULL),(2497,1,1032,NULL,'System','2021-09-27 12:11:29',NULL,NULL,NULL,NULL),(2498,1,1033,NULL,'System','2021-09-27 14:53:00',NULL,NULL,NULL,NULL),(2499,1,1034,NULL,'System','2021-09-27 14:52:54',NULL,NULL,NULL,NULL),(2500,1,1029,NULL,'System','2021-09-28 17:27:13',NULL,NULL,NULL,NULL),(2501,1,426,NULL,'System','2021-09-30 07:38:00',NULL,NULL,NULL,NULL),(14555,1,437,NULL,'System','2021-11-02 09:13:57',NULL,NULL,NULL,NULL),(14556,1,432,NULL,'System','2021-11-02 09:33:10',NULL,NULL,NULL,NULL),(14557,1,428,NULL,'System','2021-11-02 09:39:33',NULL,NULL,NULL,NULL),(14558,1,429,NULL,'System','2021-11-02 09:42:51',NULL,NULL,NULL,NULL),(14559,1,430,NULL,'System','2021-11-02 09:47:03',NULL,NULL,NULL,NULL),(14560,1,431,NULL,'System','2021-11-02 10:08:25',NULL,NULL,NULL,NULL),(14561,1,436,NULL,'System','2021-11-02 10:15:32',NULL,NULL,NULL,NULL),(14562,1,1035,NULL,'bhagya.e@papertrl.com','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(14563,1,1037,NULL,'bhagya.e@papertrl.com','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(14564,1,1038,NULL,'bhagya.e@papertrl.com','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(14565,1,1039,NULL,'bhagya.e@papertrl.com','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(14566,1,1040,NULL,'bhagya.e@papertrl.com','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(14581,1,452,NULL,'System','2021-11-02 13:59:02',NULL,NULL,NULL,NULL),(14582,1,453,NULL,'System','2021-11-02 13:59:02',NULL,NULL,NULL,NULL),(14583,1,454,NULL,'System','2021-11-02 13:59:02',NULL,NULL,NULL,NULL),(14584,1,455,NULL,'System','2021-11-02 13:59:02',NULL,NULL,NULL,NULL),(14585,1,456,NULL,'System','2021-11-02 13:59:02',NULL,NULL,NULL,NULL),(14595,1,457,NULL,'admin','2021-12-28 04:00:00',NULL,NULL,NULL,NULL),(14596,1,1043,NULL,'admin','2021-12-29 06:47:48',NULL,NULL,NULL,NULL),(14597,1,1028,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14598,1,438,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14599,1,439,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14600,1,440,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14601,1,441,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14602,1,442,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14603,1,443,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(14604,1,1041,NULL,'admin','2021-12-29 11:05:21',NULL,NULL,NULL,NULL),(16436,1,1044,NULL,'System','2021-06-02 13:43:37',NULL,NULL,NULL,NULL),(16437,1,453,NULL,'System','2021-06-02 13:43:37',NULL,NULL,NULL,NULL),(16438,1,457,NULL,'System','2022-01-05 14:48:01',NULL,NULL,NULL,NULL),(16439,1,458,NULL,'System','2022-01-31 18:51:26',NULL,NULL,NULL,NULL),(16440,1,1045,NULL,'System','2022-02-17 14:45:37',NULL,NULL,NULL,NULL),(16441,1,459,NULL,'System','2022-02-17 14:47:10',NULL,NULL,NULL,NULL),(16442,1,460,NULL,'System','2022-02-17 14:47:57',NULL,NULL,NULL,NULL),(16443,1,461,NULL,'System','2022-02-17 14:47:57',NULL,NULL,NULL,NULL),(16444,1,462,NULL,'System','2022-02-17 14:47:57',NULL,NULL,NULL,NULL),(16445,1,118,NULL,'System','2022-02-21 10:37:00',NULL,NULL,NULL,NULL),(16446,1,464,NULL,'System','2022-02-17 14:47:57',NULL,NULL,NULL,NULL),(16447,1,118,NULL,'System','2022-02-23 09:59:00',NULL,NULL,NULL,NULL),(16448,1,365,NULL,'system','2021-06-24 10:00:00',NULL,NULL,NULL,NULL),(16449,1,466,NULL,'System','2022-03-01 15:43:18',NULL,NULL,NULL,NULL),(16450,1,467,NULL,'System','2022-03-01 15:43:55',NULL,NULL,NULL,NULL),(16451,1,459,NULL,'System','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(16452,1,1006,NULL,'System','2022-03-01 10:21:00',NULL,NULL,NULL,NULL),(16453,1,1015,NULL,'System','2022-03-01 10:21:00',NULL,NULL,NULL,NULL),(16454,1,1021,NULL,'System','2022-03-01 10:30:00',NULL,NULL,NULL,NULL),(16455,1,463,NULL,'System','2022-03-07 07:48:00',NULL,NULL,NULL,NULL),(16456,1,465,NULL,'System','2022-03-08 12:45:00',NULL,NULL,NULL,NULL),(16457,1,468,NULL,'System','2022-03-14 09:53:00',NULL,NULL,NULL,NULL),(16458,1,1046,NULL,'system','2022-03-21 16:11:25',NULL,NULL,NULL,NULL),(16459,1,471,NULL,'system','2022-03-21 16:11:25',NULL,NULL,NULL,NULL),(16460,1,1049,NULL,'system','2022-04-19 11:47:10',NULL,NULL,NULL,NULL),(16461,1,478,NULL,'system','2022-04-19 11:39:40',NULL,NULL,NULL,NULL),(16462,1,479,NULL,'system','2022-04-19 11:39:40',NULL,NULL,NULL,NULL),(16463,1,480,NULL,'system','2022-04-19 11:39:40',NULL,NULL,NULL,NULL),(16464,1,481,NULL,'system','2022-04-19 11:39:40',NULL,NULL,NULL,NULL),(16465,1,482,NULL,'system','2022-04-19 11:39:40',NULL,NULL,NULL,NULL),(16466,1,483,NULL,'system','2022-04-25 16:11:47',NULL,NULL,NULL,NULL),(16467,1,484,NULL,'system','2022-04-25 16:12:42',NULL,NULL,NULL,NULL),(16468,1,485,NULL,'System','2022-05-06 12:30:19',NULL,NULL,NULL,NULL),(16469,1,486,NULL,'System','2022-05-06 12:31:55',NULL,NULL,NULL,NULL),(16472,1,489,NULL,'System','2022-05-18 15:22:32',NULL,NULL,NULL,NULL),(16473,1,1014,NULL,'System','2022-06-06 07:11:00',NULL,NULL,NULL,NULL),(16474,1,513,NULL,'System','2022-06-19 10:54:00',NULL,NULL,NULL,NULL),(16475,1,490,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16476,1,491,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16477,1,492,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16478,1,493,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16479,1,494,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16480,1,495,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16481,1,496,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16482,1,497,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16483,1,498,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16484,1,499,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16485,1,500,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16486,1,501,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16487,1,502,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16488,1,503,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16489,1,504,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16490,1,505,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16491,1,506,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16492,1,507,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16493,1,508,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16494,1,509,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16495,1,510,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16496,1,511,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16497,1,512,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16498,1,1052,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16499,1,1053,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16500,1,1054,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16501,1,1055,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16502,1,1056,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16503,1,1057,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16504,1,1048,NULL,'System','2022-06-17 15:26:01',NULL,NULL,NULL,NULL),(16505,1,515,NULL,'System','2022-06-22 17:44:55',NULL,NULL,NULL,NULL),(16506,1,472,NULL,'system','2022-06-27 09:55:43',NULL,NULL,NULL,NULL),(16507,1,473,NULL,'system','2022-06-27 09:56:23',NULL,NULL,NULL,NULL),(16508,1,474,NULL,'system','2022-06-27 09:56:49',NULL,NULL,NULL,NULL),(16509,1,475,NULL,'system','2022-06-27 09:57:21',NULL,NULL,NULL,NULL),(16510,1,476,NULL,'system','2022-06-27 10:04:31',NULL,NULL,NULL,NULL),(16511,1,516,NULL,'System','2022-07-04 13:43:38',NULL,NULL,NULL,NULL),(16512,1,517,NULL,'test@gmail.com','2021-03-29 22:43:59',NULL,NULL,NULL,NULL),(16513,1,518,NULL,'System','2022-08-17 15:14:59',NULL,NULL,NULL,NULL),(16514,1,519,NULL,'System','2022-11-02 17:56:08',NULL,NULL,NULL,NULL),(16515,1,520,NULL,'System','2022-11-11 12:10:20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `umm_role_previlege` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `role_id` int(11) NOT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_mst`
--

LOCK TABLES `umm_user_mst` WRITE;
/*!40000 ALTER TABLE `umm_user_mst` DISABLE KEYS */;
INSERT INTO `umm_user_mst` VALUES (1,'4ccc7194-5df8-4544-b394-3e62d62acdf0',1,'papertrl_system_schedule','System Schedule',NULL,'papertrl_system_schedule',NULL,'D',0,'$2a$10$y7uaBNBgCUO479OdpBhd0uKt4hT1KCavYFpAnczN4/NCoDmN5t7Y.','2021-09-20 15:47:25','PAPERTRL_SYSTEM',NULL,'N','N',NULL,NULL,NULL,NULL,'',NULL,'2021-09-09 03:57:09','I','','A','2021-09-09 00:00:00','2021-09-09 00:00:00',NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umm_user_propic`
--

LOCK TABLES `umm_user_propic` WRITE;
/*!40000 ALTER TABLE `umm_user_propic` DISABLE KEYS */;
INSERT INTO `umm_user_propic` VALUES (1,'default_propic.png','image/png','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0u\0\0u\0\0\0ýzÈ\0\0 \0IDATxœíÝy”dY]/úïoŸsâì“‘‘c\rY•5÷TY]¢ Ã½ˆO—Wy¾×\nâ€>äÉÅûðÁ{Z¹ºpÁ»êQä²¼<Ðn[Ÿ ®%¢¢\"^ôÕUÝ@Ï]]CVUfå|ö‰söþ½?êduvueVq\"Nü>‹Z]ÃÊ8ßÜ±GúÚ\'±&6[zœÛ¥#Ý`ÀPþß\Z€ ÿ{\0 ?¿+å·]k\0ç_æ·¥\0æó¿_0kb³ÜšÿBlÝ_üùgÖüžßÆ:„X—Žô€ý\0&ò?™y_þ÷Q\"\ZÂ•\037\0dÌìòx&{\0üÌûšÁáµ¯C dÕ\0&À €ˆ\0Ÿˆ*:Ò\0°ÀÌ3\0.8MDOxÀéüÏ“&6ÓÍý×bk$ÔE[éH÷x€Û\0L2ó$naœ™€„ƒ™CfÖÌ03˜W\ZØÛzï†küýºˆhˆˆ†@8L ˆÈQBŠ\0 Ô‘V`œeðÃDt\nÀ)\0øš‰Íâ6jbS$ÔEËèHßàv\0/dæÑm\0sKÌ°ãêJP;ç®>¬°‚×pÍ/“\Z×Ôª”:@Dˆè»IÑ¥J©ªŽô,3?DDÿà_\0<`bóP›Ê=FB]4EàßÆ+ü\":ÀÌKÎ90s¿sNå-pàúýÜ]oÕ/&\0¨®ü…ˆÆHÑ˜RêeD´¨”‚Žt•™Ÿ ÐAø[\0ÿ$A/šAB]l‰ŽôË|3¿’ˆŽ3sÃ9ç9çªì®¶¼k—Ù˜lÎ:…Uÿ&J©Ã¤è°RêN¥”Õ‘®0ó	\"ú<€?7±ùûâªÝJB]lˆŽô‹\0ÜÅÌßMDÏsÎÍ9çªÎ¹ ow\\·I§sÎ°°U\0 \"¢oWJ=_)õfé:3ˆþ\nÀ}&6ÿ\\pÉ¢H¨‹ëÒ‘Ç•–øÑËœs‰s®ÏYä­ðRv¡iU‹~ez&”Rß¢<5©”z£ŽtÈÌÿ@DŸÆ•–üÙb+HB]\\¥#ým\0~˜™ÿgfÞíœcg]Õ:pç\r`öçœs€:ð”÷?)O}‡Rê×Bž#¢?ð{&6_.ºVÑ$Ô{œŽôËÀx=w13Yk«Î:ÿšA?Ñ	°ÖÂÚ+Ý5J©ÃÊS?ãyÞOèH3÷ðI›/]ª(Ž„zÒ‘þ0ÞÂîŠºÍ,]gÚžè`y+ÞÏÒ¬NDð|ï\'•RwéH{`ü1¿ebóOE×)ÚKB½GèHßà­\0~Ð9H—3#K30˜ü)¥þéÀ§|D¦Lö	õ’Ó‘¾‡™ïdæýÖÚÈfÖ— /·ëü›<ÏûÑP‡§‰è>›÷]£h	õÒ‘~>oá5ÖÚe›Ùé#ïMyÀûYšÕ”R“žïíÓ‘þy0þ\0„™Ø|¥è\ZEsI¨—„Ž´ðÌüjfÞi­ÈÒL(º6Ñœsp\r7\"…ø¯õ<ïU¡§ˆè\0üGùÍ_ªèÄöèHÖZ€µÖþlÚHoNLRÏ]ˆëÊÒL%&©§ôfkíÏ°ZëÿWGúpÑµ‰í‘¿KéH¿2Ôá˜ù«™Í~ØÄi#­J7‹ØçÒFZ5±Af³×2óWC~AGú»Š®Mlt¿t™|àóuÎ¹‘,Ë•Í‘¥™—¥Y¿òÔË}ß¿7Ôá4ý®¬vi©w	é_Ö‘¾w±n$\r	tÑÎ:4’Æ`ÚH[kVGú¢Žô/]—Ø	õ§#ý+:ÒÖÚ·&&KiMºXD;ä]3µÄ$£ÖÚ·êH/èHÿJÑu‰õI¨w(éêH/ÙÌ¾%1IÚH«2¿\\™‘6Òjb’~›Ù·èH/éH°èºÄõI¨wéèHÏÛÌ¾91I_šJ˜‹ÎÀÌHÓ´š˜¤Ïfö§ó–ûŠ®K<›„z‡Ð‘þEé)kí[“H˜‹N•‡{_b’~kí[t¤§t¤±èºÄêÓ‘~a¨Ã¯[kÿ}b’i#í—0Ý ï–éOL²ÃZûïC~=ß¾YHB½ :Òƒ¡ÿ”™?—6Ò[ÒFZ“0Ý(÷ZÚHoaæ¿\nuø§:ÒrˆJA$ÔÛLGZéHÀkí÷\'&©ËlQÎ9$&©[k¿ÀéæÛWˆ6’ð6Êû/ÛÌ¾ÞÄ&ÈÒÌ+º&!š-K3ÏÄ&°™}=€ËÒßÞ^êm #} ÔáWuoMLRKÓTŽ†¥—¦©NLRsÖ½5ÔáWu¤]S/Po1é1óÖÚç5\Zºô›‹^ÂÌh4\Zukíó˜ùé]SÙI¨·ˆŽôu¤ÏØÌþHb’þ,ÍŠ.IˆÂdi†|ñÒèHŸÑ‘~aÑ5••„z“éHëP‡¿ÏÌŸKL2ž¦iTtMBtŠ4M£Ä$ãÌü¹P‡¿¯#-]‘M&¡ÞDù€ÐEkí‰I¤«Eˆë`æ•Y2w¸(©Í%[ï6Žt?3ÿsî¥²xHˆÉÒ¬b3[	*ÁÏ„:|>½ÆÄf±èºº´Ô·IGú\0ÎXk¿§‘4%Ð…Ø8fF#iZk¿À™üzÛ ¡¾\rZëO0óç“Ô²4Š®Gˆn•¥Y˜¤ÆÌŸ×Z¢èzº™„úèH…:|ÐZûCÒw.Ds¬êkÿ¡P‡êH]S7’Pß$é‚qÚZ{[š¦}E×#DÙ¤iÚg­½\rŒÓ²oûæÉ@éåƒ¡÷Yk_œ6Ò°èz„(³,Í¥YT‚7„:<NDwÊ êÆHK}t¤w\0xØZûi#­]½\"m¤5kí+\0<œ_‡â$Ôo@Gú—™ù©Ä$»d0TˆöËQw1óSr\0öI¨¯CkýIçÜ›I#”ÁP!Š“O}soÖZ²èz:™„úuèH…:ü²µö.™{.DgX5§ý®P‡_Ö‘*º¦N$¡~\réC\0ž²Ö¾@f·ÑyòÙ1/\0ðt~½ŠU$ÔWÑ‘þfþZ¾«¢üÛÑ¡²4S‰Iú˜ùk:Ò¿Rt=D‚+§µþ¸sî\rI’ÈÞ-BtfF’$ýÎ¹7h­?^t=¢çç©ëHW˜ùO­³/Mé@Ñõ!6FÒ*Á†:ÜKD?`bÓ(º¬\"õtK]Gz™¿ì¬ûN	t!ºWÚHœu¯`æ/ëH]O‘z6Ôó}%NYk\'ÓTVˆ\nÑíÒ4\r­µ“\0zzß˜žõ|eÚÓY–giæ]¢9²4ó²,Û+Ûøöä\nÔžué{\0œNLR‘sC…(Ÿü<Ô\0Àéüzï)=ê:Òïgæ·\'&©È!Ê+ßÆ·ÂÌÿ‡Žôû‹®§z&Ôó9è?ÓH\ZU	t!Ê/_ÚÏÌ?ÓKsÙ{\"Ôu¤ÿs>]´¢‡äsÙëÎ¹7èHÿç¢ëi‡Ò‡ºŽô¯:ç^ßH\Zƒ<¢÷äsÙs¯×‘þÕ¢ËiµR‡ºŽô‡s?ÞH\Z==oUq5Ø\\GúÃE×ÒJ¥\rõ<Ð_\'.„X‘ûët¤£èZZ¥”¡žw¹H !ž#ö×–µ+¦t¡žŠJ—‹bM«ºbJ7xZªP×‘þÀÕAQ!„XÇªÁÓ]K3•&Ôó…EoJ©ºbCÒF:ÈÌo*Ó¥R„ºŽô=Ìü¶FÒyèBˆ\rË(Õ™ùmeÙR ëC=ß´çÿÊWŽ]Ž¢Ë¬¬<ãeØ¬«C=ß^óŒìå\"„ØŽ|åiˆ+»;võ¶½]êùFødYæK !¶‹™‘e™àn>h£+C]G:dæ/dY6*Ûç\n!š%K3dY6ÊÌ_Ð‘îÊÃsº2Ô™ùÿ³ÖÞ,\\!š-K3ÏZ{33ÿYÑµlE×…ºÖúÎ¹ïÈÒ¬+‹\n!:_–f¡sîÅZëO]ËfuU¨ëHÀ±»C‰B´ZÚH»;ºmqR×„ºŽôaf~‹,.B´K¾8é-:Ò‡‹®e£º\"Ôu¤G\0œ”¹èBˆvº:‡8•çPÇëøP×‘VÌüwY–…èBˆvË§:V˜ùït¤;~rFÇ‡:3ßë¬;œ¥]‹¢7eiFÎºÃÌüGE×r#ê:ÒdÇ¯LÓT]‹¢·¥iªÙñ+u¤?Tt-ëéØP×‘ÞËÌon4\Zõ¢kB\0h4\Zõ|WÇ½E×²–Žué~\0_i$jÑµ!Äjy.}%Ï©ŽÓ‘¡ÎÌ÷eY&Ûè\n!:N>pZgæû‹®åz:.Ôóãè^œ¥YPt-Bq=YšÎ¹oïÄãð:*Ôu¤w3óÓFZ+º!„XOÚHkÌüFéÝE×²š_t+t¤0þ¹Ñhô]‹è>D„J CTÂ\nß‡Ÿÿñ¼+S‹•ºÒ†qÎ\0¬³È2‹,M‘e\ZiŠ$I$\rH×ŸØˆF£ÑVÂÖ‘>lb“]ÐA¡Æ³Öî`\'“XŸR\nýÕ*ªýUôE¢(Bi5g)3Ã˜qc9Ž±¸¸„¥¥%Xk›òü¢<Ø1¬µ;”§>	àµE×tH¨ëHßãœûwišÊÎ‹â9ˆýýUÔëuÔj¨öõ5-À×z½(Òˆ\"a¸ôqcn~sssXXX”Ö¼\0\0¤i\ZVTå{u¤ï1±yoÑõÐ×8¹¥šØ4¥\0é\0ç“ôÉE\"Vêµ\Z†‡‡044xµ¥SXç07;‡é™ÌÍÍ_íÒ½‰ˆêpÀ.›…V¿Þ_üùgÖü^á-ufþ´µVÎ\0€¾(ÂØØ(FF†áû…¿=×ä)…áá!ÁZ‹™™Ë¸pñ–––Š.M`eÏóþÀ÷YK¡WŽôûó/:÷ê-GD\Z\ZÄ®;Ðßß‘ë9ÖåyÆÆF166Šååç§¦0==#Ý3=&K3_)õ\"é÷›Ø¼»¨:\në~É»].&&‘Ý{aÇØvíÚ0,×pJš¦˜šº€©e€µ‡äÝ0	€±VvÃtd÷3ÿ®µÖ“@ï=D„±ÑQŒïB¥R)ºœ–‚\0{÷îÁ®];qîü¦¦.H¿{È»a<Ïó~ÀQC!‹t¤ïaæ—K·Kï©×k¸ýØ$ØWÚ@_Í÷}LìÝƒã·Obdx¸èrDdiæ3óËu¤ï)âõÛÞý¢#í¸˜dHZé½#CØ¿õzo/^\\\\ÂO>‰åå¸èRDåÝ0³¸Ò\r“5ûù×ë~iKñ1›ÙH½7vïÚ‰Ûíù@€þþ*&Þ†½{÷\\]á*Ê‡™a3«Áøív¿v[ßU:ÒG|·zÑ´qô¶[01±Wl\"Âøî]˜<zúúdWŒ²JÓT3ø.é#í|Ý¶^iÌ|Ÿµv ¯)Š166ŠÉÉ£¨VeKüµD‘ÆäÑ[±{×Î¢K-’6Òf¾¯¯Ù¶P×‘þ%çÜ,mz÷’è J):x\0ì‡\'­ó\"\"LLìÅÍ7é¸U³bûœspÎÐ‘þ¥v½f[®:é\n€·ei&ª%†½íŒŽŽ]J×¬còèmˆ¢¨èRD“å¹÷6é¶t;·§)Åø¸ÍdNz™U«U½íVé#Þ†•1P.—|îºÆÇÚñz-ué	ß);0–×Ðà n»õfVµ]žçáæ›Ž`ll´èRDeiVað:Ò­~­–‡:3ÂZ+Í·’\ZÁ‘#‡dvKØ]2€Z*ÖÚ>fþV¿NK¯Dé—2ó³4kÝæ×¢0;vŒáÐ¡-ÝÛ¼—í›Ø‹ññŽ:)MlC–fÄÌ/Ð‘~Y+_§¥¡ÎÌÿ5K³ÁV¾†(ÆØØ(ìßWt¥·wÏ¸{‰di6ÈÌoåk´,Ôu¤Ñ9·[61*Ÿ‘áa	ô6Ú»g»vî(ºÑùÇ]:Ò¿Øª×heKý2…±|jµér)À¾}‘\rÁÊ K³:€ŸlÕó·$Ôu¤9hÅÓ‹‚ôEn:rX½ ‡@­&²»3ÃZÛ¯#ýþV<«Zêÿ{–fÝw„X“ïû¸ùfYõX$\"Â‘Ã‡Jw H/Ê{1ÞÐŠçnz¨ëHP\Z•áÈ‘C=±ÿy§ó}79,SH»\\ÞZZ±}@+Þ?e™ÌK/‘½{÷ 6 û;E__„ƒö]†Ø¦,Í\0üt³Ÿ·©¡ž·ÒYZéåQ¯×dÁ422,{ìt¹¼µîëH ™ÏÛì–ú›²,“½VKÂ÷}:x è2Ä\Zöï›þõ.—=¾¥™ÏÙ´PÏg¼´ÒËãàý²ŸKó<‡(º±\rykšÙZofKýËRi¥—ÅÐÐ ††d1p§èïÇŽcE—!¶!ÏÍ¦Í[oJ¨ëHßc­\r¥•^žça¿¬í\Z{÷ÈÌ¤.–·Ö+:Ò÷4ãùšêÌü£6³²z´$öìÙŠt»t\rÏó01±§è2Ä6ØÌÖ˜ùG›ñ\\ÛuéW0óìñRZkìÜ!ûŒt›‘áaô÷Ëz¿nåœ3éH×vŸkÛ¡ÎÌïË2Ù‰±,&&öÈ6\0]jÿ¾½E— ¶!Ë²Af~ÏvŸg[¡®#}À·:+­ô2èï¯bhP~?w«jU~~Ý,ÏÑoÍsuË¶×RgÜc­•“rKbÏžñ¢KÛ$?Ãîf­ÀØÖ€é–C]GZð#YšÉO%Ðß_E½&cÝÝ®¯/’ÖzËÒÌáu:Ò[ÎÕí´Ôßo3»¼Ç‹\"ça–ÇîÝ»Š.AlƒÍl`Ë‡hl=Ô¯Ë¬lÜU:1<4Tt¢Iúû«èï—u€Ý*³Y¯Ûêã·\Zê/sìjìd±QÈŠÄò‘i©Ý‹Ã±«mõ€ê-…:3ÿŸÎ9é¸+\"’ÝþJhhh¾ï]†Ø\"çÜ 3¿c+ÝJ¨WˆèUYšmåõD‡‘‹¿œ”R•3M»V–f ¢ï×‘Þôþ[	õ÷Xkã-<Nt Ñi¥—•TÝÝòœÝôb¤M‡:3ßm3+£0%àyêu™ÆXVÕjUö[ïb6³Uf~õf·ÙP?\n`\\öy)‡¡¡AÙ ä†‡eVS·Êsv·ŽôÑÍ<n³¡þk­Lc,‰ÁÁzÑ%ˆ“ŸqwËóvS\'#m6Ô_c3+£j%@D²‚´ôW«2ÞÅò¼}Íf³™P©sÎ“ƒ0Ê¡¿¿\nÏ“ÊŽˆP«\r]†Ø\"f†sÎÓ‘~éF³ñPg¼É9\'ŸåJ¢&­ôžQPïfÎ¹:oÚèý7ê„;lfeT­$ä@…ž!‡gt7›YáŽÞ£¡þrç\\&]/å@D¨ÊÞ =£¯/’®¶.–wÁd:Ò/ßÈý7êŒ—®—òÃžjÊñ´¢KôõÉ¤µn–wÁüøFî»±+›p§t½”G_$çšô\Zù™w·¼æÎÜw#¡þmÌ¬¤ë¥<¢>¹À{üÌ»3ƒ™•Žô·Ýè¾	õ×X+Û”I¤uÑ%ˆ6“Ÿy÷Ësø†sÖoêŒ;u²z¡DÂpÓ¿‰.\'?óîç¬ó™ù†³`nê{<&{½”‹lòÔ{‚ }~º\\žÃ;t¤÷®w¿…úœuòN(¥”,ïAD„J%(º±My¿a½û¬êÌüçœÌ…*_æ+÷,ùeÞýœs}Ìü’õî³n¨ÑË­µÍ­JÊäÂîUêÝÏZ\"ZwÒz¡þbçœœpT2ž’–z¯ò=	õ2pÎÅwÜu÷‹×úþz¡~§sN6(Ï—PïY2:V\nÎ¹*°öB¤5C™¿G¦2\nQ²ÿK98ëfþîµ¾¿f¨Ñq™ÊX>Jö|¢«9ç@DÏ[ëûk]á/wÎÍµ¨&Q ùE-D÷sÎÍÝq×Ý×0]+Ô_•÷Û!JB~¡—GžÏ¯ºÞ÷®êÌü\nçœ¬T(!¹°{—lÊWÎ¹€™_q½ï]7Ô‰èyÎÊÅ_FV~®=K®éòpví~õë…ú$3\'-®I$Ë²¢KI³´èD1srÇ]w»ööë…ú·9çdŠDII¨÷®,“Õáeâœó\0|ûµ·?7¼¯”EGåe­•~õ•¦ÒR/ç\\ŒW\\{ûsBÁ/e\'*e–$Ò»Ök²,ƒìãT.ì~Ùµ·?\'Ô‰è´äÊ-I\ZE— ÚL~æå“/B:xíí×†ú·0³,:*9#-õžcSt	¢˜yîŽ»î~þêÛ®\rõççï¢ÄâX6ßì5q,¡^FÎ9Àº¡þ2HZ~ËËê½&–Ÿy)å+KŸµ\rï³B™¿UIË/ŽcY]Øc–——‹.A´\0;3¿põmÏ\nu\":\"{ù9çäãxi4R$\r(-#fY}ÛêPeæŠ„zoX\\\\,ºÑ&ò³./f3wÜu÷èÊm«Cý(3Kó­GÌÏ/]‚h“…	õ2ËsûèÊ×«Cýv,;3öˆù…éWïsóóE— ZˆW\0Üºòõµ-uÙC½GdY†Å¥¥¢Ë-–$	Œ‘àeÆÌ}¸^K™KË­·ÌÍÊ:³²›“ŸqÙåýê·¯|}5Ô	tØ±lÐKf._.ºÑb33ò3.;Ç:¼òõ3Ý/„q™£Þ[ŒI°$ó—K«‘¦2HÚØ1@_ùz%ÔÇ˜Y¶pëAÒ’+¯™™™¢KmÂÌÙwÝ½x&Ô\'\0È.O=èÒ¥i™SR/N]‚hŸ€½À3¡¾Oº^zSš¦˜•ÓÒY\\\\”ÛzHžßû€U-uf«HêÂÅ‹E— šìÂÅKE— Ú(Ïï	à™P?ÀÌº¸’D‘æææ¥UW\"išbzZúÓ{Ižß€<Ô™ù€ô«ö¶sç§Š.A4Éù©2NÒcò¹ê€gZêãyô²éé9ò¬²ÌâÂéNë5y~ïòP\'Ð.ÉôÞÆÌ8{î\\Ñeˆm:?5%L÷\"4¬´Ô	ƒòqM\\º4-ç—v±,Ë05u¡è2D˜ Ït¿H¨fÆéÓO]†Ø¢§Ïœ•VzÊó{\0¸êU\0²é‹\0\0\\¾<+{­w¡8ŽqQ¦1ö:wÇ]wW€AfN‹®FtŽ§NŸ–Ù]æÉ§ägÖëòT\0d×#:ÈòrŒó2Å±k\\º4-Ÿ®p%ÇWZêÒý\"žåÌÙs0FM;]šfxJÆA€<Ç€þ¢‹Ç9‡ÇB>Òw¸\'ž|Y&´ÅU\n@?3«ÞUôœ…ÅEœ;w¾è2Ä\Z.^¼„Ë—g‹.Ctˆ<Ç«\n@\rÏ>«Tˆ«Îœ=‡ÅE9Ë´ÓcðäS§‹.Ct ¦\0ø`PÑÕˆÎÄÌxäÑÇ¦ò¿SXçðð#Â9\n«\\ÉqÿJ÷Ø/ºÑ¹\Zyô1é_ï?öâØ]†è0yŽ÷K·‹Ø……ù¸ßÎœ=\'†‹uI¨‹\r»pá¢œhzzgÎœ-ºÑáV¦4VŠ.Dt‡ÓOŸ‘\n077Ç¢è2Dg« ŸÒè2P*6î±ÇŸ©tm´°°€‡yTÆ4Ä\0%Ý/bÓVfÄÌÎÉÕ­¶¸¸ˆo>,3]ÄÆI¨‹-af<üð£2h×BóóøÆ7–ítÅ¦(\0sÄæ13}ôq\\º4]t)¥3;;‡o>ü¬´ÐÅÆ1\0«\0,Ã)Å–03{ü	œ9+Gá5Ë…eq‘ØŠ€EYt$šâÌ™³HL‚öAÉPÍ–¬œ<u^Ž¤Û ¡.šæÒô4bã¦#‡Q©È,ÙÍÈ²<ú˜ì‹.¶M˜\'\"ÙØC4ÅÒÒ2NžzssóE—Ò5qòÔCèb[òŸS\0äŒRÑDY–áß|O>uZú…×ÁÌ8sæ,úú7ÑhÈ°–Ø6 ñq%Ôeö‹hº©©˜ŸŸÇÁÐß_-ºœŽ²Çxâñ\'±¸$Û\Z‹¦a\0ÆÇ•îiN‰–ˆcƒú:vîÜ½{Æáy^Ñ%Ê9‡³çÎãÜ¹ó²BT4Užãó>€å¢‹å75u33—±wï8ÆFG‹.§—/Ïâôé§a9ûU´Ì²`–ˆdšh¹4MñøãOâÂÔELLìA­V+º¤¶XZZÂéÓg0¿ ¡¢uòŸõÌB¦6Š6ZZ^Æ×¿ñ0ú±wÏ8Š.©%–––qöì9\\ž•ÍÏD[øX	u\"\nŠ®Fôž……E<ôõo¢Z­b÷®\Z\ZQ÷o:;;‡óSS2EQ´Užã³>€%ÈÆ^¢@KKKxäÑÇP©T066Š±Ñ‘®[¼”¦.]º„‹—¦aŒ5\'\n¡î¿ïÞ¥•n—y\"\Z’ÑxQ¤F£3gÎâìÙs¨Õ02<Œ¡¡ÁŽ1c­Åììff.cvnNf³ˆÂäŸp€¼/™/K¨‹NÁÌ˜››ÇÜÜ<è	B­6€z½†ÁzZëBkK’æææ®Ô7?/‹«DG \"0óeà™Òó *°&!®kuÀ?…§Q©T0Ðßþþ*úû«ˆ¢¨eˆ13â8ÆâÒ2±°¸ˆD¦#ŠNte(ê°*ÔIN´] Ñh`zfÓ3WÎI%\"„aˆ(ÒÃaXAX	á>|ß‡ïùðýëwßXk‘eY–\"Í2¤I’À$	âØÀ#]*¢+äù}ÈCˆž(Ã¬Ñ{˜Æ˜\r\rN®¼Ç%¨EÙˆè	à™Y/‘Ù‹Rcf	tQJy~?	<êO‘t\n!D7\"$\0žž	õ§HI÷‹Bt£|²Àià™P?\r ,ª !„ÛRððL¨_$¢Î\\á!„b]Däßß½SÀêíg¥F!º)gW¾¾\Zê~XÉ¼BÑU)0øÑ«_¯ü…ˆNÊ\\u!„è.ùõ+_¯nš?HDr`¢Bt‘<·\\ùzu¨R‰™Œ\0\0ûIDAT¥í/I!ÄVå¹ý•¯¯m©»žBˆMÉsûÔÊ×«C}šˆ\ZÒ¯.„Ý!ïOoÜß½Ó+·=kº3?,¡.„Ý!ßGý‘Õ·©kîð?d®ºBtR\"ú×Õ·ù×Üç‹J©×ZØþ6Ö%DS‚ @¥ (¥à)R\nJ)\0ÀŽáœ…c†³iš\"MS4ÒTN4]A)µàŸVßvm¨U)eÛW’[†DQtåÖˆ¢•JApíÛzó¬µh4\Z0&AlâåËq,gˆŽ’çõWVßF_{àäµ÷s&6Ò#:\n¡¿ZÅ@m\0ýÕ+GÙùþöÃ{³œsX\\ZÂÒâæ°¸°+­zQiÜß½ÏÊëç\\Ìü˜Rê°|üEƒõAÖQ¯×Zvéf(¥P@m`\0»wï3caa³³³¸<;\'g˜Š¶QJ™»ööç„:¾HŠC2] ÆÐÐ úû;h‡ˆP«\r VÀ¾}ˆã—/ÏâÒôÌ†ŽØb«Hô×ÞþÜÏ¯„Ï+¥îÁRÑ.D„¡¡AŒŽŽ ^«¡›§Õ®ôñïÆââ.]º„é™Ë°V†ªDs)¥Aøüµ·_¯SòKJ)	-W©T°sÇÆÆFéoµþþ+}ÿûöM`zæ2¦ÎOa9Ž‹.K”DžÓ_ºööë\r”Àrb’HFùE+T«}Øµs\'†‡‡ººU¾ssó8?5…¹¹ù¢K]NG:¹ÿ¾{Ÿ³µËu›GÌ|‚½ˆ­„ºhžþj{÷Ž£V«]Jaêõ\Zêõ\Z–—cœ9s—gg‹.It!å)0ó×®÷½ë†:ýRêÎº µ¥‰^Ð×aÏžq\r]JÇèë‹pÓM‡±´´„ÓOŸÅü¼´ÜÅÆ)¥R\"zN:°F¨ø¬RêÍ\0ä*[V©T0±wFF†‹.¥cU«UÜzËM˜Ÿ_ÀS§ŸÆòòrÑ%‰. ”ZðÙë}o­>u\0°&6ÅO]‡ˆ°k×NŒï†×sË»3ãâÅK8ýô™-#Ö¥#íî¿ï^ïzß[sÊ3ŸPJ}‹,B›Q¯×°ß´–­ù7‹ˆ°cÇ†‡‡púé3¸xñRÑ%‰”/:ºn:°N¨Ñ_)OM:\'ýêâÆ|ßÃþ}û¤«¥	|ßÇÁû1:2ŒÇRV©ŠgQžJ‰èsk~ÇÞ§”’>qCõz\rÇ&\'%Ð›l``\0Ç&oÃŽ±±¢K$ÏåûÖúþz}ê\0c4df£¸O)Lì›ÀŽ±Ñ¢K)½¹ùy<þøh4äážF€ÖÚÜß½ÑZwYw‹™ÿÞS×í‹=.Š\"LNÞ&Þ&õZ\rÇ&¢^ïÝ9þð”fþûõî³n¨Ñ½Ò#®5::‚É£·Ê`h›ù¾[n¾	{÷Œ÷ÜJ\\q…Rj™ˆî]÷>7xŽÏ(O¦¤‰+”R8x`?<ÐÛàöªññÝ¸åæ›2‡¡×äy|ÝùéWïsƒç8àŒ\\À¢¸íÖ›1&Ý-¡VÀäÑ[Ñ­Ùµ*J&Ïá3&6gÖ½ßžˆˆþLy*kVa¢ûT«}8:yªÕjÑ¥ˆU*•\nn»íÔëõ¢Km <•ÑŸÝð~x®?ð<o©	5‰.48XÇ­·Þ‚Š|ÔïHžçáæ›cçŽE—\"Z,Ïáß¿Ñý6ê_&\"+3½gll79,Ký;aÿþ	ìÛ··èRD‹ˆÈšØüËî»±«•q¿ç{²_@Ù½{Ø/³,ºÈ®;qèÐù™•Pž¿¼‘ûn,Ô	¿£”’½A{ÄÞ½{0±wOÑeˆ-Á‘Ã‡$ØK&ÏßOnè¾|ÎPJ)y£”ß¾}{1¾{WÑeˆm\Z\ZÄÍ7‘i§%ADPJy&6ë.:Z±ñŸ:ã¥¦Ü&öîÁ®;‹.C4A½^“{Ix¾çÀkïõr­‡:á·¤¦¼öŒïÆni¡—Êà`‡”`ïrJ©y~kÃ÷ßÄsI)Õ7HùìÞµ{öŒ]†há¡!<(ÞÝ*ïzi˜Ø|i£Ùl§Ûz¾\'ÛÄ•ÈŽc˜˜©pe6:2‚ýû&Š.ClAž·¸™Çl6Ô?âyžÙäcD‡\Z\Z”‹½GìØ1†=ã»‹.ClRž·ÙÌc6ê_‡ìS\nýýUéoí1{öŒËÞ=]dÕ^/_ßÔã6ûBDt¯çË¶ÝL‡¡LyëQöïC­6Ptb<ß[ºÑ6»×³•«úÏóú¶ð8Ñ<ÏÃÍ7ï¯y<­(1\"ÂMGË^ø] ÏÙ{6û¸­„zÆÌâ\nÝèÐ¡rA÷8Ïó®ìéãÉ©fÊ|0óŸ˜Ølz‡Ü-}þ&¢*¥f·òXQœ=ã»148Xt¢D‘ÆÁƒû‹.C¬A)5KDÚÒc·øš_T¤æHÉ [·¬Ë\\tñ,ÃCC²%D\"EP¤æLlþq+ßúHá÷|Ï—Ó. Ã‡,ºÑöìG½&‡Ywßó—@ø½­>~;Ó~Þó=9\n§Ã9$ý§âºˆ‡óN;Hž«?¿ÕÇo9ÔMlŒOùo·ú¢õ&&ö¢Ú\'“•ÄÚ‚ þõá¾ãS&6¼ÕçØÞDeÂ{=Ï‹·õ¢eêõ\Zví”cÎÄ\rÖëò^é\0žçÅ ¼w;Ï±­P7±yÀ¿*O±t\Zß÷qèà¢Ë]dbb/úäS]aòý×<W·þ<Û-„ˆÞçû¾Loì0ì“~R±)+ýë²uD1|ßŸ%¢÷m÷y¶ê&6KD—dÉyçÂðÐPÑeˆ.ÔE—¿ÚN)\"š6±ùÛm?Wêýžç{r€Fð}öï+ºÑÅÆwïB_]FOñ|ožˆ~·ÏÕ”P7±y¯çyF>¶oÿ¾	Ù×EláàAé†i\"‚çy‰‰Í¶HW4³Ïä¿ú,F*R½^ÃÈÈpÑeˆ¨Vûd6L›ä¹ùñf=_ÓBÝÄæ]žç9ùí^\"Âþ}Òí\"šgÏžq„•JÑe”ZÞJ·&6ïjÖs6{tó7¥µ^Œ]»vBë°è2D‰(¥°o¿œŒÕJ~à/øÍf>gSCÝÄæžç±´ÖÛ«R©ÈQe¢%†Q¯ËÞ0­°ª/ýÍ|ÞVÌCü¨ïKk½öMì•SŒDËìß7!ƒ¦-àþ€5ûy›ž&6ïð|é[o—ÚÀ\0†‡eNºh­5vî+ºŒRÉ[éËÍìK_ÑªæÝGòßB¢Å&&ö]‚èãã»e§Ï&òÀo·â¹[ê&6ÿ·çyKÒZo­‘‘aT«²W‡h=ß÷±{×Î¢Ë(RÏóæMlÞÓŠçoeGìÇýÀŸkáó÷4\"Â^9ÉH´Ñ®];e?¡&ü`À\'Zõü-u›÷(¥ÎÉ\0^kìCÊFÑ>J)™eµMJ)¢sÍZ=zÝ×hÕ\0ý„ÈŽÍ¦”Âîq9[R´ßØØ¨4&¶ÁüY\"úÉV¾FKCÝÄæKDôe?ð·|Š‡x®±ÑTäc°(\0ÉaÕ[ä>Ñ—Mlþ©•¯Óò¾\"z½œŽÔ<D„ÝrQ‰ŽŽ \"Ûlšçy1ýD«_§å¡nbs–@Ÿ‚ iõkõ¹ DÑ¤a±yA$ú´‰Í™V¿V{F1	oö|ÏÊÇí‘¾¢SŒŽÈL˜\r\"\"x¾gAxs;^¯-¡nbÓ\0ðkù„{±EÃÃC2H%:‚R\n»dÞú†ä¹÷ky¶\\ÛæšØ¼K)õ¸È[%‹?D\'Ù16\nO¦,¯Ë|(¥žhÅv\0kiëO„ˆîô<o±¯YýýU9é]tÏó0:6ZtÍó¼E\"º£¯ÙÖP7±y,45í|Ý2ØµSZé¢óÈF_k‚ÀèLlkçë¶ÿ³áMž/ûÂlF¥RÁÐÐ`ÑeñZkÙoý:òÁÑ%ÞÐî×n{¨›ØX\0	*¬4Ý ;wÈ~Ö¢cÉ§ÈçÊóí#yÞµU!£&6ï%¢¿ó?-âõ»	alt¤è2„XS½^“YY«øŸÑßµr—õ6tMD¯ó}?“èú†‡†àû2cHt¶2`\nàJ#Ì÷}KD¯+ª†ÂBÝÄf	À‡¤f}cr±ˆ.0::\"]„¸Úíò¡<ß\nQè$S›÷Ñ?H7Ìõ…aµÚ@ÑeqCA`°^/ºŒBåÝ.ÿhbóî\"ë(|å\0½Ö÷ýD~Ë?×èˆô¥‹î1ÚÃc?y·Kƒˆ^St-…‡º‰Í\"€ÿGºaž«—/Ñ}ë=;þ³ªÛ¥ðÅ•…‡:pe6Œ\"õYY”ôŒjµ*3\nDW!¢ž\\OQ¤þ¢¨Ù.×êˆP\0^ïyÞ)é†€‘á¡¢KbÓzí}›\"=Â]ËŠŽ	u›„o¯T*r ®ìÈ(D·è©-y+•JÂ‹Ll²¢kYÑ1¡\0&6ˆè£A%èé-zúûå Ñ•ˆÃ=ÒT‚y\"ú¨‰ÍTÑµ¬ÖQ¡\0&6oWJ}±—§9H+]t¯ááá¢Kh9?ðS¥ÔMlÞ^t-×ê¸P\0\"zµïû—{ušãÐ „ºè^ýJ|nB>}ñ2½ºèZ®§#C=Ÿô¼JX‰Ñc¹^íëC¥Ò;}’¢œêe]ˆD@%¬,ø–N˜¾x=ê\0`bsžˆ>\\	*sE×ÒNõÁ’^¢§”uui%¨ÌÑGLlÎ]ËZ:6ÔÀÄæ¤è¯‚ è™1ƒê¢êõZéö‚	‚ &EŸ3±yGÑµ¬§£C\0ˆè•§öß]K«þjµè2„Ø6ÏóJµo‘ø¬<õp§ö£¯Öñ¡nbÃDô½°?LY?²ŠÞT–÷s>0jˆè•&6\\t=7Òñ¡\0&63\0ŽVÂÊb™ƒ½&Ç‚‰)CKˆP	+‹\0&Ml¦‹®g#º\"ÔÀÄæ	\"ú2oüU¯I¨‹òˆ¢¨ëW—•`–ˆ~ÃÄæñ¢kÙ¨®	u\00±y§\"uP	Š®¥Ùúú¢žÝáN”Wm {[ëA%XP¤î7±ygÑµlFW…:\0c~R)õ7~à\'E×ÒL]üæb-µþ¢KØ?ð¥ÔŒ1?Yt-›Õu¡\\™ãyÞ7ýÀoûIÝ­ÒÍ-\Z!ÖRëÂ.E?ð­çyß$¢»Š®e+º2ÔMl\"ú7¾ï_òK²y` ;[4B¬G‡aW­ö¾ï_\"¢cbÓ•½]ê\0`b3àö|ªQÑål‹ÖZúÓEiõW»£Á’O]Ì\0ÜžçKWêÚP\0›‹\0ö‡:´Ýìýý²àH”WµÞßD„P‡Àž<WºVW‡:pev\0ÿ©V–º5Ø%ÔE™uú*é|.ú€ÿ”çIWëúP®œqJD¿Z	+óÝìÕÓ±Õj_Çî“ú<ýj§œ1º]¥u\00±y7ýf·-NRJ¡/ŠŠ.Cˆ–QJ!ŠtÑe\\W¾¸è7MlÞ]t-ÍRšPòÅIJýN%¬tM°GQÔ±­!š¥?VÂÊ¬RêwºmqÑ”*ÔÀÄæ?tS°÷õI+]”_§½ÏWú(º–f+]¨Wƒý“Ýì‘t½ˆÐI]Œy ²Œ”4ÔÀÄæmÝìôf¢U:¥ñ²*ÐßVt-­RÚP®{GwÅtÚÇR!ZÁ÷ýÂW–®êr)m %uàjWÌ\'*ae®Ó$ƒ •¤¢gÕZÏ§-Î*¥>QÖ.—ÕJê\0`bóv¥ÔouÚ<öNùH*D;ñ~_™‡®”ú˜‰ÍÛÛ^@z\"Ô+Ó‰è¿TÂÊr§»ÖaÑ%Ñ6:lïû}e¥(ý—²M[\\OÏ„:puÒC¦ìa›ßäB©ï÷|/—”ˆ>T¦…EÑS¡\\ÙR\0ÀÞP‡ÆüB‘mwËEˆ\"µë“©øêÐ\0Ø[–¥ÿ›Ñs¡\\ÝlÂ÷ý3E´!-uÑK*•JËWOûo}ß?`¢›smEO†:\0˜Ø\\pÌó¼A²~VŠxY!\nAD¨TZ÷ž‚ ñ<ï\0“ùõÝ“z6ÔÀÄfŽˆ^¤<õùvf><ÏkçK\nQ¸V}:\r*Á‚òÔç‰èÛMlæZò\"]¢§C\0LlÒÄ$ßçyÞTÂÊl»P[Ùb¢S…M~ß¯ÌA÷<ïÓ‰I¾ÏÄ&mêt¡žõ&6oTJ}¬]‡mH¨‹^ÔÌU¥+Só9èohÚw9	õUò¹ìGC.ûïZùZAÐ=‡ñ\nÑ,A“\Z3~à»P‡ËD4ÙKsÐ7BBý\Z&6O˜ÈPãV½NEB]ô  Øþ¶AÄù€è„‰Í“Û¯ª\\$Ô¯ÃÄf†ˆ^ <õÙJ¥2‡ôÆHK]ô¢m5f¨T*sÊSŸ%¢ç›ØÌ4¯²òP_ƒ‰\r\'&yµòÔÇÂ0Œ›ÝÏ.y‰^´Õ÷=!ÃXyêc‰I^mbSèÂÁN&¡~&6ï ¢ƒ¡§üÀoÚÈºß„¡Bt›­„ºøi¨Ã)\":hbóŽ”U*ê`b3àçyŸ*Á|3žSæ¨‹^´Ù÷}P	æ=Ïûk\0‡òëPÜ€„ú™Ø,çóÙ;Ôa¬Ôöþé|	uÑ£|ÿÆï}¥BÆžçývb’gb³Ü†ÒJAB}“Ll~ŽˆT*•\'‚ 0[}i©‹^å©õßûA˜J¥ò0±ù¹6•U\Zê[`bs„#žçÝ»ÕU¨ê¢Wyk´ÔW­½„#½º!×vI¨o‘‰5Æü¨Rê×C.lfU]ô²ë½ÿóÁÐ¥Ô¯c~ÔÄ¦°ÝS»„ú6åû5{ž÷—mµK¨‹^¶úý¿ªuþ—\0Æ{qÿóf“Po›ÅÄ$? ”úp¾ÅÀº­öâÏ\\¢8Š®ÄNÞ:_VJ}81É˜Ø,\\Z)H¨7‘‰Í{\0ìð<ï3ëµÚ¥¥.z\Za¥uþ\0;òëF4‰„z“™Ø,%&¹3ïk¿¸2B”ÍÓgÎšå8¾¤”úõÄ$wšØ,]SÙH¨·HÞ7¸Ëó½O…:\\’¤¢—M]¸€úúâìÜÜïØ)}ç­#¡ÞB&6ÎÄæ\rD4éyÞW*•ÊI÷‹èY–á±\'ž˜›žžùJfííÇŽÞöSµ–nkÝë¤ùØùö /Ð‘þ¥Ðßj\0È©Ó¢ÔÎœ=—\\žM™ù7nŸ<ú®¢ëéÒRo#›wqì>uòÁ‡âóS¤Å\"JçüÔwòÁ‡âË³³ŸrÎH ·—´ÔÛÌÄ¦1ÐßÿS©ÍÞ5=3óÉùùùíÝ3>Ø××WtiBlËòò2ž>sv6Í²vÎýØñc“²\"´\0êpÌÈßðß{âä©?þäSŸˆ´ß3¾»ÞªÓÖ…h•$Ipæì¹¹Ø˜sÖÚŸ8~lòKE×ÔË$ÔÀî™^—ü8zâä©{yìñŸªV«{vï\Z“‘D§K³gÎž[XZZZ°Ö~üø±É\rÍh±Vv\0h%	õ‘_ï}àÔƒ¿ôÅÅŸ®×jÁî];«rB’è4Y–áÜù©¥¹ùùLA;$F¯}W~¼ëS~`n~þ§kµµ{×®j á.\n–fÎ?¿4?¿à˜ù£·O}gÑ5‰ç’¤(€s7žô’_0ï|àÔƒ˜Ÿ_xóÀÀ€Ú¹c¬_KŸ»h3“$˜ºpqqaaÁ1óon7Ì¥û¥µ$Ô°‘P_q5ÜOžzÿâââkìÛQïï¯¶®@!\0,..aêâ…9c’gí»ýØä»›ñ¼ÎÉ™Ñ­$¡^€­´TòêÝ\'Nžú¾§Ìé_ô<ïðà`½¶sÇÙôQ4ÕÔ…<;;7o­}4³ö=ÇMþy3Ÿ_Zê­%¡^\0f†s[9ç4¿ÀþüÄÉS/¸4=ó—.Mçððpe×ÎþVN`¸òž<áB63=Ó\0ÑßXkÿãñc“ÿ£¯%¡ÞZê±Ön)ÔWäÜ«Nœ<5>=3ó/]ú‰¡ÁÁxtt¤\ZiÝ¼BE©ÅÆàÒ¥é¥Ë³³‘§Ô§¬s?üØäÙV¾¦„zkI¨ÄZ‡fLEÏ/ÀŸðSœ<õþù……|¨^¯Õ¥kF¬eêÂž››ŸK³ì²³ö÷Ž7©¿|#$Ô[KB½ ­xc¯êwq:=óŽ©ÿ×ÁÁúòÈðpµ*Ûô¼¥åeLÏÌ,ÍÎÎõyž÷\'ÖÚ_i÷êÏ•®GÑ:ê±6kÙsçê\'NžòfgçÞ·¸°xˆö\r\rêá¡¡ +-{mÑY’¤™Ë—ÓË³³ÌOeÖÞà}“·ÝZHs9Ë¤•ÞjêIÓÖ…úŠãÇ&-€÷\0xÏ‰“§nšž™ù™™™™ôƒ ª×j#ÃCJ¶#(Ÿ4Ë0==ãææç²4øCçÜ‡›|¸èÚ²lÝã{EH¨$mó›;¿ ßàm\'Nžú¶KÓÓo¼4=}w¥RAm` 6<4¨*iÁw«F£™Ë³n~aa¾Ñh€?rÎ}ìø±É/]ÛjíhÌô:	õ‚ùæÎ/ô/xÃ‰“§^Òh4~ìÒôô]¾ïõZ­¯^¯}QTX}bc–ãssóéÜüürv¥	|Ÿsî“ÇM~±èÚÖ’¦ÒRo5	õ‚¤ÎxsçðE\0o>qòÔ·\\šžþ‘™Ë—_ÅÌûjµW¨ô÷Ë|ÀZ‹…ÅEÌ/,,ÍÏ/(\"zÊ9÷fþÔñc“_-º¾Po=	õ‚4ÒFÑ%<G_ðs\'NžÚ9;;÷ý‹‹w[çþm¥RIú«}Aµ¯o[sìÅÆ8ç°´¼Œ………taqi¹ÑhžR—Y{/€Ï?69Ut›ÕhtÞû¾l$ÔÒè–úZòÀøDþ\'Nžza£Ñ¸ëòìÜw9çŽW‚ÀT«ÕJµ\ZõõEþøík4\ZX^Ž±¸´/--5\Ziª•R\'œsÍÌ÷?6ù/E×¸]\ri©·œ„zA’$)º„MÉåj¨œ8yêùI£ñ’¹ùùïeæQTíë³Q¤kýýÐZKk~Î9c°°¸ˆ86óKËË3ÇDô%kí_ø§V-Ó/Rbºë}ß$ÔÂÌh4\Z]ÛÂ=~lò+\0¾à#\0pâä©‰ù……—,.-}×¥é™—;ç{ž—hÚ¾(ê¢ÈÓaˆ^<®/I˜$AÇv9ŽI”µV+¥eæ¿wÎý5®„øSE×ÚjICB½Õ$Ôd’¤kCýZÇMžðéü\0àÄÉS‡³Û—––_ä)õ­>æï+•Ei/¬TªaR¥RAX©tõ`¬µI£F£$I8i4–LllÒhô+EtÒ:÷¯Ìüß<püØä#E×ÜnYfeñQH¨(1	00Pt-süØä£\0ð\'+·8yJ›$9n’d’ˆnó”:ÆÀçÜ‘ïûIø\\©T‚JôA\0ß÷¯üñ<ø¾ßÖnç²,Cfí•ÿfÒ4E#M—Fš¦eY23+¥Nðˆuî$3?à€“·5m+¸ƒu[—c·’P/P/¾É›4\0þ{þçYNœ<5Ôh4&\ZÆÞ¥¥å	\":¤”š `»˜y˜™k\0|\"J<¥2ÏóœRŠ•RDŠH)OyJyDt5ù=OùDä1³µÖ]] ÀÌÎº+ÿcÇìœcçYk•uÎgæ@FDóD4CÀyÎ8çN3óc\0Nx\ZÀéãÇ&/·ü¯Ëõâû½êJ™ÞµZŒ—œXï~\'Nžª0ó sn0Í²A\0ý\0ª\0\"\0\ZÀ\0žýÞîH\0,¯º=°\0À\0ˆ,X0»òçø±Iù!5‰‘Po‹ÿo»ìíä.ç\0\0\0\0IEND®B`‚');
/*!40000 ALTER TABLE `umm_user_propic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill`
--

DROP TABLE IF EXISTS `vp_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `bill_attachment_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `bill_date_str` varchar(40) DEFAULT NULL,
  `bill_date_format` varchar(40) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `content_extractable` char(1) DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `submitted_by` varchar(100) DEFAULT NULL,
  `submitted_by_name` varchar(200) DEFAULT NULL,
  `deletection_level` char(1) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `discount_applicable_date` datetime DEFAULT NULL,
  `bill_type` char(1) DEFAULT NULL,
  `applicable_discount_amount` decimal(19,2) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `submitted_by_vendor` tinyint(1) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `schedule_template_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `paid_amount` decimal(19,2) DEFAULT NULL,
  `payment_under_processing` decimal(19,2) DEFAULT NULL,
  `vendor_schedule_template_id` int(11) DEFAULT NULL,
  `inbox_attachment_id` int(11) DEFAULT NULL,
  `ocr_running_status` char(1) DEFAULT NULL,
  `close_po` tinyint(1) DEFAULT 0,
  `ocr_running_date` date DEFAULT NULL,
  `statement_id` int(11) DEFAULT NULL,
  `credit_amount` decimal(19,2) DEFAULT NULL,
  `thumbnail_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39h0uns08ssn9fvuqlpktjdj8` (`vendor_id`) USING BTREE,
  KEY `PO_KEY_FK_1` (`po_id`),
  KEY `AUTOMATION_ID_FK_6` (`automation_id`),
  KEY `WORKFLOW_ID_FK_9` (`workflow_id`),
  KEY `BILL_ATTACHMENT_ID_FK_1` (`bill_attachment_id`),
  KEY `PO_RECEIPT_FK_1` (`receipt_id`),
  KEY `DEPT_ID_FK` (`department_id`),
  KEY `SCHEDULE_TEMPLATE_ID_FK_1` (`schedule_template_id`),
  KEY `vp_bill_common_inbox_attachment_id_fk` (`inbox_attachment_id`),
  KEY `STATEMENT_ID_FK` (`statement_id`),
  KEY `AUTOMATION_RULE_ID_FK_1` (`automation_rule_id`),
  CONSTRAINT `AUTOMATION_ID_FK_6` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `AUTOMATION_RULE_ID_FK_1` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `DEPT_ID_FK` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `PO_KEY_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PO_RECEIPT_FK_1` FOREIGN KEY (`receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `SCHEDULE_TEMPLATE_ID_FK_1` FOREIGN KEY (`schedule_template_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`),
  CONSTRAINT `STATEMENT_ID_FK` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`),
  CONSTRAINT `VENDOR_ID_FK_8` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `WORKFLOW_ID_FK_9` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill`
--

LOCK TABLES `vp_bill` WRITE;
/*!40000 ALTER TABLE `vp_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_additional_data`
--

DROP TABLE IF EXISTS `vp_bill_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `bill_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_invoice_mst` (`bill_mst_id`),
  CONSTRAINT `FK__vp_invoice_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_additional_data`
--

LOCK TABLES `vp_bill_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_bill_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_bill_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `bill_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inv_mst` (`bill_mst_id`),
  CONSTRAINT `FK_inv_mst` FOREIGN KEY (`bill_mst_id`) REFERENCES `vp_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_additional_field_attachment`
--

LOCK TABLES `vp_bill_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_bill_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_attachment`
--

DROP TABLE IF EXISTS `vp_bill_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BILL_ID_FK_1` (`bill_id`),
  CONSTRAINT `BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_attachment`
--

LOCK TABLES `vp_bill_attachment` WRITE;
/*!40000 ALTER TABLE `vp_bill_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_audit_trail`
--

DROP TABLE IF EXISTS `vp_bill_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `header` varchar(200) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT '',
  `bill_id` int(11) NOT NULL,
  `undo_action` tinyint(1) DEFAULT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbcyeuds2xgf57mx6c46cmrmag` (`bill_id`) USING BTREE,
  KEY `status_id` (`status_id`) USING BTREE,
  CONSTRAINT `vp_bill_audit_trail_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `vp_bill_audit_trail_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_audit_trail`
--

LOCK TABLES `vp_bill_audit_trail` WRITE;
/*!40000 ALTER TABLE `vp_bill_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_audit_trail_cost_distribution`
--

DROP TABLE IF EXISTS `vp_bill_audit_trail_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_audit_trail_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_trail_id` int(11) NOT NULL,
  `cost_type` varchar(100) NOT NULL,
  `number` varchar(100) DEFAULT NULL,
  `project_code` varchar(300) DEFAULT '',
  `department` varchar(100) DEFAULT NULL,
  `qty` decimal(19,2) DEFAULT 0.00,
  `cost` decimal(19,2) DEFAULT 0.00,
  `amount` decimal(19,2) NOT NULL DEFAULT 0.00,
  `changed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_audit_trail_cost_distribution`
--

LOCK TABLES `vp_bill_audit_trail_cost_distribution` WRITE;
/*!40000 ALTER TABLE `vp_bill_audit_trail_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_audit_trail_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_capturing_audit_trial`
--

DROP TABLE IF EXISTS `vp_bill_capturing_audit_trial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_capturing_audit_trial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_status` char(1) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `failed_reason` varchar(500) DEFAULT NULL,
  `response_data` longtext DEFAULT NULL,
  `bill_id` int(15) NOT NULL,
  `requested_on` date NOT NULL,
  `requested_by` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_capturing_audit_trial`
--

LOCK TABLES `vp_bill_capturing_audit_trial` WRITE;
/*!40000 ALTER TABLE `vp_bill_capturing_audit_trial` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_capturing_audit_trial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_create_detail`
--

DROP TABLE IF EXISTS `vp_bill_create_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_create_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(150) DEFAULT NULL,
  `qty` decimal(12,2) NOT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_invoice` (`bill_id`) USING BTREE,
  CONSTRAINT `BILL_CREATE_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_create_detail`
--

LOCK TABLES `vp_bill_create_detail` WRITE;
/*!40000 ALTER TABLE `vp_bill_create_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_create_detail` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_csv_export_format`
--

LOCK TABLES `vp_bill_csv_export_format` WRITE;
/*!40000 ALTER TABLE `vp_bill_csv_export_format` DISABLE KEYS */;
INSERT INTO `vp_bill_csv_export_format` VALUES (1,'Default','DEFAULT',1),(2,'Business Central','BC',0),(3,'Blackbaud','BB',0),(4,'KERA DEFAULT','KERA',0),(5,'SAGE','SAGE',0);
/*!40000 ALTER TABLE `vp_bill_csv_export_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_expense_cost_distribution`
--

DROP TABLE IF EXISTS `vp_bill_expense_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `receipt_url` varchar(300) DEFAULT NULL,
  `receipt_file_type` varchar(50) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `po_receipt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` (`bill_id`),
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
  KEY `PROJECT_ID_FK_3` (`project_id`),
  KEY `DEPT_ID_FK_1` (`department_id`),
  KEY `PO_REC_ID_FK_1` (`po_receipt_id`),
  CONSTRAINT `DEPT_ID_FK_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_REC_ID_FK_1` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_3` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_expense_cost_distribution`
--

LOCK TABLES `vp_bill_expense_cost_distribution` WRITE;
/*!40000 ALTER TABLE `vp_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_expense_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_item_cost_distribution`
--

DROP TABLE IF EXISTS `vp_bill_item_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_item_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) DEFAULT 0.00,
  `rate` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `item_number` varchar(50) DEFAULT '',
  `item_name` varchar(300) DEFAULT '',
  `department_id` int(11) DEFAULT NULL,
  `receipt_url` varchar(300) DEFAULT NULL,
  `receipt_file_type` varchar(50) DEFAULT NULL,
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `po_receipt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
  KEY `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`bill_id`),
  KEY `PROJECT_ID_FK_1` (`project_id`),
  KEY `PO_ID_FK_1` (`po_id`),
  KEY `DEPTID_FK` (`department_id`),
  KEY `PO_REC_ID_FK_2` (`po_receipt_id`),
  CONSTRAINT `DEPTID_FK` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_common_product_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`),
  CONSTRAINT `PO_ID_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PO_REC_ID_FK_2` FOREIGN KEY (`po_receipt_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `PROJECT_ID_FK_1` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_item_cost_distribution`
--

LOCK TABLES `vp_bill_item_cost_distribution` WRITE;
/*!40000 ALTER TABLE `vp_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_item_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment`
--

DROP TABLE IF EXISTS `vp_bill_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_referance_no` varchar(30) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `payment_type_description` varchar(200) DEFAULT NULL,
  `bill_id` int(11) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `discount_amount` decimal(19,2) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `mailed_date` datetime DEFAULT NULL,
  `mailed_user` varchar(50) DEFAULT NULL,
  `sync_id` int(11) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT '',
  `vendor_id` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `ap_account_ref` int(11) DEFAULT NULL,
  `bank_account_ref` int(11) DEFAULT NULL,
  `distribution_id` int(11) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`bill_id`) USING BTREE,
  KEY `FK_IMPORT_MST` (`import_id`),
  KEY `FK_AP_ACCOUNT` (`ap_account_ref`),
  KEY `FK_BANK_ACCOUNT_REF` (`bank_account_ref`),
  CONSTRAINT `BILL_PAYMENT_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AP_ACCOUNT` FOREIGN KEY (`ap_account_ref`) REFERENCES `common_account_number` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_BANK_ACCOUNT_REF` FOREIGN KEY (`bank_account_ref`) REFERENCES `common_account_number` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IMPORT_MST` FOREIGN KEY (`import_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_payment`
--

LOCK TABLES `vp_bill_payment` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment_additional_data`
--

DROP TABLE IF EXISTS `vp_bill_payment_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_value_date` date DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `payment_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_payment_mst` (`payment_mst_id`),
  CONSTRAINT `FK__vp_payment_mst` FOREIGN KEY (`payment_mst_id`) REFERENCES `vp_bill_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_payment_additional_data`
--

LOCK TABLES `vp_bill_payment_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_bill_payment_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `payment_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_mst` (`payment_mst_id`),
  CONSTRAINT `FK_payment_mst` FOREIGN KEY (`payment_mst_id`) REFERENCES `vp_bill_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_payment_additional_field_attachment`
--

LOCK TABLES `vp_bill_payment_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment_attachment`
--

DROP TABLE IF EXISTS `vp_bill_payment_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_payment_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_payment_attachment`
--

LOCK TABLES `vp_bill_payment_attachment` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment_distribution`
--

DROP TABLE IF EXISTS `vp_bill_payment_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `un_tag_referance` int(11) NOT NULL,
  `invoice_referance` int(11) NOT NULL,
  `distribute_amount` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_payment_distribution`
--

LOCK TABLES `vp_bill_payment_distribution` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment_import_issue`
--

DROP TABLE IF EXISTS `vp_bill_payment_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST2` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST2` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_bill_payment_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_payment_import_issue`
--

LOCK TABLES `vp_bill_payment_import_issue` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_payment_import_mst`
--

DROP TABLE IF EXISTS `vp_bill_payment_import_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_payment_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
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
-- Dumping data for table `vp_bill_payment_import_mst`
--

LOCK TABLES `vp_bill_payment_import_mst` WRITE;
/*!40000 ALTER TABLE `vp_bill_payment_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_payment_import_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_po_receipt_detail`
--

DROP TABLE IF EXISTS `vp_bill_po_receipt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_po_receipt_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `po_receipt_id` int(11) DEFAULT NULL,
  `billd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_po_receipt_detail`
--

LOCK TABLES `vp_bill_po_receipt_detail` WRITE;
/*!40000 ALTER TABLE `vp_bill_po_receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_po_receipt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_template_detail`
--

DROP TABLE IF EXISTS `vp_bill_template_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_template_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `page_no` int(11) NOT NULL,
  `axis_x` float(10,2) NOT NULL,
  `axis_y` float(10,2) NOT NULL,
  `width` float(10,2) NOT NULL,
  `height` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`) USING BTREE,
  CONSTRAINT `vp_bill_template_detail_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `vp_bill_template_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_template_detail`
--

LOCK TABLES `vp_bill_template_detail` WRITE;
/*!40000 ALTER TABLE `vp_bill_template_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_template_email`
--

DROP TABLE IF EXISTS `vp_bill_template_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_template_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  UNIQUE KEY `vp_bill_template_email_pk` (`id`),
  KEY `vp_bill_template_email_vp_bill_template_mst_id_fk` (`template_id`),
  CONSTRAINT `vp_bill_template_email_vp_bill_template_mst_id_fk` FOREIGN KEY (`template_id`) REFERENCES `vp_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_template_email`
--

LOCK TABLES `vp_bill_template_email` WRITE;
/*!40000 ALTER TABLE `vp_bill_template_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_template_mst`
--

DROP TABLE IF EXISTS `vp_bill_template_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `bill_date_format` varchar(30) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `bill_term` int(11) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `po_no` varchar(100) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT 0.00,
  `bill_date_str` varchar(100) DEFAULT NULL,
  `bill_no` varchar(100) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`) USING BTREE,
  KEY `invoice_id` (`bill_id`) USING BTREE,
  CONSTRAINT `vp_bill_template_mst_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_template_mst`
--

LOCK TABLES `vp_bill_template_mst` WRITE;
/*!40000 ALTER TABLE `vp_bill_template_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_bill_template_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_bill_term`
--

DROP TABLE IF EXISTS `vp_bill_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_bill_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(50) NOT NULL,
  `in_months` int(4) DEFAULT NULL,
  `on_month` int(4) DEFAULT NULL,
  `on_day` int(4) DEFAULT NULL,
  `net_days_due` int(4) NOT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_days_due` int(4) DEFAULT NULL,
  `in_months_discount_days_due` int(11) DEFAULT NULL,
  `on_day_discount_days_due` int(11) DEFAULT NULL,
  `end_of_month` tinyint(1) DEFAULT 0,
  `from_entry` tinyint(1) DEFAULT 0,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_bill_term`
--

LOCK TABLES `vp_bill_term` WRITE;
/*!40000 ALTER TABLE `vp_bill_term` DISABLE KEYS */;
INSERT INTO `vp_bill_term` VALUES (1,'Due on receipt',NULL,NULL,NULL,0,0.00,0,NULL,NULL,0,0,'A','admin','2019-10-14 10:38:44',NULL,NULL,NULL,NULL),(2,'Net 10',NULL,NULL,NULL,10,0.00,0,NULL,NULL,0,0,'A','admin','2019-10-14 10:39:29',NULL,NULL,NULL,NULL),(3,'Net 15',NULL,NULL,NULL,15,0.00,0,NULL,NULL,0,0,'A','admin','2019-10-14 10:40:09',NULL,NULL,NULL,NULL),(4,'Net 30',NULL,NULL,NULL,30,0.00,0,NULL,NULL,0,0,'A','admin','2019-10-14 10:40:28',NULL,NULL,NULL,NULL),(5,'Net 60',NULL,NULL,NULL,60,0.00,0,NULL,NULL,0,0,'A','admin','2019-10-14 10:40:57',NULL,NULL,NULL,NULL),(6,'1%/10, Net 30',NULL,NULL,NULL,30,1.00,10,NULL,NULL,0,0,'A','admin','2019-10-14 10:41:27',NULL,NULL,NULL,NULL),(7,'1%/15, Net 30',NULL,NULL,NULL,30,1.00,15,NULL,NULL,0,0,'A','admin','2019-10-14 10:41:48',NULL,NULL,NULL,NULL),(8,'2%/10, Net 30',NULL,NULL,NULL,30,2.00,10,NULL,NULL,0,0,'A','admin','2019-10-14 10:42:08',NULL,NULL,NULL,NULL),(9,'2%/15/Net 30',NULL,NULL,NULL,30,2.00,15,NULL,NULL,0,0,'A','admin','2019-10-14 10:42:46',NULL,NULL,NULL,NULL),(10,'Other',NULL,NULL,NULL,0,0.00,0,NULL,NULL,0,0,'A','admin','2019-10-14 10:43:11',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vp_bill_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_for_employee`
--

DROP TABLE IF EXISTS `vp_credit_card_for_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_for_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `employee_name` varchar(200) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_for_employee`
--

LOCK TABLES `vp_credit_card_for_employee` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_for_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_for_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_missing_receipt_form`
--

DROP TABLE IF EXISTS `vp_credit_card_missing_receipt_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_missing_receipt_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(300) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MISSING_RECEIPT_TRANSACTION_FK` (`transaction_id`),
  CONSTRAINT `MISSING_RECEIPT_TRANSACTION_FK` FOREIGN KEY (`transaction_id`) REFERENCES `vp_credit_card_statement_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_missing_receipt_form`
--

LOCK TABLES `vp_credit_card_missing_receipt_form` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_missing_receipt_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_missing_receipt_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_missing_receipt_form_item`
--

DROP TABLE IF EXISTS `vp_credit_card_missing_receipt_form_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_missing_receipt_form_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `missing_receipt_form_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` decimal(12,2) DEFAULT NULL,
  `rate` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_missing_receipt_form_item`
--

LOCK TABLES `vp_credit_card_missing_receipt_form_item` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_missing_receipt_form_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_missing_receipt_form_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_statement`
--

DROP TABLE IF EXISTS `vp_credit_card_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `header_row` int(11) NOT NULL,
  `date_format_id` varchar(30) DEFAULT NULL,
  `total_records` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_statement`
--

LOCK TABLES `vp_credit_card_statement` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_statement_audit_trail`
--

DROP TABLE IF EXISTS `vp_credit_card_statement_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_statement_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `header` varchar(200) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `undo_action` tinyint(1) DEFAULT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_statement_audit_trail`
--

LOCK TABLES `vp_credit_card_statement_audit_trail` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_statement_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_statement_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_statement_detail`
--

DROP TABLE IF EXISTS `vp_credit_card_statement_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_statement_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_id` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `posting_date` datetime DEFAULT NULL,
  `merchant` varchar(300) DEFAULT NULL,
  `card_no` varchar(50) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `status` char(255) NOT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `employee_name` varchar(200) DEFAULT NULL,
  `submitted_date` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8 NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) DEFAULT '',
  `update_by` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_group_name` varchar(75) DEFAULT '',
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `missing_receipt_availability` char(1) DEFAULT NULL,
  `missing_receipt_form_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `billable` char(1) DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `STATEMENT_ID_FK_3` (`statement_id`),
  KEY `RECEIPT_ID_STATEMENT_DETAIL_RECEIPT_ID_KF` (`receipt_id`),
  CONSTRAINT `RECEIPT_ID_STATEMENT_DETAIL_RECEIPT_ID_KF` FOREIGN KEY (`receipt_id`) REFERENCES `vp_receipt_mst` (`id`),
  CONSTRAINT `STATEMENT_ID_FK_3` FOREIGN KEY (`statement_id`) REFERENCES `vp_credit_card_statement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_statement_detail`
--

LOCK TABLES `vp_credit_card_statement_detail` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_statement_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_statement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_card_transaction_cache`
--

DROP TABLE IF EXISTS `vp_credit_card_transaction_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_card_transaction_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_name` varchar(150) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CREDIT_CARD_TRANSACTION_CACHE_VENDOR_ID` (`vendor_id`),
  CONSTRAINT `CREDIT_CARD_TRANSACTION_CACHE_VENDOR_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_card_transaction_cache`
--

LOCK TABLES `vp_credit_card_transaction_cache` WRITE;
/*!40000 ALTER TABLE `vp_credit_card_transaction_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_card_transaction_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_note`
--

DROP TABLE IF EXISTS `vp_credit_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_no` varchar(50) DEFAULT NULL,
  `credit_note_date` datetime DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_email` varchar(200) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `credit_total` decimal(19,2) DEFAULT NULL,
  `credit_balance` decimal(19,2) DEFAULT NULL,
  `tax_amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `submitted_by_vendor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_CRED_VEN_ID` (`vendor_id`) USING BTREE,
  KEY `FK_CRED_PO_ID` (`po_id`) USING BTREE,
  CONSTRAINT `FK_CRED_PO_ID` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CRED_VEN_ID` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_note`
--

LOCK TABLES `vp_credit_note` WRITE;
/*!40000 ALTER TABLE `vp_credit_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_note_additional_data`
--

DROP TABLE IF EXISTS `vp_credit_note_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_note_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `credit_note_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK__vp_purchase_order_mst` (`credit_note_id`) USING BTREE,
  KEY `PO_ADDITIONAL_FIELD_TYPE_FK_1` (`field_type_id`) USING BTREE,
  CONSTRAINT `VP_CRED_NT_ADD_FK_ID` FOREIGN KEY (`field_type_id`) REFERENCES `common_additional_field_type` (`id`),
  CONSTRAINT `VP_CRED_NT_ID_FK_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1902 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_note_additional_data`
--

LOCK TABLES `vp_credit_note_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_credit_note_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_note_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_note_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_credit_note_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_note_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `credit_note_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Fk_po_mst` (`credit_note_id`) USING BTREE,
  CONSTRAINT `ADD_ATT_FKD_1` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_note_additional_field_attachment`
--

LOCK TABLES `vp_credit_note_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_credit_note_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_note_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_note_attachment`
--

DROP TABLE IF EXISTS `vp_credit_note_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_note_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_CRED_NT_ID` (`credit_note_id`) USING BTREE,
  CONSTRAINT `FK_CRED_NT_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_note_attachment`
--

LOCK TABLES `vp_credit_note_attachment` WRITE;
/*!40000 ALTER TABLE `vp_credit_note_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_note_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_note_item_details`
--

DROP TABLE IF EXISTS `vp_credit_note_item_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_note_item_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT NULL,
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `qty` decimal(12,2) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `po_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_ITM_CRED_ID` (`credit_note_id`) USING BTREE,
  CONSTRAINT `FK_ITM_CRED_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_note_item_details`
--

LOCK TABLES `vp_credit_note_item_details` WRITE;
/*!40000 ALTER TABLE `vp_credit_note_item_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_note_item_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_credit_note_relation`
--

DROP TABLE IF EXISTS `vp_credit_note_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_credit_note_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) DEFAULT NULL,
  `credit_note_no` varchar(50) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `applied_credit_amount` decimal(19,2) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_CRED_ID` (`credit_note_id`) USING BTREE,
  KEY `FK_BILL_CRED_ID` (`bill_id`) USING BTREE,
  CONSTRAINT `FK_BILL_CRED_ID` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CRED_ID` FOREIGN KEY (`credit_note_id`) REFERENCES `vp_credit_note` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_credit_note_relation`
--

LOCK TABLES `vp_credit_note_relation` WRITE;
/*!40000 ALTER TABLE `vp_credit_note_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_credit_note_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_customer_vendor_relation`
--

DROP TABLE IF EXISTS `vp_customer_vendor_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_customer_vendor_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) DEFAULT NULL,
  `vendor_email` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT '',
  `contact_person` varchar(150) DEFAULT NULL,
  `local_vendor_id` int(11) DEFAULT NULL,
  `community_vendor_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `request_by` varchar(100) NOT NULL,
  `request_on` datetime DEFAULT NULL,
  `vendor_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LOCAL_VENDOR_FK_1` (`local_vendor_id`),
  CONSTRAINT `LOCAL_VENDOR_FK_1` FOREIGN KEY (`local_vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_customer_vendor_relation`
--

LOCK TABLES `vp_customer_vendor_relation` WRITE;
/*!40000 ALTER TABLE `vp_customer_vendor_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_customer_vendor_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_additional_data`
--

DROP TABLE IF EXISTS `vp_expense_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `expense_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_expense_mst` (`expense_mst_id`),
  CONSTRAINT `EXPENSE_ADDITIONAL_FIELD_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_additional_data`
--

LOCK TABLES `vp_expense_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_expense_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_expense_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `expense_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT '',
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_fieldId` (`field_id`),
  KEY `Fk_expense_mst` (`expense_mst_id`),
  CONSTRAINT `ADDITIONAL_FIELD_EXPENSE_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `EXPENSE_ADDITIONAL_ATTACHMENT_FIELD_ID_FK1` FOREIGN KEY (`field_id`) REFERENCES `common_additional_field` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_additional_field_attachment`
--

LOCK TABLES `vp_expense_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_expense_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_attachment`
--

DROP TABLE IF EXISTS `vp_expense_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_mst_id` int(11) NOT NULL,
  `expense_detail_id` int(11) DEFAULT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXPENSE_ID_FK_1` (`expense_mst_id`),
  CONSTRAINT `EXPENSE_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_attachment`
--

LOCK TABLES `vp_expense_attachment` WRITE;
/*!40000 ALTER TABLE `vp_expense_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_audit_trail`
--

DROP TABLE IF EXISTS `vp_expense_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `header` varchar(500) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `expense_id` int(11) NOT NULL,
  `undo_action` tinyint(1) DEFAULT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_expense_type` (`status_id`),
  KEY `FK__ar_expense_mst` (`expense_id`),
  CONSTRAINT `` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ar_expense_det` FOREIGN KEY (`expense_id`) REFERENCES `vp_expense_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_expense_audit_trail_vp_vendor_invoice_status` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_audit_trail`
--

LOCK TABLES `vp_expense_audit_trail` WRITE;
/*!40000 ALTER TABLE `vp_expense_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_detail`
--

DROP TABLE IF EXISTS `vp_expense_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_mst_id` int(11) DEFAULT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `project_code_name` varchar(255) DEFAULT NULL,
  `project_account_code` varchar(200) DEFAULT NULL,
  `expense_account_code` varchar(200) DEFAULT NULL,
  `merchant` varchar(50) DEFAULT NULL,
  `expense_type` varchar(50) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `mileage_rate` decimal(19,2) DEFAULT 0.00,
  `mileage` decimal(19,2) DEFAULT NULL,
  `mileage_amount` decimal(19,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `FK1_EXPENSE_MST_ID` (`expense_mst_id`) USING BTREE,
  KEY `EXPENSE_PROJECT_ID_FK_1` (`project_code_id`),
  KEY `EXPENSE_ACCOUNT_ID_FK_1` (`account_id`),
  KEY `ATTACHMENT_ID_FK_1` (`attachment_id`),
  CONSTRAINT `EXPENSE_ACCOUNT_ID_FK_1` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `EXPENSE_MASTER_ID_FK_1` FOREIGN KEY (`expense_mst_id`) REFERENCES `vp_expense_mst` (`id`),
  CONSTRAINT `EXPENSE_PROJECT_ID_FK_1` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_detail`
--

LOCK TABLES `vp_expense_detail` WRITE;
/*!40000 ALTER TABLE `vp_expense_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_mileage_rate`
--

DROP TABLE IF EXISTS `vp_expense_mileage_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_mileage_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mileage_rate` decimal(19,2) DEFAULT 0.00,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_mileage_rate`
--

LOCK TABLES `vp_expense_mileage_rate` WRITE;
/*!40000 ALTER TABLE `vp_expense_mileage_rate` DISABLE KEYS */;
INSERT INTO `vp_expense_mileage_rate` VALUES (1,0.00,NULL,'2022-08-19','2022-08-19',NULL,'A');
/*!40000 ALTER TABLE `vp_expense_mileage_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_mst`
--

DROP TABLE IF EXISTS `vp_expense_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `total_miles_driven` decimal(19,2) DEFAULT NULL,
  `total_mileage_amount` decimal(19,2) DEFAULT 0.00,
  `paid_amount` decimal(19,2) DEFAULT NULL,
  `payment_under_processing` decimal(19,2) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `payment_status` char(2) DEFAULT NULL,
  `report_name` varchar(50) DEFAULT '',
  `business_purpose` varchar(50) DEFAULT '',
  `export_status` char(1) DEFAULT 'N',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `created_by_name` varchar(200) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXPENSE_VNDOR_FK_1` (`vendor_id`),
  KEY `EXPENSE_AUTOMATION_ID_FK_1` (`automation_id`),
  KEY `EXPENSE_RULE_AUTOMATION_FK_1` (`automation_rule_id`),
  CONSTRAINT `EXPENSE_AUTOMATION_ID_FK_1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `EXPENSE_RULE_AUTOMATION_FK_1` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `EXPENSE_VNDOR_FK_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_mst`
--

LOCK TABLES `vp_expense_mst` WRITE;
/*!40000 ALTER TABLE `vp_expense_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_expense_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_expense_type`
--

DROP TABLE IF EXISTS `vp_expense_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_expense_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_expense_type`
--

LOCK TABLES `vp_expense_type` WRITE;
/*!40000 ALTER TABLE `vp_expense_type` DISABLE KEYS */;
INSERT INTO `vp_expense_type` VALUES (1,'Airfare','A','admin','2020-06-02 14:52:36',NULL,NULL,NULL,NULL),(2,'Ground transportation','A','admin','2020-06-02 14:54:00',NULL,NULL,NULL,NULL),(3,'Tolls','A','admin','2020-06-02 14:55:44',NULL,NULL,NULL,NULL),(4,'Meals','A','admin','2020-06-02 14:59:17',NULL,NULL,NULL,NULL),(5,'Lodging','A','admin','2020-06-02 14:59:31',NULL,NULL,NULL,NULL),(6,'Tips','A','admin','2020-06-02 14:59:50',NULL,NULL,NULL,NULL),(7,'Entertainment','A','admin','2020-06-02 15:00:03',NULL,NULL,NULL,NULL),(8,'Registration fees','A','admin','2020-06-02 15:00:18',NULL,NULL,NULL,NULL),(9,'Business supplies','A','admin','2020-06-02 15:00:29',NULL,NULL,NULL,NULL),(10,'Business services','A','admin','2020-06-02 15:00:42',NULL,NULL,NULL,NULL),(11,'Maintenance','A','admin','2020-06-02 15:00:53',NULL,NULL,NULL,NULL),(12,'Permits','A','admin','2020-06-02 15:01:11',NULL,NULL,NULL,NULL),(13,'Shipping','A','admin','2020-06-02 15:01:22',NULL,NULL,NULL,NULL),(14,'Training','A','admin','2020-06-02 15:01:34',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vp_expense_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_batch`
--

DROP TABLE IF EXISTS `vp_payment_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(100) DEFAULT NULL,
  `tp_batch_id` varchar(12) DEFAULT NULL,
  `no_of_vendor` int(6) DEFAULT NULL,
  `no_of_bills` int(6) DEFAULT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `cancellable_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `payment_status` char(1) DEFAULT '',
  `remarks` varchar(500) DEFAULT NULL,
  `api_message` varchar(500) DEFAULT NULL,
  `processed_date` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `approval_user` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `approval_group_name` varchar(75) CHARACTER SET latin1 DEFAULT '',
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `cancelled_by` varchar(100) DEFAULT NULL,
  `cancelled_on` datetime DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `export_status` char(1) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PAYMENT_STATUS_FK_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_batch`
--

LOCK TABLES `vp_payment_batch` WRITE;
/*!40000 ALTER TABLE `vp_payment_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_batch_audit_trail`
--

DROP TABLE IF EXISTS `vp_payment_batch_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_batch_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `user_name` varchar(200) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `automation_name` varchar(300) DEFAULT NULL,
  `payment_batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frky1_po_id` (`payment_batch_id`),
  KEY `frky2_status_id` (`status_id`),
  CONSTRAINT `VP_PAYMENT_AUDIT_TRAIL_BATCH_ID_FK1` FOREIGN KEY (`payment_batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `vp_payment_batch_audit_trail_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_batch_audit_trail`
--

LOCK TABLES `vp_payment_batch_audit_trail` WRITE;
/*!40000 ALTER TABLE `vp_payment_batch_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_batch_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_batch_bill_wise_transaction`
--

DROP TABLE IF EXISTS `vp_payment_batch_bill_wise_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_batch_bill_wise_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_txn_id` varchar(12) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `batch_no` varchar(12) DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT NULL,
  `document_type` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `document_no` varchar(50) DEFAULT NULL,
  `offline_payment_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `payee_name` varchar(255) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT '',
  `txn_ref` varchar(50) DEFAULT NULL,
  `txn_type` int(11) NOT NULL,
  `txn_type_name` varchar(100) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` char(1) NOT NULL,
  `payment_status` char(1) NOT NULL,
  `reason` text DEFAULT NULL,
  `comment` varchar(500) DEFAULT '',
  `bank_account_id` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(75) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user_name` varchar(200) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `cancelled_by` varchar(100) DEFAULT NULL,
  `cancelled_on` datetime DEFAULT NULL,
  `export_status` char(1) DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `scheduled_time` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TXN_VENDOR_ID_FK1` (`vendor_id`),
  KEY `TXN_BATCH_ID_FK1` (`batch_id`),
  KEY `TXN_BILL_ID_FK1` (`bill_id`),
  CONSTRAINT `TXN_BATCH_ID_FK1` FOREIGN KEY (`batch_id`) REFERENCES `vp_payment_batch` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `TXN_BILL_ID_FK1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `TXN_VENDOR_ID_FK1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_batch_bill_wise_transaction`
--

LOCK TABLES `vp_payment_batch_bill_wise_transaction` WRITE;
/*!40000 ALTER TABLE `vp_payment_batch_bill_wise_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_batch_bill_wise_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_bill_wise_cache`
--

DROP TABLE IF EXISTS `vp_payment_bill_wise_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_bill_wise_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_cache_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `txn_type` int(11) DEFAULT NULL,
  `txn_amount` decimal(19,2) DEFAULT NULL,
  `txn_discount` decimal(19,2) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `bill_no` varchar(50) NOT NULL DEFAULT '',
  `txn_ref` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_CACHE_BILL_ID_FK_1` (`bill_id`),
  KEY `BILL_PAYMENT_CACHE_VENDOR_CACHE_ID_FK1` (`vendor_cache_id`),
  CONSTRAINT `BILL_PAYMENT_CACHE_BILL_ID_FK_1` FOREIGN KEY (`bill_id`) REFERENCES `vp_bill` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `BILL_PAYMENT_CACHE_VENDOR_CACHE_ID_FK1` FOREIGN KEY (`vendor_cache_id`) REFERENCES `vp_payment_vendor_wise_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_bill_wise_cache`
--

LOCK TABLES `vp_payment_bill_wise_cache` WRITE;
/*!40000 ALTER TABLE `vp_payment_bill_wise_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_bill_wise_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_payment_vendor_wise_cache`
--

DROP TABLE IF EXISTS `vp_payment_vendor_wise_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_payment_vendor_wise_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(150) DEFAULT NULL,
  `no_of_bills` int(5) DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `balance_amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by_name` varchar(200) CHARACTER SET latin1 DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` (`vendor_id`),
  CONSTRAINT `BILL_PAYMENT_VENDOR_CACHE_VENDOR_ID_FK1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_payment_vendor_wise_cache`
--

LOCK TABLES `vp_payment_vendor_wise_cache` WRITE;
/*!40000 ALTER TABLE `vp_payment_vendor_wise_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_payment_vendor_wise_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_account_detail`
--

DROP TABLE IF EXISTS `vp_po_account_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_account_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `purchase_order_mst_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_po_account_chart_of_account` (`account_id`),
  KEY `FK_vp_po_account_approval_code` (`project_id`),
  KEY `FK_vp_po_account_po_mst` (`purchase_order_mst_id`),
  KEY `FK_DEPT_ID_FK1` (`department_id`),
  CONSTRAINT `FK_DEPT_ID_FK1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_po_account_approval_code` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_po_account_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vp_po_account_po_mst` FOREIGN KEY (`purchase_order_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_account_detail`
--

LOCK TABLES `vp_po_account_detail` WRITE;
/*!40000 ALTER TABLE `vp_po_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_account_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_additional_data`
--

DROP TABLE IF EXISTS `vp_po_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `po_mst_id` int(15) NOT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_purchase_order_mst` (`po_mst_id`),
  KEY `PO_ADDITIONAL_FIELD_TYPE_FK_1` (`field_type_id`),
  CONSTRAINT `FK__vp_purchase_order_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `PO_ADDITIONAL_FIELD_TYPE_FK_1` FOREIGN KEY (`field_type_id`) REFERENCES `common_additional_field_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_additional_data`
--

LOCK TABLES `vp_po_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_po_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_po_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_po_mst` (`po_mst_id`),
  CONSTRAINT `Fk_po_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_additional_field_attachment`
--

LOCK TABLES `vp_po_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_po_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_attachment`
--

DROP TABLE IF EXISTS `vp_po_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_purchase_order_attachment_vp_purchase_order_mst` (`po_mst_id`),
  CONSTRAINT `FK_vp_purchase_order_attachment_vp_purchase_order_mst` FOREIGN KEY (`po_mst_id`) REFERENCES `vp_po_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_attachment`
--

LOCK TABLES `vp_po_attachment` WRITE;
/*!40000 ALTER TABLE `vp_po_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_audit_trail`
--

DROP TABLE IF EXISTS `vp_po_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `header` varchar(500) DEFAULT NULL,
  `comment` varchar(400) DEFAULT NULL,
  `puchase_order_id` int(11) NOT NULL,
  `undo_action` tinyint(1) DEFAULT NULL,
  `automation_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frky1_po_id` (`puchase_order_id`),
  KEY `frky2_status_id` (`status_id`),
  CONSTRAINT `frky1_po_id` FOREIGN KEY (`puchase_order_id`) REFERENCES `vp_po_mst` (`id`),
  CONSTRAINT `frky2_status_id` FOREIGN KEY (`status_id`) REFERENCES `common_audit_trial_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_audit_trail`
--

LOCK TABLES `vp_po_audit_trail` WRITE;
/*!40000 ALTER TABLE `vp_po_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_detail`
--

DROP TABLE IF EXISTS `vp_po_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_mst_id` int(11) NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(200) DEFAULT '',
  `qty` decimal(12,2) DEFAULT NULL,
  `remaining_qty` decimal(12,2) DEFAULT NULL,
  `credit_remaining_qty` decimal(12,2) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `per_unit_discount` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `unbilled_qty` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mst_id` (`purchase_order_mst_id`),
  KEY `uom_id` (`uom_id`),
  KEY `FK_DEPT_ID` (`department_id`),
  CONSTRAINT `FK_DEPT_ID` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `mst_id` FOREIGN KEY (`purchase_order_mst_id`) REFERENCES `vp_po_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uom_id` FOREIGN KEY (`uom_id`) REFERENCES `common_uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_detail`
--

LOCK TABLES `vp_po_detail` WRITE;
/*!40000 ALTER TABLE `vp_po_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_mst`
--

DROP TABLE IF EXISTS `vp_po_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `project_code_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `automation_id` int(11) DEFAULT NULL,
  `automation_rule_id` int(11) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `workflow_level` int(11) DEFAULT NULL,
  `no_of_levels` int(3) DEFAULT NULL,
  `po_number` varchar(100) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `account_gross_amount` decimal(19,2) DEFAULT NULL,
  `item_gross_amount` decimal(19,2) DEFAULT NULL,
  `vendor_approved_date` datetime DEFAULT NULL,
  `gross_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `net_amount` decimal(19,2) DEFAULT NULL,
  `tax_amount` decimal(19,2) NOT NULL,
  `contact_person` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `vendor_approval_status` char(1) DEFAULT NULL,
  `remaining_celing` decimal(19,2) DEFAULT NULL,
  `price_variance` decimal(19,2) DEFAULT NULL,
  `remaining_price_variance` decimal(19,2) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT NULL,
  `approval_group_name` varchar(100) DEFAULT NULL,
  `approval_user_name` varchar(100) DEFAULT NULL,
  `poc_name` varchar(50) DEFAULT NULL,
  `poc_phone` varchar(40) DEFAULT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `receipt_status` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  `export_status` char(1) NOT NULL,
  `approved_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  `credit_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_CODE` (`project_code_id`),
  KEY `FK1_VENDOR_PO` (`vendor_id`),
  KEY `PO_WORKFLOW_FK_1` (`workflow_id`),
  KEY `PO_AUTOMATION_ID_FK_1` (`automation_id`),
  KEY `PO_ATTACHMENT_ID_FK_1` (`attachment_id`),
  KEY `PO_DEPT_ID_FK_1` (`department_id`),
  KEY `PO_RULE_AUTOMATION_FK_1` (`automation_rule_id`),
  CONSTRAINT `FK1_CODE` FOREIGN KEY (`project_code_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `PO_ATTACHMENT_ID_FK_1` FOREIGN KEY (`attachment_id`) REFERENCES `vp_po_attachment` (`id`),
  CONSTRAINT `PO_AUTOMATION_ID_FK_1` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PO_DEPT_ID_FK_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `PO_RULE_AUTOMATION_FK_1` FOREIGN KEY (`automation_rule_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PO_VENDOR_ID_FK_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `PO_WORKFLOW_FK_1` FOREIGN KEY (`workflow_id`) REFERENCES `common_document_workflow_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_mst`
--

LOCK TABLES `vp_po_mst` WRITE;
/*!40000 ALTER TABLE `vp_po_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_number_config`
--

DROP TABLE IF EXISTS `vp_po_number_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_number_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) NOT NULL,
  `department_name` varchar(255) DEFAULT '',
  `prefixes` varchar(50) DEFAULT NULL,
  `suffixes` varchar(50) DEFAULT NULL,
  `separator_symbol_id` int(10) DEFAULT NULL,
  `running_no` varchar(10) DEFAULT NULL,
  `is_override` char(1) DEFAULT NULL,
  `po_no_pattern` varchar(255) DEFAULT NULL,
  `status` char(5) DEFAULT NULL,
  `created_username` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_number_config`
--

LOCK TABLES `vp_po_number_config` WRITE;
/*!40000 ALTER TABLE `vp_po_number_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_number_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_price_variance`
--

DROP TABLE IF EXISTS `vp_po_price_variance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_price_variance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `price_variance` decimal(19,2) DEFAULT NULL,
  `is_percentage` tinyint(1) DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `created_username` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_price_variance`
--

LOCK TABLES `vp_po_price_variance` WRITE;
/*!40000 ALTER TABLE `vp_po_price_variance` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_price_variance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_receipt_account_detail`
--

DROP TABLE IF EXISTS `vp_po_receipt_account_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_receipt_account_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `account_detail_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `account_name` varchar(300) DEFAULT NULL,
  `is_select_account` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_po_receipt_mst_id` (`receipt_mst_id`),
  KEY `FK_po_receipt_account_id` (`account_id`),
  CONSTRAINT `FK_po_receipt_account_id` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `FK_po_receipt_mst_id` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_receipt_account_detail`
--

LOCK TABLES `vp_po_receipt_account_detail` WRITE;
/*!40000 ALTER TABLE `vp_po_receipt_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_account_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_receipt_additional_data`
--

DROP TABLE IF EXISTS `vp_po_receipt_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_receipt_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `receipt_mst_id` int(15) NOT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_grn_additional_data_vp_grn_mst` (`receipt_mst_id`),
  CONSTRAINT `FK_vp_grn_additional_data_vp_grn_mst` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_receipt_additional_data`
--

LOCK TABLES `vp_po_receipt_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_po_receipt_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_receipt_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_po_receipt_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_receipt_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `receipt_mst_id` int(11) NOT NULL,
  `detail_Id` int(11) DEFAULT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_grn_mst` (`receipt_mst_id`),
  CONSTRAINT `Fk_grn_mst` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `RECEIPT_DETAIL_ID_FK_1` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_receipt_additional_field_attachment`
--

LOCK TABLES `vp_po_receipt_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_po_receipt_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_receipt_attachment`
--

DROP TABLE IF EXISTS `vp_po_receipt_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_receipt_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_grn_attachment_vp_grn_mst` (`receipt_mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_receipt_attachment`
--

LOCK TABLES `vp_po_receipt_attachment` WRITE;
/*!40000 ALTER TABLE `vp_po_receipt_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_receipt_detail`
--

DROP TABLE IF EXISTS `vp_po_receipt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_receipt_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_mst_id` int(11) NOT NULL,
  `po_detail_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `received_qty` decimal(12,2) DEFAULT 0.00,
  `remaining_qty` decimal(12,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT 0.00,
  `item_number` varchar(50) DEFAULT NULL,
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `uom` varchar(100) DEFAULT '',
  `unit_price` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vp_grn_mst` (`receipt_mst_id`),
  KEY `PO_RECEIPT_PRODUCT_ID_FK_1` (`product_id`),
  CONSTRAINT `FK__vp_grn_mst` FOREIGN KEY (`receipt_mst_id`) REFERENCES `vp_po_receipt_mst` (`id`),
  CONSTRAINT `PO_RECEIPT_PRODUCT_ID_FK_1` FOREIGN KEY (`product_id`) REFERENCES `common_item_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_receipt_detail`
--

LOCK TABLES `vp_po_receipt_detail` WRITE;
/*!40000 ALTER TABLE `vp_po_receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_po_receipt_mst`
--

DROP TABLE IF EXISTS `vp_po_receipt_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_po_receipt_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `po_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `po_date` date NOT NULL,
  `receipt_date` date DEFAULT NULL,
  `receipt_number` varchar(50) DEFAULT '',
  `received_by` varchar(50) DEFAULT '',
  `notes` varchar(255) DEFAULT '',
  `status` char(1) NOT NULL,
  `export_status` char(1) NOT NULL,
  `total_amount` decimal(19,2) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `update_on` datetime DEFAULT NULL,
  `close_by_po` tinyint(1) DEFAULT 0,
  `automation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_VENDOR_GRN` (`vendor_id`),
  KEY `RECEIPT_ATTACHMENT_ID_FK_1` (`attachment_id`),
  KEY `RECEIPT_PO_ID_FK_1` (`po_id`),
  KEY `AUTO_FK_ID` (`automation_id`),
  CONSTRAINT `AUTO_FK_ID` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`),
  CONSTRAINT `PO_RECEIPT_VENDOR_ID_FK_1` FOREIGN KEY (`vendor_id`) REFERENCES `vp_vendor_mst` (`id`),
  CONSTRAINT `RECEIPT_ATTACHMENT_ID_FK_1` FOREIGN KEY (`attachment_id`) REFERENCES `vp_po_receipt_attachment` (`id`),
  CONSTRAINT `RECEIPT_PO_ID_FK_1` FOREIGN KEY (`po_id`) REFERENCES `vp_po_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_po_receipt_mst`
--

LOCK TABLES `vp_po_receipt_mst` WRITE;
/*!40000 ALTER TABLE `vp_po_receipt_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_po_receipt_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_receipt_mst`
--

DROP TABLE IF EXISTS `vp_receipt_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_receipt_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `merchant` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `employee_name` varchar(200) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `attached` char(1) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `ocr_running_status` char(1) DEFAULT NULL,
  `ocr_running_date` datetime DEFAULT NULL,
  `detection_level` char(1) DEFAULT NULL,
  `updated_status` char(1) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_receipt_mst`
--

LOCK TABLES `vp_receipt_mst` WRITE;
/*!40000 ALTER TABLE `vp_receipt_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_receipt_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_additional_data`
--

DROP TABLE IF EXISTS `vp_recurring_bill_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_additional_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_value` text DEFAULT NULL,
  `field_id` int(15) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `field_type_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `multiple_status` char(1) DEFAULT NULL,
  `template_mst_id` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_additional_data_FKID1` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_additional_data_FKID1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_additional_data`
--

LOCK TABLES `vp_recurring_bill_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_recurring_bill_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `template_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_additional_field_attachment_FKID1` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_additional_field_attachment_FKID1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_additional_field_attachment`
--

LOCK TABLES `vp_recurring_bill_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_attachment`
--

DROP TABLE IF EXISTS `vp_recurring_bill_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vp_recurring_bill_attachment_fkid_1` (`template_mst_id`),
  CONSTRAINT `vp_recurring_bill_attachment_fkid_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_attachment`
--

LOCK TABLES `vp_recurring_bill_attachment` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_expense_cost_distribution`
--

DROP TABLE IF EXISTS `vp_recurring_bill_expense_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_expense_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT '',
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `template_mst_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`) USING BTREE,
  KEY `PROJECT_ID_FK_3` (`project_id`) USING BTREE,
  KEY `DEPT_ID_FK_1` (`department_id`) USING BTREE,
  KEY `vp_recurring_bill_expense_cost_distribution_idfk_5` (`template_mst_id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `common_account_number` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `vp_recurring_bill_expense_cost_distribution_idfk_5` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_expense_cost_distribution`
--

LOCK TABLES `vp_recurring_bill_expense_cost_distribution` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_expense_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_expense_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_failed_record`
--

DROP TABLE IF EXISTS `vp_recurring_bill_failed_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_failed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) DEFAULT NULL,
  `fail_reason` varchar(200) DEFAULT NULL,
  `failed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_failed_record`
--

LOCK TABLES `vp_recurring_bill_failed_record` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_failed_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_failed_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_item_cost_distribution`
--

DROP TABLE IF EXISTS `vp_recurring_bill_item_cost_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_item_cost_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT '',
  `vendor_item_number` varchar(50) DEFAULT NULL,
  `item_name` varchar(300) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `qty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(19,2) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `template_mst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vp_recurring_bill_item_cost_approval_code` (`project_id`),
  KEY `FK_vp_recurring_bill_item_cost_department` (`department_id`),
  KEY `FK_vp_recurring_bill_item_cost_item_mst` (`item_id`),
  KEY `FK_vp_recurring_bill_item_cost_template_mst` (`template_mst_id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_approval_code` FOREIGN KEY (`project_id`) REFERENCES `common_approval_code` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_department` FOREIGN KEY (`department_id`) REFERENCES `common_department` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_item_mst` FOREIGN KEY (`item_id`) REFERENCES `common_item_mst` (`id`),
  CONSTRAINT `FK_vp_recurring_bill_item_cost_template_mst` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_item_cost_distribution`
--

LOCK TABLES `vp_recurring_bill_item_cost_distribution` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_item_cost_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_item_cost_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_bill_template_mst`
--

DROP TABLE IF EXISTS `vp_recurring_bill_template_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_bill_template_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `schedule_name` varchar(100) NOT NULL,
  `interval_value` varchar(50) NOT NULL,
  `custom_Interval_value` varchar(50) DEFAULT NULL,
  `recurring_month` varchar(50) DEFAULT '',
  `recurring_day` varchar(50) DEFAULT '',
  `recurring_day_of_week` varchar(50) DEFAULT NULL,
  `generation_frequent_status` varchar(50) DEFAULT NULL,
  `generation_frequent` int(11) DEFAULT NULL,
  `recurring_start_date` date DEFAULT NULL,
  `recurring_end_date` date DEFAULT NULL,
  `occurrence_frequent_status` varchar(50) DEFAULT NULL,
  `occurrence_frequent` int(11) DEFAULT NULL,
  `last_generation_date` date DEFAULT NULL,
  `no_of_generation` int(11) NOT NULL DEFAULT 0,
  `save_as_approved` tinyint(1) NOT NULL DEFAULT 0,
  `vendor_id` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `net_days_due` int(3) DEFAULT NULL,
  `discount_days_due` int(3) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `bill_amount` decimal(19,2) DEFAULT NULL,
  `discount_amount` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `additional_notes` varchar(500) DEFAULT NULL,
  `prefixes` varchar(50) DEFAULT NULL,
  `suffixes` varchar(50) DEFAULT NULL,
  `separator_symbol_id` int(10) DEFAULT NULL,
  `running_no` int(10) DEFAULT NULL,
  `bill_no_pattern` varchar(200) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_by_name` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_bill_template_mst`
--

LOCK TABLES `vp_recurring_bill_template_mst` WRITE;
/*!40000 ALTER TABLE `vp_recurring_bill_template_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_bill_template_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_recurring_template_ad_hoc_workflow_detail_config`
--

DROP TABLE IF EXISTS `vp_recurring_template_ad_hoc_workflow_detail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_recurring_template_ad_hoc_workflow_detail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_mst_id` int(11) NOT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_user` varchar(100) DEFAULT '',
  `approval_order` int(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_recurring_template_ad_hoc_workflow_detail_config_idfk_1` (`template_mst_id`),
  CONSTRAINT `FK_recurring_template_ad_hoc_workflow_detail_config_idfk_1` FOREIGN KEY (`template_mst_id`) REFERENCES `vp_recurring_bill_template_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_recurring_template_ad_hoc_workflow_detail_config`
--

LOCK TABLES `vp_recurring_template_ad_hoc_workflow_detail_config` WRITE;
/*!40000 ALTER TABLE `vp_recurring_template_ad_hoc_workflow_detail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_recurring_template_ad_hoc_workflow_detail_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_address`
--

DROP TABLE IF EXISTS `vp_vendor_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(300) DEFAULT NULL,
  `address_line_2` varchar(300) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `city` varchar(200) DEFAULT '',
  `country` varchar(200) DEFAULT '',
  `address_state` varchar(200) DEFAULT '',
  `vendor_mst_id` int(11) DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FKp54ae4xbmwuo3fj2v0mqr6ify` (`city`) USING BTREE,
  KEY `FK9q1h8wlehll8abof3gy0m2rr6` (`country`) USING BTREE,
  KEY `FK6spbmlk298owe39onhokfa67x` (`address_state`) USING BTREE,
  KEY `FK5539bpkljsmqi7ww9wq6w3v76` (`vendor_mst_id`) USING BTREE,
  KEY `FK933hd6ya9jh5wnur9s9l16l9w` (`zipcode`) USING BTREE,
  CONSTRAINT `VENDOR_MST_FK_1` FOREIGN KEY (`vendor_mst_id`) REFERENCES `vp_vendor_mst` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_address`
--

LOCK TABLES `vp_vendor_address` WRITE;
/*!40000 ALTER TABLE `vp_vendor_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_classification`
--

DROP TABLE IF EXISTS `vp_vendor_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `classification_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_classification`
--

LOCK TABLES `vp_vendor_classification` WRITE;
/*!40000 ALTER TABLE `vp_vendor_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_classification_attachment`
--

DROP TABLE IF EXISTS `vp_vendor_classification_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_classification_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(500) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_by` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_classification_attachment`
--

LOCK TABLES `vp_vendor_classification_attachment` WRITE;
/*!40000 ALTER TABLE `vp_vendor_classification_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_classification_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_field_config`
--

DROP TABLE IF EXISTS `vp_vendor_field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `show_enable` tinyint(1) NOT NULL,
  `all_config` char(1) DEFAULT NULL,
  `status` char(1) NOT NULL,
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
-- Dumping data for table `vp_vendor_field_config`
--

LOCK TABLES `vp_vendor_field_config` WRITE;
/*!40000 ALTER TABLE `vp_vendor_field_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_field_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_import_issue`
--

DROP TABLE IF EXISTS `vp_vendor_import_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_import_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_mst_id` int(11) NOT NULL,
  `record` text DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `line_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMPORT_MST3` (`import_mst_id`),
  CONSTRAINT `FK_IMPORT_MST3` FOREIGN KEY (`import_mst_id`) REFERENCES `vp_vendor_import_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_import_issue`
--

LOCK TABLES `vp_vendor_import_issue` WRITE;
/*!40000 ALTER TABLE `vp_vendor_import_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_import_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_import_mst`
--

DROP TABLE IF EXISTS `vp_vendor_import_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_import_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `total_records` int(11) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `failed` int(11) DEFAULT NULL,
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
-- Dumping data for table `vp_vendor_import_mst`
--

LOCK TABLES `vp_vendor_import_mst` WRITE;
/*!40000 ALTER TABLE `vp_vendor_import_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_import_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_invitation`
--

DROP TABLE IF EXISTS `vp_vendor_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `accepted_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_invitation`
--

LOCK TABLES `vp_vendor_invitation` WRITE;
/*!40000 ALTER TABLE `vp_vendor_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_mst`
--

DROP TABLE IF EXISTS `vp_vendor_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `vendor_code` varchar(50) DEFAULT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `cc_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT '',
  `contact_person` varchar(150) DEFAULT NULL,
  `emp_id_no` varchar(20) DEFAULT '',
  `exempt_payee_code` varchar(40) DEFAULT '',
  `fatca_reporting_code` varchar(40) DEFAULT '',
  `fax` varchar(50) DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `social_sec_no` varchar(15) DEFAULT '',
  `tax_class_otherdetail` varchar(300) DEFAULT '',
  `tax_classification` varchar(3) DEFAULT '',
  `tax_code` varchar(25) DEFAULT '',
  `w9_form_url` varchar(200) DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `sic_code` int(11) DEFAULT NULL,
  `naics_code` int(11) DEFAULT NULL,
  `business_description` text CHARACTER SET utf8 DEFAULT NULL,
  `web_url` varchar(300) CHARACTER SET utf8 DEFAULT '',
  `requested_tenant_id` varchar(50) DEFAULT '',
  `invitation_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `confidential` tinyint(1) DEFAULT 0,
  `created_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `update_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `is_diverse_supplier` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_mst`
--

LOCK TABLES `vp_vendor_mst` WRITE;
/*!40000 ALTER TABLE `vp_vendor_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_mst_additional_data`
--

DROP TABLE IF EXISTS `vp_vendor_mst_additional_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_mst_additional_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int(11) NOT NULL,
  `field_value` text DEFAULT NULL,
  `field_id` int(15) unsigned NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_type_id` int(11) unsigned DEFAULT NULL,
  `section_id` int(11) unsigned NOT NULL,
  `display_order` int(11) unsigned NOT NULL,
  `multiple_status` char(1) DEFAULT 'I',
  `detail_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_mst_additional_data`
--

LOCK TABLES `vp_vendor_mst_additional_data` WRITE;
/*!40000 ALTER TABLE `vp_vendor_mst_additional_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst_additional_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_mst_additional_field_attachment`
--

DROP TABLE IF EXISTS `vp_vendor_mst_additional_field_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_mst_additional_field_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `vendor_mst_id` int(11) NOT NULL,
  `attachment_url` varchar(200) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT '',
  `delete_on` datetime DEFAULT NULL,
  `field_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `detail_Id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_mst_additional_field_attachment`
--

LOCK TABLES `vp_vendor_mst_additional_field_attachment` WRITE;
/*!40000 ALTER TABLE `vp_vendor_mst_additional_field_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_mst_additional_field_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_w9_attachment`
--

DROP TABLE IF EXISTS `vp_vendor_w9_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_w9_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_mst_id` int(11) DEFAULT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(500) NOT NULL,
  `attachment_url` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `delete_by` varchar(100) DEFAULT NULL,
  `delete_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_w9_attachment`
--

LOCK TABLES `vp_vendor_w9_attachment` WRITE;
/*!40000 ALTER TABLE `vp_vendor_w9_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vp_vendor_w9_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vp_vendor_w9_parameter`
--

DROP TABLE IF EXISTS `vp_vendor_w9_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vp_vendor_w9_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `property_name` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vp_vendor_w9_parameter`
--

LOCK TABLES `vp_vendor_w9_parameter` WRITE;
/*!40000 ALTER TABLE `vp_vendor_w9_parameter` DISABLE KEYS */;
INSERT INTO `vp_vendor_w9_parameter` VALUES (1,'NAME_FIELD','topmostSubform[0].Page1[0].f1_1[0]','A'),(2,'BUSINESS_NAME_FIELD','topmostSubform[0].Page1[0].f1_2[0]','A'),(3,'EXEMPT_PAYEE_CODE','topmostSubform[0].Page1[0].Exemptions[0].f1_5[0]','A'),(4,'FACTA_CODE','topmostSubform[0].Page1[0].Exemptions[0].f1_6[0]','A'),(5,'TAX_TYPE_INDIVIDUAL','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]','A'),(6,'TAX_TYPE_C_CORPORATION','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[1]','A'),(7,'TAX_TYPE_S_CORPORATION','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[2]','A'),(8,'TAX_TYPE_S_PARTNERSHIP','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[3]','A'),(9,'TAX_TYPE_TRUST_ESTATE','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[4]','A'),(10,'TAX_TYPE_OTHER','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[6]','A'),(11,'TAX_TYPE_OTHER_DESC','topmostSubform[0].Page1[0].FederalClassification[0].f1_4[0]','A'),(12,'TAX_TYPE_LIMITED_LIABILITY','topmostSubform[0].Page1[0].FederalClassification[0].c1_1[5]','A'),(13,'TAX_TYPE_LIMITED_LIABILITY_CODE','topmostSubform[0].Page1[0].FederalClassification[0].f1_3[0]','A'),(14,'ADDRESS_PART_1','topmostSubform[0].Page1[0].Address[0].f1_7[0]','A'),(15,'ADDRESS_PART_2','topmostSubform[0].Page1[0].Address[0].f1_8[0]','A'),(16,'ADDRESS_OTHER','topmostSubform[0].Page1[0].f1_9[0]','A'),(17,'SOCIAL_SECURITY_NO_PART_1','topmostSubform[0].Page1[0].SSN[0].f1_11[0]','A'),(18,'SOCIAL_SECURITY_NO_PART_2','topmostSubform[0].Page1[0].SSN[0].f1_12[0]','A'),(19,'SOCIAL_SECURITY_NO_PART_3','topmostSubform[0].Page1[0].SSN[0].f1_13[0]','A'),(20,'EMPLOYEE_ID_NO_PART_1','topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]','A'),(21,'EMPLOYEE_ID_NO_PART_2','topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]','A');
/*!40000 ALTER TABLE `vp_vendor_w9_parameter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 10:58:54
