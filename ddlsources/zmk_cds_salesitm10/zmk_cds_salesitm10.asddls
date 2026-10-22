@AbapCatalog.sqlViewName: 'ZMKDDL_SLSITM10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds view for salesitm10'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMK_CDS_SALESITM10 as select from zmk_salesitm10
  association to parent ZMK_CDS_SALESHDR10 as _SalesHdr 
     on $projection.Salesorderuuid = _SalesHdr.Salesorderuuid 
{
    key salesitemuuid as Salesitemuuid, 
    salesorderuuid as Salesorderuuid, 
    salesorderitem as Salesorderitem, 
    salesorderitemcategory as Salesorderitemcategory, 
    salesorderitemtext as Salesorderitemtext, 
    material as Material, 
    plant as Plant, 
    @Semantics.quantity.unitOfMeasure: 'Orderquantityunit' 
    orderquantity as Orderquantity, 
    orderquantityunit as Orderquantityunit, 
    @Semantics.amount.currencyCode: 'Transactioncurrency' 
    netamount as Netamount, 
    transactioncurrency as Transactioncurrency, 
    @Semantics.user.createdBy: true 
    createdbyuser as Createdbyuser, 
    @Semantics.systemDateTime.createdAt: true 
    creationat as Creationat, 
    @Semantics.user.lastChangedBy: true 
    lastchangedbyuser as Lastchangedbyuser, 
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat as Lastchangedat, 
    locallastchangedat as Locallastchangedat,
    _SalesHdr
}
