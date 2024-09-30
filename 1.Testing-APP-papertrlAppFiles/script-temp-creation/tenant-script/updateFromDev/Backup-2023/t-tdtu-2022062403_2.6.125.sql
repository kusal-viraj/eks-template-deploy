ALTER TABLE `vp_po_receipt_mst` 
ADD COLUMN `automation_id` int NULL AFTER `close_by_po`,
ADD CONSTRAINT `AUTO_FK_ID` FOREIGN KEY (`automation_id`) REFERENCES `common_automation_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;