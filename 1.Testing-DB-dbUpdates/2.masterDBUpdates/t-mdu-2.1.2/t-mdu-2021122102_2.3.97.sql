-----Dhanuddara----2.3.97---------

ALTER TABLE `tp_integration_mst` 
ADD COLUMN `api_subscription_key` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `base_url`;