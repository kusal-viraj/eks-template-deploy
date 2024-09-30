-----------------2.10.15- sithum--------------------


UPDATE vp_bill bill SET bill.negative_recode ='N',bill.applied_to_positive_recode='N' WHERE bill.negative_recode_id IS NULL;

UPDATE hst_vp_bill bill SET bill.negative_recode ='N',bill.applied_to_positive_recode='N' WHERE bill.negative_recode_id IS NULL;