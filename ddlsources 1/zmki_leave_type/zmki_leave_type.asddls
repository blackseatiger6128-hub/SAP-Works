@AbapCatalog.sqlViewName: 'ZMK_LEAVE_TYPE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Leave Type Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view ZMKI_LEAVE_TYPE as select from zmkdb_leave_type 
    association [1..*] to ZMKI_LEAVE_TYPETX as _Texts 
            on $projection.code = _Texts.code
{
    key code, 
    created_by, 
    created_at, 
    changed_by, 
    changed_at,
    _Texts
}
