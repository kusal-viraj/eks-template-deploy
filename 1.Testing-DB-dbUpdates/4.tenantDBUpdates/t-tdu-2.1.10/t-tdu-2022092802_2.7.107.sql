----------Dhanuddara----2.7.107-------------

UPDATE `common_integration_failed_record` fail SET fail.object_type = 'OBJECT_TYPE_VENDOR' WHERE fail.object_type = 'OBJECT_TYPE_VENDOR ';
UPDATE `common_integration_id_connection` idCon SET idCon.object_type = 'OBJECT_TYPE_VENDOR' WHERE idCon.object_type = 'OBJECT_TYPE_VENDOR ';
UPDATE `common_integration_incomplete_record` incomplete SET incomplete.object_type = 'OBJECT_TYPE_VENDOR' WHERE incomplete.object_type = 'OBJECT_TYPE_VENDOR ';