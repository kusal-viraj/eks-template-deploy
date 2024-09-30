CREATE TABLE `papertrl_error_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usb_error_message` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `papertrl_message` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `papertrl_error_message` VALUES (1, 'suplier.name', 'One of the attributes does not conform to schema definition', 'The recipient name format is incorrect. ', 1);
INSERT INTO `papertrl_error_message` VALUES (2, 'suplier.email', 'Acceptable Email Address format is test@domain.extension and multiple Email addresses must be separated by semi-colon', 'Recipient email should follow the format \"test@domain.extension\" and multiple addresses must be separated by a semi-colon (;).', 1);
INSERT INTO `papertrl_error_message` VALUES (3, 'suplier.email', 'One of the attributes does not conform to schema definition', 'Supplier email format is incorrect. Please check and update accordingly.', 1);
INSERT INTO `papertrl_error_message` VALUES (4, 'paymentAccountID', 'One of the attributes does not conform to schema definition', 'Payment Account ID format is incorrect.', 1);
INSERT INTO `papertrl_error_message` VALUES (5, 'transaction.requestorDetails.companyName', 'companyName is required.', 'Company Name is required. ', 1);
INSERT INTO `papertrl_error_message` VALUES (6, 'companyName', 'Attribute value must be correctly formatted to successfully submit the request.', 'Company Name format is incorrect.', 1);
INSERT INTO `papertrl_error_message` VALUES (7, 'transaction.requestorDetails.companyName', 'companyName is invalid. A maximum of 16 characters are allowed.', 'Invalid Company Name. Maximum of 16 characters allowed.', 1);
INSERT INTO `papertrl_error_message` VALUES (8, 'clientID', 'client ID value should be  a valid OB Customer', 'Provide a valid OB Customer for the client ID value.', 1);
INSERT INTO `papertrl_error_message` VALUES (9, 'transaction.clientDetails.clientID', 'clientID is invalid. A maximum of 100 characters are allowed.', 'Invalid Client ID. Maximum of 100 characters allowed.', 1);
INSERT INTO `papertrl_error_message` VALUES (10, 'transaction.requestorDetails.companyID', 'companyID is required.', 'Company ID is required. ', 1);
INSERT INTO `papertrl_error_message` VALUES (11, 'transaction.requestorDetails.companyID', 'companyId must be between 1 - 10 characters.', 'The Company ID should have a length ranging from 1 to 10 characters.', 1);
INSERT INTO `papertrl_error_message` VALUES (12, 'transaction.recipientDetails.recipientName', 'recipientName is required.', 'Recipient name is required.', 1);
INSERT INTO `papertrl_error_message` VALUES (13, 'transaction.recipientDetails.recipientName', 'recipientName is invalid. A maximum of 22 characters are allowed.', 'Invalid Recipient Name. Maximum of 22 characters allowed.', 1);
INSERT INTO `papertrl_error_message` VALUES (14, 'recipientAccountNumber', 'recipientAccountNumber is required', 'Recipient account number is required.', 1);
INSERT INTO `papertrl_error_message` VALUES (15, 'transaction.recipientDetails.recipientAccountNumber', 'recipientAccountNumber is invalid. A maximum of 17 characters are allowed.', 'Invalid Recipient Account Number. Maximum of 17 characters allowed.', 1);
INSERT INTO `papertrl_error_message` VALUES (16, 'recipientRoutingNumber', 'recipientRoutingNumber is required.', 'Recipient routing number is required.', 1);
INSERT INTO `papertrl_error_message` VALUES (17, 'transaction.recipientDetails.recipientRoutingNumber', 'recipientRoutingNumber is invalid. 9 digits are required.', 'The recipient routing number is invalid. It should consist 9 digits.', 1);
INSERT INTO `papertrl_error_message` VALUES (18, NULL, 'Invalid receiving DFI identification number provided.', 'Invalid routing number', 1);
INSERT INTO `papertrl_error_message` VALUES (19, NULL, 'Incorrect clientId-companyId combination. Please check these values in the request.', 'ClientId and companyId combination is incorrect.', 2);
INSERT INTO `papertrl_error_message` VALUES (20, 'checkPayableDetails.clientDetails.clientID', 'Client ID must be provided to successfully submit the request', 'Client ID is required to successfully submit the request', 2);
INSERT INTO `papertrl_error_message` VALUES (21, 'checkPayableDetails.clientDetails.clientID', 'Client ID must be correctly formatted to successfully submit the request', 'Client ID format is incorrect to proceed with the request submission.', 2);
INSERT INTO `papertrl_error_message` VALUES (22, 'checkPayableDetails.clientDetails.clientID', 'clientID should have a valid value', 'Client ID requires a valid value.', 2);
INSERT INTO `papertrl_error_message` VALUES (23, 'checkPayableDetails.requestorDetails.accountNumber', 'Account Number must be provided to successfully submit the request', 'Applicant account Number is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (24, 'checkPayableDetails.requestorDetails.accountNumber', 'Account Number parameter need to be numeric and > 0', 'Applicant account Number must be numeric and greater than zero.', 1);
INSERT INTO `papertrl_error_message` VALUES (25, 'checkPayableDetails.requestorDetails.accountNumber', 'Account Number must be correctly formatted to successfully submit the request', 'Applicant account Number format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (26, 'checkPayableDetails.requestorDetails.routingNumber', 'Routing Number must be provided to successfully submit the request', 'Applicant routing Number is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (27, 'checkPayableDetails.requestorDetails.routingNumber', 'Routing Number parameter need to be numeric and > 0', 'Applicant routing Number must be numeric and greater than zero.', 1);
INSERT INTO `papertrl_error_message` VALUES (28, 'checkPayableDetails.requestorDetails.routingNumber', 'Routing Number must be correctly formatted to successfully submit the request', 'Applicant routing Number format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (29, 'checkPayableDetails.recipientDetails.recipientNames', 'RecipientNames must be provided to successfully submit the request', 'Recipient Name is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (30, 'checkPayableDetails.recipientDetails.recipientNames[0]', 'Recipient Name must be correctly formatted to successfully submit the request', 'Recipient Name format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (31, 'recipientNames', 'Please provide only standard ASCII characters for recipient name', 'Recipient name should only consist of standard ASCII characters.', 1);
INSERT INTO `papertrl_error_message` VALUES (32, 'checkPayableDetails.recipientDetails.address.addressLine1', 'AddressLine1 must be provided to successfully submit the request', 'Recipient address Line 1 is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (33, 'checkPayableDetails.recipientDetails.address.addressLine1', 'Address Line1 must be correctly formatted to successfully submit the request', 'Recipient address Line 1 format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (34, 'checkPayableDetails.recipientDetails.address.addressLine2', 'Address Line2 must be correctly formatted to successfully submit the request', 'Recipient address Line 2 format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (35, 'checkPayableDetails.recipientDetails.address.addressLine3', 'Address Line3 must be correctly formatted to successfully submit the request', 'Recipient address Line 3 format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (36, 'checkPayableDetails.recipientDetails.address.city', 'City must be provided to successfully submit the request', 'Recipient city is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (37, 'checkPayableDetails.recipientDetails.address.city', 'City must be correctly formatted to successfully submit the request', 'Recipient city format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (38, 'checkPayableDetails.recipientDetails.address.state', 'State must be provided to successfully submit the request', 'Recipient state is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (39, 'checkPayableDetails.recipientDetails.address.state', 'State must be correctly formatted to successfully submit the request', 'Recipient state format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (40, 'checkPayableDetails.recipientDetails.address.zipCode', 'ZipCode must be provided to successfully submit the request', 'Recipient zip code is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (41, 'checkPayableDetails.recipientDetails.address.zipCode', 'Zip Code should at least be 5 chars for domestic checks', 'For domestic checks, the recipient Zip Code should have a minimum of 5 characters.', 1);
INSERT INTO `papertrl_error_message` VALUES (42, 'checkPayableDetails.recipientDetails.address.zipCode', 'Zip Code should be either 5 digits or 10 digits. Acceptable formats are XXXXX or XXXXX-XXXX', 'Recipient zip code should be 5 or 10 digits in the format XXXXX or XXXXX-XXXX.', 1);
INSERT INTO `papertrl_error_message` VALUES (43, 'checkPayableDetails.recipientDetails.address.zipCode', 'Zip Code must be correctly formatted to successfully submit the request', 'Recipient zip code format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (44, 'checkPayableDetails.recipientDetails.address.country', 'Country must match country code', 'Recipient country must match the corresponding country code.', 1);
INSERT INTO `papertrl_error_message` VALUES (45, 'checkPayableDetails.recipientDetails.address.country', 'Country must be correctly formatted to successfully submit the request', 'Recipient country format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (46, 'checkPayableDetails.recipientDetails.address.countryCode', 'Country code must match country', 'Recipient country code must match the corresponding country.', 1);
INSERT INTO `papertrl_error_message` VALUES (47, 'checkPayableDetails.recipientDetails.address.countryCode', 'Country code must be correctly formatted to successfully submit the request', 'Recipient country code format is incorrect to proceed with the request submission.', 1);
INSERT INTO `papertrl_error_message` VALUES (48, 'checkPayableDetails.checkDetails.checkNumber', 'Check Number must be provided to successfully submit the request', 'Check numner is required to successfully submit the request.', 1);
INSERT INTO `papertrl_error_message` VALUES (49, 'checkPayableDetails.checkDetails.checkNumber', 'Check Number parameter need to be numeric and > 0', 'Check Number must be numeric and greater than zero.', 1);
INSERT INTO `papertrl_error_message` VALUES (50, 'cardInfo.firstName', 'Required field', 'Recipient First Name is required.', 1);
INSERT INTO `papertrl_error_message` VALUES (51, 'cardInfo.firstName', 'Maximum 50 characters allowed', 'Recipient first name should not exceed 50 characters.', 1);
INSERT INTO `papertrl_error_message` VALUES (52, 'cardInfo.lastName', 'Required field', 'Recipient Last Name is required.', 1);
INSERT INTO `papertrl_error_message` VALUES (53, 'cardInfo.lastName', 'Maximum 50 characters allowed', 'Recipient last name should not exceed 50 characters.', 1);
INSERT INTO `papertrl_error_message` VALUES (54, 'cardInfo.email', 'Invalid character', 'Recipient email address should not contain invalid characters.', 1);
INSERT INTO `papertrl_error_message` VALUES (55, 'cardInfo.phone', 'Must be 10 digits', 'Recipient phone number must be a 10-digit value.', 1);
INSERT INTO `papertrl_error_message` VALUES (56, 'cardInfo.phone', 'Invalid special character', 'Recipient phone number contains an invalid special character.', 1);
INSERT INTO `papertrl_error_message` VALUES (57, 'paymentAccountID', 'Required field', 'Payment Account ID is required.', 1);
INSERT INTO `papertrl_error_message` VALUES (58, 'paymentAccountID', 'Must be 12 digits', 'The Payment Account ID must consist exactly 12 digits.', 1);
INSERT INTO `papertrl_error_message` VALUES (59, 'paymentAccountID', 'Invalid special character', 'The Payment Account ID contains an invalid special character.', 1);
INSERT INTO `papertrl_error_message` VALUES (60, NULL, 'Invalid paymentAccountID', 'Invalid payment account ID', 1);