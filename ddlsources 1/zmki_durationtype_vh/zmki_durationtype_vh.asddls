@AbapCatalog.sqlViewName: 'ZMK_SH_DURA_TYPE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH: Duration Types'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_DURATIONTYPE_VH as select from zmkdb_dura_type as Dur
   association [1..1] to zmkdb_dura_tytx as _Text on _Text.code = Dur.code
                                                 and _Text.spras = $session.system_language 
{ 
   @ObjectModel.text.element: [ 'Text' ]
   key Dur.code as Code, 
   _Text.text as Text 
}
