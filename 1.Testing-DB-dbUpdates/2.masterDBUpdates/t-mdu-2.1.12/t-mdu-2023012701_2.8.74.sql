-----Danuddara-2.8.74------


CREATE TABLE `payment_provider_credential`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_id` int NOT NULL,
  `client_id` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `secret` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `auth_url` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `access_token_expire_on` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic; 

ALTER TABLE `payment_provider` 
ADD COLUMN `osn` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `logo_image`;

ALTER TABLE `payment_type_for_provider` 
ADD COLUMN `provider_credential_id` int NULL AFTER `short_code`,
ADD CONSTRAINT `fk_provider_credentials` FOREIGN KEY (`provider_credential_id`) REFERENCES `payment_provider_credential` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
