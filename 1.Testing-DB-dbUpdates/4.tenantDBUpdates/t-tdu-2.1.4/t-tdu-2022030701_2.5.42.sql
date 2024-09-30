--------Indra-----2.5.42---------

ALTER TABLE `vp_po_receipt_detail`
	DROP FOREIGN KEY `PO_DETAIL_ID_FK_1`;
	
ALTER TABLE `vp_po_receipt_detail`
	DROP INDEX `PO_DETAIL_ID_FK_1`;
	
ALTER TABLE `vp_po_receipt_account_detail`
	DROP FOREIGN KEY `FK_po_receipt_account_detail`;
	
ALTER TABLE `vp_po_receipt_account_detail`
	DROP INDEX `FK_po_receipt_account_detail`;