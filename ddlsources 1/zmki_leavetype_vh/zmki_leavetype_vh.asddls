@AbapCatalog.sqlViewName: 'ZMK_SH_LEAV_TYPE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave Type VH'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_LEAVETYPE_VH as select from zmkdb_leave_type as LeaveType 
    association [1..1] to zmkdb_leave_tytx as _Text on _Text.code = LeaveType.code
                                                    and _Text.spras = $session.system_language
{ 
  @ObjectModel.text.element: [ 'Text' ]
  key LeaveType.code as Code, 
  _Text.text as Text 
}
