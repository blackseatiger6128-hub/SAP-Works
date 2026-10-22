@AbapCatalog.sqlViewName: 'ZMK_DDL_ASSOC6'
@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association 6'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//@AbapCatalog.extensibility: { extensible: true }

define view ZMK_ASSOC6
as select from ekko 
association [ 1..* ] to ZMK_MM_ASSOC3 as _poi on _poi.ebeln = $projection.ebeln
association to ZMK_MM_ASSOC5 as _vend on _vend.lifnr = $projection.lifnr
{
  key ebeln,
  bstyp,
  lifnr,
  _poi,
  _vend  
}
where bstyp = 'F'
