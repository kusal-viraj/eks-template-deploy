------2.5.31--------Hashila-----------

ALTER TABLE `hst_vp_po_additional_field_attachment` DROP FOREIGN KEY `FK_hst_vp_po_additional_field_attachment_hst_vp_expense_mst`;



ALTER TABLE `hst_vp_po_additional_field_attachment`
ADD CONSTRAINT `FK_hst_vp_po_additional_field_attachment_hst_vp_expense_mst` FOREIGN KEY (`hst_recode_id`) REFERENCES `hst_vp_po_mst` (`recode_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;