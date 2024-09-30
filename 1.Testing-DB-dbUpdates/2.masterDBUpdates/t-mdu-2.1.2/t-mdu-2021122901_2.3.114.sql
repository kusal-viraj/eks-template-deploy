----Madhusha----2.3.114------

UPDATE papertrl_master_tenant mstTnt 
SET mstTnt.time_zone="US/Eastern" 
WHERE mstTnt.time_zone IS NULL;