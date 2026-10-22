@AbapCatalog.sqlViewName: 'ZMK_LEAVE_TYPETX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave Type Txt Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_LEAVE_TYPETX as select from zmkdb_leave_tytx 
   association to parent ZMKI_LEAVE_TYPE as _LeaveType 
         on $projection.code = _LeaveType.code 
{
 key code, 
 key spras, 
 text, 
 _LeaveType 
 }
