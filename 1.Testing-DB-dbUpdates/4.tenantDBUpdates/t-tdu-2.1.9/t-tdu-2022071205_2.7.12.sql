--------2.7.12-------Madhusha----------

UPDATE `vp_po_detail` SET `taxable` = 0;

UPDATE `vp_po_detail` SET `billable` = 0;

UPDATE `vp_po_account_detail` SET `billable` = 0;

UPDATE `vp_po_account_detail` SET `taxable` = 0;

UPDATE `hst_vp_po_account_detail` SET `taxable` = 0;

UPDATE `hst_vp_po_account_detail` SET `billable` = 0;

UPDATE `hst_vp_po_detail` SET `taxable` = 0;

UPDATE `hst_vp_po_detail` SET `billable` = 0;