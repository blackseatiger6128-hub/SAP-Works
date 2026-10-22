@AbapCatalog.sqlViewName: 'ZMKL_LEAVE_REQ'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave Requests'
@Metadata.ignorePropagatedAnnotations: true
define root view ZMKI_LEAVE_REQ 
  as select from zmkdb_leave_req 
{
   key leave_uuid, 
   employee_id, 
   start_date, 
   end_date, 
   duration_type,
   leave_type, 
   reason, 
   approver_id, 
   status,
   created_by, 
   created_at, 
   last_changed_by, 
   last_changed_at,
   local_last_changed_at
}
