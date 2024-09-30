DELETE FROM `tp_integration_mst` where system_id = 6;
DELETE FROM `tp_integration_system` WHERE id = 6;
UPDATE `tp_integration_system` SET `id` = 6 WHERE `id` = 9;