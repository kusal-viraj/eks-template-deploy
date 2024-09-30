DROP TABLE IF EXISTS `common_product_type`;
CREATE TABLE IF NOT EXISTS `common_product_type` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(20) NOT NULL,
 `description` varchar(200) NOT NULL,
 `status` char(1) NOT NULL,
 `icon` varchar(50) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `common_product_category`;
CREATE TABLE IF NOT EXISTS `common_product_category` (
 `id` int(15) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
 `status` char(1) NOT NULL,
 `created_by` varchar(50) NOT NULL,
 `created_on` date NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `common_product_mst`;
CREATE TABLE IF NOT EXISTS `common_product_mst` (
 `id` int(15) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
 `sku` varchar(50) DEFAULT NULL,
 `taxable` tinyint(1) DEFAULT NULL,
 `amount` decimal(19,2) NOT NULL,
 `status` char(1) NOT NULL,
 `description` varchar(255) DEFAULT NULL,
 `income_account` varchar(50) DEFAULT NULL,
 `expense_account` varchar(50) DEFAULT NULL,
 `created_by` varchar(50) NOT NULL,
 `created_on` date NOT NULL,
 `product_type_id` int(11) NOT NULL,
 `product_category_id` int(11) DEFAULT NULL,
 `vendor_id` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK__common_product_type` (`product_type_id`),
 CONSTRAINT `FK__common_product_type` FOREIGN KEY (`product_type_id`)
REFERENCES `common_product_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `common_product_attachment`;
CREATE TABLE IF NOT EXISTS `common_product_attachment` (
 `id` int(15) NOT NULL AUTO_INCREMENT,
 `image_data` blob NOT NULL,
 `file_name` varchar(200) NOT NULL,
 `file_type` varchar(50) NOT NULL,
 `product_mst_id` int(15) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_common_product_attachment_common_product_mst`
(`product_mst_id`),
 CONSTRAINT `FK_common_product_attachment_common_product_mst` FOREIGN
KEY (`product_mst_id`) REFERENCES `common_product_mst` (`id`) ON
UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `common_product_sync_mst`;
CREATE TABLE IF NOT EXISTS `common_product_sync_mst` (
 `id` int(15) NOT NULL AUTO_INCREMENT,
 `system_id` int(11) NOT NULL,
 `recode_status` char(1) NOT NULL,
 `sync_date_time` datetime DEFAULT NULL,
 `sync_status` char(1) DEFAULT NULL,
 `attemps` int(2) DEFAULT NULL,
 `executed_by` varchar(50) DEFAULT NULL,
 `executed_on` date DEFAULT NULL,
 `insert_by` varchar(50) NOT NULL,
 `insert_on` date NOT NULL,
 `product_mst_id` int(15) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_common_product_sync_mst_common_product_mst`
(`product_mst_id`),
 CONSTRAINT `FK_common_product_sync_mst_common_product_mst` FOREIGN
KEY (`product_mst_id`) REFERENCES `common_product_mst` (`id`) ON
UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vp_invoice_item_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_invoice_item_cost_distribution` (
 `id` int(15) NOT NULL AUTO_INCREMENT,
 `item_id` int(15) NOT NULL,
 `description` varchar(100) DEFAULT NULL,
 `qty` int(10) NOT NULL,
 `rate` decimal(19,2) NOT NULL,
 `amount` decimal(19,2) NOT NULL,
 `billable` tinyint(1) NOT NULL,
 `tax` tinyint(1) NOT NULL,
 `project_id` int(15) DEFAULT NULL,
 `po_id` int(15) DEFAULT NULL,
 `invoice_id` int(15) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_vp_invoice_item_cost_distribution_common_product_mst` (`item_id`),
 KEY `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice` (`invoice_id`),
 CONSTRAINT `FK_vp_invoice_item_cost_distribution_common_product_mst`
FOREIGN KEY (`item_id`) REFERENCES `common_product_mst` (`id`),
 CONSTRAINT `FK_vp_invoice_item_cost_distribution_vp_vendor_invoice`
FOREIGN KEY (`invoice_id`) REFERENCES `vp_vendor_invoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `common_account_type`;
CREATE TABLE IF NOT EXISTS `common_account_type` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(200) NOT NULL DEFAULT '',
 `short_name` varchar(200) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
INSERT INTO `common_account_type` (`id`, `name`, `short_name`) VALUES
(1, 'Accounts receivable (A/R)', 'Accounts receivable'),
(2, 'Other Current Assets', 'Other Current Asset'),
(3, 'Bank', 'Bank'),
(4, 'Fixed Assets', 'Fixed Asset'),
(5, 'Other Assets', 'Other Asset'),
(6, 'Accounts payable (A/P)', 'Accounts payable'),
(7, 'Credit Card', 'Credit Card'),
(8, 'Other Current Liabilities', 'Other Current Liability'),
(9, 'Long Term Liabilities', 'Long Term Liability'),
(10, 'Equity', 'Equity'),
(11, 'Income', 'Income'),
(12, 'Other Income', 'Other Income'),
(13, 'Cost of Goods Sold', 'Cost of Goods Sold'),
(14, 'Expenses', 'Expense'),
(15, 'Other Expense', 'Other Expense');

DROP TABLE IF EXISTS `common_account_detail_type`;
CREATE TABLE IF NOT EXISTS `common_account_detail_type` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `account_type` int(11) NOT NULL,
 `name` varchar(200) NOT NULL,
 `short_code` varchar(200) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_ACCOUNT_TYPE` (`account_type`),
 CONSTRAINT `FK_ACCOUNT_TYPE` FOREIGN KEY (`account_type`) REFERENCES
`common_account_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
INSERT INTO `common_account_detail_type` (`id`, `account_type`,
`name`, `short_code`) VALUES
(1, 1, 'Accounts Receivable (A/R)', 'AccountsReceivable'),
(2, 2, 'Allowance for Bad Debts', 'AllowanceForBadDebts'),
(3, 2, 'Development Costs', 'DevelopmentCosts'),
(4, 2, 'Employee Cash Advances', 'EmployeeCashAdvances'),
(5, 2, 'Inventory', 'Inventory'),
(6, 2, 'Investment - Mortgage/Real Estate Loans', 'Investment_MortgageRealEstateLoans'),
(7, 2, 'Investment - Tax-Exempt Securities', 'Investment_TaxExemptSecurities'),
(8, 2, 'Investment - U.S. Government Obligations', 'Investment_USGovernmentObligations'),
(9, 2, 'Investments - Other', 'Investments_Other'),
(10, 2, 'Loans To Officers', 'LoansToOfficers'),
(11, 2, 'Loans to Others', 'LoansToOthers'),
(12, 2, 'Loans to Stockholders', 'LoansToStockholders'),
(13, 2, 'Other Current Assets', 'OtherCurrentAssets'),
(14, 2, 'Prepaid Expenses', 'PrepaidExpenses'),
(15, 2, 'Retainage', 'Retainage'),
(16, 2, 'Undeposited Funds', 'UndepositedFunds'),
(17, 3, 'Cash on hand', 'CashOnHand'),
(18, 3, 'Checking', 'Checking'),
(19, 3, 'Money Market', 'MoneyMarket'),
(20, 3, 'Rents Held in Trust', 'RentsHeldInTrust'),
(21, 3, 'Savings', 'Savings'),
(22, 3, 'Trust account', 'TrustAccount'),
(23, 4, 'Accumulated Amortization', 'AccumulatedAmortization'),
(24, 4, 'Accumulated Depletion', 'AccumulatedDepletion'),
(25, 4, 'Accumulated Depreciation', 'AccumulatedDepreciation'),
(26, 4, 'Buildings', 'Buildings'),
(27, 4, 'Depletable Assets', 'DepletableAssets'),
(28, 4, 'Fixed Asset Computers', 'FixedAssetComputers'),
(29, 4, 'Fixed Asset Copiers', 'FixedAssetCopiers'),
(30, 4, 'Fixed Asset Furniture', 'FixedAssetFurniture'),
(31, 4, 'Fixed Asset Other Tools Equipment', 'FixedAssetOtherToolsEquipment'),
(32, 4, 'Fixed Asset Phone', 'FixedAssetPhone'),
(33, 4, 'Fixed Asset Photo Video', 'FixedAssetPhotoVideo'),
(34, 4, 'Fixed Asset Software', 'FixedAssetSoftware'),
(35, 4, 'Furniture & Fixtures', 'FurnitureAndFixtures'),
(36, 4, 'Intangible Assets', 'IntangibleAssets'),
(37, 4, 'Land', 'Land'),
(38, 4, 'Leasehold Improvements', 'LeaseholdImprovements'),
(39, 4, 'Machinery & Equipment', 'MachineryAndEquipment'),
(40, 4, 'Other fixed assets', 'OtherFixedAssets'),
(41, 4, 'Vehicles', 'Vehicles'),
(42, 5, 'Accumulated Amortization of Other Assets', 'AccumulatedAmortizationOfOtherAssets'),
(43, 5, 'Goodwill', 'Goodwill'),
(44, 5, 'Lease Buyout', 'LeaseBuyout'),
(45, 5, 'Licenses', 'Licenses'),
(46, 5, 'Organizational Costs', 'OrganizationalCosts'),
(47, 5, 'Other Long-term Assets', 'OtherLong_termAssets'),
(48, 5, 'Security Deposits', 'SecurityDeposits'),
(49, 6, 'Accounts Payable (A/P)', 'AccountsPayable'),
(50, 7, 'Credit Card', 'CreditCard'),
(51, 8, 'Federal Income Tax Payable', 'FederalIncomeTaxPayable'),
(52, 8, 'Insurance Payable', 'InsurancePayable'),
(53, 8, 'Line of Credit', 'LineOfCredit'),
(54, 8, 'Loan Payable', 'LoanPayable'),
(55, 8, 'Other Current Liabilities', 'OtherCurrentLiabilities'),
(56, 8, 'Payroll Clearing', 'PayrollClearing'),
(57, 8, 'Payroll Tax Payable', 'PayrollTaxPayable'),
(58, 8, 'Prepaid Expenses Payable', 'PrepaidExpensesPayable'),
(59, 8, 'Rents in trust - Liability', 'RentsInTrust_Liability'),
(60, 8, 'Sales Tax Payable', 'SalesTaxPayable'),
(61, 8, 'State/Local Income Tax Payable', 'StateLocalIncomeTaxPayable'),
(62, 8, 'Trust Accounts - Liabilities', 'Trust Accounts_Liabilities'),
(63, 8, 'Undistributed Tips', 'UndistributedTips'),
(64, 9, 'Notes Payable', 'NotesPayable'),
(65, 9, 'Other Long Term Liabilities', 'OtherLongTermLiabilities'),
(66, 9, 'Shareholder Notes Payable', 'ShareholderNotesPayable'),
(67, 10, 'Accumulated Adjustment', 'AccumulatedAdjustment'),
(68, 10, 'Common Stock', 'CommonStock'),
(69, 10, 'Estimated Taxes', 'EstimatedTaxes'),
(70, 10, 'Healthcare', 'Healthcare'),
(71, 10, 'Opening Balance Equity', 'OpeningBalanceEquity'),
(72, 10, 'Owner\'s Equity', 'OwnersEquity'),
(73, 10, 'Paid-In Capital or Surplus', 'Paid_InCapitalOrSurplus'),
(74, 10, 'Partner Contributions', 'PartnerContributions'),
(75, 10, 'Partner\'s Equity', 'PartnersEquity'),
(76, 10, 'Personal Expense', 'PersonalExpense'),
(77, 10, 'Personal Income', 'PersonalIncome'),
(78, 10, 'Preferred Stock', 'PreferredStock'),
(79, 10, 'Retained Earnings', 'RetainedEarnings'),
(80, 10, 'Treasury Stock', 'TreasuryStock'),
(81, 11, 'Discounts/Refunds Given', 'DiscountsRefundsGiven'),
(82, 11, 'Non-Profit Income', 'Non_ProfitIncome'),
(83, 11, 'Other Primary Income', 'OtherPrimaryIncome'),
(84, 11, 'Sales of Product Income', 'SalesOfProductIncome'),
(85, 11, 'Service/Fee Income', 'ServiceFeeIncome'),
(86, 11, 'Unapplied Cash Payment Income', 'UnappliedCashPaymentIncome'),
(87, 12, 'Dividend Income', 'DividendIncome'),
(88, 12, 'Interest Earned', 'InterestEarned'),
(89, 12, 'Other Investment Income', 'OtherInvestmentIncome'),
(90, 12, 'Other Miscellaneous Income', 'OtherMiscellaneousIncome'),
(91, 12, 'Tax-Exempt Interest', 'Tax_ExemptInterest'),
(92, 13, 'Cost of labor - COS', 'CostOfLaborCos'),
(93, 13, 'Equipment Rental - COS', 'EquipmentRental_COS'),
(94, 13, 'Other Costs of Services - COS', 'OtherCostsOfServiceCos'),
(95, 13, 'Shipping, Freight & Delivery - COS', 'ShippingFreightDeliveryCos'),
(96, 13, 'Supplies & Materials - COGS', 'SuppliesMaterialsCogs'),
(97, 14, 'Advertising/Promotional', 'AdvertisingPromotional'),
(98, 14, 'Auto', 'Auto'),
(99, 14, 'Bad Debts', 'BadDebts'),
(100, 14, 'Bank Charges', 'BankCharges'),
(101, 14, 'Charitable Contributions', 'CharitableContributions'),
(102, 14, 'Cost of Labor', 'CostOfLabor'),
(103, 14, 'Dues & subscriptions', 'DuesSubscriptions'),
(104, 14, 'Entertainment', 'Entertainment'),
(105, 14, 'Entertainment Meals', 'EntertainmentMeals'),
(106, 14, 'Equipment Rental', 'EquipmentRental'),
(107, 14, 'Finance costs', 'FinanceCosts'),
(108, 14, 'Insurance', 'Insurance'),
(109, 14, 'Interest Paid', 'InterestPaid'),
(110, 14, 'Legal & Professional Fees', 'LegalProfessionalFees'),
(111, 14, 'Office/General Administrative Expenses', 'OfficeGeneralAdministrativeExpenses'),
(112, 14, 'Other Business Expenses', 'OtherBusinessExpenses'),
(113, 14, 'Other Miscellaneous Service Cost', 'OtherMiscellaneousServiceCost'),
(114, 14, 'Payroll Expenses', 'PayrollExpenses'),
(115, 14, 'Promotional Meals', 'PromotionalMeals'),
(116, 14, 'Rent or Lease of Buildings', 'RentOrLeaseOfBuildings'),
(117, 14, 'Repair & Maintenance', 'RepairMaintenance'),
(118, 14, 'Shipping, Freight & Delivery', 'ShippingFreightAndDelivery'),
(119, 14, 'Supplies & Materials', 'SuppliesMaterials'),
(120, 14, 'Taxes Paid', 'TaxesPaid'),
(121, 14, 'Travel', 'Travel'),
(122, 14, 'Travel Meals', 'TravelMeals'),
(123, 14, 'Unapplied Cash Bill Payment Expense', 'UnappliedCashBillPaymentExpense'),
(124, 14, 'Utilities', 'Utilities'),
(125, 15, 'Amortization', 'Amortization'),
(126, 15, 'Depreciation', 'Depreciation'),
(127, 15, 'Exchange Gain or Loss', 'ExchangeGainOrLoss'),
(128, 15, 'Gas And Fuel', 'GasAndFuel'),
(129, 15, 'Home Office', 'HomeOffice'),
(130, 15, 'Homeowner Rental Insurance', 'HomeownerRentalInsurance'),
(131, 15, 'Mortgage Interest Home Office', 'MortgageInterestHomeOffice'),
(132, 15, 'Other Home Office Expenses', 'OtherHomeOfficeExpenses'),
(133, 15, 'Other Miscellaneous Expense', 'OtherMiscellaneousExpense'),
(134, 15, 'Other Vehicle Expenses', 'OtherVehicleExpenses'),
(135, 15, 'Parking and Tolls', 'ParkingAndTolls'),
(136, 15, 'Penalties & Settlements', 'PenaltiesSettlements'),
(137, 15, 'Rent and Lease Home Office', 'RentAndLeaseHomeOffice'),
(138, 15, 'Repairs and Maintenance Home Office', 'RepairsAndMaintenanceHomeOffice'),
(139, 15, 'Utilities Home Office', 'UtilitiesHomeOffice'),
(140, 15, 'Vehicle', 'Vehicle'),
(141, 15, 'Vehicle Insurance', 'VehicleInsurance'),
(142, 15, 'Vehicle Lease', 'VehicleLease'),
(143, 15, 'Vehicle Loan', 'VehicleLoan'),
(144, 15, 'Vehicle Loan Interest', 'VehicleLoan Interest'),
(145, 15, 'Vehicle Registration', 'VehicleRegistration'),
(146, 15, 'Vehicle Repairs', 'VehicleRepairs'),
(147, 15, 'Wash and Road Services', 'WashAndRoadServices'),
(148, 8, 'Global Tax Payable', 'GlobalTaxPayable');

DROP TABLE IF EXISTS `common_chart_of_account`;
CREATE TABLE IF NOT EXISTS `common_chart_of_account` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `account_type` int(11) NOT NULL,
 `account_detail_type` int(11) NOT NULL,
 `name` varchar(200) NOT NULL,
 `description` varchar(500) DEFAULT NULL,
 `parent_account` int(11) DEFAULT NULL,
 `as_at_date` date DEFAULT NULL,
 `as_at_date_balance` decimal(20,2) DEFAULT NULL,
 `current_balance` decimal(20,2) DEFAULT NULL,
 `current_balance_with_sub_accounts` decimal(20,2) DEFAULT NULL,
 `status` char(1) NOT NULL,
 `classification` varchar(100) DEFAULT NULL,
 `created_by` varchar(30) NOT NULL,
 `created_date` datetime NOT NULL,
 `updated_by` varchar(30) DEFAULT NULL,
 `updated_date` datetime DEFAULT NULL,
 `qb_id` int(11) DEFAULT NULL,
 `bc_id` int(11) DEFAULT NULL,
 `qb_parent_id` int(11) DEFAULT NULL,
 `bc_parent_id` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_ACCOUNT_TYPE_1` (`account_type`),
 KEY `FK_ACCOUNT_DETAIL_TYPE` (`account_detail_type`),
 CONSTRAINT `FK_ACCOUNT_DETAIL_TYPE` FOREIGN KEY
(`account_detail_type`) REFERENCES `common_account_detail_type`
(`id`),
 CONSTRAINT `FK_ACCOUNT_TYPE_1` FOREIGN KEY (`account_type`)
REFERENCES `common_account_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `common_chart_of_account_sync`;
CREATE TABLE IF NOT EXISTS `common_chart_of_account_sync` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `account_id` int(11) NOT NULL,
 `sync_id` int(11) DEFAULT NULL,
 `system_id` int(11) NOT NULL,
 `recode_status` char(2) NOT NULL,
 `sync_date_time` datetime DEFAULT NULL,
 `sync_status` char(1) NOT NULL,
 `attempts` int(2) DEFAULT 0,
 `executed_by` varchar(50) DEFAULT NULL,
 `executed_on` date DEFAULT NULL,
 `insert_by` varchar(50) NOT NULL,
 `insert_on` date NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_vp_vendor_sync_mst_vp_vendor_mst` (`account_id`),
 CONSTRAINT `FK_ACCOUNT_ID` FOREIGN KEY (`account_id`) REFERENCES
`common_chart_of_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`,
`url`, `type`, `super_type`, `super_type_2`, `department`,
`date_created`, `created_user`, `menu_order`, `display_icon`,
`short_name`, `detail_text`, `status`, `portal_menu`) VALUES (51,
'Item Management', 'Item Management', 'card text-white bg-info',
'/home/item-catalogue/management/item-management', 'S', 5, NULL,
'Admin', '2020-09-28 14:38:35', 'System', 309, 'fa fa-cube', 'Item',
'Management', 'A', 0);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (203, 51, 1, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (204, 51, 2, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (205, 51, 3, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (206, 51, 4, '2020-09-16 12:00:00', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (207, 51, 5, '2020-09-16 12:00:00', 'System');

INSERT INTO `umm_menu` (`id`, `name`, `display_text`, `menu_style`,
`url`, `type`, `super_type`, `super_type_2`, `department`,
`date_created`, `created_user`, `menu_order`, `display_icon`,
`short_name`, `detail_text`, `status`, `portal_menu`) VALUES (52,
'Account Management', 'Account Management', 'card text-white bg-info',
'/home/account/management/account-management', 'S', 5, NULL, 'Admin',
'2020-09-28 18:20:40', 'System', 209, 'fa fa-usd', 'Account',
'Management', 'A', 0);

INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (208, 52, 1, '2020-09-17 19:40:52', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (209, 52, 2, '2020-09-17 19:41:24', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (210, 52, 4, '2020-09-28 18:26:43', 'System');
INSERT INTO `umm_menu_privilage` (`id`, `menu_id`, `prililage_id`,
`data_created`, `user_inserted`) VALUES (211, 52, 5, '2020-09-17 19:43:07', 'System');

DROP TABLE IF EXISTS `vp_invoice_expense_cost_distribution`;
CREATE TABLE IF NOT EXISTS `vp_invoice_expense_cost_distribution` (
 `id` int(15) NOT NULL AUTO_INCREMENT,
 `account_id` int(15) NOT NULL,
 `description` varchar(100) DEFAULT NULL,
 `amount` decimal(19,2) NOT NULL,
 `billable` tinyint(1) NOT NULL,
 `tax` tinyint(1) NOT NULL,
 `project_id` int(15) DEFAULT NULL,
 `invoice_id` int(15) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` (`invoice_id`),
 KEY `FK_vp_vendor_item_cost_distribution_common_chart_of_account` (`account_id`),
 CONSTRAINT `FK_vp_vendor_item_cost_distribution_common_chart_of_account` FOREIGN KEY (`account_id`) REFERENCES `common_chart_of_account` (`id`) ON UPDATE NO ACTION,
 CONSTRAINT `FK_vp_vendor_item_cost_distribution_vp_vendor_mst` FOREIGN KEY (`invoice_id`) REFERENCES `vp_vendor_mst` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;