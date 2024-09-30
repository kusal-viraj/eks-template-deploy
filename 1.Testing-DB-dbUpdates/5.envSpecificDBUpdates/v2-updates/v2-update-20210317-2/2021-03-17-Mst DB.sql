INSERT INTO `tp_integration_mst`(`id`, `system_id`, `tenant_id`, `auth_type`, `user_id`, `password`, `token_type`, `grant_type`, `access_token`, `refresh_token`, `refresh_token_expires_on`, `access_token_expires_on`, `authentication_end_point`, `redirect_url`, `relaim_id`, `token_status`, `status`, `created_by`, `created_on`, `sync_user_id`, `sync_user_password`, `papertrl_access_token`, `papertrl_refresh_token`, `papertrl_access_token_expires_on`, `papertrl_refresh_token_expires_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (1, 1, 2, 'BS', 'sdd', 'Rxqy7n+RAho=', 'bearer', 'grant', 'access', 'refresh', NULL, NULL, NULL, NULL, NULL, NULL, 'D', 'add', '2021-01-19 09:33:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tp_integration_mst`(`id`, `system_id`, `tenant_id`, `auth_type`, `user_id`, `password`, `token_type`, `grant_type`, `access_token`, `refresh_token`, `refresh_token_expires_on`, `access_token_expires_on`, `authentication_end_point`, `redirect_url`, `relaim_id`, `token_status`, `status`, `created_by`, `created_on`, `sync_user_id`, `sync_user_password`, `papertrl_access_token`, `papertrl_refresh_token`, `papertrl_access_token_expires_on`, `papertrl_refresh_token_expires_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (2, 2, 2, 'BT', NULL, NULL, NULL, NULL, 'eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..FaqgzGujOw4OPX_Uc4yGGQ.Q1rXbwDGN7aekOBIbL1TDOUEWNCsp6nVzYjDkHPuF0-hhdvAhyWmne0FhE815opZwERXI8iEQanaGTfQmdDMZdQRA_ZCAgQacUKorTK_q3h5Wi8P6KvlUF2usywHNxn_fUQH2I9t1y2LO70RqKRZaKgFrDgHcKPoXfDB48pMto4onakwP5JRy2-pBrouvpRyNsQuAF81nL7_kNYNgoZm4Byir44mo4eryHU9QR1OZHXiEDBlQpXD5UBtqY0klwE5hWaomJ3vGzRu-A5iSx6fbbJgRF8EaKhzkJQXffYRr0va8U_j29TWbZzf5pAmqC-q-VZuenV48XxkCyeeU-xGolkT2LUopJRo5J0oNLgzuVey_iMAMNL9dw7hEAXQuBn5txwt5PHa62t9TtR52oKPVvXJ0Lz1n3YJFU0xe-K_Nbh9vXfPdDa3jKDbBi0Z6aB_HMCrPfQ7YPxl4vo8Nwqg9-2EaLXRe9qfB3Pb4gsvAXi1zPClZfdspcDw04MwzKDVzHa7AeBE7WxD05BEPQGb6B_auRDbVb37qB4mEWBVdEikhFLDJIZCLOzXhiLDSxBZNwmw3UPRybfvFUPv3gziqzLnjeFyJ3GLKfQxahkQopgnIHnVV_iixZ9AHvtotrJ_WuLJL9TbdXnDZihjziMbVYwxH6hJyyFVnsK4mQYMqAG3nTUdf4D7ViB-WGU1DNKHVKQ6EKLLVmYr2n-x1m8LwZCDEZD2qIHoowvM1ux8U9-yB3ACgpXUZqcQNtXnyfFn.BVg8jTPX7xbN0mAvWpX8Ag', 'AB116198633303RXycKbPbN1BtV4UQI59QGM4QIVUlRBO8fHjI', '2021-05-01 02:01:28', '2021-01-20 05:02:41', NULL, 'https://testing-ba.papertrl.com:8443/proxy/integration/get_oauth_tokens', '4620816365152804670', NULL, 'A', 'add', '2021-01-19 09:33:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


CREATE TABLE `tp_integration_system_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `tp_integration_system_type` VALUES (1, 'Accounting');
INSERT INTO `tp_integration_system_type` VALUES (2, 'File Sharing');

ALTER TABLE `tp_integration_system` 
ADD COLUMN `desktop_connector` tinyint(1) NOT NULL AFTER  `client_secret`;

ALTER TABLE `tp_integration_system` 
ADD COLUMN `type_id` int NOT NULL AFTER `client_secret`;

UPDATE `tp_integration_system` SET `name` = 'Quickbooks Desktop', `client_id` = NULL, `client_secret` = NULL, `type_id` = 1, `desktop_connector` = 1, `status` = 'A', `created_by` = 'admin', `created_on` = '2020-06-25 00:00:00', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 1;
UPDATE `tp_integration_system` SET `name` = 'Quickbooks Online', `client_id` = 'ABa32mAIN8gG3t6Ai16PpWIMr2v0hrxrkzNT8UgJhwjV2tFCZi', `client_secret` = 'NM9sAEap1L89SdZTsiok7AOffFOqNCmzNerr0VbW', `type_id` = 1, `desktop_connector` = 0, `status` = 'A', `created_by` = 'admin', `created_on` = '2020-07-21 00:00:00', `update_by` = NULL, `update_on` = NULL, `delete_by` = NULL, `delete_on` = NULL WHERE `id` = 2;


