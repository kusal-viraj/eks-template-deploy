------Niron-----2.3.1-------

ALTER TABLE `papertrl_trial_config`
MODIFY COLUMN `db_validation_query`  varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL AFTER `db_default_auto_commit`;