UPDATE vp_bill_csv_export_format SET active='0' WHERE  format_code = 'DEFAULT';
UPDATE vp_bill_csv_export_format SET active='1' WHERE  format_code = 'ISG';