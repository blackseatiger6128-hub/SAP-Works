@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds projection view for saleshdr10'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZMK_CDS_PJV_SALESHDR10 
   as projection on ZMK_CDS_SALESHDR10 as SalesHdr
{
    key Salesorderuuid,
    @Search.defaultSearchElement: true
    Salesorder,
    Salesordertype,
    Description,
    @Search.defaultSearchElement: true
    Salesorganization,
    @Search.defaultSearchElement: true
    Soldtoparty,
    Distributionchannel,
    Documentreason,
    @Semantics.amount.currencyCode: 'Transactioncurrency'
    Totalnetamount,
    Transactioncurrency,
    Status,
    @Semantics.user.createdBy: true 
    Createdbyuser,
    @Semantics.systemDateTime.createdAt: true 
    Creationat,
    @Semantics.user.lastChangedBy: true 
    Lastchangedbyuser,
    @Semantics.systemDateTime.lastChangedAt: true 
    Lastchangedat,
    Locallastchangedat,
    /* Associations */
    _SalesItm: redirected to composition child ZMK_CDS_PJV_SALESITM10
}
