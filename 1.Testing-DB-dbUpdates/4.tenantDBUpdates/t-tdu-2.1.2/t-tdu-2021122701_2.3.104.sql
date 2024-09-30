---------Madhusha------2.3.104----------

/*
 * Updating project code table amount columns using vp_bill_expense_cost_distribution line amount
 */
UPDATE common_approval_code apcode
INNER JOIN 
    (
SELECT ecd.project_id as pId,SUM(ecd.amount) as amounInvoiced
FROM vp_bill_expense_cost_distribution ecd
INNER JOIN vp_bill bill ON bill.id=ecd.bill_id
WHERE bill.`status`='A' AND ecd.project_id IS NOT NULL
GROUP BY ecd.project_id 
    ) t ON t.pId = apcode.id
SET apcode.amount_invoiced = t.amounInvoiced, apcode.remaining_amount = apcode.project_budget-t.amounInvoiced;



/*
 * Updating project code table amount columns using vp_bill_item_cost_distribution line amount
 */
UPDATE common_approval_code apcode
INNER JOIN 
    (
SELECT ecd.project_id as pId,SUM(ecd.amount) as amounInvoiced
FROM vp_bill_item_cost_distribution ecd
INNER JOIN vp_bill bill ON bill.id=ecd.bill_id
WHERE bill.`status`='A' AND ecd.project_id IS NOT NULL
GROUP BY ecd.project_id 
    ) t ON t.pId = apcode.id
SET apcode.amount_invoiced = apcode.amount_invoiced + t.amounInvoiced, apcode.remaining_amount = apcode.remaining_amount - t.amounInvoiced;