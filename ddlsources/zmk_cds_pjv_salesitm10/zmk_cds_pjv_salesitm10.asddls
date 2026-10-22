@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds projection view for salesitm10'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZMK_CDS_PJV_SALESITM10 
as projection on ZMK_CDS_SALESITM10 as SalesItm
{
    key Salesitemuuid, 
    Salesorderuuid, 
    Salesorderitem, 
    Salesorderitemcategory, 
    Salesorderitemtext, 
    Material, 
    Plant, 
    @Semantics.quantity.unitOfMeasure: 'Orderquantityunit'
    Orderquantity, 
    Orderquantityunit, 
    @Semantics.amount.currencyCode: 'Transactioncurrency'
    Netamount, 
    Transactioncurrency, 
    Createdbyuser, 
    Creationat, 
    Lastchangedbyuser, 
    Lastchangedat, 
    Locallastchangedat,
    /* Associations */ 
    _SalesHdr : redirected to parent ZMK_CDS_PJV_SALESHDR10
}
