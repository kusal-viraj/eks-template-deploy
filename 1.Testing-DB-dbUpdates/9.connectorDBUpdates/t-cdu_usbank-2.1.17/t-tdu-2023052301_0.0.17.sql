CREATE TABLE `card_declined_auth_code`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `reason` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `card_declined_auth_code` VALUES (1, '0001', 'Caution Account', 'The account the customer used for the attempted transaction is flagged as a fraud/caution account.');
INSERT INTO `card_declined_auth_code` VALUES (2, '0002', 'Closed Account', 'The account the customer used for the attempted transaction is a closed account.');
INSERT INTO `card_declined_auth_code` VALUES (3, '0003', 'Arrest', 'The account the customer used for the attempted transaction is a confirmed fraud account with a credit rating set to fraud.');
INSERT INTO `card_declined_auth_code` VALUES (4, '0004', 'Pick-Up - Fraud Code F1', 'The account the customer used for the attempted transaction has an F1 fraud status due to the plastic card being flagged as lost, stolen or never received by the cardholder. This decline reason may also display for an account with a F1 fraud status due to fraudulent activity on the account despite the cardholder possessing the card.');
INSERT INTO `card_declined_auth_code` VALUES (5, '0005', 'Transferred Account', 'The account the customer used for the attempted transaction has been reported as lost or stolen, and the balance transferred to a new account, but the attempted transaction used the old account.');
INSERT INTO `card_declined_auth_code` VALUES (6, '0006', 'Lost Card - Pending Transfer', 'The account the customer used for the transaction is a reported lost or stolen card with a balance that the customer has not yet transferred to a new card.');
INSERT INTO `card_declined_auth_code` VALUES (7, '0007', 'Card Expired', 'The account the customer used for the attempted transaction is an expired card.');
INSERT INTO `card_declined_auth_code` VALUES (8, '0008', 'Charge-off Account', 'The account the customer used for the attempted transaction is an account that has been charged-off.');
INSERT INTO `card_declined_auth_code` VALUES (9, '0015', 'Account Coded V9', 'The account the customer used for the attempted transaction is a closed account.');
INSERT INTO `card_declined_auth_code` VALUES (10, '0016', 'Account Coded M9', 'The account the customer used for the attempted transaction is a suspended account.');
INSERT INTO `card_declined_auth_code` VALUES (11, '0031', 'Account Coded (Credit Rating)', 'The account the customer used for the attempted transaction has a negative credit rating.');
INSERT INTO `card_declined_auth_code` VALUES (12, '0038', 'Obtain Positive ID', 'The account the customer used for this transaction has a fraud credit rating because of suspicious activity or potential fraud on the account.');
INSERT INTO `card_declined_auth_code` VALUES (13, '0048', 'Not Enough Available Money', 'The attempted transaction would send the account over the account\'s available credit limit.');
INSERT INTO `card_declined_auth_code` VALUES (14, '0084', 'Over Limit', 'The account the customer used for the attempted transaction is already over its allotted limit.');
INSERT INTO `card_declined_auth_code` VALUES (15, '0091', 'Single Purchase Limit Exceeded', 'The attempted transaction exceeds the account\'s single purchase limit.');
INSERT INTO `card_declined_auth_code` VALUES (16, '0092', 'Nmbr Monthly Transactions Exceeded', 'The attempted transaction would have exceeded the account\'s allowed number of monthly transactions.');
INSERT INTO `card_declined_auth_code` VALUES (17, '0093', 'Nbr Daily Transaction Exceeded', 'The attempted transaction would have exceeded the account\'s allowed number of daily transactions.');
INSERT INTO `card_declined_auth_code` VALUES (18, '0103', 'Invalid Card/Account', 'The card and/or account the customer used for the attempted transaction is not a valid card and/or account.');
INSERT INTO `card_declined_auth_code` VALUES (19, '0111', 'Invalid PIN', 'The customer entered an invalid personal identification number. This authorization check applies to corporate cards used for travel purposes.');
INSERT INTO `card_declined_auth_code` VALUES (20, '0112', 'Exceeds ATM Daily Limit', 'The account the customer used for the attempted transaction has exceeded the allowed daily dollar value of ATM withdrawals. This authorization check applies to corporate cards used for travel.');
INSERT INTO `card_declined_auth_code` VALUES (21, '0113', 'Exceeded Number of ATM Per Day', 'The account the customer used for the attempted transaction has exceeded the allowed number of automated teller machine (ATM) transactions for that day. This authorization check applies to corporate cards used for travel.');
INSERT INTO `card_declined_auth_code` VALUES (22, '0114', 'Exceeds PIN Limit', 'The cardholder entered their PIN incorrectly multiple times and the client or the bank needs to reset the PIN counter.');
INSERT INTO `card_declined_auth_code` VALUES (23, '0117', 'Exceeds Down-Time Processing Limit', 'The processing system was down and the system could not process the attempted transaction.');
INSERT INTO `card_declined_auth_code` VALUES (24, '0125', 'Invalid Card Verification Value/Check', 'The card verification value the customer gave for the attempted transaction did not match the card verification value on file for the account. This authorization check normally occurs for cardless accounts and for internet and telephone orders.');
INSERT INTO `card_declined_auth_code` VALUES (25, '0125', 'Invalid Card Verification', 'The merchant is removing the card from the terminal too quickly and the merchant needs to retry the transaction, refer the transaction to merchant services, or swipe the card.');
INSERT INTO `card_declined_auth_code` VALUES (26, '0134', 'CRV Status', 'The cardholder has not yet activated the account they used for the attempted transaction.');
INSERT INTO `card_declined_auth_code` VALUES (27, '0145', 'ATC Incorrect', 'The card verification value (CVV) embedded in the chip is not verifying and the merchant needs to retry the transaction, refer the transaction to merchant services, or swipe the card.');
INSERT INTO `card_declined_auth_code` VALUES (28, '0162', 'Invalid ICVV', 'The merchant is truncating the data they send and the merchant needs to retry the transaction, refer the transaction to merchant services, or swipe the card.');
INSERT INTO `card_declined_auth_code` VALUES (29, '0333', 'Card Not Activated', 'The cardholder has not yet activated the account they used for the attempted transaction.');
INSERT INTO `card_declined_auth_code` VALUES (30, '0800', 'Vendor Excluded', 'The merchant for the attempted transaction is excluded from the organization\'s preferred vendor list.');
INSERT INTO `card_declined_auth_code` VALUES (31, '0803', 'MCCG Exclude', 'The transaction was with a merchant in a merchant category code group with a control set to exclude transactions.');
INSERT INTO `card_declined_auth_code` VALUES (32, '0805', 'Exceeded Account Single Trans Limit', 'The transaction exceeds the account\'s single transaction limit.');
INSERT INTO `card_declined_auth_code` VALUES (33, '0808', 'Exceeded MCCG STDL', 'The attempted transaction exceeded the single transaction limit for the merchant category code group associated to the account.');
INSERT INTO `card_declined_auth_code` VALUES (34, '0813', 'Exceeded Account Velocity Amount', 'The attempted transaction exceeds a velocity limit set for the account.');
INSERT INTO `card_declined_auth_code` VALUES (35, '0818', 'Exceeded Account MCCG Velocity Amount', 'The attempted transaction exceeds a velocity limit for the merchant category code group associated to the account.');
INSERT INTO `card_declined_auth_code` VALUES (36, '0823', 'MCCG Included, No Match', 'The attempted transaction is with a merchant not in an authorized merchant category code group with a control set to approve only those included merchants.');
INSERT INTO `card_declined_auth_code` VALUES (37, '0831', 'Invalid Plastic Used', 'The account the customer used for the transaction does not have a plastic card issued, but the authorization request indicates that someone swiped a card.');
INSERT INTO `card_declined_auth_code` VALUES (38, '0832', 'No Driver or Vehicle in ISO MSG', 'The attempted transaction requires the submission of a Driver ID or Vehicle ID and neither was submitted by the merchant system.');
INSERT INTO `card_declined_auth_code` VALUES (39, '0836', 'Invalid Fleet ID', 'The attempted transaction has an invalid fleet ID.');
INSERT INTO `card_declined_auth_code` VALUES (40, '0837', 'Invalid Fleet Vehicle', 'The attempted transaction has an invalid fleet vehicle ID.');
INSERT INTO `card_declined_auth_code` VALUES (41, '0838', 'Invalid Fleet Driver', 'The attempted transaction has an invalid fleet driver ID.');
INSERT INTO `card_declined_auth_code` VALUES (42, '0851', 'ADS I Strategy', 'The authorization request hit an Authorization Decision Strategy I (ADS I) rule. ADS I includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (43, '0881', 'ARQC Invalid', 'The merchant ran the attempted transaction off-line and needs to run the transaction again on-line.');
INSERT INTO `card_declined_auth_code` VALUES (44, '0882', 'Application Trans Counter Invalid', 'The merchant terminal is sending incomplete data and the merchant needs to retry the transaction, refer the transaction to merchant services, or swipe the card.');
INSERT INTO `card_declined_auth_code` VALUES (45, '8997', 'ADS II Strategy', 'The authorization went through an Authorization Decision Strategy II (ADS II) filter without hitting an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (46, '8998', 'ADS II Strategy', 'The authorization went through an Authorization Decision Strategy II (ADS II) filter without hitting an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (47, '8999', 'ADS II Strategy', 'The authorization went through an Authorization Decision Strategy II (ADS II) filter without hitting an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (48, '9000', 'ADS II Strategy', 'The authorization went through an Authorization Decision Strategy II (ADS II) filter without hitting an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (49, '9001', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (50, '9002', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (51, '9003', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (52, '9004', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (53, '9005', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (54, '9006', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (55, '9007', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (56, '9008', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (57, '9009', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (58, '9010', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (59, '9011', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (60, '9012', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (61, '9013', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (62, '9014', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (63, '9015', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (64, '9016', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (65, '9017', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (66, '9018', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (67, '9019', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (68, '9020', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (69, '9021', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (70, '9022', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (71, '9023', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (72, '9024', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (73, '9025', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (74, '9026', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (75, '9027', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (76, '9028', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (77, '9029', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (78, '9030', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (79, '9031', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (80, '9032', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (81, '9033', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (82, '9034', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (83, '9035', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (84, '9036', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (85, '9037', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (86, '9038', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (87, '9039', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (88, '9040', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (89, '9041', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (90, '9042', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (91, '9043', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (92, '9044', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (93, '9045', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (94, '9046', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (95, '9047', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (96, '9048', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (97, '9049', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');
INSERT INTO `card_declined_auth_code` VALUES (98, '9050', 'ADS II Strategy', 'The authorization request hit an ADS II rule. ADS II includes pre-defined, high-risk fraud criteria.');