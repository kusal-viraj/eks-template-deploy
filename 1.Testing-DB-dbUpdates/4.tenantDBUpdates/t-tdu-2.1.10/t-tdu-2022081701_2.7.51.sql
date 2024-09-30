--------Dhanuddara------2.7.51-----------

UPDATE `vp_bill_term` SET end_of_month = 0 WHERE end_of_month is null;
UPDATE `vp_bill_term` SET from_entry = 0  WHERE from_entry is null;