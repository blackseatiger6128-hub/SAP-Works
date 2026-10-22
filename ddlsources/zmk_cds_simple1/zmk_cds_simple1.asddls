@AbapCatalog.sqlViewName: 'ZMK_DDL_SIMPLE1'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Simple cds view 1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMK_CDS_SIMPLE1 
with parameters p_vbtyp : vbtyp
as select from vbak
{
  key vbeln,
  vbtyp,
  vkorg,
  vtweg,
  spart,
  kunnr  
}
//where vbtyp = 'C'
where vbtyp = $parameters.p_vbtyp
