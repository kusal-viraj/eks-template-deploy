------------------kavindu-2.13.41-------------

UPDATE common_audit_trial_status SET name='Transaction failed ' WHERE  id=46;
UPDATE common_audit_trial_status SET name='Check payment marked as returned by ' WHERE  id=77;
UPDATE common_audit_trial_status SET name='Approved and finalized by ' WHERE  id=3;
UPDATE common_audit_trial_status SET name='Approved and finalized by ' WHERE  id=24;
UPDATE common_audit_trial_status SET name='Changed assignee by ' WHERE  id=5;

INSERT INTO common_audit_trial_status (id, name, sort_order, icon, color) VALUES (81, 'Emailed to vendor by', 28, 'fa fa-paper-plane', 'bg-blue');
